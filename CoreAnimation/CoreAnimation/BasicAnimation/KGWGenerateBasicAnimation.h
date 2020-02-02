//
//  KGWGenerateBasicAnimation.h
//  CoreAnimation
//
//  Created by junjian_h@163.com on 2020/1/31.
//  Copyright © 2020年 junjian_h@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef enum : NSInteger {
    AnimationKeyPathScale,///(比例转换)
    AnimationKeyPathScaleX,///(横轴比例转换)
    AnimationKeyPathScaleY,///(纵轴比例转换)
    AnimationKeyPathRotation,///(旋转)
    AnimationKeyPathRotationX,///(x轴旋转)
    AnimationKeyPathRotationY,///(y轴旋转)
    AnimationKeyPathRotationZ,///(z轴旋转)
}AnimationKeyPath;

@interface KGWGenerateBasicAnimation : NSObject


+ (void)generateMoveAnimationWithSuperView:(UIView *)superView;
+ (void)generatiRotationAnimationWithSuperView:(UIView *)superView;;
+ (void)generateScaleAnimationWithSuperView:(UIView *)superView;;
+ (void)generateOpacityAnmationWithSuperView:(UIView *)superView;;
+ (void)generateBackgroundColorAnmationWithSuperView:(UIView *)superView;;

@end
