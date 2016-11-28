//
//  SearchBarView.m
//  HyphenateDemo
//
//  Created by apple on 16/11/25.
//  Copyright © 2016年 LiYue. All rights reserved.
//

#import "SearchBarView.h"

@implementation SearchBarView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UISearchBar * searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, frame.size.width - 50, 30)];
        [searchBar setSearchBarStyle:UISearchBarStyleMinimal];
        [searchBar setPlaceholder:@"Search"];
        [self addSubview:searchBar];
        
        UIButton * add = [UIButton buttonWithType:UIButtonTypeCustom];
        add.frame = CGRectMake(searchBar.frame.size.width, 0, 50, 30);
        [add setImage:[UIImage imageNamed:@"Icon_Add.png"] forState:UIControlStateNormal];
        [self addSubview:add];
        [add addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

#pragma mark - buttonClick
- (void)add:(UIButton *)btn {
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
