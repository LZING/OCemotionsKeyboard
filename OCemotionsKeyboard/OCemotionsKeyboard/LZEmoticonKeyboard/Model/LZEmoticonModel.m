//
//  LZEmoticonModel.m
//  OCemotionsKeyboard
//
//  Created by lzing on 16/4/1.
//  Copyright © 2016年 LZING. All rights reserved.
//

#import "LZEmoticonModel.h"

@implementation LZEmoticonModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (NSString *)description {
    return [NSString stringWithFormat:@"\n \t 表情模型:code: %@, chs: %@, png: %@", self.code, self.chs, self.png];
}

@end
