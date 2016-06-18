//
//  LFLoopScrollView.h
//  LFLoopScrollView
//
//  Created by LiuFeng on 15/10/26.
//  Copyright (c) 2015年 LF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFLoopScrollView : UIView
//shi否自动滚动
@property (nonatomic,assign) BOOL autoScroll;       //  默认是NO

//实例化
+ (instancetype)loopScrollViewWithFrame:(CGRect)frame;

//设置本地图片
- (void)setImageWithArray:(NSArray *)images;

//设置网络图片
- (void)setImageWithUrlS:(NSArray *)urls;

//设置点击事件
- (void)setClickedAction:(void(^)(UIImageView *imageView,NSInteger index))action;
@end
