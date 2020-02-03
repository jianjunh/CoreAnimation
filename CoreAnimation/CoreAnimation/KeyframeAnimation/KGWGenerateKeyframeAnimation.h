//
//  KGWGenerateKeyframeAnimation.h
//  CoreAnimation
//
//  Created by junjian_h@163.com on 2020/2/2.
//  Copyright © 2020年 junjian_h@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KGWGenerateKeyframeAnimation : NSObject


/**
 使用values数组创建关键帧动画
 */
+ (void)generateKeyframeAnimationWithValuesWithSuperView:(UIView *)superView;

/**
 使用路径创建关键帧动画
 */
+ (void)generateKeyframeAnimationWithPathWithSuperView:(UIView *)superView;

/**
 使用values数组创建抖动动画
 */
+ (void)generateKeyframeShakeAnimationWithValuesWithSuperView:(UIView *)superView;

@end
