//
//  FLYUser.m
//  zhibo
//
//  Created by fly on 2017/1/4.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "FLYUser.h"

@implementation FLYUser


+ (instancetype) sharedUser
{
    static FLYUser * _user = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _user = [[FLYUser alloc] init];
    });
    
    return _user;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        _userName = [[NSUserDefaults standardUserDefaults] objectForKey:@"userName"];
        _passWord = [[NSUserDefaults standardUserDefaults] objectForKey:@"passWord"];
        _iconUrl = [[NSUserDefaults standardUserDefaults] objectForKey:@"iconUrl"];
        _nickName = [[NSUserDefaults standardUserDefaults] objectForKey:@"nickName"];
        _token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
        _ID = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_id"];
        _phone = [[NSUserDefaults standardUserDefaults] objectForKey:@"phone"];
        _position = [[NSUserDefaults standardUserDefaults] objectForKey:@"position"];
        _level = [[NSUserDefaults standardUserDefaults] objectForKey:@"level"];
        _userType = [[NSUserDefaults standardUserDefaults] objectForKey:@"userType"];
        _customerId = [[NSUserDefaults standardUserDefaults] objectForKey:@"customerId"];
        
        _isFitting = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isFitting"] boolValue];
        _isVideo = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isVideo"] boolValue];
        _isAddDevice = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isAddDevice"] boolValue];
        _isBind = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isBind"] boolValue];
        _isUnBind = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isUnBind"] boolValue];
        _isTaskTrack = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isTaskTrack"] boolValue];
        _isTrackPlayback = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isTrackPlayback"] boolValue];
        _isChangerWorker = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isChangerWorker"] boolValue];
        _isRemoteSignin = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isRemoteSignin"] boolValue];
        _isRepairLift = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isRepairLift"] boolValue];
        _isPropertyEvaluation = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isPropertyEvaluation"] boolValue];
        _isDisinfect = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isDisinfect"] boolValue];
    }
    return self;
}


//保存用户信息
+ (void) saveUser
{
    FLYUser * user = [FLYUser sharedUser];
    
    [[NSUserDefaults standardUserDefaults] setObject:user.userName forKey:@"userName"];
    [[NSUserDefaults standardUserDefaults] setObject:user.passWord forKey:@"passWord"];
    [[NSUserDefaults standardUserDefaults] setObject:user.nickName forKey:@"nickName"];
    [[NSUserDefaults standardUserDefaults] setObject:user.token forKey:@"token"];
    [[NSUserDefaults standardUserDefaults] setObject:user.iconUrl forKey:@"iconUrl"];
    [[NSUserDefaults standardUserDefaults] setObject:user.ID forKey:@"user_id"];
    [[NSUserDefaults standardUserDefaults] setObject:user.phone forKey:@"phone"];
    [[NSUserDefaults standardUserDefaults] setObject:user.position forKey:@"position"];
    [[NSUserDefaults standardUserDefaults] setObject:user.level forKey:@"level"];
    [[NSUserDefaults standardUserDefaults] setObject:user.userType forKey:@"userType"];
    [[NSUserDefaults standardUserDefaults] setObject:user.customerId forKey:@"customerId"];
    
    
    [[NSUserDefaults standardUserDefaults] setObject:@(user.isFitting) forKey:@"isFitting"];
    [[NSUserDefaults standardUserDefaults] setObject:@(user.isVideo) forKey:@"isVideo"];
    [[NSUserDefaults standardUserDefaults] setObject:@(user.isAddDevice) forKey:@"isAddDevice"];
    [[NSUserDefaults standardUserDefaults] setObject:@(user.isBind) forKey:@"isBind"];
    [[NSUserDefaults standardUserDefaults] setObject:@(user.isUnBind) forKey:@"isUnBind"];
    
    [[NSUserDefaults standardUserDefaults] setObject:@(user.isTaskTrack) forKey:@"isTaskTrack"];
    [[NSUserDefaults standardUserDefaults] setObject:@(user.isTrackPlayback) forKey:@"isTrackPlayback"];
    [[NSUserDefaults standardUserDefaults] setObject:@(user.isChangerWorker) forKey:@"isChangerWorker"];
    [[NSUserDefaults standardUserDefaults] setObject:@(user.isRemoteSignin) forKey:@"isRemoteSignin"];
    [[NSUserDefaults standardUserDefaults] setObject:@(user.isRepairLift) forKey:@"isRepairLift"];
    [[NSUserDefaults standardUserDefaults] setObject:@(user.isPropertyEvaluation) forKey:@"isPropertyEvaluation"];
    [[NSUserDefaults standardUserDefaults] setObject:@(user.isDisinfect) forKey:@"isDisinfect"];
    
    //同步
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//清除用户信息
+ (void)clearUser
{
    FLYUser * user = [FLYUser sharedUser];
    user.userName = @"";
    user.passWord = @"";
    user.nickName = @"";
    user.token = @"";
    user.iconUrl = @"";
    user.ID = @"";
    user.phone = @"";
    user.position = @(0);
    user.level = @"";
    user.userType = @"";
    user.customerId = @"";
    
    user.isFitting = NO;
    user.isVideo = NO;
    user.isAddDevice = NO;
    user.isBind = NO;
    user.isUnBind = NO;
    user.isTaskTrack = NO;
    user.isTrackPlayback = NO;
    user.isChangerWorker = NO;
    user.isRemoteSignin = NO;
    user.isRepairLift = NO;
    user.isPropertyEvaluation = NO;
    user.isDisinfect = NO;
    
    [FLYUser saveUser];
}



+ (BOOL)isAutoLogin
{
    if ( [FLYUser sharedUser].ID.length == 0 )
    {
        return NO;
    }
    
    return YES;
}

@end
