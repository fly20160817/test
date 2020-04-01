//
//  HttpTool.m
//  HttpTool
//
//  Created by fly on 2018/8/23.
//  Copyright © 2018年 fly. All rights reserved.
//

#import "HttpTool.h"
#import "AFNetworking.h"
#import "AppDelegate.h"
//#import "FLYSettingViewController.h"

static NSString * kBaseUrl = BASE_API;

@interface AFHttpClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end

@implementation AFHttpClient

+ (instancetype)sharedClient {
    
    static AFHttpClient * client = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURLSessionConfiguration * config = [NSURLSessionConfiguration defaultSessionConfiguration];
        //配置超时时长 (默认60s)
        config.timeoutIntervalForRequest = 15;
        //请求头
        config.HTTPAdditionalHeaders = @{ @"token" : [FLYUtility filterNullAndNilWithString:[FLYUser sharedUser].token replaceStr:@""] };
        
        
        client = [[AFHttpClient alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrl] sessionConfiguration:config];
        //接收参数类型
        client.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", @"text/json", @"text/javascript",@"text/plain",@"image/gif",nil];
        //设置超时时间
        //client.requestSerializer.timeoutInterval = 15;
    });
    
    return client;
}

@end



@implementation HttpTool


+ (void)getWithPath:(NSString *)path
             params:(NSDictionary *)params
            success:(HttpSuccessBlock)success
            failure:(HttpFailureBlock)failure {
    
    //获取完整的url路径
    //NSString * url = [kBaseUrl stringByAppendingPathComponent:path];
    

    [[AFHttpClient sharedClient] GET:path parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //        if ([responseObject[@"dm_error"] integerValue])
        //        {
        //            failure(responseObject[@"error_msg"]);
        //#warning 对系统的进行判断
        //            NSLog(@"这里处理系统错误");
        //            return ;
        //        }
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
}


+ (void)postWithPath:(NSString *)path
              params:(NSDictionary *)params
             success:(HttpSuccessBlock)success
             failure:(HttpFailureBlock)failure
{
    //获取完整的url路径
    //NSString * url = [kBaseUrl stringByAppendingPathComponent:path];

    
    [[AFHttpClient sharedClient] POST:path parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        if ( [[responseObject[SERVER_STATUS] stringValue] isEqualToString:@"809"] )
//        {
//            [SVProgressHUD showImage:nil status:@"您的登录已过期！"];
//            [FLYSettingViewController userExit];
//        }
//        else
//        {
//            success(responseObject);
//        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
}


+ (void)headWithPath:(NSString *)path
              params:(NSDictionary *)params
             success:(HttpSuccessBlock)success
             failure:(HttpFailureBlock)failure
{
    //获取完整的url路径
    //NSString * url = [kBaseUrl stringByAppendingPathComponent:path];
    
    
    [[AFHttpClient sharedClient] HEAD:path parameters:params headers:nil success:^(NSURLSessionDataTask * _Nonnull task) {
        
        success(task.response);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
}


+ (void)deleteWithPath:(NSString *)path
                params:(NSDictionary *)params
               success:(HttpSuccessBlock)success
               failure:(HttpFailureBlock)failure
{
    //获取完整的url路径
    //NSString * url = [kBaseUrl stringByAppendingPathComponent:path];
    
    
    [[AFHttpClient sharedClient] DELETE:path parameters:params headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
}


+ (void)downloadWithPath:(NSString *)path
                 success:(HttpSuccessBlock)success
                 failure:(HttpFailureBlock)failure
                progress:(HttpProgressBlock)progress
{
    
    NSURL * url = [NSURL URLWithString:path];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDownloadTask *downloadTask = [[AFHttpClient sharedClient] downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        progress(downloadProgress.fractionCompleted);
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        //获取沙盒的Caches路径,再拼上文件的名字
        NSString * path = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:response.suggestedFilename];
        //本地的路径转URL不能使用URLWithString
        NSURL * url = [NSURL fileURLWithPath:path];
        
        //返回要保存文件的路径,不然下完在tmp文件中,不使用就自动删除了
        return url;
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        if (error)
        {
            failure(error);
        }
        else
        {
            success(filePath.path);
        }
        
    }];
    
    [downloadTask resume];
}


+ (void)uploadImageWithPath:(NSString *)path
                     params:(NSDictionary *)params
                  thumbName:(NSString *)imagekey
                     images:(NSArray *)images
                    success:(HttpSuccessBlock)success
                    failure:(HttpFailureBlock)failure
                   progress:(HttpProgressBlock)progress;
{
    //获取完整的url路径
    //NSString * urlString = [kBaseUrl stringByAppendingPathComponent:path];
    
    
    [[AFHttpClient sharedClient] POST:path parameters:params headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        for (int i = 0; i < images.count; i ++)
        {
            //上传的名字是当前的时间拼上i的值
            NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
            formatter.dateFormat=@"yyyyMMddHHmmss";
            NSString *str=[formatter stringFromDate:[NSDate date]];
            NSString *fileName=[NSString stringWithFormat:@"%@%d.jpg",str, i];
            
            UIImage *image = images[i];
            NSData *imageData = UIImageJPEGRepresentation(image, 0.28);
            [formData appendPartWithFileData:imageData name:imagekey fileName:fileName mimeType:@"image/jpeg"];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        progress(uploadProgress.fractionCompleted);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
}



#pragma mark - Other

+ (void)getNetType:(void(^)(BOOL network))networkBlock
{
    //创建监听管理者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    //打开检测开始检测网络状态
    [manager startMonitoring];
    
    //监听网络状态的改变
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
            {
                //未知网络
                NSLog(@"未知网络");
                
                networkBlock(NO);
            }
                break;
            case AFNetworkReachabilityStatusNotReachable:
            {
                //无法联网
                NSLog(@"无法联网");
                
                networkBlock(NO);
            }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                //手机自带网络
                NSLog(@"当前使用的是2g/3g/4g网络");
                
                networkBlock(YES);
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                //WIFI
                NSLog(@"当前在WIFI网络下");
                
                networkBlock(YES);
            }
        }
    }];

}


//请求头添加Token
+ (void)setTokenHTTPHeaders
{
    //在sharedClient单利里已经设置了Token，但如果执行时没登录，登录后不会再执行了，所以登录后要单独再设置
    [[AFHttpClient sharedClient].requestSerializer setValue:[FLYUser sharedUser].token forHTTPHeaderField:@"token"];
}


@end


