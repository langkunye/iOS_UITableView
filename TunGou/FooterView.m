//
//  FooterView.m
//  TunGou
//
//  Created by 郎坤也 on 15/3/20.
//  Copyright (c) 2015年 郎坤也. All rights reserved.
//

#import "FooterView.h"
#import "Tg.h"
#import "ViewController.h"

@interface FooterView()
- (IBAction)btnOnClick;
/**菊花视图*/
@property (weak, nonatomic) IBOutlet UIView *loadingView;
/**按钮*/
@property (weak, nonatomic) IBOutlet UIButton *loadBtn;

@end
@implementation FooterView

- (IBAction)btnOnClick {
    NSLog(@"按钮被点击了");
    //1.隐藏按钮
    self.loadBtn.hidden = YES;
    //2.显示菊花
    self.loadingView.hidden = NO;
   
#warning 模拟发送网络请求，3秒之后隐藏菊花
    //延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //3.调用控制器的加载数据方法
        //判断是否有代理
        if ([self.delegate respondsToSelector:@selector(footerViewDidClickloadBtn:)]) {
           // [self.delegate loadMoreData];
            [self.delegate footerViewDidClickloadBtn:self];
        }
        //4.隐藏菊花视图
        self.loadingView.hidden = YES;
        //5.显示按钮
        self.loadBtn.hidden = NO;
    });
  
}
@end
