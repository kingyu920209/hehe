//
//  macros.h
//  Mutable
//
//  Created by 嘚嘚以嘚嘚 on 2018/5/18.
//  Copyright © 2018年 嘚嘚以嘚嘚. All rights reserved.
//

#ifndef macros_h
#define macros_h

#define KScreenHeight [UIScreen mainScreen].bounds.size.height


#define KScreenWidth [UIScreen mainScreen].bounds.size.width


#define KGetHeight(h) (h)*(isIPhoneX?736.0:KScreenHeight)/1334

#define KGetWight(w) (w)*KScreenWidth/750

#define isIPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)


#ifdef DEBUG

#define LLog(fmt,...)NSLog((@"%s[Line %d]" fmt),__PRETTY_FUNCTION__,__LINE__,##__VA_ARGS__);

#else

#define LLog(...)

#endif

#endif /* macros_h */
