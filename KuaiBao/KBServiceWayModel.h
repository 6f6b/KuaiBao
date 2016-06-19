//
//  KBServiceWayModel.h
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/19.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KBServiceWayModel : NSObject
@property (nonatomic,copy) NSNumber *pageSize;
@property (nonatomic,copy) NSNumber *carTypeid;
@property (nonatomic,copy) NSNumber *servicesmodeId;
@property (nonatomic,copy) NSNumber *pageNumber;
@property (nonatomic,copy) NSNumber *price;
@property (nonatomic,copy) NSString *orderBy;
@property (nonatomic,copy) NSString *name;
@end
