//
//  LZEmoticonPackageModel.m
//  OCemotionsKeyboard
//
//  Created by lzing on 16/4/1.
//  Copyright © 2016年 LZING. All rights reserved.
//

#import "LZEmoticonPackageModel.h"
#import "LZConst.h"

@implementation LZEmoticonPackageModel

- (instancetype)initWithid:(NSString *)id group_name_cn:(NSString *)group_name_cn emoticons:(NSArray<LZEmoticonModel *> *)emoticons {
    if (self = [super init]) {
        self.id = id;
        self.group_name_cn = group_name_cn;
        self.emoticons = emoticons;
        //  将模型数组拆分成多页
        [self splitEmoticon];
    }
    return self;
}

///  将模型数组拆分成多页
- (void)splitEmoticon {
    //  计算总页数
    NSUInteger pageCount = (self.emoticons.count + LZEmoticonNumberOfPage - 1) / LZEmoticonNumberOfPage;
    //  如果一页表情都没有
    if (pageCount == 0) {
        //  创建一页空的表情
        NSArray <LZEmoticonModel *>*emptyEmoticon = [NSArray array];
        [self.pageEmoticons addObject:emptyEmoticon];
        return;
    }
    // 遍历
    for (NSInteger i = 0; i < pageCount; i++) {
        NSUInteger location = i * LZEmoticonNumberOfPage;
        // 判断最后一页就的长度是否越界
        NSUInteger length = LZEmoticonNumberOfPage;
        // 当最后页的起始值+每页的数量 > 表情总数,说明会越界
        if (location + LZEmoticonNumberOfPage > self.pageEmoticons.count) {
            length = self.emoticons.count - location;
        }
        // 计算出一页表情范围
        NSRange range = NSMakeRange(location, length);
        // 一页表情
        NSArray <LZEmoticonModel *>*splitEmoticons = [self.emoticons subarrayWithRange:range];
        [self.pageEmoticons addObject:splitEmoticons];
    }
}

- (NSString *)description {
    return [NSString stringWithFormat:@"\n \t 表情包模型:id: %@, group_name_cn: %@, emoticons: %@", self.id, self.group_name_cn, self.emoticons];
}

- (NSMutableArray<NSArray<LZEmoticonModel *> *> *)pageEmoticons {
    if (_pageEmoticons == nil) {
        _pageEmoticons = [NSMutableArray array];
    }
    return _pageEmoticons;
}

@end
