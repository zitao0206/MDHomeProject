//
//  NMLKMultiRoleView.h
//
//  Created by lizitao on 2020/2/19.
//  Copyright © 2020 Tao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

 

@interface NMLKMultiRoleViewConfig : NSObject
@property (nonatomic, assign) CGFloat height;            //背景view高度，default: templateHeight
@property (nonatomic, assign) CGFloat width;            //背景view的宽度，若多行，须设置
@property (nonatomic, strong) UIColor *backgroundColor;  //背景View的背景色
 

+ (NMLKMultiRoleViewConfig *)defaultConfig;

@end

 

typedef void(^NMLKMultiRoleViewConfigBlock)(NMLKMultiRoleViewConfig *roleConfig);

@interface NMLKMultiRoleView : UIView

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;

- (instancetype)initWithMultiRoleConfig:(NMLKMultiRoleViewConfigBlock)configBlock;

- (void)refreshItemsWithData:(NSArray *)array;//元素可以是数组、字典或者NMLKMultiRoleItemDataModel类型

@end

NS_ASSUME_NONNULL_END
