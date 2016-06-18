//
//  KBSettingPasswordViewController.m
//  KuaiBao
//
//  Created by FengLiu on 16/4/7.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBResetPasswordViewController.h"

@interface KBResetPasswordViewController ()
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *verifyPassword;

@end

@implementation KBResetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"重置密码";
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)finishResestPassword:(id)sender {
    NSDictionary *parameter = @{@"userName":self.userName,@"pwd":self.password.text,@"customerId":@""};
    [KBHelper KBPOST:URL_UPDATEPWD parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        //成功
        if([[[dic objectForKey:@"header"] objectForKey:@"code"] isEqualToString:@"200"]){
            [KBHelper setCustomerId:nil];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        //失败
        else{
            
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
