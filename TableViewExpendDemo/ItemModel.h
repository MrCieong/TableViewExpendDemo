//
//  ItemModel.h
//  TableViewExpendDemo
//
//  Created by zhangjing on 16/6/16.
//  Copyright © 2016年 ZhangJing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSUInteger age;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
@end
