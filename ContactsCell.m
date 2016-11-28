//
//  ContactsCell.m
//  HyphenateDemo
//
//  Created by apple on 16/11/25.
//  Copyright © 2016年 LiYue. All rights reserved.
//

#import "ContactsCell.h"
//#import "EMSDKFull.h"

@implementation ContactsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //头像
        self.headerImage = [UIImageView new];
        self.headerImage.layer.masksToBounds = YES;
        self.headerImage.layer.cornerRadius = 20;
        self.headerImage.backgroundColor = [UIColor colorWithRed:173.0f / 255.0f green:185.0f / 255.0f blue:193.0f / 255.0f alpha:1.0f];
        [self.contentView addSubview:self.headerImage];
        
        //名字
        self.name = [UILabel new];
        self.name.backgroundColor = [UIColor colorWithRed:173.0f / 255.0f green:185.0f / 255.0f blue:193.0f / 255.0f alpha:1.0f];
        [self.contentView addSubview:self.name];
        
    }
    return self;
}


-(void)layoutSubviews{
    
    [super layoutSubviews];

    self.headerImage.frame = CGRectMake(10, 10, 40, 40);
    self.name.frame = CGRectMake(CGRectGetMaxX(self.headerImage.frame)+10, 10, 100, 40);

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
