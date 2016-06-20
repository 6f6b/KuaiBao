//
//  KBServiceItemCell.m
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/19.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBServiceItemCell.h"

@interface KBServiceItemCell()
@property (weak, nonatomic) IBOutlet UILabel *serviceItemName;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation KBServiceItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configWithModel:(KBServiceItemModel *)serviceItemModel{
    self.serviceItemName.text = serviceItemModel.serviceItemname;
    self.priceLabel.text      = [NSString stringWithFormat:@"%@￥",serviceItemModel.price];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
