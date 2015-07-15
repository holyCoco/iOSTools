//
//  NSObject+tools.m
//  ZQ_Calendar
//
//  Created by zq on 15/6/24.
//  Copyright (c) 2015年 zhangqiang. All rights reserved.
//

#import "NSObject+tools.h"

@implementation NSObject (tools)

- (instancetype)model4Dic:(NSDictionary *)infoDic {
  u_int count;
  objc_property_t *properties = class_copyPropertyList([self class], &count);
  for (int i = 0; i < count; i++) {
    const char *pName = property_getName(properties[i]);
    NSString *propertyName = [NSString stringWithUTF8String:pName];
    if ([infoDic objectForKey:propertyName]) {
      [self setValue:[infoDic objectForKey:propertyName] forKey:propertyName];
    }
  }
  return self;
}
- (NSString *)convert2JsonStr {
  u_int count;
  NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
  objc_property_t *properties = class_copyPropertyList([self class], &count);
  for (int i = 0; i < count; i++) {
    const char *tempPropertyName = property_getName(properties[i]);
    NSString *pName = [NSString stringWithUTF8String:tempPropertyName];
    id pValue = [self valueForKey:pName];
    [tempDic setObject:pValue ? pValue : @"" forKey:pName];
  }
  NSError *parseError = nil;
  NSData *jsonData =
      [NSJSONSerialization dataWithJSONObject:tempDic
                                      options:NSJSONWritingPrettyPrinted
                                        error:&parseError];
  return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end
