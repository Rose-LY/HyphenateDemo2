//
//  DetailCell.m
//  HyphenateDemo
//
//  Created by apple on 16/11/28.
//  Copyright © 2016年 LiYue. All rights reserved.
//

#import "DetailCell.h"

@implementation DetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        //标题
        self.title = [UILabel new];
        self.title.textColor = [UIColor colorWithRed:178.0f / 255.0f green:184.0f / 255.0f blue:189.0f / 255.0f alpha:1.0f];
        //self.title.font = [UIFont systemFontOfSize:19];
        [self.contentView addSubview:self.title];
        
        //内容
        self.contect = [UILabel new];
        //self.contect.font = [UIFont systemFontOfSize:19];
        [self.contentView addSubview:self.contect];
        
        self.line = [UIView new];
        self.line.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.line];

    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.title.frame = CGRectMake(20, 5, 200, 20);
    self.contect.frame = CGRectMake(20, CGRectGetMaxY(self.title.frame)+5, 200, 20);
    self.line.frame = CGRectMake(0, self.bounds.size.height-1, self.bounds.size.width, 1);

}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
