//
//  LZEmoticonPackageModel.h
//  OCemotionsKeyboard
//
//  Created by lzing on 16/4/1.
//  Copyright © 2016年 LZING. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LZEmoticonModel;

@interface LZEmoticonPackageModel : NSObject

///  表情包文件夹名称
@property (nonatomic, copy) NSString *id;
///  表情包名称
@property (nonatomic, copy) NSString *group_name_cn;
///  存放表情包数组
@property (nonatomic, copy) NSArray<LZEmoticonModel *> *emoticons;
///  存放每一页表情包数组
@property (nonatomic, strong) NSMutableArray<NSArray<LZEmoticonModel *> *> *pageEmoticons;

///  构造方法
///
///  @param id            表情包文件夹名称
///  @param group_name_cn 表情包名称
///  @param emoticons     存放表情包数组
///
///  @return 模型对象
- (instancetype)initWithid:(NSString *)id group_name_cn:(NSString *)group_name_cn emoticons:(NSArray<LZEmoticonModel *> *)emoticons;

@end
