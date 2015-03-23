//
//  FooterView.h
//  TunGou
//
//  Created by 郎坤也 on 15/3/20.
//  Copyright (c) 2015年 郎坤也. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController,FooterView;

/**制定协议*/
@protocol FoorerViewDelegate <NSObject>
//协议中的方法

/*
格式（编码规模）
 协议名称 ：控件名称 + Delegate
 协议方法：控件名称去掉前缀 + 含义
 在协议方法中，将自己（触发发放的）控件传出去的目的是方便用于区分哪个控件触发了该方法
 **/
//可以选择的协议
@optional
//- (void)loadMoreData;
- (void)footerViewDidClickloadBtn:(FooterView *)footerView;

@end

@interface FooterView : UIView

//@property(nonatomic,strong) ViewController *controller;

/**代理*/
/**delegate 一定遵守这个协议*/
@property(nonatomic, weak) id<FoorerViewDelegate> delegate;
@end
