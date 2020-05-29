//
//  NMLKMultiRoleView.m
//
//  Created by lizitao on 2020/2/19.
//  Copyright © 2020 Tao. All rights reserved.
//

#import "NMLKMultiRoleView.h"

#define NMLKWidth [UIScreen mainScreen].bounds.size.width

#define LabelHorizontalSpace 8
#define LabelVerticalSpace 8
#define NMLKButtonTagValue  9000

@interface NMLKMultiRoleButton : UIButton
@property (nonatomic, copy) NSString *key;
@end

@implementation NMLKMultiRoleButton
@end



@implementation NMLKMultiRoleViewConfig


+ (NMLKMultiRoleViewConfig *)defaultConfig
{
    NMLKMultiRoleViewConfig *config = [NMLKMultiRoleViewConfig new];
    return config;
}

@end

@interface NMLKMultiRoleView ()
@property (nonatomic, strong) NMLKMultiRoleViewConfig *config;

@end

@implementation NMLKMultiRoleView


- (instancetype)initWithMultiRoleConfig:(NMLKMultiRoleViewConfigBlock)configBlock
{
    self = [super init];
    if (self) {
        _config = [NMLKMultiRoleViewConfig defaultConfig];
        if (configBlock) {
            configBlock(_config);
        }
        self.backgroundColor = _config.backgroundColor;
        self.frame = CGRectMake(0, 0, _config.width, _config.height);
    }
    return self;
}



- (void)refreshItemsWithData:(NSArray *)array
{
   
}


- (CGSize)sizeWithText:(NSString *)text withFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
}

@end

