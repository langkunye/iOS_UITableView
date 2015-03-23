//
//  Tg.h
//  TunGou
//
//  Created by 郎坤也 on 15/3/20.
//  Copyright (c) 2015年 郎坤也. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NJGlobal.h"

@interface Tg : NSObject
/**已经购买人数*/
@property(nonatomic,copy) NSString *buyCount;
/**图标*/
@property(nonatomic,copy) NSString *icon;
/**价格*/
@property(nonatomic,copy) NSString *price;
/**标题*/
@property(nonatomic,copy) NSString *title;
NJInitH(tg)
@end
