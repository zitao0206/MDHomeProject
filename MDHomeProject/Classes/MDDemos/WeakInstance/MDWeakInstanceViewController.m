//
//  MDWeakInstanceViewController.m
//  MDProject
//
//  Created by lizitao on 2017/6/28.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDWeakInstanceViewController.h"
#import "MDBaseWeakInstanceManager.h"
#import <MDCommonKit/MDCommonKit.h>
#import <EasyLayout/EasyLayout.h>
#import "MDInstanceManager.h"
#import "MDWeakInstanceManager.h"
#import "MDAWeakInstanceManager.h"
#import "MDBWeakInstanceManager.h"

@interface MDWeakInstanceViewController ()<MDBaseWeakInstanceManagerDelegate, MDWeakInstanceManagerDelegate>
@property (nonatomic, strong) UIButton *btn;
 
@property (nonatomic, strong) MDBaseWeakInstanceManager *instance;
@end

@implementation MDWeakInstanceViewController

- (void)dealloc
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [MDBaseWeakInstanceManager buildInstance:self];
   
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.size = CGSizeMake(80, 40);
    [btn setTitle:@"点击这里" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [btn addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:btn];
    self.btn = btn;
    self.view.backgroundColor = [UIColor whiteColor];
    
    MDBaseWeakInstanceManager *instanceManager = [MDBaseWeakInstanceManager shareInstance];
    NSLog(@"-->%@",instanceManager);
//    NSLog(@"-->%@",[[MDInstanceManager alloc]init]);
//    NSLog(@"-->%@",[instanceManager copy]);
//    NSLog(@"-->%@",[instanceManager mutableCopy]);
    
}

- (void)clickAction
{
    MDBaseWeakInstanceManager *instanceManager = [MDBaseWeakInstanceManager shareInstance];
    NSLog(@"clicked:-->%@",instanceManager);
    
    [self.navigationController pushViewController:[[MDWeakInstanceViewController alloc]init] animated:YES];
}

#pragma mark -- MDBaseWeakInstanceManagerDelegate

- (void)assignInstance:(MDBaseWeakInstanceManager *)instance
{
    self.instance = instance;
}

//- (void)assignInstance:(MDWeakInstanceManager *)instance
//{
//    self.weakInstanceManager = instance;
//}

- (void)viewDidLayoutSubviews
{
    self.btn.centerY = self.view.height / 2.0;
    self.btn.centerX = self.view.width / 2.0;
}

@end
