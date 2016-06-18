//
//  KBOderViewController.m
//  KuaiBao
//
//  Created by FengLiu on 16/3/22.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBOderViewController.h"
#import "KBOderTableViewCell.h"
@interface KBOderViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *oderListView;
@end

@implementation KBOderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.oderListView.delegate = self;
    self.oderListView.dataSource = self;
    [self.oderListView registerNib:[UINib nibWithNibName:NSStringFromClass([KBOderTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([KBOderTableViewCell class])];
    
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *oderTableViewCell = [self.oderListView dequeueReusableCellWithIdentifier:NSStringFromClass([KBOderTableViewCell class])];
//    oderTableViewCell.textLabel.text = [NSString stringWithFormat:@"%lu",indexPath.row];
    
    return oderTableViewCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
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
