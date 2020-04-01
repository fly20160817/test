//
//  UIBarButtonItem+Item.m
//  Elevator
//
//  Created by fly on 2018/12/21.
//  Copyright © 2018年 fly. All rights reserved.
//

#import "UIBarButtonItem+Item.h"

@implementation UIBarButtonItem (Item)

+ (instancetype)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHexString:@"#04A1FD"] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    //按钮太小不好点击，加10
    //button.width += 10;
    
    UIView * view = [[UIView alloc] initWithFrame:button.bounds];
    [view addSubview:button];
    
    return [[UIBarButtonItem alloc] initWithCustomView:view];
}

//图片按钮
+ (instancetype)itemWithImageName:(NSString *)imageName highImageName:(nullable NSString *)highImageName target:(id)target action:(SEL)action
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    button.adjustsImageWhenHighlighted = NO;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [button sizeToFit];
    //button.width += 10;

    UIView * view = [[UIView alloc] initWithFrame:button.bounds];
    [view addSubview:button];
    
    return [[UIBarButtonItem alloc] initWithCustomView:view];
}

+ (instancetype)itemWithTitle:(NSString *)title ImageName:(NSString *)imageName highImageName:(nullable NSString *)highImageName target:(id)target action:(SEL)action
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHexString:@"#3a3c3d"] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 3.5, 0, -3.5);
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    button.adjustsImageWhenHighlighted = NO;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    button.height = 30;
 
    UIView * view = [[UIView alloc] initWithFrame:button.bounds];
    [view addSubview:button];
    
    return [[UIBarButtonItem alloc] initWithCustomView:view];
}




@end
