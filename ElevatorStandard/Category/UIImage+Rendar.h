//
//  UIImage+Rendar.h
//  BuDeJie
//
//  Created by fly on 2018/11/21.
//  Copyright © 2018年 fly. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Rendar)

//加载一个不要被渲染的图片
+ (UIImage *)imageNamedWithOriginal:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
