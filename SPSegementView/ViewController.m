//
//  ViewController.m
//  SPSegementView
//
//  Created by sheng on 16/2/24.
//  Copyright © 2016年 Simply. All rights reserved.
//

#import "ViewController.h"
#import "CustomSegementView.h"
#import "CinemaContentView.h"
#import "WxHxD.h"
@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong) CustomSegementView *middleView;

@property (nonatomic,strong) CinemaContentView *contentView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //中间视图显示
    self.middleView = [[CustomSegementView alloc]init];
    self.navigationItem.titleView = self.middleView;
    [self setContentView];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)setContentView{
    self.contentView = [[CinemaContentView alloc]initWithFrame:CGRectMake(0, 0, Width, Height-StatusBarAndNavigationBarHeight-TabbarHeight)];
    self.contentView.delegate = self;
    [self.view addSubview:self.contentView];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark scrollview delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if (scrollView == self.contentView) {
        //        NSLog(@"%f",scrollView.contentOffset.x);
        if (scrollView.contentOffset.x > 0) {
            CGFloat percent = ABS(scrollView.contentOffset.x)/Width;
//            NSLog(@"%f",percent);
            [self.middleView percent:percent animated:YES];
        }
        
        
    }
}
@end
