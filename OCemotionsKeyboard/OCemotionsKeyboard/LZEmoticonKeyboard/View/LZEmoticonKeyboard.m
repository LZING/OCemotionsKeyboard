//
//  LZEmoticonKeyboard.m
//  OCemotionsKeyboard
//
//  Created by lzing on 16/4/1.
//  Copyright © 2016年 LZING. All rights reserved.
//

#import "LZEmoticonKeyboard.h"
#import "LZEmoticonToolBar.h"
#import "LZEmoticonKeyboardPageCell.h"
#import "LZEmoticonPackageManager.h"
#import "LZEmoticonPackageModel.h"
#import "LZDefine.h"

static NSString *ID = @"reuseIdentifier";

@interface LZEmoticonKeyboard ()<UICollectionViewDataSource, UICollectionViewDelegate, LZEmoticonToolBarDelegate>

///  按钮工具条
@property (nonatomic, strong) LZEmoticonToolBar *toolBar;
///  存放表情的collectionView
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation LZEmoticonKeyboard

- (void)layoutSubviews {
    [super layoutSubviews];
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    flowLayout.itemSize = self.collectionView.frame.size;
}

- (instancetype)initWithFrame:(CGRect)frame {
    CGRect newFrame = CGRectMake(0, 0, LZScreenWidth, 216);
    if (self = [super initWithFrame:newFrame]) {
        ///  添加子控件
        [self addSubview];
        ///  设置约束
        [self addConstraint];
    }
    return self;
}

#pragma mark - <PrepareUI>
///  添加子控件
- (void)addSubview {
    [self addSubview:self.toolBar];
    [self addSubview:self.collectionView];
}

///  设置约束
- (void)addConstraint {
    ///  关闭autoresizing
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    self.toolBar.translatesAutoresizingMaskIntoConstraints = NO;
    ///  添加collectionView水平约束
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[collectionView]-0-|" options:0 metrics:nil views:@{@"collectionView" : self.collectionView}]];
    ///  添加toolBar水平约束
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[toolBar]-0-|" options:0 metrics:nil views:@{@"toolBar" : self.toolBar}]];
    ///  添加垂直约束
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[collectionView]-[toolBar(height)]-0-|" options:0 metrics:@{@"height" : @44} views:@{@"collectionView" : self.collectionView, @"toolBar" : self.toolBar}]];
}

#pragma mark - <LZEmoticonToolBarDelegate>
///  toolBar按钮点击事件
- (void)emoticonToolBar:(LZEmoticonToolBar *)emoticonToolBar didSelectButtonType:(LZEmoticonToolBarType)type {
    ///  取出按钮对应的indexPath
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:type];
    ///  选中item
    [self.collectionView selectItemAtIndexPath:indexPath animated:NO scrollPosition:UICollectionViewScrollPositionLeft];
}

#pragma mark - <UICollectionViewDataSource, UICollectionViewDelegate>
///  返回组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [LZEmoticonPackageManager sharedEmoticonPackageManager].packages.count;
}

///  返回每组item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [LZEmoticonPackageManager sharedEmoticonPackageManager].packages[section].pageEmoticons.count;
}

///  返回cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LZEmoticonKeyboardPageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.indexPath = indexPath;
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    ///  取出中心点
    CGPoint center = scrollView.center;
    center.x += scrollView.contentOffset.x;
    ///  判断哪个cell包含中心点
    for (UICollectionViewCell *cell in self.collectionView.visibleCells) {
        if (CGRectContainsPoint(cell.frame, center)) {
            ///  包含点
            NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
            ///  选中toolBar按钮
            [self.toolBar switchSelectedButtonWithSection:indexPath.section];
        }
    }
}

#pragma mark - 懒加载
///  按钮工具条
- (LZEmoticonToolBar *)toolBar {
    if (_toolBar == nil) {
        _toolBar = [LZEmoticonToolBar emoticonToolBar];
        _toolBar.delegate = self;
    }
    return _toolBar;
}

///  存放表情的collectionView
- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        ///  配置layout
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        ///  配置collectionView
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"emoticon_keyboard_background"]];
        _collectionView.bounces = NO;
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        // 注册cell
        [_collectionView registerClass:[LZEmoticonKeyboardPageCell class] forCellWithReuseIdentifier:ID];
    }
    return _collectionView;
}

@end
