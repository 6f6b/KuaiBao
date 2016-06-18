//
//  KBHelper.h
//  KuaiBao
//
//  Created by dev.liufeng on 16/6/13.
//  Copyright © 2016年 刘丰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KBHelper : NSObject
+ (NSURLSessionDataTask *)KBPOST:(NSString *)URLString
                    parameters:(id)parameters
                      progress:(void (^)(NSProgress * _Nonnull uploadProgress))uploadProgress
                       success:(void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                       failure:(void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;


+ (UIViewController *)getViewControllerWithStoryBoardName:(NSString *)storyBoardName storyBoardId:(NSString *)storyBoardId;

+ (void)setCustomerId:(NSString *)customerId;

+ (NSString *)getCustomerId;
@end
