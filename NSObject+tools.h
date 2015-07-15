//
//  NSObject+tools.h
//  ZQ_Calendar
//
//  Created by zq on 15/6/24.
//  Copyright (c) 2015年 zhangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (tools)

- (instancetype)model4Dic:(NSDictionary *)infoDic;
- (NSString *)convert2JsonStr;

@end
