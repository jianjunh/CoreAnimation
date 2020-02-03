//
//  KGWGenerateKeyframeAnimation.m
//  CoreAnimation
//
//  Created by junjian_h@163.com on 2020/2/2.
//  Copyright © 2020年 junjian_h@163.com. All rights reserved.
//

#import "KGWGenerateKeyframeAnimation.h"


#define KGW_SCREEN_WIDTH self.view.frame.size.width
#define KGW_SCREEN_HEIGHT self.view.frame.size.height

@implementation KGWGenerateKeyframeAnimation

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

+ (void)generateKeyframeAnimationWithValuesWithSuperView:(id)superView {
    UIView *redView = [self createRedView];
    [superView addSubview:redView];
    CGPoint point0 = CGPointMake(100, 100);
    CGPoint point1 = CGPointMake(110, 110);
    CGPoint point2 = CGPointMake(120, 120);
    CGPoint point3 = CGPointMake(130, 130);
    CGPoint point4 = CGPointMake(160, 150);
    CGPoint point5 = CGPointMake(160, 200);
    CAKeyframeAnimation *keyfameAnimationValues = [self generateKeyframeAnimation];
    keyfameAnimationValues.keyPath = @"position";
    keyfameAnimationValues.duration = 3;
    keyfameAnimationValues.autoreverses = YES;
    keyfameAnimationValues.repeatCount = MAXFLOAT;
    [keyfameAnimationValues setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    keyfameAnimationValues.values = @[[NSValue valueWithCGPoint:point0],[NSValue valueWithCGPoint:point1],[NSValue valueWithCGPoint:point2],[NSValue valueWithCGPoint:point3],[NSValue valueWithCGPoint:point4],[NSValue valueWithCGPoint:point5]];
    [redView.layer addAnimation:keyfameAnimationValues forKey:@"keyfameAnimationValues"];
    
}

+ (void)generateKeyframeAnimationWithPathWithSuperView:(UIView *)superView {
    UIView *redView = [self createRedView];
    [superView addSubview:redView];
    CAKeyframeAnimation *keyframeAnimationPath = [self generateKeyframeAnimation];
    keyframeAnimationPath.keyPath = @"position";
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:60 startAngle:0.0 endAngle:M_2_PI clockwise:true];
    keyframeAnimationPath.duration = 3.f;
    keyframeAnimationPath.path = path.CGPath;
    keyframeAnimationPath.autoreverses = YES;
    keyframeAnimationPath.repeatCount = MAXFLOAT;
    [redView.layer addAnimation:keyframeAnimationPath forKey:@"keyframeAnimationPath"];
}

+ (void)generateKeyframeShakeAnimationWithValuesWithSuperView:(UIView *)superView {
    UIView *redView = [self createRedView];
    [superView addSubview:redView];
    CAKeyframeAnimation *keyframeAnimationShake = [self generateKeyframeAnimation];
    keyframeAnimationShake.keyPath = @"transform.rotation";
    keyframeAnimationShake.duration = 0.2;
    keyframeAnimationShake.autoreverses = YES;
    keyframeAnimationShake.repeatCount = MAXFLOAT;
    keyframeAnimationShake.values = @[[NSNumber numberWithFloat:M_PI_4 / 8],[NSNumber numberWithFloat:-M_PI_4 / 8]];
    [redView.layer addAnimation:keyframeAnimationShake forKey:@"keyframeAnimationShake"];
}
@end





















