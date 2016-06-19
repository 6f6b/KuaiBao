//
//  KBFastProtectViewController.m
//  KuaiBao
//
//  Created by FengLiu on 16/3/22.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBFastProtectViewController.h"
#import <BaiduMapAPI_Map/BMKMapView.h>
#import <BaiduMapAPI_Map/BMKPointAnnotation.h>
#import <BaiduMapAPI_Map/BMKPinAnnotationView.h>
#import <BaiduMapAPI_Location/BMKLocationService.h>
#import <BaiduMapAPI_Search/BMKGeocodeSearch.h>
#import <BaiduMapAPI_Cloud/BMKCloudSearch.h>
#import "KBPointAnnotation.h"
#import "KBAnnotationModel.h"
#import "KBAnnotationView.h"
#import "KBShopDetailViewController.h"
@interface KBFastProtectViewController ()<BMKLocationServiceDelegate,BMKGeoCodeSearchDelegate,UISearchBarDelegate,BMKCloudSearchDelegate,BMKMapViewDelegate>
@property (nonatomic,weak)      UISearchBar         *searchBar;
@property (nonatomic,strong)    BMKLocationService  *locService;
@property (nonatomic,weak)      BMKMapView          *mapView;
@property (nonatomic,strong)    BMKGeoCodeSearch    *geoCodeSearch;
@property (nonatomic,strong)    CLLocation          *location;
@property (nonatomic,weak)      UIButton            *leftButton;
@property (nonatomic,strong)    BMKCloudSearch      *cloudSearch;
@property (nonatomic,copy)      NSArray             *annotations;
@end

@implementation KBFastProtectViewController

- (BMKCloudSearch *)cloudSearch{
    if (!_cloudSearch) {
        BMKCloudSearch *cloudSearch = [[BMKCloudSearch alloc] init];
        cloudSearch.delegate = self;
        _cloudSearch = cloudSearch;
    }
    return _cloudSearch;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, -10, 200, 20)];
    self.searchBar.placeholder = @"搜一搜附近有哪些快保吧";
    self.searchBar = searchBar;
    self.searchBar.delegate = self;
    self.navigationItem.titleView = self.searchBar;
//
//    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.leftButton = leftButton;
//    leftButton.frame = CGRectMake(0, 0, 70, 25);
//    leftButton.titleLabel.font = [UIFont  systemFontOfSize:12];
//    [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [leftButton setTitle:@"位置" forState:UIControlStateNormal];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
//    [leftButton addTarget:self action:@selector(dealGeoCodeSearch) forControlEvents:UIControlEventTouchUpInside];
    
    BMKMapView *mapView = [[BMKMapView alloc] init];
    self.mapView = mapView;
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    mapView.frame = self.view.bounds;
    mapView.userTrackingMode = BMKUserTrackingModeFollow;
    [self.view addSubview:mapView];
    
    BMKLocationService *locSearvice = [[BMKLocationService alloc] init];
    self.locService = locSearvice;
    locSearvice.delegate = self;
    [locSearvice startUserLocationService];
    
    self.geoCodeSearch = [[BMKGeoCodeSearch alloc] init];
    self.geoCodeSearch.delegate = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    BMKCloudLocalSearchInfo *cloudLocalSearch = [[BMKCloudLocalSearchInfo alloc] init];
    cloudLocalSearch.ak = @"hE8TyW2MfoFY7H40QQIjTixYZqOZferB";
    cloudLocalSearch.geoTableId = 119234;
    cloudLocalSearch.pageIndex = 0;
    cloudLocalSearch.pageSize = 10;
    
    cloudLocalSearch.region = @"";
    cloudLocalSearch.keyword = self.searchBar.text;
    NSLog(@"searchText-->%@",self.searchBar.text);
    BOOL flag = [self.cloudSearch localSearchWithSearchInfo:cloudLocalSearch];
    if(flag){
        NSLog(@"本地云检索发送成功");
    }else{
        NSLog(@"本地云检索发送失败");
    }
    [self.searchBar resignFirstResponder];
}
- (void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view{
    KBPointAnnotation *annotation = view.annotation;

    KBAnnotationModel *selectAnnotationModel;
    for(KBAnnotationModel *annotationModel in _annotations){
        if(annotationModel.uid == annotation.uid){
            selectAnnotationModel = annotationModel;
            break;
        }
    }
    
//     KBAnnotationView *newView = [[[NSBundle mainBundle] loadNibNamed:@"KBAnnotationView" owner:self options:nil] lastObject];
//    newView.frame = self.mapView.bounds;
//    [newView.headImage setImageWithURL:[NSURL URLWithString:selectAnnotationModel.image]];
//    NSLog(@"%@",selectAnnotationModel.image);
//    newView.shopName.text = [NSString stringWithFormat:@"店铺名：%@",selectAnnotationModel.shopName];
//    newView.address.text = [NSString stringWithFormat:@"联系地址：%@",selectAnnotationModel.address];
//    newView.carType.text = [NSString stringWithFormat:@"车型：%@",selectAnnotationModel.carTypes];
//    [newView.phoneNumber setTitle:[NSString stringWithFormat:@"联系电话：%@",selectAnnotationModel.phone] forState:UIControlStateNormal];
//    [self.mapView addSubview:newView];
    
    KBShopDetailViewController *shopDetailViewController = [KBHelper getViewControllerWithStoryBoardName:@"KuaiBao" storyBoardId:@"KBShopDetailViewController"];
    shopDetailViewController.annotationModel = selectAnnotationModel;
    [self.navigationController pushViewController:shopDetailViewController animated:YES];
}


- (void)onGetCloudPoiResult:(NSArray *)poiResultList searchType:(int)type errorCode:(int)error{
    // 清楚屏幕中所有的annotation
    NSArray* array = [NSArray arrayWithArray:_mapView.annotations];
    [_mapView removeAnnotations:array];
    NSMutableArray *annotations = [[NSMutableArray alloc] init];
    if (error == BMKErrorOk) {
        BMKCloudPOIList* result = [poiResultList objectAtIndex:0];
        for (int i = 0; i < result.POIs.count; i++) {
            BMKCloudPOIInfo* poi = [result.POIs objectAtIndex:i];
            KBPointAnnotation* item = [[KBPointAnnotation alloc] init];
            item.uid = poi.uid;
            CLLocationCoordinate2D pt = (CLLocationCoordinate2D){ poi.longitude,poi.latitude};
            item.coordinate = pt;
            item.title = poi.title;
            [_mapView addAnnotation:item];
            
            KBAnnotationModel *annotationModel = [KBAnnotationModel new];
            [annotationModel setValuesForKeysWithDictionary:poi.customDict];
            NSLog(@"%@",poi.customDict);
            annotationModel.uid = poi.uid;
            annotationModel.shopName = poi.title;
            annotationModel.address = poi.address;
            [annotations addObject:annotationModel];
        }
        self.annotations = annotations;
    } else {
        NSLog(@"error ==%d",error);
    }
}

- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation{
    [self.mapView updateLocationData:userLocation];
//    NSLog(@"%@",userLocation.subtitle);
    self.location = userLocation.location;
}

- (void)dealGeoCodeSearch{
        BMKReverseGeoCodeOption *reverseGeoCodeSearchOption = [[BMKReverseGeoCodeOption alloc] init];
        reverseGeoCodeSearchOption.reverseGeoPoint = self.location.coordinate;
    NSLog(@"%f",self.location.coordinate.latitude);
    NSLog(@"%f",self.location.coordinate.longitude);
        BOOL flag = [self.geoCodeSearch reverseGeoCode:reverseGeoCodeSearchOption];
        if(flag)
        {
          NSLog(@"反geo检索发送成功");
        }
        else
        {
          NSLog(@"反geo检索发送失败");
        }
}

- (void)onGetGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error{
    NSLog(@"----->%@",result.address);
}

/**
 *返回反地理编码搜索结果
 *@param searcher 搜索对象
 *@param result 搜索结果
 *@param error 错误号，@see BMKSearchErrorCode
 */
- (void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error{
//    if (error == BMK_SEARCH_NO_ERROR) {
    [self.leftButton setTitle:result.addressDetail.city forState:UIControlStateNormal];
        NSLog(@"----->%@<-",result.addressDetail.city);
//    }
//    else{
//        NSLog(@"error----->%@",result);
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)viewWillAppear:(BOOL)animated{
//}
//
//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    [self.mapView removeFromSuperview];
//}

@end
