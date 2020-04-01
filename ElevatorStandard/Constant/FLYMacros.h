//
//  FLYMacros.h
//  Elevator
//
//  Created by fly on 2018/11/8.
//  Copyright © 2018年 fly. All rights reserved.
//

#ifndef FLYMacros_h
#define FLYMacros_h

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height


#define WeakSelf __weak typeof(self) weakSelf = self;


#ifdef DEBUG
#define FLYLog(...) NSLog(__VA_ARGS__)
#else
#define FLYLog(...)
#endif


#define RGB(r,g,b,a) [UIColor colorWithRed:((r)/255.0) green:((g)/255.0) blue:((b)/255.0) alpha:a]

//是否iPhoneX
#define IPHONE_X [FLYUtility isIphoneX]

//状态栏高度
#define STATUSBAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height

//导航栏高度
#define NAVBAR_HEIGHT 44

//状态栏高度+导航栏高度
#define STATUSADDNAV_HEIGHT (STATUSBAR_HEIGHT + NAVBAR_HEIGHT)

//tabber高度
#define TABBAR_HEIGHT IPHONE_X ? 83 : 44


//将“对象的属性”转换为“字符串”
#define KEY_PATH(objc, property) ((void)objc.property, @(#property))



//正确返回码
#define CODE_CORRECT @"200"
//服务器状态码字段
#define SERVER_STATUS @"code"
//服务器消息字段
#define SERVER_MSG @"msg"
//服务器数据字段
#define SERVER_DATA @"data"



#pragma mark - 高度封装

#define FLYRequestErrorHUD [HttpTool getNetType:^(BOOL network) { [SVProgressHUD showInfoWithStatus:network ? @"服务器异常，请稍后重试。" : @"您的网络好像出现了问题"];[SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];}];


#endif

