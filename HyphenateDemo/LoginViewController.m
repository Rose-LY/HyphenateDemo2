//
//  LoginViewController.m
//  HyphenateDemo
//
//  Created by apple on 16/11/25.
//  Copyright © 2016年 LiYue. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"
#import "EMSDKFull.h"
#import "EMError.h"

@interface LoginViewController ()
@property (nonatomic, strong) UILabel * label;

@property (strong, nonatomic) UITextField *userName;
@property (strong, nonatomic) UITextField *passWord;

@property (nonatomic, strong) UIImageView * Animation;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置背景颜色
    self.view.backgroundColor = [UIColor colorWithRed:64.0f / 255.0f green:94.0f / 255.0f blue:122.0f / 255.0f alpha:1.0f];
    //动画
    self.Animation = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    NSMutableArray  *arrayM=[NSMutableArray array];
    for (int i=0; i<11; i++) {
        [arrayM addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i+1]]];
    }
    NSLog(@"%@",arrayM);
    //设置动画数组
    [self.Animation setAnimationImages:arrayM];
    //设置动画播放次数
    [self.Animation setAnimationRepeatCount:1];
    //设置动画播放时间
    [self.Animation setAnimationDuration:2.5];
    //开始动画
    [self.Animation startAnimating];
    [self.view addSubview:self.Animation];
    
    [self performSelector:@selector(createUI) withObject:nil afterDelay:self.Animation.animationDuration];
    


}

- (void)createUI {
    //logo
    UIImageView * logo = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 230, 100)];
    logo.center = CGPointMake(self.view.center.x,self.view.center.y - 180);
    logo.image = [UIImage imageNamed:@"Logo_green.png"];
    [self.view addSubview:logo];
    //textField
    _userName = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 300, 50)];
    _userName.center = CGPointMake(self.view.center.x, self.view.center.y - 70);
    _userName.borderStyle =   UITextBorderStyleRoundedRect;
    _userName.placeholder = @"HyphenateID";
    [self.view addSubview:_userName];
    
    _passWord = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 300, 50)];
    _passWord.center = CGPointMake(self.view.center.x, self.view.center.y + 10);
    _passWord.borderStyle =   UITextBorderStyleRoundedRect;
    _passWord.placeholder = @"Password";
    [self.view addSubview:_passWord];
    
    //register
    _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 270, 50)];
    _label.center = CGPointMake(self.view.center.x, self.view.center.y + 90);
    _label.text = @"Yay!New to Hyphenate?";
    _label.textColor = [UIColor colorWithRed:173.0f / 255.0f green:185.0f / 255.0f blue:193.0f / 255.0f alpha:1.0f];
    _label.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:_label];
    
    UIButton * regist = [UIButton buttonWithType:UIButtonTypeCustom];
    regist.frame = CGRectMake(0, 0, 90, 50);
    regist.center = CGPointMake(self.view.center.x+85, self.view.center.y + 90);
    //设置下划线及其颜色
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"Sign up"];
    NSRange strRange = {0,[str length]};
    [str addAttributes:@{NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle], NSUnderlineColorAttributeName: [UIColor whiteColor], NSForegroundColorAttributeName:[UIColor whiteColor]} range:strRange];
    [regist setAttributedTitle:str forState:UIControlStateNormal];
    [regist addTarget:self action:@selector(registWasClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:regist];
    
    //login
    UIButton * bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    bottomBtn.frame = CGRectMake(0, self.view.bounds.size.height - 50, self.view.bounds.size.width, 50);
    bottomBtn.backgroundColor =  [UIColor colorWithRed:0.0 green:184.0f / 255.0f blue:116.0 / 255.0f alpha:1.0f];
    [bottomBtn setTitle:@"SIGN IN" forState:UIControlStateNormal];
    [bottomBtn addTarget:self action:@selector(loginWasClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bottomBtn];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - BtnClick

- (void)loginWasClicked:(UIButton *)btn{
    //初始化SDK
    EMOptions * options = [EMOptions optionsWithAppkey:@"1158161013115379#app"];
    EMError * error = [[EMClient sharedClient]initializeSDKWithOptions:options];
    error = [[EMClient sharedClient]loginWithUsername:_userName.text password:_passWord.text];
    if (!error) {
        NSLog(@"登录成功");
        MainViewController * main = [[MainViewController alloc]init];
        [self presentViewController:main animated:YES completion:nil];
    }else {
        switch (error.code) {
            case EMErrorNetworkUnavailable:
                NSLog(@"错误原因：%@",error.errorDescription);
                //TTAlertNoTitle(NSLocalizedString(@"error.connectNetworkFail", @"No network connection!"));
                break;
            case EMErrorServerNotReachable:
                NSLog(@"错误原因：%@",error.errorDescription);
                //TTAlertNoTitle(NSLocalizedString(@"error.connectServerFail", @"Connect to the server failed!"));
                break;
            case EMErrorUserAuthenticationFailed:
                NSLog(@"错误原因：%@",error.errorDescription);
                //TTAlertNoTitle(error.errorDescription);
                break;
            case EMErrorServerTimeout:
                NSLog(@"错误原因：%@",error.errorDescription);
                //TTAlertNoTitle(NSLocalizedString(@"error.connectServerTimeout", @"Connect to the server timed out!"));
                break;
            case EMErrorServerServingForbidden:
                NSLog(@"错误原因：%@",error.errorDescription);
                // TTAlertNoTitle(NSLocalizedString(@"servingIsBanned", @"Serving is banned"));
                break;
            default:
                NSLog(@"错误原因：%@",error.errorDescription);
                // TTAlertNoTitle(NSLocalizedString(@"login.fail", @"Login failure"));
                break;
                
        }
        
    }
    
}

- (void)registWasClicked:(UIButton *)btn{
    
    //初始化SDK
    EMOptions * options = [EMOptions optionsWithAppkey:@"1158161013115379#app"];
    EMError * error = [[EMClient sharedClient]initializeSDKWithOptions:options];
    error = [[EMClient sharedClient] registerWithUsername:_userName.text password:_passWord.text];
    if (error==nil) {
        NSLog(@"注册成功");
        LoginViewController * vc = [[LoginViewController alloc]init];
        [self presentViewController:vc animated:YES completion:nil];
        
    }else {
        switch (error.code) {
            case EMErrorNetworkUnavailable:
                NSLog(@"错误原因：%@",error.errorDescription);
                //TTAlertNoTitle(NSLocalizedString(@"error.connectNetworkFail", @"No network connection!"));
                break;
            case EMErrorServerNotReachable:
                NSLog(@"错误原因：%@",error.errorDescription);
                
                //TTAlertNoTitle(NSLocalizedString(@"error.connectServerFail", @"Connect to the server failed!"));
                break;
            case EMErrorUserAuthenticationFailed:
                NSLog(@"错误原因：%@",error.errorDescription);
                
                //TTAlertNoTitle(error.errorDescription);
                break;
            case EMErrorServerTimeout:
                NSLog(@"错误原因：%@",error.errorDescription);
                
                //TTAlertNoTitle(NSLocalizedString(@"error.connectServerTimeout", @"Connect to the server timed out!"));
                break;
            case EMErrorServerServingForbidden:
                NSLog(@"错误原因：%@",error.errorDescription);
                
                // TTAlertNoTitle(NSLocalizedString(@"servingIsBanned", @"Serving is banned"));
                break;
            default:
                NSLog(@"错误原因：%@",error.errorDescription);
                
                // TTAlertNoTitle(NSLocalizedString(@"login.fail", @"Login failure"));
                break;
                
        }
        
    }
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_passWord resignFirstResponder];
    [_userName resignFirstResponder];
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
