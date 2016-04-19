//
//  LZEmoticonModel.h
//  OCemotionsKeyboard
//
//  Created by lzing on 16/4/1.
//  Copyright © 2016年 LZING. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZEmoticonModel : NSObject
///  emoji的16进制字符串
@property (nonatomic, copy) NSString *code;
///  表情名称,用于网络传输
@property (nonatomic, copy) NSString *chs;
///  表情图片
@property (nonatomic, copy) NSString *png;

///  字典转模型
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
