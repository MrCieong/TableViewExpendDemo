//
//  SectionModel.h
//  TableViewExpendDemo
//
//  Created by zhangjing on 16/6/16.
//  Copyright © 2016年 ZhangJing. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ItemModel;
@interface SectionModel : NSObject
@property (nonatomic, copy) NSString *className;
@property (nonatomic, strong) NSArray<ItemModel *> *students;
@property (nonatomic, assign) BOOL expend;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (NSArray *)sectionModelsWithArray:(NSArray *)array;
@end
