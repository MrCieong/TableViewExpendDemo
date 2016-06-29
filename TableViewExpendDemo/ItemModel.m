//
//  ItemModel.m
//  TableViewExpendDemo
//
//  Created by zhangjing on 16/6/16.
//  Copyright © 2016年 ZhangJing. All rights reserved.
//

#import "ItemModel.h"

@implementation ItemModel
- (instancetype)initWithDictionary:(NSDictionary *)dict {
  if ([dict isKindOfClass:[NSDictionary class]]) {
    self = [super init];
    if (self) {
      [self setValuesForKeysWithDictionary:dict];
    }
    return self;
  } else {
    return nil;
  }
}
@end
