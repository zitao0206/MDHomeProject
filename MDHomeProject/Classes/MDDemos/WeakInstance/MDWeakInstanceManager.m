//
//  MDWeakInstanceManager.m
//  Pods
//
//  Created by lizitao on 2020/6/11.
//

#import "MDWeakInstanceManager.h"

@implementation MDWeakInstanceManager

static __weak MDWeakInstanceManager *weakInstance = nil;

- (void)dealloc
{
    
}

+ (void)buildInstance:(id)delegate identifier:(NSString *)identifier;
{
    MDWeakInstanceManager *strongInstance = weakInstance;
    @synchronized(self) {
        if (!strongInstance || ![strongInstance.identifier isEqualToString:identifier]) {
            strongInstance = [[[self class] alloc] init];
            strongInstance.identifier = identifier;
            weakInstance = strongInstance;
        }
    }
    strongInstance.delegate = delegate;
    if (strongInstance.delegate && [strongInstance.delegate respondsToSelector:@selector(buildInstance:identifier:)]) {
        [strongInstance.delegate buildInstance:strongInstance identifier:identifier];
    }
}

+ (MDWeakInstanceManager *)shareInstance
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
