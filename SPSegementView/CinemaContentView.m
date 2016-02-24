//
//  CinemaContentView.m
//  TXKMovie
//
//  Created by sheng on 16/2/22.
//  Copyright © 2016年 TXKMovie. All rights reserved.
//

#import "CinemaContentView.h"


@implementation CinemaContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.contentSize = CGSizeMake(frame.size.width*2, frame.size.height);
        self.firstView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.firstView.backgroundColor = [UIColor grayColor];
        self.firstView.showsVerticalScrollIndicator = NO;
        
        UIView *secondView = [[UIView alloc]initWithFrame:CGRectMake(frame.size.width, 0, frame.size.width, frame.size.height)];
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.pagingEnabled = YES;
        self.userInteractionEnabled = YES;
        self.bounces = NO;
        [self addSubview:self.firstView];
        [self addSubview:secondView];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeSegement:) name:@"changeSegement" object:nil];
        
        
    }
    return self;
}
- (void)changeSegement:(NSNotification*)notification
{
    NSNumber *num = notification.userInfo[@"num"];
    NSInteger number = [num integerValue];
    NSLog(@"num%ld",number);
    if (number == 0) {
        [UIView animateWithDuration:0.4 animations:^{
            [self setContentOffset:CGPointMake(0, 0)];
        }];
    }else{
        [UIView animateWithDuration:0.4 animations:^{
            [self setContentOffset:CGPointMake(self.frame.size.width, 0)];
        }];
    }
}

@end
