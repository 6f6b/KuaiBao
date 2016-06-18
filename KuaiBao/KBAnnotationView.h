//
//  KBAnnotationView.h
//  KuaiBao
//
//  Created by FengLiu on 16/4/8.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKAnnotationView.h>

@interface KBAnnotationView : BMKAnnotationView
@property (nonatomic,strong) NSDictionary *customDict;

@property (weak, nonatomic) IBOutlet UILabel *shopName;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *carType;
@property (weak, nonatomic) IBOutlet UIButton *phoneNumber;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;

@end
