//
//  CustomSegementView.m
//  TXKMovie
//
//  Created by sheng on 16/2/22.
//  Copyright © 2016年 TXKMovie. All rights reserved.
//

#import "CustomSegementView.h"
#import "SegementLabel.h"
#import "WxHxD.h"
@interface CustomSegementView()
@property (nonatomic,strong) UIView *moveView;
@property (nonatomic,strong) SegementLabel *labelOneNormal;
@property (nonatomic,strong) SegementLabel *labelOneHide;
@property (nonatomic,strong) SegementLabel *labelTwoNormal;
@property (nonatomic,strong) SegementLabel *labelTwoHide;
@property (nonatomic,strong) UIView *firstView;
@property (nonatomic,strong) UIView *secondView;
@property (nonatomic,strong) UITapGestureRecognizer *tapFirstGR;
@property (nonatomic,strong) UITapGestureRecognizer *tapSecondGR;
@property (nonatomic,assign) CGFloat originX;
@end
@implementation CustomSegementView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        self.frame = CGRectMake(0, 0, Width*0.28, NavigationBarHeight-10);
        //the backgroundview
        UIView *backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        backgroundView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        backgroundView.layer.cornerRadius = 2.f;
        backgroundView.layer.masksToBounds = YES;
        backgroundView.backgroundColor = [UIColor colorWithRed:48/255 green:50/255 blue:41/255 alpha:0.4];
        [self addSubview:backgroundView];
        
        //move view
        self.moveView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, (self.frame.size.width-4)/2, (self.frame.size.height-2))];
        self.moveView.layer.cornerRadius = 2.f;
        self.moveView.layer.masksToBounds = YES;
        self.moveView.backgroundColor = [UIColor whiteColor];
        self.moveView.center = CGPointMake(self.frame.size.width/4, self.frame.size.height/2);
        
        [self addSubview:self.moveView];
        //firstView as a click view,corresponding to the user click;
        self.firstView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, (self.frame.size.width-4)/2, (self.frame.size.height-2))];
        self.firstView.layer.cornerRadius = 2.f;
        self.firstView.layer.masksToBounds = YES;
        self.firstView.center = CGPointMake(self.frame.size.width/4, self.frame.size.height/2);
        self.tapFirstGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickSegementView:)];
        [self.firstView addGestureRecognizer:self.tapFirstGR];
        [self addSubview:self.firstView];
        //secondView as a click view,corresponding to the user click;
        self.secondView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, (self.frame.size.width-4)/2, (self.frame.size.height-2))];
        self.secondView.layer.cornerRadius = 2.f;
        self.secondView.layer.masksToBounds = YES;
        self.secondView.center = CGPointMake(self.frame.size.width*3/4, self.frame.size.height/2);
        self.tapSecondGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickSegementView:)];
        [self.secondView addGestureRecognizer:self.tapSecondGR];
        [self addSubview:self.secondView];
        
        
        self.labelOneNormal = [SegementLabel creatRedLabelWithFrame:self.moveView.bounds andText:@"热映" andCenter:self.firstView.center];
        self.labelOneHide = [SegementLabel creatWhiteLabelWithFrame:self.moveView.bounds  andText:@"热映" andCenter:self.firstView.center];
        self.labelOneHide.alpha = 0.f;
        [self addSubview:self.labelOneNormal];
        [self addSubview:self.labelOneHide];
        
        self.labelTwoNormal = [SegementLabel creatWhiteLabelWithFrame:self.moveView.bounds andText:@"待映" andCenter:self.secondView.center];
        self.labelTwoHide = [SegementLabel creatRedLabelWithFrame:self.moveView.bounds  andText:@"待映" andCenter:self.secondView.center];
        self.labelTwoHide.alpha = 0.f;
        [self addSubview:self.labelTwoNormal];
        [self addSubview:self.labelTwoHide];
        self.originX = self.moveView.layer.position.x;
    }
    return self;
   
    
}
- (void)percent:(CGFloat)percent animated:(BOOL)animated
{
    if (animated) {
        if (percent >= 0&&percent <= 1) {
            CGFloat width = self.moveView.bounds.size.width;
            self.moveView.layer.position = CGPointMake(self.originX+(percent*width+1), self.moveView.layer.position.y);
            if (percent >= 0.4&&percent <=0.6) {
                self.labelOneNormal.alpha = 0;
                self.labelOneHide.alpha = 0;
                self.labelTwoNormal.alpha = 0;
                self.labelTwoHide.alpha = 0;
            }else{
                self.labelOneNormal.alpha = 1 - percent;
                self.labelOneHide.alpha = percent;
                self.labelTwoNormal.alpha = 1 - percent;
                self.labelTwoHide.alpha = percent;
            }
            
        }
    }
}
- (void)clickSegementView:(UIGestureRecognizer*)recognizer
{
    if (recognizer != nil) {
        if (recognizer == self.tapFirstGR) {
            NSLog(@"clickFirstView");
            [UIView animateWithDuration:0.2 animations:^{
                [self percent:0 animated:YES];
            }];
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"changeSegement" object:nil userInfo:@{@"num":@0}];
        }else{
            NSLog(@"clickSecondView");
            [UIView animateWithDuration:0.2 animations:^{
                [self percent:1 animated:YES];
            }];
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"changeSegement" object:nil userInfo:@{@"num":@1}];
        }
    }
    
}



@end
