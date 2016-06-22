//
//  KBGoodsListController.m
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/21.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBGoodsListController.h"

@interface KBGoodsListController ()
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) NSMutableArray *sectionHeaderTitles;
@end

@implementation KBGoodsListController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *parameter = @{@"customerid":[KBHelper getCustomerId],@"serviceItemid":self.serviceItemModel.serviceitemId};
    [KBHelper KBPOST:URL_GET_GOODS parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *data = [dic objectForKey:@"data"];
        NSArray *keys = [data allKeys];
        self.sectionHeaderTitles = keys;
        NSMutableArray *dataArray = [NSMutableArray new];
        for (NSString *key in keys){
            NSArray *arr = [data objectForKey:key];
            NSMutableArray *goodsArray = [NSMutableArray new];
            for (NSDictionary *goodsDic in arr){
                KBGoodsModel *goodsModel = [[KBGoodsModel alloc] init];
                [goodsModel setValuesForKeysWithDictionary:goodsDic];
                [goodsArray addObject:goodsModel];
            }
            [dataArray addObject:goodsArray];
        }
        self.dataArray = dataArray;
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.sectionHeaderTitles count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KBGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KBGoodsCell" forIndexPath:indexPath];
    KBGoodsModel *goodsModel = self.dataArray[indexPath.section][indexPath.row];
    [cell configWithModel:goodsModel];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView reloadData];
//    [self.navigationController popViewControllerAnimated:YES];
}


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
