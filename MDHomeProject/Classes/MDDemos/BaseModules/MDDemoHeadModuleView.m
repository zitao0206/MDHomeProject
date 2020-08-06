//
//  MDDemoHeadModuleView.m
//  MDProject
//
//  Created by lizitao on 2017/5/13.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDDemoHeadModuleView.h"

@interface MDDemoHeadModuleView ()

@end
@implementation MDDemoHeadModuleView

- (void)loadModuleSubViews
{
    self.backgroundColor = [UIColor redColor];
    self.indexLabel = [UILabel new];
    self.indexLabel.font = [UIFont systemFontOfSize:14.f];
    self.indexLabel.textColor = [UIColor blueColor];
    self.indexLabel.numberOfLines = 1;
    self.indexLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.indexLabel];
    self.backgroundColor = [UIColor lightGrayColor];
    
   
}

- (void)loadModuleData:(id)model
{
    self.indexLabel.text = [[NSString alloc]initWithFormat:@"Module %@",@(self.moduleIndex)];
    self.backgroundColor = [UIColor lightGrayColor];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          [self.blackBoard setValue:@(1) forKey:@"hello_world"];
    });
  
}

- (void)layoutModuleWidth:(CGFloat)viewWidth
{
    self.frame = CGRectMake(0, 0, viewWidth, 100.0);
    [self.indexLabel sizeToFit];
    self.indexLabel.centerX = self.frame.size.width / 2;
    self.indexLabel.centerY = self.frame.size.height / 2;
    
}

@end
