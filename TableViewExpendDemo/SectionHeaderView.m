//
//  SectionHeaderView.m
//  TableViewExpendDemo
//
//  Created by zhangjing on 16/6/16.
//  Copyright © 2016年 ZhangJing. All rights reserved.
//

#import "SectionHeaderView.h"
#import "SectionModel.h"

@interface SectionHeaderView ()

@property (nonatomic, strong) UILabel *sectionTitleLabel;

@end

@implementation SectionHeaderView


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
  self = [super initWithReuseIdentifier:reuseIdentifier];
  if (self) {
    [self commonSetup];
  }
  return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self commonSetup];
  }
  return self;
}

- (void)prepareForReuse {
  [super prepareForReuse];
  self.sectionTitleLabel.text = @"";
}

- (void)commonSetup {
  _sectionTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 26)];
  _sectionTitleLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-Medium" size:12.f];
  [self.contentView addSubview:_sectionTitleLabel];
  UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
  [self addGestureRecognizer:tapGR];
}

- (void)setSectionModel:(SectionModel *)sectionModel {
  _sectionModel = sectionModel;
  self.sectionTitleLabel.text = sectionModel.className;
}

- (void)tapAction {
  if ([self.delegate respondsToSelector:@selector(tapSectionHeaderView:)]) {
    [self.delegate tapSectionHeaderView:self];
  }
}

@end
