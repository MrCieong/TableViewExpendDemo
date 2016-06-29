//
//  SectionModel.m
//  TableViewExpendDemo
//
//  Created by zhangjing on 16/6/16.
//  Copyright © 2016年 ZhangJing. All rights reserved.
//

#import "SectionModel.h"
#import "ItemModel.h"

@implementation SectionModel

- (void)setValue:(id)value forKey:(NSString *)key {
  if ([value isKindOfClass:[NSNull class]]) {
    return;
  }
  
  if ([key isEqualToString:@"students"] && [value isKindOfClass:[NSArray class]]) {
    NSMutableArray *tmp = [NSMutableArray new];
    
    for (NSDictionary *dict in value) {
      ItemModel *item = [[ItemModel alloc] initWithDictionary:dict];
      [tmp addObject:item];
    }
    value = tmp;
  }
  
  [super setValue:value forKey:key];
}

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

+ (NSArray *)sectionModelsWithArray:(NSArray *)array {
  if ([array isKindOfClass:[NSArray class]]) {
    NSMutableArray *tmp = [NSMutableArray new];
    for (NSDictionary *dict in array) {
      SectionModel *item = [[SectionModel alloc] initWithDictionary:dict];
      [tmp addObject:item];
    }
    return [tmp copy];
  }
  return nil;
}

@end
