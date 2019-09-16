//
//  TestBlockViewController.h
//  MDProject
//
//  Created by lizitao on 2017/8/10.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import <XYPageMaster/XYPageMaster.h>

@interface TestBlockViewController : XYPageMasterViewController

- (instancetype)initWithBlock:(void (^)())block;

@end
