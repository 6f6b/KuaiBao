//
//  KBGoodsListController.h
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/21.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KBGoodsCell.h"
#import "KBServiceItemModel.h"

@protocol ChoiceGoodsDelegateDelegate <NSObject>
- (void)choiceGoodsSelectCellWith:(KBGoodsModel *)goodsModel;
@end
@interface KBGoodsListController : UITableViewController
@property (nonatomic,weak) id <ChoiceGoodsDelegateDelegate> delegate;
@property (nonatomic,weak) KBServiceItemModel *serviceItemModel;
@end
