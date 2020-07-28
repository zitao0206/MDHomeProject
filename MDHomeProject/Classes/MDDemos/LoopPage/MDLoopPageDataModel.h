//
//  MDLoopPageDataModel.h
//  MDProject
//
//  Created by lizitao on 2017/6/28.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import <UIKit/UIKit.h>
 

@interface MDLoopPageDataModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *icon;

- (id)initWithDict:(NSDictionary *)dict;

+ (id)newsWithDict : (NSDictionary *) dict;

@end
