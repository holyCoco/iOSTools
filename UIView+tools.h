//
//  UIView+tools.h
//  ZQ_Calendar
//
//  Created by zq on 15/6/24.
//  Copyright (c) 2015年 zhangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

typedef void (^TapBlock)(UIView *view);

@interface UIView (tools)
@property(nonatomic, copy) TapBlock tapBlock;
@property(nonatomic, copy) NSString *tempString;

- (void)addBlock4Tap:(TapBlock)tapMBlock;

@end
