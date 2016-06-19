//
//  KBChoiceServiceController.m
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/17.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBChoiceServiceController.h"
#import "KBChoiceServiceItemListDeleget.h"
#import "KBChoiceServiceWayListDeleget.h"

@interface KBChoiceServiceController ()<ChoiceServiceItemDelegateDelegate,ChoiceServiceWayDelegateDelegate>
@property (weak, nonatomic) IBOutlet UITableView *serviceItemsTableView;
@property (weak, nonatomic) IBOutlet UITableView *serviceWaysTableView;
@property (weak, nonatomic) IBOutlet UIView *coverView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *serviceItemsTableViewRightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *serviceWaysTableViewRightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *serviceItemsTableViewWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *serviceWaysTableViewWidthConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *coverViewWidthConstraint;

@property (weak, nonatomic) IBOutlet UIButton *serviceItemBtn;
@property (weak, nonatomic) IBOutlet UIButton *serviceWayBtn;
@property (weak, nonatomic) IBOutlet UILabel  *shopName;
@property (weak, nonatomic) IBOutlet UIButton *timeBtn;

@property (strong,nonatomic) KBChoiceServiceItemListDeleget *serviceItemListDeleget;
@property (strong,nonatomic) KBChoiceServiceWayListDeleget *serviceWayListDeleget;

@end

@implementation KBChoiceServiceController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"服务选择";
    
     self.serviceItemListDeleget = [[KBChoiceServiceItemListDeleget alloc] init];
    self.serviceItemListDeleget.delegate = self;
    self.serviceItemsTableView.delegate = self.serviceItemListDeleget;
    self.serviceItemsTableView.dataSource = self.serviceItemListDeleget;
    [self.serviceItemsTableView registerNib:[UINib nibWithNibName:@"KBServiceItemCell" bundle:nil] forCellReuseIdentifier:@"KBServiceItemCell"];
    
    self.serviceWayListDeleget = [[KBChoiceServiceWayListDeleget alloc] init];
    self.serviceWayListDeleget.delegate = self;
    self.serviceWaysTableView.delegate = self.serviceWayListDeleget;
    self.serviceWaysTableView.dataSource = self.serviceWayListDeleget;
    [self.serviceWaysTableView registerNib:[UINib nibWithNibName:@"KBServiceWayCell" bundle:nil] forCellReuseIdentifier:@"KBServiceWayCell"];
    
    self.serviceItemsTableViewWidthConstraint.constant = SCREEN_WIDTH*0.5;
    self.serviceWaysTableViewWidthConstraint.constant  = SCREEN_WIDTH*0.5;
    self.coverViewWidthConstraint.constant = 0;
    
    [self hiddenServiceItemList];
    [self hiddenServiceWayList];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenAll)];
    [self.coverView addGestureRecognizer:tap];
}
- (IBAction)dealServiceItemBtn:(id)sender {
    [self showServiceItemList];
    [self showCoverView];
    NSDictionary *parameter = @{@"member_id":[KBHelper getCustomerId],@"pageSize":@200,@"pageNumber":@1};
    [KBHelper KBPOST:URL_GET_SERVICE_ITEMS parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        NSMutableArray *dataArray = [[NSMutableArray alloc] init];
        for(NSDictionary *data in arr){
            KBServiceItemModel *serviceItemModel = [[KBServiceItemModel alloc] init];
            [serviceItemModel setValuesForKeysWithDictionary:data];
            [dataArray addObject:serviceItemModel];
        }
        self.serviceItemListDeleget.dataArray = dataArray;
        [self.serviceItemsTableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (IBAction)dealServiceWayBtn:(id)sender {
    [self showServiceWayList];
    [self showCoverView];
    NSDictionary *parameter = @{@"pageSize":@200,@"pageNumber":@1};
    [KBHelper KBPOST:URL_GET_SERVICE_WAYS parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        NSMutableArray *dataArray = [[NSMutableArray alloc] init];
        for(NSDictionary *data in arr){
            KBServiceWayModel *serviceWayModel = [[KBServiceWayModel alloc] init];
            [serviceWayModel setValuesForKeysWithDictionary:data];
            [dataArray addObject:serviceWayModel];
        }
        self.serviceWayListDeleget.dataArray = dataArray;
        [self.serviceWaysTableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
- (IBAction)dealTimeBtn:(id)sender {
    
}
- (IBAction)dealOk:(id)sender {
}

//隐藏coverView
- (void)hiddenCoverView{
    self.coverViewWidthConstraint.constant = 0;
}
//显示coverView
- (void)showCoverView{
    self.coverViewWidthConstraint.constant = 0.5*SCREEN_WIDTH;
}

//隐藏服务项目列表
- (void)hiddenServiceItemList{
    [UIView animateWithDuration:0.5 animations:^{
        self.serviceItemsTableViewRightConstraint.constant = -SCREEN_WIDTH*0.5;
    }];
}
//显示服务项目列表
- (void)showServiceItemList{
    [UIView animateWithDuration:0.5 animations:^{
        self.serviceItemsTableViewRightConstraint.constant = 0;
    }];
}

//隐藏服务方式列表
- (void)hiddenServiceWayList{
    [UIView animateWithDuration:0.5 animations:^{
        self.serviceWaysTableViewRightConstraint.constant = -SCREEN_WIDTH*0.5;
    }];
}
//显示服务方式列表
- (void)showServiceWayList{
    [UIView animateWithDuration:0.5 animations:^{
        self.serviceWaysTableViewRightConstraint.constant = 0;
    }];
}

//隐藏所有
- (void)hiddenAll{
    [self hiddenCoverView];
    [self hiddenServiceItemList];
    [self hiddenServiceWayList];
}

#pragma mark - 实现tableview的代理的协议
- (void)choiceServiceItemSelectCellWith{
    [self hiddenAll];
}

- (void)choiceServiceWaySelectCellWith{
    [self hiddenAll];
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