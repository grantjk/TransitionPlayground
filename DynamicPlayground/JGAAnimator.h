//
//  JGAAnimator.h
//  DynamicPlayground
//
//  Created by John Grant on 1/31/2014.
//  Copyright (c) 2014 John Grant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JGAAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign, getter = isDismissing) BOOL dismissing;
@property (nonatomic, assign) CGRect targetRect;

@end
