//
//  LZEmoticonToolBar.m
//  OCemotionsKeyboard
//
//  Created by lzing on 16/4/1.
//  Copyright © 2016年 LZING. All rights reserved.
//

#import "LZEmoticonToolBar.h"

@interface LZEmoticonToolBar ()

///  选中按钮
@property (nonatomic, weak) UIButton *selectedButton;

@end

@implementation LZEmoticonToolBar

///  选中某个按钮
- (void)switchSelectedButtonWithSection:(NSUInteger)section {
    // 找到对应的按钮
    UIButton *button = self.subviews[section];
    // 选中按钮
    [self switchSelectedButton:button];
}

#pragma mark - <buttonClickAction>
- (IBAction)buttonDidClick:(UIButton *)button {
    [self switchSelectedButton:button];
    // 取出按钮类型
    LZEmoticonToolBarType type = button.tag;
    // 调用代理方法
    if ([self.delegate respondsToSelector:@selector(emoticonToolBar:didSelectButtonType:)]) {
        [self.delegate emoticonToolBar:self didSelectButtonType:type];
    }
}

///  选中按钮
- (void)switchSelectedButton:(UIButton *)button {
    // 如果选中的按钮为同一个按钮则不再选中
    if (self.selectedButton == button) {
        return;
    }
    // 取消上一个按钮选中
    self.selectedButton.selected = NO;
    // 选中当前按钮
    button.selected = YES;
    // 记录当前按钮为上一个按钮
    self.selectedButton = button;
}

///  加载toolBar
+ (instancetype)emoticonToolBar {
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

@end
