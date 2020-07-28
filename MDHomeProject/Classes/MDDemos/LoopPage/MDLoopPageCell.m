//
//  MDLoopPageCell.h
//  MDProject
//
//  Created by lizitao on 2017/6/28.
//  Copyright © 2017年 lizitao. All rights reserved.
//
#import "MDLoopPageCell.h"
#import "MDLoopPageDataModel.h"

@interface MDLoopPageCell()
@property (weak , nonatomic) UILabel *label;
@property (weak , nonatomic) UIImageView *imageView;

@end

@implementation MDLoopPageCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    if (self) {
        UIImageView *img = [[UIImageView alloc] init];
        [self.contentView addSubview:img];
        self.imageView = img;
        
        UILabel *lab = [[UILabel alloc] init];
        [self.contentView addSubview:lab];
        self.label = lab;
    }
    return self;
}


- (void)setDatas:(MDLoopPageDataModel *)datas
{
    _datas = datas;
    [self settingData];
    [self settingFrame];
}

#pragma mark 给子控件赋值

- (void)settingData
{
    self.imageView.image = [UIImage imageNamed:_datas.icon];
    self.label.text = _datas.title;
}

#pragma mark 设置子控件的frame
- (void)settingFrame
{
    CGFloat screenWidth = self.contentView.frame.size.width;
    self.imageView.frame = CGRectMake(0, 0, screenWidth, 200);
    self.label.frame = CGRectMake(0, 0, screenWidth, 200);
    self.label.font = [UIFont systemFontOfSize:30];
    self.label.textAlignment = NSTextAlignmentCenter;
}

@end
