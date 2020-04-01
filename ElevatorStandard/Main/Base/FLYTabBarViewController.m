//
//  FLYTabBarViewController.m
//  Elevator
//
//  Created by fly on 2018/11/8.
//  Copyright © 2018年 fly. All rights reserved.
//

#import "FLYTabBarViewController.h"
#import "FLYBaseNavViewController.h"
#import "UIImage+Rendar.h"

@interface FLYTabBarViewController ()

@property (nonatomic, strong) NSArray * dataList;
@property (nonatomic, strong) NSArray * vcNames;

@end

@implementation FLYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUI];
}



#pragma mark - UI

- (void)initUI
{
    //加载控制器
    [self configViewControllers];
}

- (void)configViewControllers
{
    NSMutableArray * array = self.vcNames.mutableCopy;
    
    for ( NSInteger i=0; i < array.count; i++ )
    {
        NSString * vcName = array[i];
        
        UIViewController * vc = [[NSClassFromString(vcName) alloc] init];
        FLYBaseNavViewController * nav = [[FLYBaseNavViewController alloc] initWithRootViewController:vc];
        nav.tabBarItem.title = self.dataList[i][@"title"];
        //NSDictionary * normalDict = @{ NSFontAttributeName : [UIFont systemFontOfSize:10], NSForegroundColorAttributeName : [UIColor colorWithHexString:@"#8E8E93"] };
        //NSDictionary * selectedDict = @{ NSFontAttributeName : [UIFont systemFontOfSize:10], NSForegroundColorAttributeName : [UIColor colorWithHexString:@"#04A1FD"] };
        //[nav.tabBarItem setTitleTextAttributes:normalDict forState:UIControlStateNormal];
        //[nav.tabBarItem setTitleTextAttributes:selectedDict forState:UIControlStateSelected];
        nav.tabBarItem.image = [UIImage imageNamedWithOriginal:self.dataList[i][@"normal"]];
        nav.tabBarItem.selectedImage = [UIImage imageNamedWithOriginal:self.dataList[i][@"selected"]];
        [array replaceObjectAtIndex:i withObject:nav];
    }
    
    self.viewControllers = array;
}



#pragma mark - setters and getters

-(NSArray *)vcNames
{
    if ( _vcNames == nil )
    {
        _vcNames = @[ @"FLYBaseViewController", @"FLYBaseViewController", @"FLYBaseViewController", @"FLYBaseViewController",  @"FLYBaseViewController" ];
    }
    return _vcNames;
}

-(NSArray *)dataList
{
    if ( _dataList == nil )
    {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"TabbarList" ofType:@"plist"];
        _dataList = [NSMutableArray arrayWithContentsOfFile:path];
    }
    return _dataList;
}

@end


