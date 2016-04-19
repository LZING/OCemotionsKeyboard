//
//  LZEmoticonToolBar.h
//  OCemotionsKeyboard
//
//  Created by lzing on 16/4/1.
//  Copyright © 2016年 LZING. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LZEmoticonToolBar;

///  按钮对应的tag枚举
typedef NS_ENUM(NSInteger, LZEmoticonToolBarType) {
    ///  最近
    LZEmoticonToolBarTypeRecent = 0,
    ///  默认
    LZEmoticonToolBarTypeDefault = 1,
    ///  emoji
    LZEmoticonToolBarTypeEmoji = 2,
    ///  浪小花
    LZEmoticonToolBarTypeLXH = 3
};

@protocol LZEmoticonToolBarDelegate <NSObject>

///  选中toolBar按钮代理方法
- (void)emoticonToolBar:(LZEmoticonToolBar *)emoticonToolBar didSelectButtonType:(LZEmoticonToolBarType)type;

@end

@interface LZEmoticonToolBar : UIView

///  代理
@property (nonatomic, weak) id<LZEmoticonToolBarDelegate> delegate;

///  选中某个按钮
- (void)switchSelectedButtonWithSection:(NSUInteger)section;

///  加载toolBar
+ (instancetype)emoticonToolBar;

@end
