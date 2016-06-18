//
//  LFLoopScrollView.m
//  LFLoopScrollView
//
//  Created by LiuFeng on 15/10/26.
//  Copyright (c) 2015年 LF. All rights reserved.
//

#import "LFLoopScrollView.h"

@interface LFLoopScrollView ()<UIScrollViewDelegate>
@property (nonatomic,weak) UIScrollView *scrollView;
@property (nonatomic,weak) UIPageControl *pageControl;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,strong) void(^action)(UIImageView *imageView,NSInteger index);
@end

@implementation LFLoopScrollView

+ (instancetype)loopScrollViewWithFrame:(CGRect)frame{
    id scrollView = [[self alloc] initWithFrame:frame];
    return scrollView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}



//懒加载scrollView
- (UIScrollView *)scrollView{
    if (_scrollView) {
        return _scrollView;
    }
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    _scrollView = scrollView;
    _scrollView.userInteractionEnabled = YES;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.backgroundColor = [UIColor whiteColor];
    [self addSubview:scrollView];
    return _scrollView;
}

//懒加载pageControl
- (UIPageControl *)pageControl{
    if (_pageControl) {
        return _pageControl;
    }
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.pageIndicatorTintColor = [UIColor colorWithRed:0.536 green:1.000 blue:0.585 alpha:1.000];
    pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    _pageControl = pageControl;
    [self addSubview:pageControl];
    return _pageControl;
}

#pragma mark - 给自己设置frame的时候确定scrollView和pageContol的frame
- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    
    self.scrollView.frame = self.bounds;
    
    CGPoint center = self.center;
    center.y = self.bounds.size.height-20;
    self.pageControl.frame = CGRectMake(0, 0, 20, 20);
    self.pageControl.center = center;
    
}

- (void)setAutoScroll:(BOOL)autoScroll{
    _autoScroll = autoScroll;
    if (_autoScroll) {
        NSTimer *timer = self.timer;
    }
}

#define mark - 配置定时器
- (NSTimer *)timer{
    if (_timer) {
        return _timer;
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(dealTimer) userInfo:nil repeats:YES];
    return _timer;
}

- (void)dealTimer{
    CGPoint contentOffset = self.scrollView.contentOffset;
    if (self.scrollView.contentSize.width-self.scrollView.frame.size.width<=contentOffset.x) {
        contentOffset = CGPointMake(0, 0);
    }
    else{
        contentOffset.x = contentOffset.x + self.scrollView.frame.size.width;
    }
    self.scrollView.contentOffset = contentOffset;
}

#pragma mark -  设置本地图片
- (void)setImageWithArray:(NSArray *)images{
    for (int i=0; i<images.count; i++) {
        [self setImageWithImage:images[i] index:i];
    }
    self.scrollView.contentSize = CGSizeMake(self.frame.size.width*images.count, self.frame.size.height);
    self.pageControl.numberOfPages = images.count;
    [self setAutoScroll:_autoScroll];
}


- (void)setImageWithImage:(UIImage *)image index:(NSInteger)index{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.tag = index;
    imageView.userInteractionEnabled = YES;
    //为imageView添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap:)];
    [imageView addGestureRecognizer:tap];
    
    CGFloat X = self.frame.size.width*index;
    CGFloat Y = 0;
    CGFloat W = self.frame.size.width;
    CGFloat H = self.frame.size.height;
    imageView.frame = CGRectMake(X, Y, W, H);
    imageView.image = image;
    [self.scrollView addSubview:imageView];
}

#pragma mark - 设置网络图片
- (void)setImageWithUrlS:(NSArray *)urls{
    //创建一个全局队列，供下载数据
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //创建一个主队列，供刷新UI
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    for (int i=0; i<urls.count; i++) {
        //将下载图片的任务放到队列中去
        dispatch_async(queue, ^{
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urls[i]]];
            //刷新UI在主队列中

            dispatch_async(mainQueue, ^{
                [self setImageWithImage:[UIImage imageWithData:data] index:i];
            });
        });
    }
    self.scrollView.contentSize = CGSizeMake(self.frame.size.width*urls.count, self.frame.size.height);
    self.pageControl.numberOfPages = urls.count;
    [self setAutoScroll:_autoScroll];
}




- (void)dealTap:(UITapGestureRecognizer *)tap{
    if (self.action) {
        UIImageView *imageView = (id)tap.view;
        self.action(imageView,imageView.tag);
    }
}

- (void)setClickedAction:(void (^)(UIImageView *, NSInteger))action{
    _action = action;
}

#pragma  mark - scrollView的代理方法
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.timer invalidate];
    self.timer = nil;
}


- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    if (self.autoScroll) {
       NSTimer *timer = self.timer;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger currentPage = scrollView.contentOffset.x/scrollView.frame.size.width;
    self.pageControl.currentPage= currentPage;
}

@end
