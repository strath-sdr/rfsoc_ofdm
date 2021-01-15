/*
 * File Name:         hdl_prj\OFDM_tx\ipcore\ofdm_tx_v0_4\include\ofdm_tx_addr.h
 * Description:       C Header File
 * Created:           2021-01-14 13:09:31
*/

#ifndef OFDM_TX_H_
#define OFDM_TX_H_

#define  IPCore_Reset_ofdm_tx       0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_ofdm_tx      0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_Timestamp_ofdm_tx   0x8  //contains unique IP timestamp (yymmddHHMM): 2101141309
#define  modScheme_Data_ofdm_tx     0x100  //data register for Inport modScheme
#define  enable_Data_ofdm_tx        0x104  //data register for Inport enable

#endif /* OFDM_TX_H_ */
