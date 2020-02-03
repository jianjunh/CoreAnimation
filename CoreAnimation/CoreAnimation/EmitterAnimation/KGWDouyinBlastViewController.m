//
//  KGWDouyinBlastViewController.m
//  CoreAnimation
//
//  Created by junjian_h@163.com on 2020/2/3.
//  Copyright © 2020年 junjian_h@163.com. All rights reserved.
//

#import "KGWDouyinBlastViewController.h"
#import "KGWEmitterAnimation.h"

@interface KGWDouyinBlastViewController ()

@end

@implementation KGWDouyinBlastViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"抖音点赞动画";
    self.view.backgroundColor = [UIColor whiteColor];
    [KGWEmitterAnimation generateDouYinThumbEmitterAnimationWithSuperView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
