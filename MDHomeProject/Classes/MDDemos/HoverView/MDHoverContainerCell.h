//
//  MDHoverContainerCell.h
//  MDProject
//
//  Created by lizitao on 2018/2/22.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import <UIKit/UIKit.h>
 
@protocol MDHoverContainerCellDelegate <NSObject>

@optional
- (void)containerScrollViewDidScroll:(UIScrollView *)scrollView;

- (void)containerScrollViewDidEndDecelerating:(UIScrollView *)scrollView;

@end

@interface MDHoverContainerCell : UITableViewCell

@property (nonatomic,strong) UIViewController *VC;

@property (nonatomic, strong, readonly) UIScrollView *scrollView;

@property (nonatomic, assign) BOOL objectCanScroll;
@property (nonatomic, assign) BOOL isSelectIndex;

@property (nonatomic,weak) id<MDHoverContainerCellDelegate>delegate;

- (void)configScrollView;

@end
