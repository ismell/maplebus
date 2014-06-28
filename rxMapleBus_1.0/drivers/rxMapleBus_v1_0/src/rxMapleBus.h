
#ifndef RXMAPLEBUS_H
#define RXMAPLEBUS_H

#ifdef __cplusplus
extern "C" {
#endif


/****************** Include Files ********************/
#include "xil_types.h"
#include "xstatus.h"
#include "rxMapleBus_hw.h"

/**************************** Type Definitions *****************************/

/**
 * This typedef contains configuration information for a device.
 */
typedef struct {
	u16 DeviceId;		/**< Unique ID of device */
	u32 BaseAddr;		/**< Register base address */
} rxMapleBus_Config;

/**
 * The rxMapleBus driver instance data. The user is required to allocate a
 * variable of this type for the MapleBus device in the system. A pointer
 * to a variable of this type is then passed to the driver API functions.
 */
typedef struct {
	rxMapleBus_Config MapleBusConfig;	/**< Device configuration */
	u32 IsReady;			/**< Device is initialized and ready */
} rxMapleBus;

/************************** Function Prototypes ****************************/

/*
 * Functions in rxMapleBus.c
 */
int rxMapleBus_CfgInitialize(rxMapleBus *InstancePtr, rxMapleBus_Config *ConfigPtr,
                              u32 EffectiveAddr);

/*
 * Diagnostic functions in rxMapleBus_selftest.c
 */
XStatus rxMapleBus_SelfTest(u32 BaseAddress);

/*
 * Functions in rxMapleBus_sinit.c
 */
rxMapleBus_Config *rxMapleBus_LookupConfig(u16 DeviceId);

#ifdef __cplusplus
}
#endif

#endif /* end of protection macro */
