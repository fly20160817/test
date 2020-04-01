//
//  FLYExceptionView.m
//  Paint
//
//  Created by fly on 2019/11/25.
//  Copyright © 2019 fly. All rights reserved.
//

#import "FLYExceptionView.h"

@interface FLYExceptionView ()

@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * subtitleLabel;

@end

@implementation FLYExceptionView

- (instancetype)initWithFrame:(CGRect)frame iconName:(NSString * )iconName title:(NSString *)title subtitle:(NSString *)subtitle
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.iconName = iconName;
        self.title = title;
        self.subtitle = subtitle;
        
        [self initUI];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset((self.height - 300) / 2.0);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(162, 210));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).with.offset(42);
        make.left.equalTo(self).with.offset(16);
        make.right.equalTo(self).with.offset(-16);
        make.height.mas_equalTo(22);
    }];
    
    [self.subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(6);
        make.left.equalTo(self).with.offset(16);
        make.right.equalTo(self).with.offset(-16);
        make.height.mas_equalTo(20);
    }];
}



#pragma mark - UI

- (void)initUI
{
    [self addSubview:self.imageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.subtitleLabel];
}



#pragma mark - setters and getters

-(void)setTitle:(NSString *)title
{
    _title = title;
    
    self.titleLabel.text = title;
}

-(void)setSubtitle:(NSString *)subtitle
{
    _subtitle = subtitle;
    
    self.subtitleLabel.text = subtitle;
}

-(void)setIconName:(NSString *)iconName
{
    _iconName = iconName;
    
    self.imageView.image = [UIImage imageNamed:iconName];
}

- (UIImageView *)imageView
{
    if( _imageView == nil )
    {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (UILabel *)titleLabel
{
    if( _titleLabel == nil )
    {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = [UIColor colorWithHexString:@"#04A1FD"];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UILabel *)subtitleLabel
{
    if( _subtitleLabel == nil )
    {
        _subtitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _subtitleLabel.font = [UIFont systemFontOfSize:14];
        _subtitleLabel.textColor = [UIColor colorWithHexString:@"#4D04A1FD"];
        _subtitleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _subtitleLabel;
}



@end
