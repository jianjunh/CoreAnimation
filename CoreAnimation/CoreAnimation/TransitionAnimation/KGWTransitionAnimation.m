//
//  KGWTransitionAnimation.m
//  CoreAnimation
//
//  Created by junjian_h@163.com on 2020/2/3.
//  Copyright © 2020年 junjian_h@163.com. All rights reserved.
//

#import "KGWTransitionAnimation.h"

@implementation KGWTransitionAnimation

+ (UIView *)createRedView {
    UIView *redView = [UIView new];
    redView.frame = CGRectMake(100, 100, 100, 100);
    redView.backgroundColor = [UIColor redColor];
    return redView;
}

+ (void)generateTransitionAnimationWithSuperView:(UIView *)superView {
    UIView *redView = [self createRedView];
    [superView addSubview:redView];
    
    CATransition *transitionAnimation = [CATransition new];
    transitionAnimation.type = @"push";
    transitionAnimation.subtype = @"fromRight";
    transitionAnimation.duration = 2.f;
    transitionAnimation.repeatCount = MAXFLOAT;
    transitionAnimation.autoreverses = YES;
    [redView.layer addAnimation:transitionAnimation forKey:@"transitionAnimation"];
}
@end
