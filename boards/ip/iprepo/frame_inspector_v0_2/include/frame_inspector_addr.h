/*
 * File Name:         hdl_prj\ipcore\frame_inspector_v0_2\include\frame_inspector_addr.h
 * Description:       C Header File
 * Created:           2021-02-26 00:11:07
*/

#ifndef FRAME_INSPECTOR_H_
#define FRAME_INSPECTOR_H_

#define  IPCore_Reset_frame_inspector       0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_frame_inspector      0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_Timestamp_frame_inspector   0x8  //contains unique IP timestamp (yymmddHHMM): 2102260011

#endif /* FRAME_INSPECTOR_H_ */
