//
//  ContactsViewController.m
//  HyphenateDemo
//
//  Created by apple on 16/11/25.
//  Copyright © 2016年 LiYue. All rights reserved.
//

#import "ContactsViewController.h"
#import "SearchBarView.h"
#import "ContactsCell.h"
#import "EMSDKFull.h"
#import "ContactsDetailViewController.h"

@interface ContactsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation ContactsViewController

static NSString * ident = @"ident";
#pragma mark - 数据请求
- (void)loadData{
    //获取好友列表
    EMError *error = nil;
    NSArray *userlist = [[EMClient sharedClient].contactManager getContactsFromServerWithError:&error];
    if (!error) {
        
        self.datas = [NSMutableArray arrayWithArray:userlist];

        [self.tableView reloadData];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
    //建表
    [self createUI];
}

- (void)createUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    //导航栏
    SearchBarView * search = [[SearchBarView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width - 15, 30)];
    self.navigationItem.titleView = search;

    //关闭tableView系统自动向下偏移64
    self.automaticallyAdjustsScrollViewInsets = NO;
    //建表
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width,  self.view.bounds.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    //注册自定义cell
    [_tableView registerClass:[ContactsCell class] forCellReuseIdentifier:ident];

}
#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ContactsCell * cell = [tableView dequeueReusableCellWithIdentifier:ident];
    cell.selectionStyle = NO;    //让单元格无法被选中

    cell.name.text = self.datas[indexPath.row];

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"单元格被选中");
    ContactsDetailViewController *vc = [[ContactsDetailViewController alloc]init];
    vc.name = self.datas[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
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
