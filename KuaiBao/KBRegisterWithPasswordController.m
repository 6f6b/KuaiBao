//
//  KBRegisterWithPasswordController.m
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/14.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBRegisterWithPasswordController.h"

@interface KBRegisterWithPasswordController ()
@property (weak, nonatomic) IBOutlet UITextField *password;

@property (weak, nonatomic) IBOutlet UITextField *verifyPassword;
@end

@implementation KBRegisterWithPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (IBAction)finishRegister:(id)sender {
    if(![self.password.text isEqualToString:self.verifyPassword.text]){
        return;
    }
    NSDictionary *parameter = @{@"userName":self.userName,
                                @"carno":@"",
                                @"pwd":self.password.text,
                                @"telephone":self.phoneNumber};
    [KBHelper KBPOST:URL_REGITER parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        //成功
        if([[[dic objectForKey:@"header"] objectForKey:@"code"] isEqualToString:@"200"]){
            [KBHelper setCustomerId:[[dic objectForKey:@"data"] objectForKey:@"customerId"]];
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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        if(nil != [KBHelper getCustomerId]){
            
        }
    }
}




@end
