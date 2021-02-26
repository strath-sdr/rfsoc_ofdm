/*
 * File Name:         C:\Git\rfsoc_ofdm\boards\ip\models\hdl_prj\OFDM_rx\ipcore\ofdm_rx_v0_4\include\ofdm_rx_addr.h
 * Description:       C Header File
 * Created:           2021-02-25 17:36:59
*/

#ifndef OFDM_RX_H_
#define OFDM_RX_H_

#define  IPCore_Reset_ofdm_rx       0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_ofdm_rx      0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_Timestamp_ofdm_rx   0x8  //contains unique IP timestamp (yymmddHHMM): 2102251736

#endif /* OFDM_RX_H_ */
