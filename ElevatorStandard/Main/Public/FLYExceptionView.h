//
//  FLYExceptionView.h
//  Paint
//
//  Created by fly on 2019/11/25.
//  Copyright © 2019 fly. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FLYExceptionView : UIView

- (instancetype)initWithFrame:(CGRect)frame iconName:(NSString * )iconName title:(NSString *)title subtitle:(NSString *)subtitle;

@property (nonatomic, strong) NSString * iconName;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * subtitle;

@end

NS_ASSUME_NONNULL_END
