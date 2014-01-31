//
//  JGADetailViewController.h
//  DynamicPlayground
//
//  Created by John Grant on 1/31/2014.
//  Copyright (c) 2014 John Grant. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JGAImageCell;
@interface JGADetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *image;


- (instancetype)initWithLabelText:(NSString *)labelText;

- (void)setInitialStateFromCell:(JGAImageCell *)cell;
- (void)animateToEndingStateWithDuration:(CGFloat)duration completion:(void(^)(void))completion;
@end
