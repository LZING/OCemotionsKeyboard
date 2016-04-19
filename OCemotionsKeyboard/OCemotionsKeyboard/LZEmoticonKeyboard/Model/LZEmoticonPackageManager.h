//
//  LZEmoticonPackageManager.h
//  OCemotionsKeyboard
//
//  Created by lzing on 16/4/1.
//  Copyright © 2016年 LZING. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LZEmoticonPackageModel;

@interface LZEmoticonPackageManager : NSObject

///  单例
+ (instancetype)sharedEmoticonPackageManager;

///  懒加载所有表情包模型
@property (nonatomic, copy, readonly) NSArray<LZEmoticonPackageModel *> *packages;

@end
