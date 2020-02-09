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

type： 过渡动画的动画类型，系统提供了多种过渡动画, 分别是:  
1: fade (淡出 默认)  
2: moveIn (覆盖原图)  
3: push (推出)  
4: fade (淡出 默认)  
5: reveal (底部显示出来)  
6: cube (立方旋转)  
7: suck (吸走)  
8: oglFlip (水平翻转 沿y轴)  
9: ripple (滴水效果)  
10: curl (卷曲翻页 向上翻页)  
11: unCurl (卷曲翻页返回 向下翻页)  
12: caOpen (相机开启)  
13: caClose (相机关闭)  
subtype : 过渡动画的动画方向, 系统提供了四种,分别是:  
1.fromLeft( 从左侧)  
2.fromRight (从右侧)  
3.fromTop (有上面）  
4.fromBottom (从下面）  

