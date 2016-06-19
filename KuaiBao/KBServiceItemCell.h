//
//  KBServiceItemCell.h
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/19.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KBServiceItemModel.h"

@interface KBServiceItemCell : UITableViewCell
- (void)configWithModel:(KBServiceItemModel *)serviceItemModel;
@end
