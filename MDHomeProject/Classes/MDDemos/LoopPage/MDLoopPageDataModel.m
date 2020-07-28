//
//  MDLoopPageDataModel.m
//  MDProject
//
//  Created by lizitao on 2017/6/28.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDLoopPageDataModel.h"

@implementation MDLoopPageDataModel

- (id)initWithDict:(NSDictionary *)dict
{
    
    if (self=[super init]) {
        self.title = dict[@"title"];
        self.icon = dict[@"icon"];
    }
    return self;
}

+ (id)newsWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
