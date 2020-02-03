//
//  KGWDouYinThumbButton.m
//  CoreAnimation
//
//  Created by junjian_h@163.com on 2020/2/3.
//  Copyright © 2020年 junjian_h@163.com. All rights reserved.
//

#import "KGWDouYinThumbButton.h"

@interface KGWDouYinThumbButton()

/**
 * 爆炸layer图层
 */
@property (nonatomic,strong) CAEmitterLayer *expolsionLayer;
@end

@implementation KGWDouYinThumbButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupExplosion];
    }
    return self;
}

- (void)setupExplosion {
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.name = @"explosionCell";
    cell.alphaSpeed = -1.f;
    cell.alphaRange = 0.1;
    cell.lifetime = 1;
    cell.lifetimeRange = 0.1;
    cell.velocity = 40.f;
    cell.velocityRange = 10;
    cell.scale = 0.1;
    cell.scaleRange = 0.02;
    cell.contents = (id)[[UIImage imageNamed:@"yanhua"] CGImage];
    
    CAEmitterLayer *layer = [CAEmitterLayer layer];
    
    [self.layer addSublayer:layer];
    self.expolsionLayer = layer;
    
//    layer.position = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    layer.emitterSize = CGSizeMake(self.bounds.size.width + 40, self.bounds.size.height + 40);
    layer.emitterShape = kCAEmitterLayerCircle;
    layer.emitterMode = kCAEmitterLayerOutline;
    layer.renderMode = kCAEmitterLayerOldestFirst;
    layer.emitterCells = @[cell];
}

-(void)layoutSubviews{
    //发射源位置
    self.expolsionLayer.position = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    
    [super layoutSubviews];
}
- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    if (selected) {
        scaleAnimation.values = @[@1.5,@2.0,@0.8,@1.0];
        scaleAnimation.duration = 0.5;
        scaleAnimation.calculationMode = kCAAnimationCubic;
        [self.layer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
        [self performSelector:@selector(startAnimation) withObject:nil afterDelay:0.25];
    }else {
        [self stopAnimation];
    }
    
}

- (void)startAnimation {
//    [self.expolsionLayer setValue:@1000 forKey:@"emitterCells.explosionCell.birthRate"];
#warning 使用上面这个方法设置是不起作用的
    //爆炸效果
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath: @"emitterCells.explosionCell.birthRate"];
    animation.fromValue = @0;
    animation.toValue = @1000;
    self.expolsionLayer.beginTime = CACurrentMediaTime();
    [self.expolsionLayer addAnimation:animation forKey:nil];
    [self performSelector:@selector(stopAnimation) withObject:nil afterDelay:0.15];
}

- (void)stopAnimation {
//    [self.expolsionLayer setValue:@0 forKey:@"emitterCells.explosionCell.birthRate"];
    [self.expolsionLayer removeAllAnimations];
}
@end
