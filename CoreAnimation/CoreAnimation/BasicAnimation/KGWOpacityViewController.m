//
//  KGWOpacityViewController.m
//  CoreAnimation
//
//  Created by junjian_h@163.com on 2020/2/1.
//  Copyright © 2020年 junjian_h@163.com. All rights reserved.
//

#import "KGWOpacityViewController.h"
#import "KGWGenerateBasicAnimation.h"
@interface KGWOpacityViewController ()

@end

@implementation KGWOpacityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"透明度";
    self.view.backgroundColor = [UIColor whiteColor];
    [KGWGenerateBasicAnimation generateOpacityAnmationWithSuperView:self.view];
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
