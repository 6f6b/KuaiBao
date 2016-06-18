//
//  KBAnnotationView.m
//  KuaiBao
//
//  Created by FengLiu on 16/4/8.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBAnnotationView.h"

@implementation KBAnnotationView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)removeSelf:(id)sender {
    [self removeFromSuperview];
}
- (IBAction)seeVideo:(id)sender {
}
- (IBAction)goToProtect:(id)sender {
}
@end
