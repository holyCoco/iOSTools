//
//  UIView+tools.m
//  ZQ_Calendar
//
//  Created by zq on 15/6/24.
//  Copyright (c) 2015年 zhangqiang. All rights reserved.
//

#import "UIView+tools.h"

@implementation UIView (tools)

- (void)setTempString:(NSString *)tempString {
  objc_setAssociatedObject(self, @"tempString", tempString,
                           OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)tempString {
  return objc_getAssociatedObject(self, @"tempString");
}

#pragma mark - 添加点击手势block
- (void)addBlock4Tap:(TapBlock)tapMBlock {
  UITapGestureRecognizer *tapGes =
      [[UITapGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(tapMethod:)];
  self.userInteractionEnabled = YES;
  [self addGestureRecognizer:tapGes];
  self.tapBlock = tapMBlock;
}
- (void)tapMethod:(UIGestureRecognizer *)sender {
  self.tapBlock(sender.view);
}
- (void)setTapBlock:(TapBlock)tapBlock {
  objc_setAssociatedObject(self, @"tapBlock", tapBlock,
                           OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (TapBlock)tapBlock {
  return objc_getAssociatedObject(self, @"tapBlock");
}

@end
