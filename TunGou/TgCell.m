//
//  TgCell.m
//  TunGou
//
//  Created by 郎坤也 on 15/3/20.
//  Copyright (c) 2015年 郎坤也. All rights reserved.
//

#import "TgCell.h"
#import "Tg.h"

@interface TgCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;

@end

@implementation TgCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifer = @"tg";
    //1.去缓存中取
    TgCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    //2.创建cell
    if (cell == nil ) {
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifer];
        //如果找不到就从xib中创建cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TgCell" owner:nil options:nil]firstObject];
        
        //NSLog(@"cell");
    }
    return cell;
}

-(void)setTg:(Tg *)tg
{
    _tg = tg;
    //设置图片
    self.iconView.image = [UIImage imageNamed:tg.icon];
    //设置标题
    self.titleLabel.text = tg.title;
    //设置价格
    self.priceLabel.text = [NSString stringWithFormat:@"$%@",tg.price];
    //设置购买人数
    self.buyCountLabel.text = [NSString stringWithFormat:@"%@購入済み",tg.buyCount];
}

@end
