//
//  KBChoiceServiceWayListDeleget.h
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/18.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KBServiceWayCell.h"

@protocol ChoiceServiceWayDelegateDelegate <NSObject>

- (void)choiceServiceWaySelectCellWith:(KBServiceWayModel *)serviceWayModel;

@end
@interface KBChoiceServiceWayListDeleget : NSObject<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,weak)   id <ChoiceServiceWayDelegateDelegate> delegate;
@end
