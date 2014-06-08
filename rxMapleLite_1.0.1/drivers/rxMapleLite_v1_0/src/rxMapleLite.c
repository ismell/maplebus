

/***************************** Include Files *******************************/
#include "rxMapleLite.h"

/************************** Function Definitions ***************************/


/*****************************************************************************/
/*
*
* This function initializes a rxMapleLite instance/driver.
* All members of the rxMapleLite instance structure are initialized.
*
* @param	InstancePtr is a pointer to the rxMapleLite instance.
* @param	ConfigPtr points to the rxMapleLite device configuration structure.
* @param	EffectiveAddr is the device base address in the virtual memory
*           address space. If the address translation is not used then the
*           physical address should be passed. Unexpected errors may occur
*           if the address mapping is changed after this function is invoked.
*
* @return	XST_SUCCESS always.
*
* @note		None.
*
******************************************************************************/
int rxMapleLite_CfgInitialize(rxMapleLite *InstancePtr, rxMapleLite_Config *ConfigPtr,
				u32 EffectiveAddr)
{

	Xil_AssertNonvoid(InstancePtr != NULL);
	Xil_AssertNonvoid(ConfigPtr != NULL);

	/*
	 * Set some default values for instance data, don't indicate the device
	 * is ready to use until everything has been initialized successfully.
	 */
	InstancePtr->IsReady = 0;
	InstancePtr->MapleLiteConfig.BaseAddr = EffectiveAddr;
	InstancePtr->MapleLiteConfig.DeviceId = ConfigPtr->DeviceId;
	//InstancePtr->Handler = StubHandler;

	rxMapleLite_WriteReg(InstancePtr->MapleLiteConfig.BaseAddr,
			  RXMAPLELITE_REG0_OFFSET, 0xFFFFFFFF);

	rxMapleLite_WriteReg(InstancePtr->MapleLiteConfig.BaseAddr,
			  RXMAPLELITE_REG1_OFFSET, 0xFFFFFFFF);

	rxMapleLite_WriteReg(InstancePtr->MapleLiteConfig.BaseAddr,
			  RXMAPLELITE_REG2_OFFSET, 0xFFFFFFFF);

	rxMapleLite_WriteReg(InstancePtr->MapleLiteConfig.BaseAddr,
			  RXMAPLELITE_REG3_OFFSET, 0xFFFFFFFF);

	rxMapleLite_WriteReg(InstancePtr->MapleLiteConfig.BaseAddr,
			  RXMAPLELITE_REG4_OFFSET, 0xFFFFFFFF);

	/*
	 * Indicate the component is now ready to use.
	 */
	InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

	return XST_SUCCESS;
}