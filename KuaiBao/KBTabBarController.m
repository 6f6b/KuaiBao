//
//  KBTabBarController.m
//  KuaiBao
//
//  Created by FengLiu on 16/3/22.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBTabBarController.h"

#import "KBMoreViewController.h"
#import "KBMineViewController.h"
#import "KBOderViewController.h"
#import "KBFastProtectViewController.h"
#import "KBHomePageViewController.h"
//#import "EFAnimationViewController.h"

#import "KBNavigationController.h"

@interface KBTabBarController ()

@end

@implementation KBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tabBar.barTintColor = [UIColor blackColor];
    KBHomePageViewController *homePageVC = [[KBHomePageViewController alloc] init];
    [self addChildViewControllerWith:homePageVC title:@"主页" image:@"main_index_search_normal_1" selectedImage:@"main_index_search_normal_2"];
    
    KBFastProtectViewController *fastProtectVC = [[KBFastProtectViewController alloc] init];
    [self addChildViewControllerWith:fastProtectVC title:@"快保" image:@"main_index_tuan_normal_1" selectedImage:@"main_index_tuan_normal_2"];
    
//    KBOderViewController *oderVC = [[UIStoryboard storyboardWithName:@"Oder" bundle:nil] instantiateViewControllerWithIdentifier:@"KBOderViewController"];
//    [self addChildViewControllerWith:oderVC title:@"订单" image:@"main_index_checkin_normal_1" selectedImage:@"main_index_checkin_normal_2"];
    
    KBMineViewController *mineVC = [[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateViewControllerWithIdentifier:@"KBMineViewController"];
    [self addChildViewControllerWith:mineVC title:@"我的" image:@"main_index_my_normal_1" selectedImage:@"main_index_my_normal_2"];
    
//    KBMoreViewController *moreVC = [[UIStoryboard storyboardWithName:@"More" bundle:nil] instantiateViewControllerWithIdentifier:@"KBMoreViewController"];
//    [self addChildViewControllerWith:moreVC title:@"更多" image:@"main_index_more_normal_1" selectedImage:@"main_index_more_normal_2"];
    
    // Do any additional setup after loading the view.
}

- (void)addChildViewControllerWith:(UIViewController *)childController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    KBNavigationController *nac = [[KBNavigationController alloc] initWithRootViewController:childController];
    [nac setTitle:title];
    childController.navigationItem.title = title;
    childController.tabBarItem.title = title;
    childController.tabBarItem.image = [UIImage imageNamed:image];
    childController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
//    childController.tabBarItem.
    [self addChildViewController:nac];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
