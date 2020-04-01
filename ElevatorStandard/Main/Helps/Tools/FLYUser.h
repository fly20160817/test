//
//  FLYUser.h
//  zhibo
//
//  Created by fly on 2017/1/4.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FLYUser : NSObject

//账号
@property (nonatomic, copy) NSString * userName;
//密码
@property (nonatomic, copy) NSString * passWord;

//token
@property (nonatomic, copy) NSString * token;
//用户头像Url
@property (nonatomic, copy) NSString * iconUrl;
//用户名
@property (nonatomic, copy) NSString * nickName;
//用户id
@property (nonatomic, copy) NSString * ID;
//用户手机号
@property (nonatomic, copy) NSString * phone;
//职位 0维保工 1站长 2区域经理 3总经理
@property (nonatomic, copy) NSNumber * position;
//技师等级
@property (nonatomic, copy) NSString * level;
//用户类型  user:saas平台用户  empl:维保工或管理者
@property (nonatomic, copy) NSString * userType;
//客户ID
@property (nonatomic, copy) NSString * customerId;


#pragma mark - 权限

//配件权限
@property (nonatomic, assign) BOOL isFitting;
//视频权限
@property (nonatomic, assign) BOOL isVideo;
//入库权限
@property (nonatomic, assign) BOOL isAddDevice;
//绑定权限
@property (nonatomic, assign) BOOL isBind;
//解绑权限
@property (nonatomic, assign) BOOL isUnBind;
//任务跟踪
@property (nonatomic, assign) BOOL isTaskTrack;
//轨迹回放
@property (nonatomic, assign) BOOL isTrackPlayback;
//变更派员
@property (nonatomic, assign) BOOL isChangerWorker;
//远程签到
@property (nonatomic, assign) BOOL isRemoteSignin;
//大修申请
@property (nonatomic, assign) BOOL isOverhaulApply;
//大修审批
@property (nonatomic, assign) BOOL isOverhaulApproval;
//电梯报修
@property (nonatomic, assign) BOOL isRepairLift;
//物业评价
@property (nonatomic, assign) BOOL isPropertyEvaluation;
//消毒
@property (nonatomic, assign) BOOL isDisinfect;


+ (instancetype) sharedUser;

//判断是否自动登录
+ (BOOL) isAutoLogin;

//保存用户信息
+ (void) saveUser;

//清除用户信息
+ (void)clearUser;


@end
