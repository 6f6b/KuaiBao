//
//  KBChoiceServiceController.m
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/17.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBChoiceServiceController.h"

@interface KBChoiceServiceController ()
@property (weak, nonatomic) IBOutlet UITableView *serviceItemsTableView;
@property (weak, nonatomic) IBOutlet UITableView *serviceWaysTableView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *serviceItemsTableViewRightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *serviceWaysTableViewRightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *serviceItemsTableViewWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *serviceWaysTableViewWidthConstraint;

@end

@implementation KBChoiceServiceController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.serviceItemsTableViewWidthConstraint.constant = SCREEN_WIDTH*0.5;
    self.serviceItemsTableViewRightConstraint.constant = -SCREEN_WIDTH*0.5;
    self.serviceWaysTableViewWidthConstraint.constant = SCREEN_WIDTH*0.5;
    self.serviceWaysTableViewRightConstraint.constant = -SCREEN_WIDTH*0.5;
    // Do any additional setup after loading the view.
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
