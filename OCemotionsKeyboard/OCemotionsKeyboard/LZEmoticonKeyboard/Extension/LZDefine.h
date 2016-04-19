//
//  LZDefine.h
//  LZTableViewProfile
//
//  Created by imqiuhang on 15/8/12.
//  Copyright (c) 2015年 LZING. All rights reserved.
//

#ifndef LZTableViewProfile_QHDefine_h
#define LZTableViewProfile_QHDefine_h


#define LZRGB(r, g, b)    [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
#define LZRGBA(r, g, b,a) [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:a]

#define defaultFont(s) [UIFont fontWithName:@"STHeitiSC-Light" size:s]

#define LZKEY_WINDOW      [[UIApplication sharedApplication] keyWindow]
#define LZScreenWidth     [[UIScreen mainScreen] bounds].size.width
#define LZScreenHeight    [[UIScreen mainScreen] bounds].size.height

#define LZIOS_VERSION     [[[UIDevice currentDevice] systemVersion] floatValue]

#ifdef DEBUG
#define LZLog(fmt,...) NSLog((@"\n\n[行号]%d\n" "[函数名]%s\n" "[日志]"fmt"\n"),__LINE__,__FUNCTION__,##__VA_ARGS__);
#else
#define LZLog(fmt,...);
#endif




#endif
