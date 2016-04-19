//
//  ViewController.m
//  OCemotionsKeyboard
//
//  Created by lzing on 16/4/1.
//  Copyright © 2016年 LZING. All rights reserved.
//

#import "ViewController.h"
#import "LZEmoticonKeyboard.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (nonatomic, strong) LZEmoticonKeyboard *keyboard;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.textView.inputView = self.keyboard;
    
    [self.textView becomeFirstResponder];
}

#pragma mark - 懒加载
- (LZEmoticonKeyboard *)keyboard {
    if (_keyboard == nil) {
        _keyboard = [[LZEmoticonKeyboard alloc] init];
    }
    return _keyboard;
}

@end
