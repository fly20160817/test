//
//  FLYBaseHandler.h
//  Paint
//
//  Created by fly on 2019/8/18.
//  Copyright © 2019 fly. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "HttpTool.h"
//#import "MJExtension.h"
//#import "FLYPageModel.h"

NS_ASSUME_NONNULL_BEGIN

/**
 处理完成事件
 */
typedef void(^CompleteBlock)(void);

/**
 处理事件成功
 
 @param obj 返回数据
 */
typedef void(^SuccessBlock)(id obj);

/**
 处理事件失败
 
 @param obj 错误信息
 */
typedef void(^FailedBlock)(id obj);

/**
 上传进度条
 
 @param obj 进度信息
 */
typedef void(^ProgressBlock)(float obj);

@interface FLYBaseHandler : NSObject

@end

NS_ASSUME_NONNULL_END
