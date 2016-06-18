//
//  KBShopDetailViewController.m
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/15.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBShopDetailViewController.h"

@interface KBShopDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *shopName;
@property (weak, nonatomic) IBOutlet UILabel *address;

@property (weak, nonatomic) IBOutlet UILabel *carType;
@property (weak, nonatomic) IBOutlet UIButton *phoneNumber;
@end

@implementation KBShopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"店铺详情";
    [self.headImage setImageWithURL:[NSURL URLWithString:_annotationModel.image]];
    self.shopName.text = _annotationModel.shopName;
    self.address.text = _annotationModel.address;
    self.carType.text = _annotationModel.carTypes;
    [self.phoneNumber setTitle:[NSString stringWithFormat:@"    联系电话：%@",_annotationModel.phone] forState:UIControlStateNormal];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dealCall:(id)sender {
    NSLog(@"打电话");
}

- (IBAction)goToProtect:(id)sender {
     NSLog(@"去快报");
}
- (IBAction)seeVideo:(id)sender {
     NSLog(@"看看视频");
}

#pragma mark - Table view data source

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
