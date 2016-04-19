//
//  LZEmoticonPackageManager.m
//  OCemotionsKeyboard
//
//  Created by lzing on 16/4/1.
//  Copyright © 2016年 LZING. All rights reserved.
//

#import "LZEmoticonPackageManager.h"
#import "LZEmoticonPackageModel.h"
#import "LZEmoticonModel.h"

@interface LZEmoticonPackageManager ()

///  懒加载所有表情包模型
@property (nonatomic, copy) NSArray<LZEmoticonPackageModel *> *packages;

@end

@implementation LZEmoticonPackageManager

+ (instancetype)sharedEmoticonPackageManager {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        instance = [[self alloc] init];
    });
    return instance;
}

///  加载所有的表情包模型
- (NSArray<LZEmoticonPackageModel *>*)loadPackage {
    NSMutableArray <LZEmoticonPackageModel *> *packages = [NSMutableArray array];
    // 手动创建最近表情包
    LZEmoticonPackageModel *recentPackage = [[LZEmoticonPackageModel alloc] initWithid:@"" group_name_cn:@"最近" emoticons:[NSArray array]];
    [packages addObject:recentPackage];
    // 加载默认表情包
    [packages addObject:[self loadPackageWithID:@"com.sina.default"]];
    // 加载emoji
    [packages addObject:[self loadPackageWithID:@"com.apple.emoji"]];
    // 加载lxh
    [packages addObject:[self loadPackageWithID:@"com.sina.lxh"]];
    return packages;
}

///  加载单个表情包
- (LZEmoticonPackageModel *)loadPackageWithID:(NSString *)id {
    // 获取bundle路径
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"Emoticons.bundle" ofType:nil];
    // info路径
    NSString *infoPath = [NSString stringWithFormat:@"%@/%@/info.plist", bundlePath,id];
    // 读取plist
    NSDictionary *infoDict = [NSDictionary dictionaryWithContentsOfFile:infoPath];
    // 解析info
    NSString *group_name_cn = infoDict[@"group_name_cn"];
    // 解析emoticons
    NSArray <NSDictionary *>*emoticonsArray = infoDict[@"emoticons"];
    // 定义表情模型数组
    NSMutableArray *emoticons = [NSMutableArray array];
    // 遍历数组拿出字典转模型
    for (NSDictionary *dict in emoticonsArray) {
        [emoticons addObject:[[LZEmoticonModel alloc] initWithDict:dict]];
    }
    return [[LZEmoticonPackageModel alloc] initWithid:id group_name_cn:group_name_cn emoticons:emoticons.copy];
}

#pragma mark - 懒加载
- (NSArray *)packages {
    if (_packages == nil) {
        _packages = [self loadPackage];
    }
    return _packages;
}

@end
