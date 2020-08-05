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

static NSMapTable *roomTables;

- (void)dealloc
{
    NSLog(@"------------->%@",NSStringFromClass([self class]));
}

+ (void)buildInstance:(id)delegate;
{
    if (!roomTables) {
         roomTables = [NSMapTable weakToWeakObjectsMapTable];
    }
    MDBaseWeakInstanceManager *strongInstance = [[[self class] alloc] init];
    weakInstance = strongInstance;
    
    [roomTables setValue:strongInstance forKey:delegate];
    
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
