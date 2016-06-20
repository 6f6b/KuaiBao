//
//  KBChoiceServiceController.h
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/17.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KBChoiceServiceItemListDeleget.h"
#import "KBChoiceServiceWayListDeleget.h"
#import "KBAnnotationModel.h"
@interface KBChoiceServiceController : UIViewController
@property (nonatomic,weak) KBAnnotationModel *annotationModel;
@end
