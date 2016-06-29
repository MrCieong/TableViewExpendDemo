//
//  SectionHeaderView.h
//  TableViewExpendDemo
//
//  Created by zhangjing on 16/6/16.
//  Copyright © 2016年 ZhangJing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SectionHeaderView;
@protocol SectionHeaderViewDelegate <NSObject>
- (void)tapSectionHeaderView:(SectionHeaderView *)view;
@end

@class SectionModel;
@interface SectionHeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) SectionModel *sectionModel;
@property (nonatomic, assign) NSUInteger section;
@property (nonatomic, weak) id<SectionHeaderViewDelegate> delegate;


@end
