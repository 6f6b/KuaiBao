//
//  KBGoodsListViewController.m
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/24.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBGoodsListViewController.h"
#import "KBChoiceServiceController.h"

@interface KBGoodsListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) NSMutableArray *sectionHeaderTitles;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation KBGoodsListViewController

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

- (IBAction)dealPutToShopTrolley:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    KBChoiceServiceController *choiceServiceController = (KBChoiceServiceController *)self.navigationController.topViewController;
    NSMutableArray *selectProductArray = [[NSMutableArray alloc] init];
    for(NSArray *arr in self.dataArray){
        for(KBGoodsModel *goodsModel in arr){
            if(goodsModel.buyNum != 0){
                [selectProductArray addObject:goodsModel];
            }
        }
    }
    choiceServiceController.selectProductArray = selectProductArray;
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


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 85;
}


@end
