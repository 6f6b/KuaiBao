//
//  KBHelper.m
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/13.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import "KBHelper.h"

#define SERVICE_URL 
@implementation KBHelper

+ (NSURLSessionDataTask *)KBPOST:(NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))uploadProgress success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    NSData *jsonData =[NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil];
    NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSDictionary *dic = @{@"data":json};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    return  [manager POST:URLString parameters:dic progress:uploadProgress success:success failure:failure];
}

+ (UIViewController *)getViewControllerWithStoryBoardName:(NSString *)storyBoardName storyBoardId:(NSString *)storyBoardId{
    return [[UIStoryboard storyboardWithName:storyBoardName bundle:nil] instantiateViewControllerWithIdentifier:storyBoardId];
}

+ (void)setCustomerId:(NSString *)customerId{
    [[NSUserDefaults standardUserDefaults] setObject:customerId forKey:@"customerId"];
}

+ (NSString *)getCustomerId{
    return [[NSUserDefaults standardUserDefaults] valueForKey:@"customerId"];
}
@end
