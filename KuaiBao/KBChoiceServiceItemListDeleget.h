//
//  KBChoiceServiceItemListDeleget.h
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/18.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KBServiceItemCell.h"

@protocol ChoiceServiceItemDelegateDelegate <NSObject>

- (void)choiceServiceItemSelectCellWith;

@end
@interface KBChoiceServiceItemListDeleget : NSObject<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,weak)   id <ChoiceServiceItemDelegateDelegate> delegate;
@end
