//
//  PYRefreshHeader.m
//  Gank
//
//  Created by 谢培艺 on 2017/2/27.
//  Copyright © 2017年 CoderKo1o. All rights reserved.
//

#import "PYRefreshHeader.h"

@implementation PYRefreshHeader

#pragma mark 基本设置

- (void)prepare
{
    [super prepare];
    
    self.lastUpdatedTimeLabel.hidden = YES;
    self.stateLabel.hidden = YES;
    
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=16; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_%zd", i]];
        [idleImages addObject:image];
    }
    [self setImages:idleImages forState:MJRefreshStateIdle];
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=16; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_%zd", i]];
        [refreshingImages addObject:image];
    }
    [self setImages:@[[UIImage imageNamed:[NSString stringWithFormat:@"loading_%zd", 16]]] forState:MJRefreshStatePulling];
    
    // 设置正在刷新状态的动画图片
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
}

- (void)setFrame:(CGRect)frame
{
    frame.origin = CGPointMake(frame.origin.x, 300-54);
    [super setFrame:frame];
}

@end
