//
//  KBConfigForPwdController.m
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/27.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBConfigForPwdController.h"

@interface KBConfigForPwdController ()
@property (weak, nonatomic) IBOutlet UITextField *oldPwd;
@property (weak, nonatomic) IBOutlet UITextField *nowPwd;

@property (weak, nonatomic) IBOutlet UITextField *verifyPwd;
@end

@implementation KBConfigForPwdController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)dealCommit:(id)sender {
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
