//
//  KBServiceWayCell.m
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/19.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBServiceWayCell.h"
@interface KBServiceWayCell()
@property (weak, nonatomic) IBOutlet UILabel *serviceWayName;

@end
@implementation KBServiceWayCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configWithModel:(KBServiceWayModel *)serviceWayModel{
    self.serviceWayName.text = serviceWayModel.name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
