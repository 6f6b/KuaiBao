//
//  KBConfigForCarNoController.m
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/27.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBConfigForCarNoController.h"

@interface KBConfigForCarNoController ()

@property (weak, nonatomic) IBOutlet UITextField *carNum;
@end

@implementation KBConfigForCarNoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)dealCommit:(id)sender {
    NSDictionary *parameter = @{@"customerId":[KBHelper getCustomerId]};
    [KBHelper KBPOST:URL_GET_USERINFO parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        KBUserInfo *userInfo = [KBUserInfo new];
        [userInfo setValuesForKeysWithDictionary:[dic objectForKey:@"data"]];
        
        
        if(nil != self.carNum.text){
            userInfo.carnumber = self.carNum.text;
            userInfo.pwd = nil;
            NSDictionary *parameter = [userInfo mj_keyValues];
            //            NSDictionary *parameter = @{@"userName":self.userName.text,@"customerId":[KBHelper getCustomerId]};
            [KBHelper KBPOST:URL_UPDATE_USER_INFO parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                NSLog(@"%@",dic);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
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
