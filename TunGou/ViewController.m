//
//  ViewController.m
//  TunGou
//
//  Created by 郎坤也 on 15/3/20.
//  Copyright (c) 2015年 郎坤也. All rights reserved.
//

#import "ViewController.h"
#import "Tg.h"
#import "TgCell.h"
#import "FooterView.h"
#import "HeaderView.h"

//UITableViewDataSource代理 FoorerViewDelegate协议
@interface ViewController ()<UITableViewDataSource,FoorerViewDelegate>

@property(nonatomic,strong )NSMutableArray *tgs;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)footerViewDidClickloadBtn:(FooterView *)footerView;
{
    //1.创建模型
    Tg *tg = [[Tg alloc] init];
    tg.title = @"铁板烧";
    tg.price = @"128";
    tg.buyCount =@"0";
    tg.icon = @"37e4761e6ecf56a2d78685df7157f097";
    //2.将模型添加到数组中
    [self.tgs addObject:tg];
    //3.刷新表格
    [self.tableView reloadData];


}

#pragma mark -懒加载
- (NSMutableArray *)tgs
{
    if (_tgs == nil) {
        NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:fullPath];
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:dictArray.count];
        for (NSDictionary *dict in dictArray) {
            Tg *tg = [Tg tgWithDict:dict];
            [models addObject:tg];
        }
        self.tgs = [models mutableCopy];
    }
    return _tgs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加tableView的底部视图
    //注意。给tableview添加footerView不用设置宽度，宽度和他默认的tableView一样宽
   // self.tableView.tableFooterView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    /*
    UIButton *btn = [[UIButton alloc] init];
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"全て見る" forState:UIControlStateNormal];
    btn.frame = CGRectMake(10, 0,300, 44);
    self.tableView.tableFooterView = btn;
     */
    /**加载xib的两种方式*/
   
    UINib *nib = [UINib nibWithNibName:@"FooterView" bundle:[NSBundle mainBundle]];
   FooterView *footerView = [[nib instantiateWithOwner:nil options:nil]firstObject];
    self.tableView.tableFooterView = footerView;
    
    //设置控制
    footerView.delegate = self;
    
    //设置头部视图
    self.tableView.tableHeaderView = [HeaderView headerView];
    /*
    //拿到按钮给按钮添加点击事件
    
    UIButton *btn = [footerView viewWithTag:888];
    
    [btn addTarget:self action:@selector(btnOnClick) forControlEvents:UIControlEventTouchUpInside];
     */
}
-(void)btnOnClick
{
    NSLog(@"button");
}
#pragma mark  -numberOfSectionsInTableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark -tableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tgs.count;
}
#pragma mark -UITableViewCell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    static NSString *identifer = @"tg";
    //1.去缓存中取
    TgCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    //2.创建cell
    if (cell == nil ) {
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifer];
        //如果找不到就从xib中创建cell
       cell = [[[NSBundle mainBundle] loadNibNamed:@"TgCell" owner:nil options:nil]firstObject];
        
    }
     */
      //2.创建cell
    TgCell *cell = [TgCell cellWithTableView:tableView];
    //3.设置数据
    //3.1取出对应行的模型
    Tg *tg = self.tgs[indexPath.row];
    //3.2设置模型数据给cell
    cell.tg = tg;
    //4.返回cell
    return cell;
    /**
     ios中自定义cell有两种方式
     1.通过自定义
     2.通过xib
     */
//     cell.imageView.image = [UIImage imageNamed:tg.icon];
//    cell.textLabel.text = tg.title;
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"$%@       %@",tg.price , tg.buyCount];
    /*
    UIImageView *iconView = (UIImageView *)[cell viewWithTag:10];
    iconView.image = [UIImage imageNamed:tg.icon];
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:20];
    titleLabel.text = tg.title;
    UILabel *priceLabel = (UILabel *)[cell viewWithTag:30];
    priceLabel.text = tg.price;
    UILabel *buyCountLabel = (UILabel *)[cell viewWithTag:40];
    buyCountLabel.text = tg.buyCount;
     */
    
//    
//   NSLog(@"%p - %p - %p - %p",cell.contentView,cell.imageView.superview,cell.textLabel.superview,cell.detailTextLabel.superview);
 
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
