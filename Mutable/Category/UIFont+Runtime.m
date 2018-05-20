//
//  UIFont+Runtime.m
//  Load_bigImage
//
//  Created by 嘚嘚以嘚嘚 on 2018/5/12.
//  Copyright © 2018年 chrise. All rights reserved.
//

#import "UIFont+Runtime.h"
#import <objc/runtime.h>
#define IS_IPHONE_6_PLUS ([[UIScreen mainScreen] bounds].size.height == 736.0f)

@implementation UIFont (Runtime)
+ (void)load {
    // 获取替换后的类方法
    Method newMethod = class_getClassMethod([self class], @selector(adjustFont:));
    // 获取替换前的类方法
    Method method = class_getClassMethod([self class], @selector(systemFontOfSize:));
    // 然后交换类方法，交换两个方法的IMP指针，(IMP代表了方法的具体的实现）
    method_exchangeImplementations(newMethod, method);
}

+ (UIFont *)adjustFont:(CGFloat)fontSize {
    [self adjustFont:fontSize];
    UIFont *newFont = nil;

    newFont = [UIFont adjustFont:fontSize * [UIScreen mainScreen].bounds.size.width/750];
    return newFont;
    
//    UIFont *newFont = nil;
//    if (IS_IPHONE_6_PLUS){
//        newFont = [UIFont adjustFont:fontSize * 1.5];
//    }else{
//        newFont = [UIFont adjustFont:fontSize];
//    }
//    return newFont;
//
}



@end
