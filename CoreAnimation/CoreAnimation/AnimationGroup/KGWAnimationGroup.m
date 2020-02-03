//
//  KGWAnimationGroup.m
//  CoreAnimation
//
//  Created by junjian_h@163.com on 2020/2/3.
//  Copyright © 2020年 junjian_h@163.com. All rights reserved.
//

#import "KGWAnimationGroup.h"
#import "KGWGenerateBasicAnimation.h"
#import "KGWGenerateKeyframeAnimation.h"

@implementation KGWAnimationGroup

+ (CABasicAnimation *)generateBasicAnimation{
    CABasicAnimation *basicAnimation = [[CABasicAnimation alloc] init];
    return basicAnimation;
}

+ (CAKeyframeAnimation *)generateKeyframeAnimation {
    CAKeyframeAnimation *keyframeAnimation = [[CAKeyframeAnimation alloc] init];
    return keyframeAnimation;
}

+ (UIView *)createRedView {
    UIView *redView = [UIView new];
    redView.frame = CGRectMake(100, 100, 100, 100);
    redView.backgroundColor = [UIColor redColor];
    return redView;
}

+ (void)generateAnimationGroupSameTimeWithSuperView:(UIView *)superView {
    UIView *redView = [self createRedView];
    [superView addSubview:redView];
    
    CABasicAnimation *basicAnimation = [self generateBasicAnimation];
    basicAnimation.keyPath = @"transform.scale";
    basicAnimation.toValue = [NSNumber numberWithFloat:0.2];
    
    CAKeyframeAnimation *keyframeAnimation = [self generateKeyframeAnimation];
    CGPoint point0 = CGPointMake(100, 100);
    CGPoint point1 = CGPointMake(110, 110);
    CGPoint point2 = CGPointMake(120, 120);
    CGPoint point3 = CGPointMake(130, 130);
    CGPoint point4 = CGPointMake(160, 150);
    CGPoint point5 = CGPointMake(160, 200);
    keyframeAnimation.keyPath = @"position";
    keyframeAnimation.values = @[[NSValue valueWithCGPoint:point0],[NSValue valueWithCGPoint:point1],[NSValue valueWithCGPoint:point2],[NSValue valueWithCGPoint:point3],[NSValue valueWithCGPoint:point4],[NSValue valueWithCGPoint:point5]];
    CAAnimationGroup *animationGroup = [[CAAnimationGroup alloc] init];
    animationGroup.animations = @[basicAnimation,keyframeAnimation];
    animationGroup.duration = 2.f;
    animationGroup.autoreverses = YES;
    animationGroup.repeatCount = MAXFLOAT;
    [redView.layer addAnimation:animationGroup forKey:@"animationGroup"];
}


/**
 连续动画，通过beginTime来控制

 @param superView 父视图
 */
+ (void)generateAnimationGroupContinuousWithSuperView:(UIView *)superView {
    UIView *redView = [self createRedView];
    [superView addSubview:redView];
    
    double currentTime = CACurrentMediaTime();
    CABasicAnimation *scaleAnimation = [self generateBasicAnimation];
    scaleAnimation.keyPath = @"transform.scale";
    scaleAnimation.toValue = [NSNumber numberWithFloat:0.2];
    scaleAnimation.beginTime = currentTime;
    scaleAnimation.duration = 1.f;
    scaleAnimation.autoreverses = YES;
    scaleAnimation.repeatCount = MAXFLOAT;
    [redView.layer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    
    CABasicAnimation *rotationAnimation = [self generateBasicAnimation];
    rotationAnimation.keyPath = @"transform.rotation.z";
    rotationAnimation.fromValue = [NSNumber numberWithFloat:M_PI_4 / 4];
    rotationAnimation.toValue = [NSNumber numberWithFloat:-M_PI_4 / 4];
    rotationAnimation.duration = 2.f;
    rotationAnimation.beginTime = currentTime + 1;
    [redView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];

    CAKeyframeAnimation *keyframeAnimation = [self generateKeyframeAnimation];
    CGPoint point0 = CGPointMake(100, 100);
    CGPoint point1 = CGPointMake(110, 110);
    CGPoint point2 = CGPointMake(120, 120);
    CGPoint point3 = CGPointMake(130, 130);
    CGPoint point4 = CGPointMake(160, 150);
    CGPoint point5 = CGPointMake(160, 200);
    keyframeAnimation.keyPath = @"position";
    keyframeAnimation.values = @[[NSValue valueWithCGPoint:point0],[NSValue valueWithCGPoint:point1],[NSValue valueWithCGPoint:point2],[NSValue valueWithCGPoint:point3],[NSValue valueWithCGPoint:point4],[NSValue valueWithCGPoint:point5]];
    keyframeAnimation.duration = 3;
    keyframeAnimation.beginTime = currentTime + 3;
    [redView.layer addAnimation:keyframeAnimation forKey:@"keyframeAnimation"];
    
}
@end
