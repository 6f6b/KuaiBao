//
//  KBForgetPasswordViewController.m
//  KuaiBao
//
//  Created by FengLiu on 16/4/7.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBForgetPasswordViewController.h"
#import "KBResetPasswordViewController.h"

@interface KBForgetPasswordViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *verifyCode;

@end

@implementation KBForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"忘记密码";
    // Do any additional setup after loading the view from its nib.
}

//跳转到设置密码界面
- (IBAction)nextForSetPassword:(id)sender {
    NSDictionary *parameter = @{@"telephone":_phoneNumber.text,@"validateVode":_verifyCode.text};
    
    [KBHelper KBPOST:URL_VERIFY_VERIFYCODE parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",dic);
        NSString *code = [[dic objectForKey:@"header"] objectForKey:@"code"];
        if ([@"200"  isEqual: code]){
            KBResetPasswordViewController *resetPasswordViewController = [KBHelper getViewControllerWithStoryBoardName:@"Mine" storyBoardId:@"KBResetPasswordViewController"];
            resetPasswordViewController.userName = self.phoneNumber.text;
            [self.navigationController pushViewController:resetPasswordViewController animated:YES];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"错误");
    }];
}

/**
 *  获取验证码
 *
 *  @param sender
 */
- (IBAction)getVerifyCode:(id)sender {
    NSDictionary *parameter = @{@"telephone":_phoneNumber.text};
    
    [KBHelper KBPOST:URL_GET_VERIFYCODE parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
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
