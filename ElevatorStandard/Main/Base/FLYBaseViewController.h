//
//  FLYBaseViewController.h
//  Paint
//
//  Created by fly on 2019/8/18.
//  Copyright © 2019 fly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLYExceptionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface FLYBaseViewController : UIViewController

@property (nonatomic, assign) BOOL navigationBarHidden;

@property (nonatomic, strong) FLYExceptionView * blankView;
@property (nonatomic, strong) FLYExceptionView * serverErrorView;
@property (nonatomic, strong) FLYExceptionView * networkErrorView;

//判断相机是否可以使用
- (BOOL)canUseCamera;

@end

NS_ASSUME_NONNULL_END
