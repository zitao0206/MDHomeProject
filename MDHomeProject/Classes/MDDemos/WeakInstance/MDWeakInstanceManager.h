//
//  MDWeakInstanceManager.h
//  Pods
//
//  Created by lizitao on 2020/3/30.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

 
@class MDWeakInstanceManager;

@protocol MDWeakInstanceManagerDelegate <NSObject>

- (void)buildInstance:(MDWeakInstanceManager *)instance identifier:(NSString *)identifier;

@end

@interface MDWeakInstanceManager : NSObject

@property (nonatomic, copy) NSString *identifier;

@property (nonatomic, weak) id delegate;

+ (void)buildInstance:(id)delegate identifier:(NSString *)identifier;

//访问时须用此方法
+ (MDWeakInstanceManager *)shareInstance;

- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
