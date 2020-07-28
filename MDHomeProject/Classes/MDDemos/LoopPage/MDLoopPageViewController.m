//
//  MDLoopPageViewController.m
//  MDProject
//
//  Created by lizitao on 2017/6/28.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDLoopPageViewController.h"
#import <MDCommonKit/MDCommonKit.h>
#import <EasyLayout/EasyLayout.h>
#import "MDLoopPageDataModel.h"
#import "MDLoopPageCell.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define YYMaxSections 3
#define k_width  (SCREEN_WIDTH - 30)

@interface MDLoopPageViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic , strong) UICollectionView *collectionView;
@property (nonatomic , strong) UIPageControl *pageControl;
@property (nonatomic , strong) NSMutableArray *newses;
@property (nonatomic , strong) NSTimer *timer;

@end

@implementation MDLoopPageViewController

-(NSArray *)newses
{
    if (_newses == nil) {
        _newses = [NSMutableArray array];
        {
            MDLoopPageDataModel *model = [MDLoopPageDataModel new];
            model.icon = @"01.jpg";
            model.title = @"第一张图";
            [_newses addObject:model];
        }
        {
            MDLoopPageDataModel *model = [MDLoopPageDataModel new];
            model.icon = @"02.jpg";
            model.title = @"第二张图";
            [_newses addObject:model];
        }
        {
            MDLoopPageDataModel *model = [MDLoopPageDataModel new];
            model.icon = @"03.jpg";
            model.title = @"第三张图";
            [_newses addObject:model];
        }
        {
            MDLoopPageDataModel *model = [MDLoopPageDataModel new];
            model.icon = @"04.jpg";
            model.title = @"第四张图";
            [_newses addObject:model];
        }
    }
    return  _newses;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initView];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)initView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(k_width, 200);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(15, 150, k_width, 200) collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.pagingEnabled = YES;
    collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:collectionView];
    
    _collectionView = collectionView;
    
    [self.collectionView registerClass:[MDLoopPageCell class] forCellWithReuseIdentifier:@"MDLoopPageCell"];
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:1] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.center = CGPointMake(SCREEN_WIDTH * 0.5, 200 + 64);
    pageControl.bounds = CGRectMake(0, 0, 150, 40);
    pageControl.pageIndicatorTintColor = [UIColor blueColor];
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    pageControl.enabled = NO;
    pageControl.numberOfPages = _newses.count;
    
    [self.view addSubview:pageControl];
    
    _pageControl = pageControl;
    
    
    [self addTimer];
    
}
#pragma mark 添加定时器
- (void)addTimer
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(nextpage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer ;
}

#pragma mark 删除定时器
- (void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)nextpage
{
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] lastObject];

    NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:1];
    [self.collectionView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];

    NSInteger nextItem = currentIndexPathReset.item + 1;
    NSInteger nextSection = currentIndexPathReset.section;
    if (nextItem == self.newses.count) {
        nextItem = 0;
        nextSection ++;
    }
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];

    [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return YYMaxSections;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.newses.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MDLoopPageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MDLoopPageCell" forIndexPath:indexPath];
    if(!cell){
        cell = [[MDLoopPageCell alloc] init];
    }
    cell.datas = self.newses[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"----------->%@",@(indexPath.section));
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}

#pragma mark 当用户停止的时候调用
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
//    [self addTimer];
    
}

#pragma mark 设置页码
-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = (int) (scrollView.contentOffset.x/scrollView.frame.size.width+0.5)%self.newses.count;
    self.pageControl.currentPage = page;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"contentOffset.x:------------>%@",@(scrollView.contentOffset.x/k_width));
    
    NSInteger offset = scrollView.contentOffset.x/k_width;
    
    if (offset == 0) {

        scrollView.contentOffset = CGPointMake(self.newses.count * k_width, 0);
    }
    if (offset == (self.newses.count * YYMaxSections - 1)) {
        scrollView.contentOffset = CGPointMake((self.newses.count * 2 - 1) * k_width, 0);
    }
}

@end
