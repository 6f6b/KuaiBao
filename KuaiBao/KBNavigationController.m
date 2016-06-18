//
//  KBNavigationController.m
//  KuaiBao
//
//  Created by FengLiu on 16/3/22.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBNavigationController.h"

@interface KBNavigationController ()

@end

@implementation KBNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = [UIColor colorWithRed:10/255.0 green:140/255.0 blue:250/255.0 alpha:1];
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count>=1){
        viewController.hidesBottomBarWhenPushed = true;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"toolbar_fanhui"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(backToController) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(0, 0, 30, 30);
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    }

    [super pushViewController:viewController animated:animated];
}


- (void)backToController{
    [self popViewControllerAnimated:true];
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
