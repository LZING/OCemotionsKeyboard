//
//  UIButton+Extension.m
//  OCemotionsKeyboard
//
//  Created by lzing on 16/4/1.
//  Copyright © 2016年 LZING. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIColor (Extension)

///  随机色
+ (instancetype)randomColor {
    return [UIColor colorWithRed:[self randomValue] green:[self randomValue] blue:[self randomValue] alpha:1];
}

///  随机数
+ (CGFloat)randomValue {
    return arc4random_uniform(256) / 255.0;
}

@end
