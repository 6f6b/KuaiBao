//
//  KBChoiceServiceItemListDeleget.m
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/18.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBChoiceServiceItemListDeleget.h"

@implementation KBChoiceServiceItemListDeleget
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.delegate choiceServiceItemSelectCellWith];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    KBServiceItemCell *serviceItemCell = [tableView dequeueReusableCellWithIdentifier:@"KBServiceItemCell"];
    KBServiceItemModel *serviceItemModel = self.dataArray[indexPath.row];
    NSLog(@"name--->%@",serviceItemModel.serviceItemname);
    [serviceItemCell configWithModel:serviceItemModel];
    return serviceItemCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
@end
