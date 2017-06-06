//
//  UIButton+AdCounting.m
//  CountingDemo
//
//  Created by Ethan on 2017/6/6.
//  Copyright © 2017年 Ethan. All rights reserved.
//

#import "UIButton+AdCounting.h"
#import "UIView+GetCurrentVC.h"
#import <objc/message.h>

@implementation UIButton (AdCounting)

+ (void)load {
    // 交换方法实现
    Method sendAction = class_getInstanceMethod([self class], @selector(sendAction:to:forEvent:));
    Method ea_SendAction = class_getInstanceMethod([self class], @selector(ea_sendAction:to:forEvent:));
    method_exchangeImplementations(sendAction, ea_SendAction);
}

- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    [super sendAction:action to:target forEvent:event];
}

- (void)ea_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    [self ea_sendAction:action to:target forEvent:event];
    NSLog(@"%@",[self.getCurrentVC title]);
}

@end
