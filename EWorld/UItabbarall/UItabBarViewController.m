//
//  UItabBarViewController.m
//
//
//  Created by FT on 1/25/15.
//  Copyright (c) 2015 FT. All rights reserved.
//

#import "UItabBarViewController.h"
#import "PersonalViewController.h"
#import "RootViewController.h"
#import "AppointViewController.h"

@interface UItabBarViewController ()

@end

@implementation UItabBarViewController
@synthesize delegate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    RootViewController *root = [[RootViewController alloc] init];
    UITabBarItem *helperItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"root@2x.png"] tag:101];
    root.tabBarItem = helperItem;
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:root];
    
    AppointViewController *pointment = [[AppointViewController alloc] init];
    UITabBarItem *targetItem = [[UITabBarItem alloc] initWithTitle:@"预约" image:[UIImage imageNamed:@"yuyue@2x.png"] tag:102];
    pointment.tabBarItem = targetItem;
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:pointment];
    
    PersonalViewController *setview = [[PersonalViewController alloc] init];
    UITabBarItem *setItem = [[UITabBarItem alloc] initWithTitle:@"个人中心" image:[UIImage imageNamed:@"person@2x.png"] tag:103];
    setview.tabBarItem = setItem;
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:setview];
       NSArray *array = @[nav1,nav2,nav3];
        self.viewControllers = array;
}
-(void)clickback
{
    NSLog(@"触发事件");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
