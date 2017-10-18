//
//  AniamtionView.m
//  TestAnimation
//
//  Created by love on 2017/6/27.
//  Copyright © 2017年 love. All rights reserved.
//

#import "AniamtionView.h"

@interface AniamtionView ()

@property (nonatomic, strong) CAShapeLayer *rippleLayer;
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, assign) CFTimeInterval beginTime;
@property (nonatomic, assign) long long pinNum;

@end

@implementation AniamtionView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initdata];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initdata];
    }
    return self;
}

- (void)initdata {
    NSLog(@"%s",__FUNCTION__);
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateTextColor)];
    self.displayLink.paused = YES;
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    self.pinNum = 0;
}

- (CADisplayLink *)displayLink {
    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateTextColor)];
        _displayLink.paused = YES;
        [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        self.pinNum = 0;
    }
    return _displayLink;
}

-(void)updateTextColor {
    NSLog(@"%s",__FUNCTION__);
    if (self.pinNum%3 == 0) {
        [self startAnimation];
    }
    self.pinNum++;
}

- (void)startAnimation2 {
    NSLog(@"%s",__FUNCTION__);
    self.beginTime = CACurrentMediaTime();
    self.displayLink.paused = NO;
}

- (void)stopAnimation2 {
    NSLog(@"%s",__FUNCTION__);
    self.displayLink.paused = YES;
    [self.displayLink invalidate];
    self.displayLink = nil;
}

- (void)startAnimation {
    NSLog(@"%s",__FUNCTION__);
    CGRect r = self.bounds;
    
    CAShapeLayer *rippleLayer = [[CAShapeLayer alloc] init];
//    rippleLayer.position = CGPointMake(200, 200);
//    rippleLayer.bounds = CGRectMake(0, 0, 400, 400);
    rippleLayer.backgroundColor = [UIColor grayColor].CGColor;
    
    CGFloat bwh = 50;
    CGFloat bx = (r.size.width-bwh)/2.0;
    CGFloat by = (r.size.height-bwh)/2.0;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(bx, by, bwh, bwh)];
    rippleLayer.path = path.CGPath;
    rippleLayer.strokeColor = [UIColor greenColor].CGColor;
    rippleLayer.lineWidth = 1.5;
    rippleLayer.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:rippleLayer];
    
    //addRippleAnimation
    CGFloat ewh = 100;
    CGFloat ex = (r.size.width-ewh)/2.0;
    CGFloat ey = (r.size.height-ewh)/2.0;
    UIBezierPath *beginPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(bx, by, bwh, bwh)];
    CGRect endRect = CGRectMake(ex, ey, ewh, ewh);
    UIBezierPath *endPath = [UIBezierPath bezierPathWithOvalInRect:endRect];
    rippleLayer.path = endPath.CGPath;
    rippleLayer.opacity = 0.6;
    
    CABasicAnimation *rippleAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    rippleAnimation.fromValue = (__bridge id _Nullable)(beginPath.CGPath);
    rippleAnimation.toValue = (__bridge id _Nullable)(endPath.CGPath);
    rippleAnimation.duration = 1.0;
    
    CABasicAnimation *alphaAnim = [CABasicAnimation animationWithKeyPath:@"strokeColor"];
    alphaAnim.fromValue = (id)[UIColor greenColor].CGColor;
    alphaAnim.toValue = (id)[UIColor clearColor].CGColor;
    alphaAnim.removedOnCompletion = YES;
    alphaAnim.duration = 1.0;
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:0.6];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.0];
    opacityAnimation.duration = 1.0;
    
    [rippleLayer addAnimation:rippleAnimation forKey:@""];
    [rippleLayer addAnimation:alphaAnim forKey:@""];
    [rippleLayer addAnimation:opacityAnimation forKey:@""];
    
    [self performSelector:@selector(removeRippleLayer:) withObject:rippleLayer afterDelay:0.8];
}

- (void)removeRippleLayer:(CAShapeLayer *)rippleLayer
{
    [rippleLayer removeFromSuperlayer];
    rippleLayer = nil;
}


- (void)stopAnimation {
    [self removeRippleLayer:self.rippleLayer];
}

@end
