//
//  XFSubscribeCell.m
//  XFBaisi
//
//  Created by xiaofans on 16/7/5.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFSubscribeCell.h"
#import "XFSubscribeTag.h"


@interface XFSubscribeCell ()
    
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *topicsCountLabel;


@end

@implementation XFSubscribeCell


- (void)setSubscribeTag:(XFSubscribeTag *)subscribeTag {
    _subscribeTag = subscribeTag;
    
    // 头像
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:subscribeTag.image_list] placeholderImage:[UIImage imageNamed:@"tag_default"]];
    
    // 名字
    self.nameLabel.text = self.subscribeTag.theme_name;
    
    // 订阅数
    if (subscribeTag.sub_number >= 10000) {
        self.subCountLabel.text = [NSString stringWithFormat:@"%.1f万人订阅", subscribeTag.sub_number / 10000.0];
    } else {
        self.subCountLabel.text = [NSString stringWithFormat:@"%zd人订阅", subscribeTag.sub_number];
    }
    
    // 总帖数
    self.topicsCountLabel.text = [NSString stringWithFormat:@"总帖数 %zd", subscribeTag.post_num];
    
}

- (IBAction)sucscribeBtnClick:(UIButton *)sender {
    XFLog(@"订阅按钮");
}


- (void)setFrame:(CGRect)frame {
    
    frame.size.height -= 1;
    [super setFrame:frame];
}



@end
