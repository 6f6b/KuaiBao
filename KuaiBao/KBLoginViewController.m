//
//  KBRegisterViewController.m
//  KuaiBao
//
//  Created by FengLiu on 16/4/5.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBLoginViewController.h"
#import "KBRegisterViewController.h"
#import "KBForgetPasswordViewController.h"
@interface KBLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userAccount;
@property (weak, nonatomic) IBOutlet UITextField *userPassword;

@end

@implementation KBLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"登录";
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)dealForRegister:(id)sender {
    
    KBRegisterViewController *registerViewController = [[KBRegisterViewController alloc] init];
    registerViewController.navigationItem.title = @"登录";
    [self.navigationController pushViewController:registerViewController animated:YES];
}
- (IBAction)dealForForgetPassword:(id)sender {
    KBForgetPasswordViewController *forgetPasswordViewController = [[KBForgetPasswordViewController alloc] init];
    forgetPasswordViewController.navigationItem.title = @"忘记密码";
    [self.navigationController pushViewController:forgetPasswordViewController animated:YES];
}
- (IBAction)dealLogin:(id)sender {
    NSDictionary *parameter = @{@"userName":self.userAccount.text,@"pwd":self.userPassword.text};
    [KBHelper KBPOST:URL_LOGIN parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if([[[dic objectForKey:@"header"] objectForKey:@"code"] isEqualToString:@"200"]){
            [KBHelper setCustomerId:[[dic objectForKey:@"data"] objectForKey:@"customerId"]];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
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
