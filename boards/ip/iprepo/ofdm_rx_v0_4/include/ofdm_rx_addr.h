/*
 * File Name:         hdl_prj\ipcore\ofdm_rx_v0_4\include\ofdm_rx_addr.h
 * Description:       C Header File
 * Created:           2022-03-24 22:06:20
*/

#ifndef OFDM_RX_H_
#define OFDM_RX_H_

#define  IPCore_Reset_ofdm_rx                           0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_ofdm_rx                          0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_PacketSize_AXI4_Stream_Master_ofdm_rx   0x8  //Packet size for AXI4-Stream Master interface, the default value is 1024. The TLAST output signal of the AXI4-Stream Master interface is generated based on the packet size.
#define  IPCore_Timestamp_ofdm_rx                       0xC  //contains unique IP timestamp (yymmddHHMM): 2203242206
#define  threshold_Data_ofdm_rx                         0x100  //data register for Inport threshold
#define  enable_threshold_Data_ofdm_rx                  0x104  //data register for Inport enable_threshold

#endif /* OFDM_RX_H_ */
