//
//  KGWEmitterAnimation.m
//  CoreAnimation
//
//  Created by junjian_h@163.com on 2020/2/3.
//  Copyright © 2020年 junjian_h@163.com. All rights reserved.
//

#import "KGWEmitterAnimation.h"
#import "KGWDouYinThumbButton.h"

@implementation KGWEmitterAnimation

+ (void)generateRedPacketEmitterAnimationWithSuperView:(UIView *)superView {
    CAEmitterLayer *rainLayer = [CAEmitterLayer layer];
    [superView.layer addSublayer:rainLayer];
    
    rainLayer.emitterShape = kCAEmitterLayerLine;
    rainLayer.emitterMode = kCAEmitterLayerSurface;
    rainLayer.emitterSize = superView.frame.size;
    rainLayer.emitterPosition = CGPointMake(superView.bounds.size.width * 0.5, 0);
    
    CAEmitterCell *snowCell = [CAEmitterCell emitterCell];
    snowCell.contents = (id)[[UIImage imageNamed:@"hongbao"] CGImage];
    snowCell.birthRate = 1.0;
    snowCell.lifetime = 30;
    snowCell.speed = 2;
    snowCell.velocity = 10.f;
    snowCell.velocityRange = 10.f;
    snowCell.yAcceleration = 60;
    snowCell.scale = 0.2;
    snowCell.scaleRange = 0.f;
    
    CAEmitterCell *snowCell1 = [CAEmitterCell emitterCell];
    snowCell1.contents = (id)[[UIImage imageNamed:@"yanhua"] CGImage];
    snowCell1.birthRate = 1.0;
    snowCell1.lifetime = 30;
    snowCell1.speed = 3;
    snowCell1.velocity = 10.f;
    snowCell1.velocityRange = 10.f;
    snowCell1.yAcceleration = 60;
    snowCell1.scale = 0.2;
    snowCell1.scaleRange = 0.f;

    rainLayer.emitterCells = @[snowCell,snowCell1];
}

+ (void)generateDouYinThumbEmitterAnimationWithSuperView:(UIView *)superView {
    KGWDouYinThumbButton *thumbButton = [[KGWDouYinThumbButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    thumbButton.center = superView.center;
    [superView addSubview:thumbButton];
    [thumbButton setImage:[UIImage imageNamed:@"weidianzan"] forState:UIControlStateNormal];
    [thumbButton setImage:[UIImage imageNamed:@"yidianzan"] forState:UIControlStateSelected];
    [thumbButton addTarget:self action:@selector(tapThumbAction:) forControlEvents:UIControlEventTouchUpInside];
}

+ (void)tapThumbAction:(UIButton *)button {
    button.selected = !button.selected;
}
@end
