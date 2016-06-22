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
#import "KBServiceTimeQuantumDelegate.h"
#import "KBServiceStationListController.h"
#import "KBGoodsListController.h"

@interface KBChoiceServiceController ()<ChoiceServiceItemDelegateDelegate,ChoiceServiceWayDelegateDelegate,ServiceTimeQuantumDelegateDelegate>
@property (weak, nonatomic) IBOutlet UITableView *serviceItemsTableView;
@property (weak, nonatomic) IBOutlet UITableView *serviceWaysTableView;
@property (weak, nonatomic) IBOutlet UITableView *serviceTimeQuantumTableView;

@property (weak, nonatomic) IBOutlet UIView *coverView;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (weak, nonatomic) IBOutlet UIButton *hiddernDatePickerBtn;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *serviceItemsTableViewRightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *serviceWaysTableViewRightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *serviceTimeQuantumRightConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *serviceItemsTableViewWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *serviceWaysTableViewWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *serviceTimeQuantumWidthConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *coverViewWidthConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *datePickerBottomConstraint;

@property (weak, nonatomic) IBOutlet UIButton *serviceItemBtn;
@property (weak, nonatomic) IBOutlet UIButton *serviceWayBtn;
@property (weak, nonatomic) IBOutlet UILabel  *shopName;
@property (weak, nonatomic) IBOutlet UIButton *timeBtn;
@property (weak, nonatomic) IBOutlet UIButton *serviceStationBtn;
@property (weak, nonatomic) IBOutlet UIButton *serviceTimeQuantumBtn;

@property (strong,nonatomic) KBChoiceServiceItemListDeleget *serviceItemListDeleget;
@property (strong,nonatomic) KBChoiceServiceWayListDeleget *serviceWayListDeleget;
@property (strong,nonatomic) KBServiceTimeQuantumDelegate *serviceTimeQuantumDelegate;
@end

@implementation KBChoiceServiceController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"服务选择";
    self.shopName.text = self.annotationModel.shopName;
    
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
    
    self.serviceTimeQuantumDelegate = [[KBServiceTimeQuantumDelegate alloc] init];
    self.serviceTimeQuantumDelegate.delegate = self;
    self.serviceTimeQuantumTableView.delegate = self.serviceTimeQuantumDelegate;
    self.serviceTimeQuantumTableView.dataSource = self.serviceTimeQuantumDelegate;
    [self.serviceTimeQuantumTableView registerNib:[UINib nibWithNibName:@"KBServiceTimeQuantumCell" bundle:nil] forCellReuseIdentifier:@"KBServiceTimeQuantumCell"];
    
    self.serviceItemsTableViewWidthConstraint.constant = SCREEN_WIDTH*0.5;
    self.serviceWaysTableViewWidthConstraint.constant  = SCREEN_WIDTH*0.5;
    self.serviceTimeQuantumWidthConstraint.constant  = SCREEN_WIDTH*0.5;
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
- (IBAction)dealTimeQuantum:(id)sender {
    [self showServiceTimeQuantumList];
    [self showCoverView];
    NSDictionary *parameter = @{@"pageSize":@200,@"pageNumber":@1};
    [KBHelper KBPOST:URL_GET_TIME_QUANTUM parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        NSLog(@"%@",arr);
        NSMutableArray *dataArray = [[NSMutableArray alloc] init];
        for(NSDictionary *data in arr){
            KBServiceTimeQuantumModel *serviceTimeQuantumModel = [[KBServiceTimeQuantumModel alloc] init];
            [serviceTimeQuantumModel setValuesForKeysWithDictionary:data];
            [dataArray addObject:serviceTimeQuantumModel];
        }
        self.serviceTimeQuantumDelegate.dataArray = dataArray;
        [self.serviceTimeQuantumTableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (IBAction)dealTimeBtn:(id)sender {
    [self showDatePicker];
}
- (IBAction)dealServiceStation:(id)sender {
     KBServiceStationListController *serviceStationList = [KBHelper getViewControllerWithStoryBoardName:@"KuaiBao" storyBoardId:@"KBServiceStationListController"];
    serviceStationList.annotationModel = self.annotationModel;
    serviceStationList.delegate = self;
    [self.navigationController pushViewController:serviceStationList animated:YES];
}
- (IBAction)dealOk:(id)sender {
}
- (IBAction)dealHiddenDatePicker:(id)sender {
    [self hiddenDatePicker];
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
    [UIView animateWithDuration:0.3 animations:^{
        self.serviceItemsTableViewRightConstraint.constant = -SCREEN_WIDTH*0.5;
        [self.serviceItemsTableView layoutIfNeeded];
    }];
}
//显示服务项目列表
- (void)showServiceItemList{
    [self hiddenDatePicker];
    [UIView animateWithDuration:0.3 animations:^{
        self.serviceItemsTableViewRightConstraint.constant = 0;
        [self.serviceItemsTableView layoutIfNeeded];
    }];
}

//隐藏服务方式列表
- (void)hiddenServiceWayList{
    [UIView animateWithDuration:0.3 animations:^{
        self.serviceWaysTableViewRightConstraint.constant = -SCREEN_WIDTH*0.5;
        [self.serviceWaysTableView layoutIfNeeded];
    }];
}
//显示服务方式列表
- (void)showServiceWayList{
    [self hiddenDatePicker];
    [UIView animateWithDuration:0.3 animations:^{
        self.serviceWaysTableViewRightConstraint.constant = 0;
        [self.serviceWaysTableView layoutIfNeeded];
    }];
}

//隐藏时间段列表
- (void)hiddenServiceTimeQuantumList{
    [UIView animateWithDuration:0.3 animations:^{
        self.serviceTimeQuantumRightConstraint.constant = -SCREEN_WIDTH*0.5;
        [self.serviceTimeQuantumTableView layoutIfNeeded];
    }];
}
//显示时间段列表
- (void)showServiceTimeQuantumList{
    [self hiddenDatePicker];
    [UIView animateWithDuration:0.3 animations:^{
        self.serviceTimeQuantumRightConstraint.constant = 0;
        [self.serviceTimeQuantumTableView layoutIfNeeded];
    }];
}

//显示时间选择器
- (void)showDatePicker{
    self.datePicker.date = [NSDate date];
    self.datePicker.minimumDate = [NSDate date];
    [self.datePicker addTarget:self action:@selector(oneDatePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.datePickerBottomConstraint.constant = 0;
        [self.datePicker layoutIfNeeded];
        [self.hiddernDatePickerBtn layoutIfNeeded];
        
    }];
}

- (void)oneDatePickerValueChanged:(UIDatePicker *)sender{
    NSDate *select = [sender date]; // 获取被选中的时间
    NSDateFormatter *selectDateFormatter = [[NSDateFormatter alloc] init];
    selectDateFormatter.dateFormat = @"yy年MM月dd日"; // 设置时间和日期的格式
    NSString *dateAndTime = [selectDateFormatter stringFromDate:select];
    [self.timeBtn setTitle:dateAndTime forState:UIControlStateNormal];
}

//隐藏时间选择器
- (void)hiddenDatePicker{
    [UIView animateWithDuration:0.3 animations:^{
        self.datePickerBottomConstraint.constant = -230;
        [self.datePicker layoutIfNeeded];
        [self.hiddernDatePickerBtn layoutIfNeeded];
    }];
}

//隐藏所有
- (void)hiddenAll{
    [self hiddenCoverView];
    [self hiddenServiceItemList];
    [self hiddenServiceWayList];
    [self hiddenServiceTimeQuantumList];
}


#pragma mark - 实现tableview的代理的协议
- (void)choiceServiceItemSelectCellWith:(KBServiceItemModel *)serviceItemModel{
    [self hiddenAll];
    [self.serviceItemBtn setTitle:serviceItemModel.serviceItemname forState:UIControlStateNormal];
    KBGoodsListController *goodListController = [KBHelper getViewControllerWithStoryBoardName:@"KuaiBao" storyBoardId:@"KBGoodsListController"];
    goodListController.serviceItemModel = serviceItemModel;
    [self.navigationController pushViewController:goodListController animated:YES];
}

- (void)choiceServiceWaySelectCellWith:(KBServiceWayModel *)serviceWayModel{
    [self hiddenAll];
    [self.serviceWayBtn setTitle:serviceWayModel.name forState:UIControlStateNormal];
}

- (void)choiceServiceStationSelectCellWith:(KBServiceStationModel *)serviceStationModel{
    [self.serviceStationBtn setTitle:serviceStationModel.name forState:UIControlStateNormal];
}

- (void)serviceTimeQuantumSelectCellWith:(KBServiceTimeQuantumModel *)serviceTimeQuantumModel{
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *currentDateStr = [dateFormatter stringFromDate:currentDate];
    currentDate = [dateFormatter dateFromString:currentDateStr];
    NSDate *beginDate = [dateFormatter dateFromString:serviceTimeQuantumModel.beginTime];
    
    NSComparisonResult *result = [currentDate compare:beginDate];
    if(result == NSOrderedAscending){
        [self.serviceTimeQuantumBtn setTitle:serviceTimeQuantumModel.timeName forState:UIControlStateNormal];
    }
    else{
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"注意" message:@"选择时间段必须大于当前时间" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertVC addAction:okAction];
        
        [self presentViewController:alertVC animated:YES completion:^{
            
        }];
    }
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
