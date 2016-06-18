//
//  KBRegisterWithAccountController.m
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/14.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBRegisterWithAccountController.h"
#import "KBRegisterWithPasswordController.h"

@interface KBRegisterWithAccountController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *verifyCode;

@end

@implementation KBRegisterWithAccountController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (IBAction)nextForSerPassword:(id)sender {
    NSDictionary *parameter = @{@"telephone":_phoneNumber.text,@"validateVode":_verifyCode.text};
    
    [KBHelper KBPOST:URL_VERIFY_VERIFYCODE parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSString *code = [[dic objectForKey:@"header"] objectForKey:@"code"];
        if ([@"200"  isEqual: code]){
            KBRegisterWithPasswordController *registerWithPasswordController = [KBHelper getViewControllerWithStoryBoardName:@"Mine" storyBoardId:@"KBRegisterWithPasswordController"];
            registerWithPasswordController.phoneNumber = self.phoneNumber.text;
            registerWithPasswordController.userName = self.userName.text;
            [self.navigationController pushViewController:registerWithPasswordController animated:YES];
        }
        NSLog(@"%@",[[dic objectForKey:@"header"] objectForKey:@"code"]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
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
}

#pragma mark - Table view data source

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
