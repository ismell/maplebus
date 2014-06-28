

/***************************** Include Files *******************************/
#include "rxMapleBus.h"

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

	rxMapleBus_WriteReg(InstancePtr->MapleBusConfig.BaseAddr,
			  RXMAPLEBUS_REG0_OFFSET, 0xFFFFFFFF);

	rxMapleBus_WriteReg(InstancePtr->MapleBusConfig.BaseAddr,
			  RXMAPLEBUS_REG1_OFFSET, 0xFFFFFFFF);

	rxMapleBus_WriteReg(InstancePtr->MapleBusConfig.BaseAddr,
			  RXMAPLEBUS_REG2_OFFSET, 0xFFFFFFFF);

	rxMapleBus_WriteReg(InstancePtr->MapleBusConfig.BaseAddr,
			  RXMAPLEBUS_REG3_OFFSET, 0xFFFFFFFF);

	rxMapleBus_WriteReg(InstancePtr->MapleBusConfig.BaseAddr,
			  RXMAPLEBUS_REG4_OFFSET, 0xFFFFFFFF);

	/*
	 * Indicate the component is now ready to use.
	 */
	InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

	return XST_SUCCESS;
}