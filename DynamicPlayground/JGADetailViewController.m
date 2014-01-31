//
//  JGADetailViewController.m
//  DynamicPlayground
//
//  Created by John Grant on 1/31/2014.
//  Copyright (c) 2014 John Grant. All rights reserved.
//

#import "JGADetailViewController.h"
#import "JGAImageCell.h"

@interface JGADetailViewController ()
@property (nonatomic, copy) NSString *initialText;
@end

@implementation JGADetailViewController

- (instancetype)initWithLabelText:(NSString *)labelText
{
    self = [super init];
    if (self) {
        _initialText = labelText;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.label.text = self.initialText;
}

- (void)setInitialStateFromCell:(JGAImageCell *)cell
{
    self.image.frame = cell.avatarView.frame;
    self.label.frame = cell.titleLabel.frame;
}

- (void)animateToEndingStateWithDuration:(CGFloat)duration completion:(void(^)(void))completion
{
    CGRect imageFrame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width);
    
    [UIView animateWithDuration:duration animations:^{
        self.image.frame = imageFrame;
        self.label.frame = CGRectMake(0, self.image.frame.size.height + 50, imageFrame.size.width, 50);
    } completion:^(BOOL finished) {
        completion();
    }];
}


@end