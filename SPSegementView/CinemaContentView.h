//
//  CinemaContentView.h
//  TXKMovie
//
//  Created by sheng on 16/2/22.
//  Copyright © 2016年 TXKMovie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CinemaContentView : UIScrollView

@property (nonatomic,strong) UITableView *firstView;

-(instancetype)initWithFrame:(CGRect)frame;

@end
