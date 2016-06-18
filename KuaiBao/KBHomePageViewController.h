//
//  KBHomePageViewController.h
//  KuaiBao
//
//  Created by FengLiu on 16/3/22.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBViewController.h"

@interface KBHomePageViewController : KBViewController

@end

@protocol EFItemViewDelegate <NSObject>

- (void)didTapped:(NSInteger)index;

@end




@interface EFItemView : UIButton

@property (nonatomic, weak) id <EFItemViewDelegate>delegate;

- (instancetype)initWithNormalImage:(NSString *)normal highlightedImage:(NSString *)highlighted tag:(NSInteger)tag title:(NSString *)title;

@end