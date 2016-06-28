//
//  XFVoiceViewController.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/28.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFVoiceViewController.h"

@interface XFVoiceViewController ()

@end

@implementation XFVoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XFLogFunc;
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %zd", [self class], indexPath.row];
    
    return cell;
}

@end
