

/***************************** Include Files *******************************/
#include "rxMapleBus.h"
#include "xdebug.h"

/************************** Function Definitions ***************************/


/*****************************************************************************/
/*
*
* This function initializes a rxMapleBus instance/driver.
* All members of the rxMapleBus instance structure are initialized.
*
* @param	InstancePtr is a pointer to the rxMapleBus instance.
* @param	ConfigPtr points to the rxMapleBus device configuration structure.
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
int rxMapleBus_CfgInitialize(rxMapleBus *InstancePtr, rxMapleBus_Config *ConfigPtr,
				u32 EffectiveAddr)
{
	u32 reg;
	u32 timeout;

	Xil_AssertNonvoid(InstancePtr != NULL);
	Xil_AssertNonvoid(ConfigPtr != NULL);

	/*
	 * Set some default values for instance data, don't indicate the device
	 * is ready to use until everything has been initialized successfully.
	 */
	InstancePtr->IsReady = 0;
	InstancePtr->MapleBusConfig.BaseAddr = EffectiveAddr;
	InstancePtr->MapleBusConfig.DeviceId = ConfigPtr->DeviceId;
	//InstancePtr->Handler = StubHandler;

	//TODO: We need to wait until TX and RX are 0 before we continue

	rxMapleBus_WriteReg(InstancePtr->MapleBusConfig.BaseAddr,
			  RXMAPLEBUS_REG0_OFFSET, RXMAPLEBUS_RESET_TX | RXMAPLEBUS_RESET_RX);
	
	for (timeout = 10; timeout > 0; --timeout) {
		reg = rxMapleBus_ReadReg(InstancePtr->MapleBusConfig.BaseAddr, RXMAPLEBUS_REG1_OFFSET);
		if (!reg) {
			break;
		}
	}
	if (!timeout) {
		xdbg_printf(XDBG_DEBUG_ERROR, "rxMapleBus failed reset in initialize\r\n");

		/* Need system hard reset to recover
		 */
		return XST_FAILURE;
	}

	rxMapleBus_WriteReg(InstancePtr->MapleBusConfig.BaseAddr,
			  RXMAPLEBUS_REG0_OFFSET, RXMAPLEBUS_ENABLE_LOOPBACK);

	reg = rxMapleBus_ReadReg(InstancePtr->MapleBusConfig.BaseAddr, RXMAPLEBUS_REG0_OFFSET);

	if (reg != RXMAPLEBUS_ENABLE_LOOPBACK) {
		xdbg_printf(XDBG_DEBUG_ERROR, "rxMapleBus failed setup in initialize\r\n");

		/* Hardware error */
		return XST_FAILURE;
	}

	/*
	 * Indicate the component is now ready to use.
	 */
	InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

	return XST_SUCCESS;
}

/*****************************************************************************/
/*
*
* This function resets the rxMapleBus module by writing reset values to
* all registers
*
* @param	Base address of rxMapleBus module
*
* @return	None
*
* @note		None.
*
******************************************************************************/
void rxMapleBus_Reset(rxMapleBus *InstancePtr)
{

}