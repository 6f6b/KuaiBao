//
//  KBServiceTimeQuantumDelegate.h
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/22.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KBServiceTimeQuantumCell.h"

@protocol ServiceTimeQuantumDelegateDelegate <NSObject>

- (void)serviceTimeQuantumSelectCellWith:(KBServiceTimeQuantumModel *)serviceTimeQuantumModel;

@end
@interface KBServiceTimeQuantumDelegate : NSObject<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,weak)   id <ServiceTimeQuantumDelegateDelegate> delegate;
@end
