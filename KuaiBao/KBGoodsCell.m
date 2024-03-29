//
//  KBGoodsCell.m
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/21.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBGoodsCell.h"
@interface KBGoodsCell()
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *productType;
@property (weak, nonatomic) IBOutlet UILabel *priceNow;
@property (weak, nonatomic) IBOutlet UILabel *priceBefore;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *recommendScroreConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *scroreImageView;
@property (weak, nonatomic) IBOutlet UILabel *buyNum;

@property (nonatomic,weak) KBGoodsModel *goodsModel;
@end
@implementation KBGoodsCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)configWithModel:(KBGoodsModel *)goodsModel{
    self.goodsModel = goodsModel;
    [self.productImage setImageWithURL:[NSURL URLWithString:goodsModel.picurlone]];
    self.productName.text = [NSString stringWithFormat:@"产品名：%@",goodsModel.productTypeName];
    self.productType.text = [NSString stringWithFormat:@"型号：%@",goodsModel.productname];
    self.priceNow.text = [NSString stringWithFormat:@"现价：%@",goodsModel.price];
    self.priceBefore.text = [NSString stringWithFormat:@"原价：%@",goodsModel.oldPrice];
    float ratio = [goodsModel.productRecommand floatValue]/5.0;

    self.recommendScroreConstraint.constant = ratio*100;
}


- (IBAction)dealChangeBuyNumber:(id)sender {
    UIStepper *stepper = sender;
    self.goodsModel.buyNum = (int)stepper.value;
    self.buyNum.text = [NSString stringWithFormat:@"%d",self.goodsModel.buyNum];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
