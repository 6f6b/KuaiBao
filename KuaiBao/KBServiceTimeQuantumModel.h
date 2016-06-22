//
//  KBServiceTimeQuantumModel.h
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/22.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KBServiceTimeQuantumModel : NSObject
@property (nonatomic,copy) NSNumber *pageSize;
@property (nonatomic,copy) NSNumber *serviceModeId;
@property (nonatomic,copy) NSString *timeQuantumDesc;
@property (nonatomic,copy) NSNumber *pageNumber;
@property (nonatomic,copy) NSString *beginTime;
@property (nonatomic,copy) NSString *endTime;
@property (nonatomic,copy) NSNumber *shopId;
@property (nonatomic,copy) NSNumber *timeQuantumId;
@property (nonatomic,copy) NSString *timeName;
@property (nonatomic,copy) NSString *orderBy;
@end
