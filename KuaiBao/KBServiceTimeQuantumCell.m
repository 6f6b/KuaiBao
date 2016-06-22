//
//  KBServiceTimeQuantumCell.m
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/22.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBServiceTimeQuantumCell.h"

@interface KBServiceTimeQuantumCell()

@property (weak, nonatomic) IBOutlet UILabel *timeName;

@end
@implementation KBServiceTimeQuantumCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configWithModel:(KBServiceTimeQuantumModel *)serviceTimeQuantumModel{
    self.timeName.text = [NSString stringWithFormat:@"时间段：%@",serviceTimeQuantumModel.timeName];
}
@end
