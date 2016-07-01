//
//  KBMineViewController.m
//  KuaiBao
//
//  Created by dev.liufeng on 16/5/24.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBMineViewController.h"
#import "KBLoginViewController.h"
#import "KBOderViewController.h"
#import "KBUserInfo.h"

@interface KBMineViewController ()
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userScore;
@property (weak, nonatomic) IBOutlet UILabel *carNumber;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;

@end

@implementation KBMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 2;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return ;
//}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        if (![KBHelper getCustomerId]) {
            KBLoginViewController *loginVC = (KBLoginViewController *)[KBHelper getViewControllerWithStoryBoardName:@"Mine" storyBoardId:@"KBLoginViewController"];
            [self.navigationController pushViewController:loginVC animated:YES];
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            KBOderViewController *oderVC = (KBOderViewController *)[KBHelper getViewControllerWithStoryBoardName:@"Oder" storyBoardId:@"KBOderViewController"];
            [self.navigationController pushViewController:oderVC animated:true];
        }
        if (indexPath.row == 1) {
            
        }
        if (indexPath.row == 2) {
            
        }
        if (indexPath.row == 4){
            if(nil == [KBHelper getCustomerId]){
                KBLoginViewController *loginVC = (KBLoginViewController *)[KBHelper getViewControllerWithStoryBoardName:@"Mine" storyBoardId:@"KBLoginViewController"];
                [self.navigationController pushViewController:loginVC animated:YES];
                return;
            }
            KBConfigController *configVC = (KBConfigController *)[KBHelper getViewControllerWithStoryBoardName:@"Mine" storyBoardId:@"KBConfigController"];
            [self.navigationController pushViewController:configVC animated:YES];
        }
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if(![KBHelper getCustomerId]){
        self.userName.text = @"请登录";
        self.carNumber.text = @"";
        self.userScore.text = @"";
        return;
    }
    NSDictionary *parameter = @{@"customerId":[KBHelper getCustomerId]};
    [KBHelper KBPOST:URL_GET_USERINFO parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        KBUserInfo *userInfo = [KBUserInfo new];
        [userInfo setValuesForKeysWithDictionary:[dic objectForKey:@"data"]];
        self.userName.text = userInfo.userName;
        self.carNumber.text = [NSString stringWithFormat:@"车牌号：%@",userInfo.carnumber];
        self.userScore.text = [NSString stringWithFormat:@"积分：%@",userInfo.point];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

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
