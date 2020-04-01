//
//  UIImage+Rendar.m
//  BuDeJie
//
//  Created by fly on 2018/11/21.
//  Copyright © 2018年 fly. All rights reserved.
//

#import "UIImage+Rendar.h"

@implementation UIImage (Rendar)

//加载一个不要被渲染的图片
+ (UIImage *)imageNamedWithOriginal:(NSString *)name
{
    UIImage * image = [UIImage imageNamed:name];
    //返回一个渲染模式为不渲染的图片
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    return image;
}


@end
