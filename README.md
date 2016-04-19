# OCemotionsKeyboard
# OC版的表情键盘
### 再提交下一份OC版的表情键盘吧,毕竟可能现在用的还是OC的多

### 使用方法
    // 设置表情键盘
    [self.textView.inputView = self.keyboard];

    懒加载
    - (LZEmoticonKeyboard *)keyboard {
	    if (_keyboard == nil) {
	        _keyboard = [[LZEmoticonKeyboard alloc] init];
	    }
	    return _keyboard;
    }