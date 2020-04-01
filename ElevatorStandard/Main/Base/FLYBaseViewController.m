//
//  FLYBaseViewController.m
//  Paint
//
//  Created by fly on 2019/8/18.
//  Copyright © 2019 fly. All rights reserved.
//

#import "FLYBaseViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface FLYBaseViewController ()

@end

@implementation FLYBaseViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //判断父视图是不是导航栏控制器，因为子控制器.navigationController获取到的是父控制器的导航栏，所以要过滤掉子控制器调用
    if ( self.parentViewController == self.navigationController )
    {
        [self.navigationController setNavigationBarHidden:_navigationBarHidden animated:animated];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if ( self.parentViewController == self.navigationController )
    {
        //获取即将显示的控制器
        FLYBaseViewController *viewController = self.navigationController.viewControllers.lastObject;
        [self.navigationController setNavigationBarHidden:viewController.navigationBarHidden animated:animated];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = RGB(245, 246, 249, 1);
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    //解决scrollview顶部留白20px
    self.automaticallyAdjustsScrollViewInsets = NO;
}

-(void)dealloc
{
    FLYLog(@"%@销毁咯",self);
}



#pragma mark - UITouch

//点击空白收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    [self.view endEditing:YES];
}



#pragma mark - private methods

//判断相机是否可以使用
- (BOOL)canUseCamera
{
    // 先判断摄像头硬件是否好用
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        // 用户是否允许摄像头使用
        NSString * mediaType = AVMediaTypeVideo;
        AVAuthorizationStatus  authorizationStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
        // 不允许则弹出提示框
        if (authorizationStatus == AVAuthorizationStatusRestricted|| authorizationStatus == AVAuthorizationStatusDenied)
        {
            UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"请您开启相机权限" message:nil preferredStyle:UIAlertControllerStyleAlert];
            
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
            
            [self presentViewController:alertController animated:YES completion:nil];
            
            return NO;
        }
        else
        {
            //这里是摄像头可以使用的处理逻辑
            return YES;
        }
    }
    else
    {
        UIAlertController * alertC = [UIAlertController alertControllerWithTitle:@"手机摄像头设备损坏" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        [alertC addAction:action];
        [self presentViewController:alertC animated:YES completion:nil];
        
        return NO;
    }
}



#pragma mark - setters and getters

- (FLYExceptionView *)blankView
{
    if( _blankView == nil )
    {
        _blankView = [[FLYExceptionView alloc] initWithFrame:self.view.bounds iconName:@"img_empty" title:@"暂无内容" subtitle:@"去逛逛之后再来吧~~"];
    }
    return _blankView;
}

- (FLYExceptionView *)serverErrorView
{
    if( _serverErrorView == nil )
    {
        _serverErrorView = [[FLYExceptionView alloc] initWithFrame:self.view.bounds iconName:@"img_error" title:@"系统错误" subtitle:@"请稍后重试~~"];
    }
    return _serverErrorView;
}

- (FLYExceptionView *)networkErrorView
{
    if( _networkErrorView == nil )
    {
        _networkErrorView = [[FLYExceptionView alloc] initWithFrame:self.view.bounds iconName:@"img_collapse" title:@"网络崩溃" subtitle:@"请检查网络连接~~"];
    }
    return _networkErrorView;
}


@end
