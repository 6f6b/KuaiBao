//
//  KBConfigForLastRepairController.m
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/27.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBConfigForLastRepairController.h"

@interface KBConfigForLastRepairController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *datePickerBottomConstraint;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIButton *finishBtn;

@end

@implementation KBConfigForLastRepairController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datePickerBottomConstraint.constant = -230;
    // Do any additional setup after loading the view.
}
- (IBAction)dealFinish:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        self.datePickerBottomConstraint.constant = -230;
        [self.datePicker layoutIfNeeded];
        [self.finishBtn layoutIfNeeded];
    }];
}
- (IBAction)dealCommit:(id)sender {

}
- (IBAction)dealShowDatePicker:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        self.datePickerBottomConstraint.constant = 0;
        [self.datePicker layoutIfNeeded];
        [self.finishBtn layoutIfNeeded];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
