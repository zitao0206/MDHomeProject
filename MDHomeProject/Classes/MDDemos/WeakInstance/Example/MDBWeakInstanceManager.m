//
//  MDBWeakInstanceManager.m
//  Pods
//
//  Created by lizitao on 2020/6/11.
//

#import "MDBWeakInstanceManager.h"
 
@implementation MDBWeakInstanceManager

+ (MDBWeakInstanceManager *)buildInstanceWith:(MDBaseWeakInstanceManager *)weakInstance
{
    MDBWeakInstanceManager *strongInstance = weakInstance;
    @synchronized(self) {
        if (!strongInstance) {
            strongInstance = [[[self class] alloc] init];
            weakInstance = strongInstance;
        }
    }
    return strongInstance;
}

@end
