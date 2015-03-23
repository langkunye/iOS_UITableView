//
//  HeaderView.m
//  TunGou
//
//  Created by 郎坤也 on 15/3/20.
//  Copyright (c) 2015年 郎坤也. All rights reserved.
//

#import "HeaderView.h"
#define ImageCount 5

@interface HeaderView ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollerView;

@property(nonatomic,strong) NSTimer *timer;

@end

@implementation HeaderView

//实现类方法
+ (instancetype)headerView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:nil options:nil] firstObject];
}
//init方法只有通过代码创建控件的时候才会调用
//动态添加代码
//- (id)init
//{
//    if (self = [super init]) {
//        //添加imageview
//        NSLog(@"init");
//    }
//    return self;
//}
//这个方法在控件通过xib或者storyboard创建的时候就会调用
- (void)awakeFromNib
{
   //在这个地方scrollv添加图片
    CGFloat width = self.scrollerView.frame.size.width;
    CGFloat height = self.scrollerView.frame.size.height;
    //2 图片（代码添加到scrollView）
    for (int i = 1; i < ImageCount + 1; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        CGFloat imageX = (i - 1) * width;
        CGFloat imageY = 0.f;
        
        imageView.frame = CGRectMake(imageX, imageY, width, height);
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"ad_%02d",i]];
        
        [self.scrollerView addSubview:imageView];
    }
    //scrollView
    self.scrollerView.contentSize = CGSizeMake(ImageCount * width, 0);
    //拖动分页
    self.scrollerView.pagingEnabled = YES;
    //设置代理
    self.scrollerView.delegate = self;
    //页码设置(当前是第几页)
    self.pageControl.numberOfPages = ImageCount;
    //创建定时器
    [self addScrollTimer];
}
- (void)addScrollTimer
{
    self.timer = [NSTimer timerWithTimeInterval:1.f target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
-(void)removeScrollTimer
{
    [self.timer invalidate];
    self.timer = nil;
}
/**写实现 下一页*/
-(void)nextPage
{

    int currentPage = self.pageControl.currentPage;
    currentPage ++;
    //循环一圈回来加1
    if (currentPage == 5) {
        currentPage = 0;
    }
    CGFloat width = self.scrollerView.frame.size.width;
    //先拿到页码 currentPage当前页 * 款图
    CGPoint offset = CGPointMake((currentPage) * width, 0.f);
    //设置偏移量
    //设置动画效果
    [UIView animateWithDuration:0.2f animations:^{
        self.scrollerView.contentOffset = offset;
    }];
}
#pragma mark - UIscrollViewDelegate 实现方法
//scrollView 滚动时执行
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = self.scrollerView.contentOffset;
    CGFloat offsetX = offset.x;
    CGFloat width = self.scrollerView.frame.size.width;
    //实现四舍五入原理
    int pageNum = (offsetX + .5f * width) / width;
    
    self.pageControl.currentPage = pageNum;
}
/**点击*/
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeScrollTimer];
}
/**释放*/
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView
{
    [self addScrollTimer];
}
//这个方法在控件通过xib或者storyboard创建的时候就会调用
//-(id)initWithCoder:(NSCoder *)aDecoder
//{
//
//}

@end
