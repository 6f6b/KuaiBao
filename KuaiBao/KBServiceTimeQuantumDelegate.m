//
//  KBServiceTimeQuantumDelegate.m
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/22.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBServiceTimeQuantumDelegate.h"

@implementation KBServiceTimeQuantumDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.delegate serviceTimeQuantumSelectCellWith:self.dataArray[indexPath.row]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    KBServiceTimeQuantumCell *serviceTimeQuantumCell = [tableView dequeueReusableCellWithIdentifier:@"KBServiceTimeQuantumCell"];
    KBServiceTimeQuantumModel *serviceTimeQuantumModel = self.dataArray[indexPath.row];
    [serviceTimeQuantumCell configWithModel:serviceTimeQuantumModel];
    return serviceTimeQuantumCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
@end
