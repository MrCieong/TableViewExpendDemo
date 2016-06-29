//
//  ExpendTableViewController.m
//  TableViewExpendDemo
//
//  Created by zhangjing on 16/6/16.
//  Copyright © 2016年 ZhangJing. All rights reserved.
//

#import "ExpendTableViewController.h"
#import "SectionModel.h"
#import "ItemModel.h"
#import "SectionHeaderView.h"

@interface ExpendTableViewController () <SectionHeaderViewDelegate>

@property (nonatomic, strong) NSArray *sectionModels;

@end

@implementation ExpendTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.tableView registerClass:[SectionHeaderView class] forHeaderFooterViewReuseIdentifier:@"HeaderView"];
  [self loadData];
}

- (void)loadData {
  NSArray *datas = @[@{@"className" : @"Aitna",
                       @"students"  : @[@{@"name" : @"Y.X.M.",   @"age" : @(27)},
                                        @{@"name" : @"Leif",     @"age" : @(12)},
                                        @{@"name" : @"Lennon",   @"age" : @(23)},
                                        @{@"name" : @"Lambert",  @"age" : @(19)},
                                        @{@"name" : @"Jerome",   @"age" : @(19)},
                                        @{@"name" : @"Isidore",  @"age" : @(19)}]},
                     @{@"className" : @"Melete",
                       @"students"  : @[@{@"name" : @"Merle",    @"age" : @(34)},
                                        @{@"name" : @"Paddy",    @"age" : @(31)},
                                        @{@"name" : @"Perry",    @"age" : @(10)},
                                        @{@"name" : @"Philip",   @"age" : @(39)}]},
                     @{@"className" : @"Aoede",
                       @"students"  : @[@{@"name" : @"Verne",    @"age" : @(34)},
                                        @{@"name" : @"Vincent",  @"age" : @(78)},
                                        @{@"name" : @"Walter",   @"age" : @(43)},
                                        @{@"name" : @"Zachary",  @"age" : @(21)}]},
                     @{@"className" : @"Dione",
                       @"students"  : @[@{@"name" : @"Timothy",  @"age" : @(98)},
                                        @{@"name" : @"Roderick", @"age" : @(21)},
                                        @{@"name" : @"Quentin",  @"age" : @(7)},
                                        @{@"name" : @"Paddy",    @"age" : @(67)}]},
                     @{@"className" : @"Adanos",
                       @"students"  : @[@{@"name" : @"Mortimer", @"age" : @(23)},
                                        @{@"name" : @"Michael",  @"age" : @(45)},
                                        @{@"name" : @"Kevin",    @"age" : @(89)},
                                        @{@"name" : @"Jeremy",   @"age" : @(23)}]},];
  self.sectionModels = [SectionModel sectionModelsWithArray:datas];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return self.sectionModels.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  SectionModel *sectionModel = [self sectionModelAtSection:section];
  return sectionModel.expend == YES ? sectionModel.students.count : 0;
}

- (ItemModel *)itemModelAtIndexPath:(NSIndexPath *)indexPath {
  SectionModel *sectionModel = [self sectionModelAtSection:indexPath.section];
  return sectionModel.students[indexPath.row];
}

- (SectionModel *)sectionModelAtSection:(NSInteger)section {
  return self.sectionModels[section];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
  SectionHeaderView *headerView = (SectionHeaderView *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"HeaderView"];
  headerView.sectionModel = [self sectionModelAtSection:section];
  headerView.delegate = self;
  headerView.section = section;
  return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
  
  ItemModel *model = [self itemModelAtIndexPath:indexPath];
  cell.textLabel.text = model.name;
  cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)model.age];
  
  return cell;
}

#pragma mark - SectionHeaderViewDelegate
- (void)tapSectionHeaderView:(SectionHeaderView *)view {
  SectionModel *sectionModel = view.sectionModel;
  if (sectionModel.expend == NO) {
    sectionModel.expend = YES;
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:view.section] withRowAnimation:UITableViewRowAnimationFade];
  } else {
    sectionModel.expend = NO;
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:view.section] withRowAnimation:UITableViewRowAnimationFade];
  }
}

@end
