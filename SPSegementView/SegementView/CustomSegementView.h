//
//  CustomSegementView.h
//  TXKMovie
//
//  Created by sheng on 16/2/22.
//  Copyright © 2016年 TXKMovie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomSegementView : UIView


- (instancetype)init;
/**
 *  创建view
 */



/**
 *  百分比
 *
 *  @param percent 百分比
 */
- (void)percent:(CGFloat)percent animated:(BOOL)animated;


@end
