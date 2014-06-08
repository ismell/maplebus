
#ifndef RXMAPLELITE_H
#define RXMAPLELITE_H

#ifdef __cplusplus
extern "C" {
#endif


/****************** Include Files ********************/
#include "xil_types.h"
#include "xstatus.h"
#include "rxMapleLite_hw.h"

/**************************** Type Definitions *****************************/

/**
 * This typedef contains configuration information for a device.
 */
typedef struct {
	u16 DeviceId;		/**< Unique ID of device */
	u32 BaseAddr;		/**< Register base address */
} rxMapleLite_Config;

/**
 * The rxMapleBus driver instance data. The user is required to allocate a
 * variable of this type for the MapleBus device in the system. A pointer
 * to a variable of this type is then passed to the driver API functions.
 */
typedef struct {
	rxMapleLite_Config MapleLiteConfig;	/**< Device configuration */
	u32 IsReady;			/**< Device is initialized and ready */
} rxMapleLite;

/************************** Function Prototypes ****************************/

/*
 * Functions in rxMapleLite.c
 */
int rxMapleLite_CfgInitialize(rxMapleLite *InstancePtr, rxMapleLite_Config *ConfigPtr,
                              u32 EffectiveAddr);

/*
 * Diagnostic functions in rxMapleLite_selftest.c
 */
XStatus rxMapleLite_SelfTest(u32 BaseAddress);

/*
 * Functions in rxMapleBus_sinit.c
 */
rxMapleLite_Config *rxMapleLite_LookupConfig(u16 DeviceId);

#ifdef __cplusplus
}
#endif

#endif /* end of protection macro */
