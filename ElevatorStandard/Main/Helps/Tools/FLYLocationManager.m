//
//  FLYLocationManager.m
//  zhibo
//
//  Created by fly on 2016/12/21.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "FLYLocationManager.h"
#import <CoreLocation/CoreLocation.h>

@interface FLYLocationManager () < CLLocationManagerDelegate >

@property (nonatomic, strong) CLLocationManager * locManager;
//用来定时向服务器传位置信息
@property (nonatomic, strong) NSTimer * timer;

@end

@implementation FLYLocationManager

+ (instancetype) sharedManager
{
    static FLYLocationManager * _manager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _manager = [[FLYLocationManager alloc] init];
    });
    
    return _manager;
    
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _locManager = [[CLLocationManager alloc] init];
        _locManager.delegate = self;
        //设置定位的精确度
        [_locManager setDesiredAccuracy:kCLLocationAccuracyBest];
        //设置定位的刷新频率 (单位是米,移动多少距离刷新)
        _locManager.distanceFilter = 1;
        
        
        
        /*后定定位时添加的代码*/
        
        //设置iOS设备是否可暂停定位来节省电池的电量。如果该属性设为“YES”，则当iOS设备不再需要定位数据时，iOS设备可以自动暂停定位。如果不设置为NO，只能在后台运行15分钟后就会处于挂起状态。
        _locManager.pausesLocationUpdatesAutomatically = NO;
        
        // 若不设置，默认为NO。不会后台进行定位。
        [_locManager setAllowsBackgroundLocationUpdates:YES];
        
        
        

        
        //用户尚未对该应用程序作出选择
        if ( [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined )
        {
            [_locManager requestAlwaysAuthorization];
        }
        //如果权限被用户关闭
        else if ( [CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied )
        {
            [self alertOpenLocation];
        }

        
    }
    return self;
}



#pragma mark - CLLocationManagerDelegate

//刷新当前位置的代理
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *loc = [locations lastObject];
    
    [FLYLocationManager sharedManager].latitude = loc.coordinate.latitude;
    [FLYLocationManager sharedManager].longitude = loc.coordinate.longitude;
    
    //%f只会默认输入小数点后6位，需要多输出，强制指定就可以了
    NSLog(@"经纬度  %.10f  %.10f ", loc.coordinate.longitude,loc.coordinate.latitude);
    
    //将定位器开关关闭
    //[self stopLocation];
    //上传经纬度
    //[self uploadLocation];
}

//当设备获取坐标失败时调用该方法
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    if ( error )
    {
        [self checkError:error];
    }
}



#pragma mark - event handler

//上传经纬度到服务器
-(void)uploadLocation
{
    if ( self.latitude == 0 && self.longitude == 0 )
    {
        return;
    }
    
    //这样转换只保留小数点后六位
    //[NSString stringWithFormat:@"%f", self.lat];
    
    NSNumber * latNumber = [NSNumber numberWithDouble:self.latitude];
    NSString * latitude = [latNumber stringValue];
    
    NSNumber * lonNumber = [NSNumber numberWithDouble:self.longitude];
    NSString * longitude = [lonNumber stringValue];

    NSDictionary * params = @{ @"location" : [NSString stringWithFormat:@"%@,%@", longitude, latitude] };
    
//    [FLYMyHandler executePostUploadLocationWithParams:params success:^(id obj) {
//
//        NSLog(@"经纬度上传成功: %@, %@", longitude, latitude);
//
//    } failed:^(id obj) {
//
//        NSLog(@"位置上传失败：%@", obj);
//    }];
}



#pragma mark - private methods

//打开定位服务
- (void)startLocation
{
    [self.locManager startUpdatingLocation];
    
    [self starTimer];
}

//关闭定位服务
- (void)stopLocation
{
    [self.locManager stopUpdatingLocation];
    
    [self stopTimer];
}

//打开计时器
- (void)starTimer
{
    self.timer.fireDate = [NSDate distantPast];
}

//关闭计时器
- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

//引导用户打开定位服务
- (void)alertOpenLocation
{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"请您开启位置权限" message:@"用于接收距离用户最近的维保任务" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * alert1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction * alert2 = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([[UIApplication sharedApplication] canOpenURL:url])
        {
            [[UIApplication sharedApplication] openURL:url];
        }
    }];
    
    [alertController addAction:alert1];
    [alertController addAction:alert2];
    
    
    //app刚启动时就开起了定位，那是可能还没有页面，所以延迟5面加载页面才有弹窗
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [[FLYUtility currentViewController] presentViewController:alertController animated:YES completion:nil];
    });
}

//将提取错误的方法专门提炼出来
- (void) checkError:(NSError *)error
{
    //判断错误码对应的错误原因
    switch ( error.code )
    {
        case kCLErrorNetwork:
            NSLog(@"没有网");
            break;
            
        case kCLErrorDenied:
            NSLog(@"没开定位");
            break;
            
        case kCLErrorLocationUnknown:
            NSLog(@"荒山野岭，定位不到");
            break;
            
        default:
            NSLog(@"其他原因，定位不到");
            break;
    }
}



#pragma mark - setters and getters

-(NSTimer *)timer
{
    if ( _timer == nil )
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(uploadLocation) userInfo:nil repeats:YES];
        _timer.fireDate = [NSDate distantFuture];
    }
    return _timer;
}

@end


