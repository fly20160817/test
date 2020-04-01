//
//  FLYBaseNavViewController.m
//  Paint
//
//  Created by fly on 2019/8/18.
//  Copyright © 2019 fly. All rights reserved.
//

#import "FLYBaseNavViewController.h"
#import "UIBarButtonItem+Item.h"
#import "UIImage+Rendar.h"

@interface FLYBaseNavViewController () < UIGestureRecognizerDelegate >

@property (nonatomic, strong) UIView * lineView;

@end

@implementation FLYBaseNavViewController

+ (void)load
{
    /*
     appearance: 获取整个应用程序下所有东西
     appearanceWhenContainedIn: 获取哪个类下的东西
     */
    UINavigationBar * bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    
    //设置导航条标题的字体
    NSDictionary * dict = @{ NSFontAttributeName : [UIFont systemFontOfSize:18], NSForegroundColorAttributeName : [UIColor colorWithHexString:@"#333333"] };
    //文字内容是通过navigationItem.title设置的,而富文本属性是通过navigationBar的 titleTextAttributes属性设置。
    bar.titleTextAttributes = dict;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置系统的滑动手势代理为自己
    self.interactivePopGestureRecognizer.delegate = self;
    
    //设置导航栏不透明，内容就会自动从导航栏下面开始
    self.navigationBar.translucent = NO;
    
    self.navigationBar.barTintColor  = RGB(245, 246, 249, 1);
    
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    
    self.navigationBar.shadowImage = [FLYUtility getImageWithColor:RGB(245, 246, 249, 1) andSize:CGSizeMake(SCREEN_WIDTH, 1)];
    
    [self.navigationBar addSubview:self.lineView];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ( self.viewControllers.count > 0 )
    {
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamedWithOriginal:@"icon_return"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
        
        viewController.hidesBottomBarWhenPushed = YES;
    }

    [super pushViewController:viewController animated:animated];
}

- (void)backAction
{
    [self popViewControllerAnimated:YES];
}



#pragma mark - UIGestureRecognizerDelegate

//手势是否触发
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    //根控制器不触发手势
    return self.childViewControllers.count > 1;
}



#pragma mark - setters and getters

-(void)setIsLine:(BOOL)isLine
{
    _isLine = isLine;
    
    self.lineView.hidden = !isLine;
}

-(UIView *)lineView
{
    if ( _lineView == nil )
    {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(16, self.navigationBar.height - 1, SCREEN_WIDTH - 32, 1)];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"#ECECEC"];
        _lineView.layer.shadowColor = [UIColor colorWithHexString:@"#ECECEC"].CGColor;
        _lineView.layer.shadowOffset = CGSizeMake(0,-0.5);
        _lineView.layer.shadowOpacity = 1;
        _lineView.layer.shadowRadius = 0;
        _lineView.hidden = YES;
    }
    return _lineView;
}

@end
