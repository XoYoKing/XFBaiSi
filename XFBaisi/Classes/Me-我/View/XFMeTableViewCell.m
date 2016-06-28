//
//  XFMeTableViewCell.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/26.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFMeTableViewCell.h"

@implementation XFMeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.textLabel.textColor = [UIColor darkGrayColor];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.imageView.image == nil) return;
    
    // imageview
    self.imageView.xf_y = XFSmallMargin;
    self.imageView.xf_height = self.contentView.xf_height - 2 * XFSmallMargin;
    self.imageView.xf_width = self.imageView.xf_height;
    
    // label
    self.textLabel.xf_x = self.imageView.xf_right + XFMargin;
}

@end













