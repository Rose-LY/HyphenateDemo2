//
//  ContactsDetailViewController.m
//  HyphenateDemo
//
//  Created by apple on 16/11/27.
//  Copyright © 2016年 LiYue. All rights reserved.
//

#import "ContactsDetailViewController.h"
#import "DetailCell.h"
#define WIDTH  [UIScreen mainScreen].bounds.size.width
#define HEIGHT  [UIScreen mainScreen].bounds.size.height

@interface ContactsDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datas;


@end

@implementation ContactsDetailViewController
static NSString * identDetail = @"ident";
static NSString * ident = @"identDetail";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
}
#pragma mark - UI
- (void)createUI{
    //表头
    UIImageView *head = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT/3.0)];
    //头像
    UIImageView * headImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    headImage.center = CGPointMake(self.view.center.x, 50);
    headImage.layer.masksToBounds = YES;
    headImage.layer.cornerRadius = 40;
    headImage.backgroundColor = [UIColor redColor];////////////////
    [head addSubview:headImage];
    //名字
    UILabel * name = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 30)];
    name.center = CGPointMake(self.view.center.x, CGRectGetMaxY(headImage.frame) + 20);
    name.textAlignment = NSTextAlignmentCenter;
    name.font = [UIFont systemFontOfSize:19];
    name.text = _name;
    [head addSubview:name];
    
    UIButton *chat = [UIButton buttonWithType:UIButtonTypeCustom];
    [chat setBackgroundImage:[UIImage imageNamed:@"Button_Chat"] forState:UIControlStateNormal];
    [chat addTarget:self action:@selector(btnWasClicked:) forControlEvents:UIControlEventTouchUpInside];
    chat.tag = 100;
    chat.frame = CGRectMake(0, 0, 40, 60);

    chat.center =  CGPointMake(self.view.center.x-80, CGRectGetMaxY(headImage.frame) + 80);
    [head addSubview:chat];

    UIButton *call = [UIButton buttonWithType:UIButtonTypeCustom];
    [call setBackgroundImage:[UIImage imageNamed:@"Button_Call"] forState:UIControlStateNormal];
    [call addTarget:self action:@selector(btnWasClicked:) forControlEvents:UIControlEventTouchUpInside];
    call.tag = 101;
    call.frame = CGRectMake(0, 0, 40, 60);
    call.center =  CGPointMake(self.view.center.x, CGRectGetMaxY(headImage.frame) + 80);
    [head addSubview:call];

    UIButton *video = [UIButton buttonWithType:UIButtonTypeCustom];
    [video setBackgroundImage:[UIImage imageNamed:@"Button_Video"] forState:UIControlStateNormal];
    [video addTarget:self action:@selector(btnWasClicked:) forControlEvents:UIControlEventTouchUpInside];
    video.tag = 102;
    video.frame = CGRectMake(0, 0, 40, 60);
    video.center =  CGPointMake(self.view.center.x+80, CGRectGetMaxY(headImage.frame) + 80);
    [head addSubview:video];
    //建表
     self.automaticallyAdjustsScrollViewInsets = NO;
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, WIDTH,  HEIGHT-64) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = NO;
    _tableView.tableHeaderView = head;
    [self.view addSubview:_tableView];
    
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
#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
        {
            return 3;

        }
            break;
        case 1:
        {
            return 2;

        }
            break;
            
        default:
        {
            return 0;

        }
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            DetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identDetail];
            if(!cell){
                cell = [[DetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identDetail];
                cell.selectionStyle = NO;    //让单元格无法被选中
            }
            
            //cell赋值
            NSArray * titles = @[@"Name",@"Hyphenate ID",@"iOS APNS"];
            
            cell.title.text = titles[indexPath.row];
            cell.contect.text = _name;
            return cell;


        }
            break;
        case 1:
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
            if(!cell){
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
                cell.selectionStyle = NO;    //让单元格无法被选中
            }
            
            NSArray * titles = @[@"Block Contact",@"Delete Contact"];
            cell.textLabel.text = titles[indexPath.row];
            return cell;

        }

            
        default:
        {
            
            return nil;

        }
            break;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

//    ContactsDetailViewController *vc = [[ContactsDetailViewController alloc]init];
//    
//    [self.navigationController pushViewController:vc animated:YES];
    
}
#pragma mark - btn
- (void)btnWasClicked:(UIButton *)btn{
    switch (btn.tag) {
        case 100:
        {
            
        }
            break;
        case 101:
        {
            
        }
            break;

        case 102:
        {
            
        }
            break;

            
        default:
            break;
    }
    
}
@end
