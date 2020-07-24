//
//  MDBaseWeakInstanceManager.m
//  Pods
//
//  Created by lizitao on 2020/6/11.
//

#import "MDBaseWeakInstanceManager.h"

@interface MDBaseWeakInstanceManager ()

@end

@implementation MDBaseWeakInstanceManager

static __weak MDBaseWeakInstanceManager *weakInstance = nil;

- (void)dealloc
{
    NSLog(@"------------->%@",NSStringFromClass([self class]));
}

+ (void)buildInstance:(id)delegate;
{
    MDBaseWeakInstanceManager *strongInstance = nil;
    if (!strongInstance) {
        strongInstance = [[[self class] alloc] init];
        weakInstance = strongInstance;
    }
    strongInstance.delegate = delegate;
    if (strongInstance.delegate && [strongInstance.delegate respondsToSelector:@selector(assignInstance:)]) {
        [strongInstance.delegate assignInstance:strongInstance];
    }
}

+ (MDBaseWeakInstanceManager *)shareInstance
{
    return weakInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

@end
