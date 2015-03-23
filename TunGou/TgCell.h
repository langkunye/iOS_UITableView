//
//  TgCell.h
//  TunGou
//
//  Created by 郎坤也 on 15/3/20.
//  Copyright (c) 2015年 郎坤也. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Tg;

@interface TgCell : UITableViewCell

@property(nonatomic, strong)Tg *tg;

+(instancetype)cellWithTableView:(UITableView *)tableView;


@end
