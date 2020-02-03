# CoreAnimation
Learing CoreAnimation（学习动画）


iOS 动画主要是CoreAnimation，包括基础动画CABaiscAnimtion、关键帧动画CAKeyframeAnimation、过渡动画CATransition、动画组CAAnimationGroup（warning ：keypath一定要设置）

动画的继承结构
CAAnimation{
        CAPropertyAnimation{
                CABasicAnimation{
                    CASpringAnimation
                }
                CAKeyframeAnimation
        }
        CATransition   
        CAAnimationGroup
}
