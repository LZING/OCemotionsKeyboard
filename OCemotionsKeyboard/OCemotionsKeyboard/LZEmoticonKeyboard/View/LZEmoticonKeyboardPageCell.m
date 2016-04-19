//
//  LZEmoticonKeyboardPageCell.m
//  OCemotionsKeyboard
//
//  Created by lzing on 16/4/1.
//  Copyright © 2016年 LZING. All rights reserved.
//

#import "LZEmoticonKeyboardPageCell.h"
#import "LZEmoticonPackageManager.h"
#import "UIButton+Extension.h"
#import "LZConst.h"

@interface LZEmoticonKeyboardPageCell ()
///  记录20个按钮
@property (nonatomic, strong) NSMutableArray *emoticonButtons;

@property (nonatomic, strong) UILabel *label;
///  删除按钮
@property (nonatomic, strong) UIButton *deleteBtn;

@end

@implementation LZEmoticonKeyboardPageCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 添加20个按钮
        [self addEmoticonButtons];
        // 添加删除按钮
        [self.contentView addSubview:self.deleteBtn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 重新布局子控件
    [self relayoutButtons];
}

///  重新布局子控件
- (void)relayoutButtons {
    // 左右间距
    CGFloat marginLR = 3;
    // 底部间距
    CGFloat marginBotton = 26;
    // 计算按钮宽度
    CGFloat width = (self.frame.size.width - 2 * marginLR) / LZEmoticonColumnOfPage;
    // 计算按钮高度
    CGFloat height = (self.frame.size.height - marginBotton) / LZEmoticonRowOfPage;
    // 遍历
    NSUInteger index = 0;
    for (UIButton *button in self.contentView.subviews) {
        // 计算按钮在哪一列
        NSUInteger column = index % LZEmoticonColumnOfPage;
        // 计算按钮在哪一行
        NSUInteger row = index / LZEmoticonColumnOfPage;
        // 设置frame
        CGRect frame = CGRectMake(marginLR + width * column, row * height, width, height);
        button.frame = frame;
        index++;
    }
}

///  添加20个按钮
- (void)addEmoticonButtons {
    for (NSUInteger i = 0; i < LZEmoticonNumberOfPage; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor randomColor];
        [self.contentView addSubview:button];
        [self.emoticonButtons addObject:button];
    }
}

- (void)setIndexPath:(NSIndexPath *)indexPath {
    _indexPath = indexPath;
    self.label.text = [NSString stringWithFormat:@"第 %zd 组,第 %zd 个cell", indexPath.section, indexPath.item];
}

#pragma mark - 懒加载
- (UILabel *)label {
    if (_label == nil) {
        _label = [[UILabel alloc] init];
        _label.font = [UIFont systemFontOfSize:18];
        _label.textColor = [UIColor redColor];
        _label.numberOfLines = 0;
        _label.frame = CGRectMake(0, 0, 300, 170);
        [self addSubview:_label];
    }
    return _label;
}

- (UIButton *)deleteBtn {
    if (_deleteBtn == nil) {
        _deleteBtn = [[UIButton alloc] init];
        [_deleteBtn setImage:[UIImage imageNamed:@"compose_emotion_delete"] forState:UIControlStateNormal];
    }
    return _deleteBtn;
}

- (NSMutableArray *)emoticonButtons {
    if (_emoticonButtons == nil) {
        _emoticonButtons = [NSMutableArray array];
    }
    return _emoticonButtons;
}

@end
