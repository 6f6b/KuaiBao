//
//  KBServiceStationListController.h
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/20.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KBAnnotationModel.h"
#import "KBServiceStationCell.h"
@protocol ChoiceServiceStationDelegateDelegate <NSObject>

- (void)choiceServiceStationSelectCellWith:(KBServiceStationModel *)serviceStationModel;

@end
@interface KBServiceStationListController : UITableViewController
@property (nonatomic,weak) KBAnnotationModel *annotationModel;
@property (nonatomic,weak)   id <ChoiceServiceStationDelegateDelegate> delegate;
@end
