//
//  MDWeakInstanceViewController.m
//  MDProject
//
//  Created by lizitao on 2017/6/28.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDWeakInstanceViewController.h"
#import "MDWeakInstanceManager.h"
#import <MDCommonKit/MDCommonKit.h>
#import <EasyLayout/EasyLayout.h>

@interface MDWeakInstanceViewController ()<MDWeakInstanceManagerDelegate>
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) MDWeakInstanceManager *instance;

@end

@implementation MDWeakInstanceViewController

- (void)dealloc
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [MDWeakInstanceManager buildInstance:self identifier:@"A"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       
        NSLog(@"%@",[MDWeakInstanceManager shareInstance]);

        
    });
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.size = CGSizeMake(80, 40);
    [btn setTitle:@"点击这里" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [btn addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:btn];
    self.btn = btn;
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark -- MDWeakInstanceManagerDelegate

- (void)buildInstance:(MDWeakInstanceManager *)instance identifier:(NSString *)identifier
{
    if ([identifier isEqualToString:@"A"]) {
        self.instance = instance;
    }
}

- (void)viewDidLayoutSubviews
{
    self.btn.centerY = self.view.height / 2.0;
    self.btn.centerX = self.view.width / 2.0;
}

@end
