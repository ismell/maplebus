/******************************************************************************
*
* (c) Copyright 2013 Xilinx, Inc. All rights reserved.
*
* This file contains confidential and proprietary information of Xilinx, Inc.
* and is protected under U.S. and international copyright and other
* intellectual property laws.
*
* DISCLAIMER
* This disclaimer is not a license and does not grant any rights to the
* materials distributed herewith. Except as otherwise provided in a valid
* license issued to you by Xilinx, and to the maximum extent permitted by
* applicable law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL
* FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS,
* IMPLIED, OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF
* MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE;
* and (2) Xilinx shall not be liable (whether in contract or tort, including
* negligence, or under any other theory of liability) for any loss or damage
* of any kind or nature related to, arising under or in connection with these
* materials, including for any direct, or any indirect, special, incidental,
* or consequential loss or damage (including loss of data, profits, goodwill,
* or any type of loss or damage suffered as a result of any action brought by
* a third party) even if such damage or loss was reasonably foreseeable or
* Xilinx had been advised of the possibility of the same.
*
* CRITICAL APPLICATIONS
* Xilinx products are not designed or intended to be fail-safe, or for use in
* any application requiring fail-safe performance, such as life-support or
* safety devices or systems, Class III medical devices, nuclear facilities,
* applications related to the deployment of airbags, or any other applications
* that could lead to death, personal injury, or severe property or
* environmental damage (individually and collectively, "Critical
* Applications"). Customer assumes the sole risk and liability of any use of
* Xilinx products in Critical Applications, subject only to applicable laws
* and regulations governing limitations on product liability.
*
* THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE
* AT ALL TIMES.
*
*******************************************************************************/
/*****************************************************************************/
/**
*
* @file diskio.c
*		This file is the glue layer between file system and
*		driver.
*		Description related to SD driver:
*		Process to use file system with SD
*		Select xilffs in SDK when creating a BSP
*		In SDK, set "fs_interface" to 1 to select SD interface.
*		This glue layer can currently be used only with one
*		SD controller enabled.
*		In order to use eMMC, in SDK set "Enable MMC" to 1. If not,
*		SD support is enabled by default.
*
*		Description:
*		This glue layer initializes the host controller and SD card
*		in disk_initialize. If SD card supports it, 4-bit mode and
*		high speed mode will be enabled.
*		The default block size is 512 bytes.
*		disk_read and disk_write functions are used to read and
*		write files using ADMA2 in polled mode.
*		The file system can be used to read from and write to an
*		SD card that is already formatted as FATFS.
*
* <pre>
* MODIFICATION HISTORY:
*
* Ver	Who	Date		Changes
* ----- ---- -------- -------------------------------------------------------
* 1.00a hk   10/17/13 First release
* 2.0   hk   02/12/14 Corrected status check in disk initialize. CR# 772072.
* 2.1   hk   04/16/14 Move check for ExtCSD high speed bit set inside if
*                     condition for high speed support.
*                     Include xil_types.h irrespective of xsdps.h. CR# 797086.
*
* </pre>
*
* @note
*
******************************************************************************/
#include "diskio.h"
#include "xparameters.h"
#include "xil_types.h"

#ifdef FILE_SYSTEM_INTERFACE_SD
#include "xsdps.h"		/* SD device driver */
#endif

#include "xil_printf.h"

#define SD_DEVICE_ID		XPAR_XSDPS_0_DEVICE_ID
#define HIGH_SPEED_SUPPORT	0x01
#define WIDTH_4_BIT_SUPPORT	0x4
#define SD_CLK_25_MHZ		25000000
#define SD_CLK_26_MHZ		26000000
#define SD_CLK_52_MHZ		52000000
#define EXT_CSD_DEVICE_TYPE_BYTE	196
#define EXT_CSD_4_BIT_WIDTH_BYTE	183
#define EXT_CSD_HIGH_SPEED_BYTE		185
#define EXT_CSD_DEVICE_TYPE_HIGH_SPEED	0x3

/*--------------------------------------------------------------------------

	Public Functions

---------------------------------------------------------------------------*/

/*
 * Global variables
 */
static DSTATUS Stat;	/* Disk status */

#ifdef FILE_SYSTEM_INTERFACE_SD
static XSdPs SdInstance;
#endif

u8 ExtCsd[512];

/*-----------------------------------------------------------------------*/
/* Get Disk Status							*/
/*-----------------------------------------------------------------------*/

/*****************************************************************************/
/**
*
* Gets the status of the disk.
* In case of SD, it checks whether card is present or not.
*
* @param	drv - Drive number
*
* @return
*		0		Status ok
*		STA_NOINIT	Drive not initialized
*		STA_NODISK	No medium in the drive
*		STA_PROTECT	Write protected
*
* @note		In case Card detect signal is not connected,
*		this function will not be able to check if card is present.
*
******************************************************************************/
DSTATUS disk_status (
		BYTE drv	/* Drive number (0) */
)
{
	DSTATUS s = Stat;
	u32 StatusReg;

#ifdef FILE_SYSTEM_INTERFACE_SD
		StatusReg = XSdPs_GetPresentStatusReg(XPAR_XSDPS_0_BASEADDR);
		if ((StatusReg & XSDPS_PSR_CARD_INSRT_MASK) == 0) {
				s = STA_NODISK | STA_NOINIT;
		} else {
			s &= ~STA_NODISK;
			if (StatusReg & XSDPS_PSR_WPS_PL_MASK){
				s &= ~STA_PROTECT;
			}
			else{
				s |= STA_PROTECT;
			}
		}

		Stat = s;
#endif
		return s;
}

/*-----------------------------------------------------------------------*/
/* Initialize Disk Drive						 */
/*-----------------------------------------------------------------------*/
/*****************************************************************************/
/**
*
* Initializes the drive.
* In case of SD, it initializes the host controller and the card.
* This function also selects additional settings such as bus width,
* speed and block size.
*
* @param	drv - Drive number
*
* @return	s - which contains an OR of the following information
*		STA_NODISK	Disk is not present
*		STA_NOINIT	Drive not initialized
*		STA_PROTECT	Drive is write protected
*		0 or only STA_PROTECT both indicate successful initialization.
*
* @note
*
******************************************************************************/
DSTATUS disk_initialize (
		BYTE drv	/* Physical drive number (0) */
)
{
	DSTATUS s;
	int Status;
	u8 SCR[8];
	u8 ReadBuff[64];

#ifdef FILE_SYSTEM_INTERFACE_SD

	XSdPs_Config *SdConfig;

	/*
	 * Check if card is in the socket
	 */
	s = disk_status(drv);
	if (s & STA_NODISK) {
		return s;
	}

	/*
	 * Initialize the host controller
	 */
	SdConfig = XSdPs_LookupConfig(SD_DEVICE_ID);
	if (NULL == SdConfig) {
		s |= STA_NOINIT;
		return s;
	}

	Stat = STA_NOINIT;
	Status = XSdPs_CfgInitialize(&SdInstance, SdConfig,
					SdConfig->BaseAddress);
	if (Status != XST_SUCCESS) {
		s |= STA_NOINIT;
		return s;
	}

#ifndef MMC_CARD
	Status = XSdPs_SdCardInitialize(&SdInstance);
	if (Status != XST_SUCCESS) {
		s |= STA_NOINIT;
		return s;
	}

	Status = XSdPs_Change_ClkFreq(&SdInstance, SD_CLK_25_MHZ);
	if (Status != XST_SUCCESS) {
		s |= STA_NOINIT;
		return s;
	}

	Status = XSdPs_Select_Card(&SdInstance);
	if (Status != XST_SUCCESS) {
		s |= STA_NOINIT;
		return s;
	}

	Status = XSdPs_Get_BusWidth(&SdInstance, SCR);
	if (Status != XST_SUCCESS) {
		s |= STA_NOINIT;
		return s;
	}

	Status = XSdPs_Get_BusSpeed(&SdInstance, ReadBuff);
	if (Status != XST_SUCCESS) {
		s |= STA_NOINIT;
		return s;
	}

	if(ReadBuff[13] & HIGH_SPEED_SUPPORT){
		Status = XSdPs_Change_BusSpeed(&SdInstance);
		if (Status != XST_SUCCESS) {
			s |= STA_NOINIT;
			return s;
		}
	}

	Status = XSdPs_Pullup(&SdInstance);
	if (Status != XST_SUCCESS) {
		s |= STA_NOINIT;
		return s;
	}

	if (SCR[1] & WIDTH_4_BIT_SUPPORT) {
		Status = XSdPs_Change_BusWidth(&SdInstance);
		if (Status != XST_SUCCESS) {
			s |= STA_NOINIT;
			return s;
		}
	}

	Status = XSdPs_SetBlkSize(&SdInstance, XSDPS_BLK_SIZE_512_MASK);
	if (Status != XST_SUCCESS) {
		s |= STA_NOINIT;
		return s;
	}

#else
	Status = XSdPs_MmcCardInitialize(&SdInstance);
	if (Status != XST_SUCCESS) {
		s |= STA_NOINIT;
		return s;
	}

	Status = XSdPs_Change_ClkFreq(&SdInstance, SD_CLK_26_MHZ);
	if (Status != XST_SUCCESS) {
		s |= STA_NOINIT;
		return s;
	}

	Status = XSdPs_Select_Card(&SdInstance);
	if (Status != XST_SUCCESS) {
		s |= STA_NOINIT;
		return s;
	}

	Status = XSdPs_Change_BusWidth(&SdInstance);
	if (Status != XST_SUCCESS) {
		s |= STA_NOINIT;
		return s;
	}

	Status = XSdPs_Get_Mmc_ExtCsd(&SdInstance, ExtCsd);
	if (Status != XST_SUCCESS) {
		s |= STA_NOINIT;
		return s;
	}

	if(ExtCsd[EXT_CSD_4_BIT_WIDTH_BYTE] != 0x1) {
		s |= STA_NOINIT;
		return s;
	}

	if(ExtCsd[EXT_CSD_DEVICE_TYPE_BYTE] & EXT_CSD_DEVICE_TYPE_HIGH_SPEED){
		Status = XSdPs_Change_BusSpeed(&SdInstance);
		if (Status != XST_SUCCESS) {
			s |= STA_NOINIT;
			return s;
		}

		Status = XSdPs_Get_Mmc_ExtCsd(&SdInstance, ExtCsd);
		if (Status != XST_SUCCESS) {
			s |= STA_NOINIT;
			return s;
		}

		if(ExtCsd[EXT_CSD_HIGH_SPEED_BYTE] != 0x1) {
			s |= STA_NOINIT;
			return s;
		}
	}

	Status = XSdPs_SetBlkSize(&SdInstance, XSDPS_BLK_SIZE_512_MASK);
	if (Status != XST_SUCCESS) {
		s |= STA_NOINIT;
		return s;
	}

#endif

	/*
	 * Disk is initialized.
	 * Store the same in Stat.
	 */
	s &= (~STA_NOINIT);

	Stat = s;

#endif

	return s;
}


/*-----------------------------------------------------------------------*/
/* Read Sector(s)							 */
/*-----------------------------------------------------------------------*/
/*****************************************************************************/
/**
*
* Reads the drive
* In case of SD, it reads the SD card using ADMA2 in polled mode.
*
* @param	drv - Drive number
* @param	*buff - Pointer to the data buffer to store read data
* @param	sector - Start sector number
* @param	count - Sector count
*
* @return
*		RES_OK		Read successful
*		STA_NOINIT	Drive not initialized
*		RES_ERROR	Read not successful
*
* @note
*
******************************************************************************/
DRESULT disk_read (
		BYTE drv,	/* Physical drive number (0) */
		BYTE *buff,	/* Pointer to the data buffer to store read data */
		DWORD sector,	/* Start sector number (LBA) */
		BYTE count	/* Sector count (1..128) */
)
{
#ifdef FILE_SYSTEM_INTERFACE_SD
	DSTATUS s;
	int Status;


	s = disk_status(drv);

	if (s & STA_NOINIT) return RES_NOTRDY;
	if (!count) return RES_PARERR;

	/* Convert LBA to byte address if needed */
	if (!(SdInstance.HCS)) sector *= XSDPS_BLK_SIZE_512_MASK;

	Status  = XSdPs_ReadPolled(&SdInstance, sector, count, buff);
	if (Status != XST_SUCCESS) {
		return RES_ERROR;
	}

#endif
    return RES_OK;
}

/*-----------------------------------------------------------------------*/
/* Miscellaneous Functions						*/
/*-----------------------------------------------------------------------*/

DRESULT disk_ioctl (
	BYTE drv,				/* Physical drive number (0) */
	BYTE ctrl,				/* Control code */
	void *buff				/* Buffer to send/receive control data */
)
{
#ifdef FILE_SYSTEM_INTERFACE_SD
	DRESULT res;

	if (disk_status(drv) & STA_NOINIT)	/* Check if card is in the socket */
			return RES_NOTRDY;

	res = RES_ERROR;
	switch (ctrl) {
		case CTRL_SYNC :	/* Make sure that no pending write process */
			res = RES_OK;
			break;

		case GET_SECTOR_COUNT : /* Get number of sectors on the disk (DWORD) */
			break;

		case GET_BLOCK_SIZE :	/* Get erase block size in unit of sector (DWORD) */
			*(DWORD*)buff = 128;
			res = RES_OK;
			break;

		default:
			res = RES_PARERR;
			break;
	}

		return res;
#endif
		return 0;
}

/******************************************************************************/
/**
*
* This function is User Provided Timer Function for FatFs module
*
* @param	None
*
* @return	DWORD
*
* @note		None
*
****************************************************************************/

DWORD get_fattime (void)
{
	return	((DWORD)(2010 - 1980) << 25)	/* Fixed to Jan. 1, 2010 */
		| ((DWORD)1 << 21)
		| ((DWORD)1 << 16)
		| ((DWORD)0 << 11)
		| ((DWORD)0 << 5)
		| ((DWORD)0 >> 1);
}

/*****************************************************************************/
/**
*
* Reads the drive
* In case of SD, it reads the SD card using ADMA2 in polled mode.
*
* @param	drv - Drive number
* @param	*buff - Pointer to the data to be written
* @param	sector - Sector address
* @param	count - Sector count
*
* @return
*		RES_OK		Read successful
*		STA_NOINIT	Drive not initialized
*		RES_ERROR	Read not successful
*
* @note
*
******************************************************************************/
DRESULT disk_write (
	BYTE drv,			/* Physical drive nmuber (0..) */
	const BYTE *buff,	/* Data to be written */
	DWORD sector,		/* Sector address (LBA) */
	BYTE count			/* Number of sectors to write (1..128) */
)
{
	DSTATUS s;
	int Status;

#ifdef FILE_SYSTEM_INTERFACE_SD
	s = disk_status(drv);

	if (s & STA_NOINIT) return RES_NOTRDY;
	if (!count) return RES_PARERR;

	/* Convert LBA to byte address if needed */
	if (!(SdInstance.HCS)) sector *= XSDPS_BLK_SIZE_512_MASK;

	Status  = XSdPs_WritePolled(&SdInstance, sector, count, buff);
	if (Status != XST_SUCCESS) {
		return RES_ERROR;
	}

#endif
	return RES_OK;
}


