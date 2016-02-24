//
//  SegementLabel.m
//  TXKMovie
//
//  Created by sheng on 16/2/22.
//  Copyright © 2016年 TXKMovie. All rights reserved.
//

#import "SegementLabel.h"

@implementation SegementLabel

+ (instancetype)creatWithFrame:(CGRect)frame andText:(NSString *)text andCenter:(CGPoint)center
{
    SegementLabel *label = [[SegementLabel alloc]initWithFrame:frame];
    label.text = text;
    label.font = [UIFont systemFontOfSize:10];
    label.textAlignment = NSTextAlignmentCenter;
    label.center = center;
    return label;
}
+(instancetype)creatWhiteLabelWithFrame:(CGRect)frame andText:(NSString *)text andCenter:(CGPoint)center
{
     SegementLabel *label = [self creatWithFrame:frame andText:text andCenter:center];
    label.textColor = [UIColor whiteColor];

    return label;
}
+ (instancetype)creatRedLabelWithFrame:(CGRect)frame andText:(NSString *)text andCenter:(CGPoint)center{
    SegementLabel *label = [self creatWithFrame:frame andText:text andCenter:center];
    label.textColor = [UIColor redColor];
    
    return label;
}

@end
