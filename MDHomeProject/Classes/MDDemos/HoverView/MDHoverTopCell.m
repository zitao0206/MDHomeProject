//
//  MDHoverTopCell.m
//  MDProject
//
//  Created by lizitao on 2018/2/22.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import "MDHoverTopCell.h"
#import <EasyLayout/EasyLayout.h>
 

@interface MDHoverTopCell ()
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation MDHoverTopCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLabel = [UILabel new];
        _titleLabel.text = @"top view";
        _titleLabel.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:_titleLabel];
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}
 

- (void)layoutSubviews
{
    [self.titleLabel sizeToFit];
    self.titleLabel.centerY = self.frame.size.height/2;
    self.titleLabel.centerX = self.frame.size.width/2;
}


@end
