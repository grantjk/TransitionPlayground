//
//  JGAAnimator.m
//  DynamicPlayground
//
//  Created by John Grant on 1/31/2014.
//  Copyright (c) 2014 John Grant. All rights reserved.
//

#import "JGAAnimator.h"

#import "JGADetailViewController.h"

static const CGFloat JGAAnimatorDuration = 0.5f;

@implementation JGAAnimator

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    if (!self.isDismissing) {
        toVC.view.frame = self.targetRect;
        [self runPresentationAnimation:fromVC toViewController:(JGADetailViewController *)toVC context:transitionContext];
    }else{
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toVC.view.alpha = 1.0f;
            fromVC.view.alpha = 0.0f;
            toVC.view.frame = containerView.bounds;
        } completion:^(BOOL finished) {
            if (self.isDismissing) {
                [fromVC.view removeFromSuperview];
            }
            [transitionContext completeTransition:YES];
        }];
    }
    
}

- (void)animationEnded:(BOOL)transitionCompleted
{
    NSLog(@"ENDED! (%d)", transitionCompleted);
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return JGAAnimatorDuration;
}

- (void)runPresentationAnimation:(UIViewController *)fromVC toViewController:(JGADetailViewController *)toVC context:(id<UIViewControllerContextTransitioning>)transitionContext
{
    [UIView animateWithDuration:JGAAnimatorDuration animations:^{
        toVC.view.frame = transitionContext.containerView.bounds;
        [toVC animateToEndingStateWithDuration:JGAAnimatorDuration completion:^{}];
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end
