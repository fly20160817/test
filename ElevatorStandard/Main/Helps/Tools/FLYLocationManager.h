//
//  FLYLocationManager.h
//  zhibo
//
//  Created by fly on 2016/12/21.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FLYLocationManager : NSObject

@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;

+ (instancetype) sharedManager;

//打开定位服务
- (void)startLocation;
//关闭定位服务
- (void)stopLocation;

//手动调用上传经纬度
-(void)uploadLocation;

@end
