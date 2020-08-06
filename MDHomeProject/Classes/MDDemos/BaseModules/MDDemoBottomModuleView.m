//
//  MDDemoBottomModuleView.m
//  MDProject
//
//  Created by lizitao on 2017/5/13.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDDemoBottomModuleView.h"

@implementation MDDemoBottomModuleView

- (void)loadModuleSubViews
{
    self.backgroundColor = [UIColor greenColor];
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
    
    [[self.blackBoard signalForKey:@"hello_world"] subscribeNext:^(id  _Nullable x) {
       
        NSLog(@"--------------->%@",x);
    }];
    
    
}

- (void)layoutModuleWidth:(CGFloat)viewWidth
{
    self.frame = CGRectMake(0, 0, viewWidth, 100.0);
    [self.indexLabel sizeToFit];
    self.indexLabel.centerX = self.frame.size.width / 2;
    self.indexLabel.centerY = self.frame.size.height / 2;
    
}

@end
