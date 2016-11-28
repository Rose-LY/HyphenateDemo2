//
//  MainViewController.m
//  HyphenateDemo
//
//  Created by apple on 16/11/25.
//  Copyright © 2016年 LiYue. All rights reserved.
//

#import "MainViewController.h"
#import "ContactsViewController.h"
#import "ChatsViewController.h"
#import "SettingsViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createViewControllers];
}

-(void)createViewControllers{
    //隐藏系统的返回按钮
    [self.navigationItem setHidesBackButton:YES];
    
    ContactsViewController *contactVC = [[ContactsViewController alloc]init];
    ChatsViewController *chatVC = [[ChatsViewController alloc]init];
    SettingsViewController *setVC = [[SettingsViewController alloc]init];
    
    NSArray * array = @[contactVC,chatVC,setVC];
    NSArray *titleArray = @[@"Contacts",@"Chats",@"Settings"];

    NSMutableArray *viewControllers = [[NSMutableArray alloc]init];
    for(int i = 0; i < array.count; i++){
        
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:array[i]];
        NSString *title = titleArray[i];
        //非选中效果的图片
        UIImage *image = [[UIImage imageNamed:title] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        //选中效果的图片
        UIImage *imageS = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_active",title]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        //创建tabItem
        UITabBarItem *tabItem = [[UITabBarItem alloc]initWithTitle:title image:image selectedImage:imageS];
        //设置非选中效果的tabItem标题颜色
        [tabItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:134/255.0f green:152/255.0f blue:163/255.0f alpha:1]} forState:UIControlStateNormal];
        [tabItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:60/255.0f green:210/255.0f blue:64/255.0f alpha:1]} forState:UIControlStateSelected];

        nav.tabBarItem = tabItem;
        [viewControllers addObject:nav];
    }
    self.viewControllers = viewControllers;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
