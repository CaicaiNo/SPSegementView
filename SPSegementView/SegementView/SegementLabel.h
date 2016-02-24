//
//  SegementLabel.h
//  TXKMovie
//
//  Created by sheng on 16/2/22.
//  Copyright © 2016年 TXKMovie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SegementLabel : UILabel

+ (instancetype)creatWhiteLabelWithFrame:(CGRect)frame andText:(NSString *)text andCenter:(CGPoint)center;

+ (instancetype)creatRedLabelWithFrame:(CGRect)frame andText:(NSString *)text andCenter:(CGPoint)center;

+ (instancetype)creatWithFrame:(CGRect)frame andText:(NSString *)text andCenter:(CGPoint)center;

@end
