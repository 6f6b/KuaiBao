//
//  KBAnnotationModel.h
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/15.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KBAnnotationModel : NSObject
@property (nonatomic,copy) NSString *phone;
@property (nonatomic,copy) NSString *carTypes;
@property (nonatomic,copy) NSNumber *coord_type;
@property (nonatomic,copy) NSNumber *sortVip;
@property (nonatomic,copy) NSString *image;
@property (nonatomic,copy) NSString *tedi;
@property (nonatomic,copy) NSNumber *jibie;
@property (nonatomic,copy) NSNumber *mendianid;

@property (nonatomic,assign) int uid;
@property (nonatomic,copy) NSString *shopName;
@property (nonatomic,copy) NSString *address;
@end
