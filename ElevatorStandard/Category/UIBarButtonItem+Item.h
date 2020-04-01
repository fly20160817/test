//
//  UIBarButtonItem+Item.h
//  Elevator
//
//  Created by fly on 2018/12/21.
//  Copyright © 2018年 fly. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (Item)

//文字按钮
+ (instancetype)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action;

//图片按钮
+ (instancetype)itemWithImageName:(NSString *)imageName highImageName:(nullable NSString *)highImageName target:(id)target action:(SEL)action;

//文字+图片 （返回按钮）
+ (instancetype)itemWithTitle:(NSString *)title ImageName:(NSString *)imageName highImageName:(nullable NSString *)highImageName target:(id)target action:(SEL)action;

@end

NS_ASSUME_NONNULL_END
