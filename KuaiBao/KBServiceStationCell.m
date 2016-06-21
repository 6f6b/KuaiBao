//
//  KBServiceStationCell.m
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/20.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBServiceStationCell.h"

@interface KBServiceStationCell ()
@property (weak, nonatomic) IBOutlet UILabel *stationName;
@property (weak, nonatomic) IBOutlet UILabel *stationIntroduce;

@end
@implementation KBServiceStationCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configWithModel:(KBServiceStationModel *)serviceStationModel{
    self.stationName.text = [NSString stringWithFormat:@"名字：%@",serviceStationModel.name];
    self.stationIntroduce.text = [NSString stringWithFormat:@"简介：%@",serviceStationModel.stateDesc];
}
@end
