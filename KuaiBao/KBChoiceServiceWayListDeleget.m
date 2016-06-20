//
//  KBChoiceServiceWayListDeleget.m
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/18.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBChoiceServiceWayListDeleget.h"

@implementation KBChoiceServiceWayListDeleget
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.delegate choiceServiceWaySelectCellWith:self.dataArray[indexPath.row]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    KBServiceWayCell *serviceWayCell = [tableView dequeueReusableCellWithIdentifier:@"KBServiceWayCell"];
    KBServiceWayModel *serviceWayModel = self.dataArray[indexPath.row];
    [serviceWayCell configWithModel:serviceWayModel];
    return serviceWayCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
@end
