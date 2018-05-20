//
//  UILabel+font.m
//  Load_bigImage
//
//  Created by 嘚嘚以嘚嘚 on 2018/5/12.
//  Copyright © 2018年 chrise. All rights reserved.
//

#import "UILabel+font.h"
#import <objc/runtime.h>
@implementation UILabel (font)

+ (void)load{
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
//    Method impp = class_getInstanceMethod([self class], @selector(initWithFrame:));
//    Method myImpp = class_getInstanceMethod([self class], @selector(myInitWithFrame:));
//    method_exchangeImplementations(impp, myImpp);
}
//-(id)myInitWithFrame:(CGRect)frame{
//
//}


- (id)myInitWithCoder:(NSCoder*)aDecode{
    [self myInitWithCoder:aDecode];
    if (self) {
        //部分不像改变字体的把tag值设置成333跳过
        if(self.tag !=333){
            CGFloat fontSize =self.font.pointSize;
            self.font = [UIFont systemFontOfSize:fontSize * 750];
        }
    }
    return self;
}


@end
