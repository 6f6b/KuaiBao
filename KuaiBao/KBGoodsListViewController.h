//
//  KBGoodsListViewController.h
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/24.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KBGoodsCell.h"
#import "KBServiceItemModel.h"

@protocol ChoiceGoodsDelegateDelegate <NSObject>
- (void)choiceGoodsSelectCellWith:(KBGoodsModel *)goodsModel;
@end
@interface KBGoodsListViewController : UIViewController
@property (nonatomic,weak) id <ChoiceGoodsDelegateDelegate> delegate;
@property (nonatomic,weak) KBServiceItemModel *serviceItemModel;

@end
