//
//  KGWGenerateBasicAnimation.m
//  CoreAnimation
//
//  Created by junjian_h@163.com on 2020/1/31.
//  Copyright © 2020年 junjian_h@163.com. All rights reserved.
//

#import "KGWGenerateBasicAnimation.h"

@implementation KGWGenerateBasicAnimation

+ (CABasicAnimation *)generateBasicAnimation{
    CABasicAnimation *basicAnimation = [[CABasicAnimation alloc] init];
    return basicAnimation;
}

+ (UIView *)createRedView {
    UIView *redView = [UIView new];
    redView.frame = CGRectMake(100, 100, 100, 100);
    redView.backgroundColor = [UIColor redColor];
    return redView;
}

+ (void)generateMoveAnimationWithSuperView:(UIView *)superView {
    UIView *redView = [self createRedView];
    [superView addSubview:redView];
    CABasicAnimation *moveAnimation = [self generateBasicAnimation];
    moveAnimation.keyPath = @"position";
    moveAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    moveAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    moveAnimation.duration = 3;
    moveAnimation.autoreverses = YES;
    moveAnimation.repeatCount = MAXFLOAT;
    [redView.layer addAnimation:moveAnimation forKey:@"moveAnimation"];
    
}

+ (void)generatiRotationAnimationWithSuperView:(UIView *)superView {
    UIView *redView = [self createRedView];
    [superView addSubview:redView];
    CABasicAnimation *rotationAnimation = [self generateBasicAnimation];
    rotationAnimation.keyPath = @"transform.rotation.z";
    rotationAnimation.toValue = [NSNumber numberWithDouble:M_PI];
    rotationAnimation.duration = 3;
    rotationAnimation.repeatCount = MAXFLOAT;
    [redView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

+ (void)generateScaleAnimationWithSuperView:(UIView *)superView {
    UIView *redView = [self createRedView];
    [superView addSubview:redView];
    CABasicAnimation *scaleAnimation = [self generateBasicAnimation];
    scaleAnimation.keyPath = @"transform.scale";
    scaleAnimation.toValue = [NSNumber numberWithFloat:0.5];
    scaleAnimation.autoreverses = YES;
    scaleAnimation.duration = 1.f;
    scaleAnimation.repeatCount = MAXFLOAT;
    [redView.layer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
}

+ (void)generateOpacityAnmationWithSuperView:(UIView *)superView {
    UIView *redView = [self createRedView];
    [superView addSubview:redView];
    CABasicAnimation *opacityAnimation = [self generateBasicAnimation];
    opacityAnimation.keyPath = @"opacity";
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.2];
    opacityAnimation.repeatCount = MAXFLOAT;
    opacityAnimation.autoreverses = NO;
    opacityAnimation.duration = 2.f;
    [redView.layer addAnimation:opacityAnimation forKey:@"opacityAnimation"];
}

+ (void)generateBackgroundColorAnmationWithSuperView:(UIView *)superView {
    UIView *redView = [self createRedView];
    [superView addSubview:redView];
    CABasicAnimation *backgroundColorAnimation = [self generateBasicAnimation];
    backgroundColorAnimation.keyPath = @"backgroundColor";
    backgroundColorAnimation.duration = 2;
    backgroundColorAnimation.repeatCount = MAXFLOAT;
    backgroundColorAnimation.autoreverses = YES;
    backgroundColorAnimation.toValue = CFBridgingRelease([UIColor grayColor].CGColor);
    [redView.layer addAnimation:backgroundColorAnimation forKey:@"backgroundAnimation"];
}
@end
