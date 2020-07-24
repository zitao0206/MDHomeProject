//
//  MDAWeakInstanceManager.m
//  Pods
//
//  Created by lizitao on 2020/6/11.
//

#import "MDAWeakInstanceManager.h"

@interface MDAWeakInstanceManager ()

@end

@implementation MDAWeakInstanceManager

+ (MDAWeakInstanceManager *)buildInstanceWith:(MDBaseWeakInstanceManager *)weakInstance
{
    MDAWeakInstanceManager *strongInstance = weakInstance;
    @synchronized(self) {
        if (!strongInstance) {
            strongInstance = [[[self class] alloc] init];
            weakInstance = strongInstance;
        }
    }
    return strongInstance;
}

@end
