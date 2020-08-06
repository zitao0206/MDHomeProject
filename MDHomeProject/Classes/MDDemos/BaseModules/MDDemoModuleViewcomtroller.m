//
//  MDDemoModuleViewcomtroller.m
//  MDProject
//
//  Created by lizitao on 2017/5/13.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDDemoModuleViewcomtroller.h"
#import <EasyLayout/EasyLayout.h>

@interface MDDemoModuleViewcomtroller ()

@end

@implementation MDDemoModuleViewcomtroller


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //这里必须要写
    MDBaseModuleModel *model = [MDBaseModuleModel new];
    model.title = @"名称";
    self.model = model;
    
}

- (NSArray *)moduleViews
{
    return @[
        @"MDDemoHeadModuleView",
        @"MDDemoMiddleModuleView",
        @"MDDemoBottomModuleView",
    ];
}

- (CGFloat)contentViewWidth
{
    return [self screenWidth] - 30;
}

- (CGFloat)spaceBetweenModuleViews
{
    return 15.0;
}

- (CGFloat)screenWidth
{
    return [UIScreen mainScreen].bounds.size.width;
}
@end
