//
//  UIView+GetCurrentVC.m
//  CountingDemo
//
//  Created by Ethan on 2017/6/6.
//  Copyright © 2017年 Ethan. All rights reserved.
//

#import "UIView+GetCurrentVC.h"

@implementation UIView (GetCurrentVC)

//-  (UIViewController*)getCurrentVC {
//    
//    UIViewController*result =nil;
//    
//    UIWindow* window = [[UIApplication sharedApplication]keyWindow];
//    
//    if(window.windowLevel!=UIWindowLevelNormal)
//        
//    {
//        
//        NSArray*windows = [[UIApplication sharedApplication]windows];
//        
//        for(UIWindow* tmpWin in windows)
//            
//        {
//            
//            if(tmpWin.windowLevel==UIWindowLevelNormal)
//                
//            {
//                
//                window = tmpWin;
//                
//                break;
//                
//            }
//            
//        }
//        
//    }
//    
//    UIView*frontView = [[window subviews]objectAtIndex:0];
//    
//    id nextResponder = [frontView nextResponder];
//    
//    if([nextResponder isKindOfClass:[UIViewController class]])
//        
//        result = nextResponder;
//    
//    else
//        
//        result = window.rootViewController;
//    
//    return result;
//    
//}

- (UIViewController *)getCurrentVC {
    UIViewController * rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        UITabBarController * tabBarVC = (UITabBarController *)rootVC;
        UIViewController * selectedVC = tabBarVC.selectedViewController;
        if ([selectedVC isKindOfClass:[UINavigationController class]]) {
            UINavigationController * navigationVC = (UINavigationController *)selectedVC;
            UIViewController * lastVC = [navigationVC.viewControllers lastObject];
            return lastVC;
        }
    } else if ([rootVC isKindOfClass:[UINavigationController class]]) {
        UINavigationController * navigationVC = (UINavigationController *)rootVC;
        UIViewController * lastVC = [navigationVC.viewControllers lastObject];
        return lastVC;
    }
    
    return rootVC;
}

@end
