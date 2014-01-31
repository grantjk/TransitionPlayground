//
//  JGARootViewController.m
//  DynamicPlayground
//
//  Created by John Grant on 1/31/2014.
//  Copyright (c) 2014 John Grant. All rights reserved.
//

#import "JGARootViewController.h"
#import "JGADetailViewController.h"
#import "JGAAnimator.h"
#import "JGAImageCell.h"

@interface JGARootViewController () <UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>

@end

@implementation JGARootViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.delegate = self;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"JGAImageCell" bundle:nil] forCellReuseIdentifier:@"JGAImageCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JGAImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JGAImageCell" forIndexPath:indexPath];
    cell.titleLabel.text = [NSString stringWithFormat:@"Cell: %d", indexPath.row];
    cell.avatarView.image = [UIImage imageNamed:@"TestImage"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *text = [NSString stringWithFormat:@"Cell: %d", indexPath.row];
    JGADetailViewController *detail = [[JGADetailViewController alloc] initWithLabelText:text];
    [self.navigationController pushViewController:detail animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

#pragma mark - UIViewControllerTransitioningDelegate


#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    JGAAnimator *animator = [[JGAAnimator alloc] init];
    animator.dismissing = (operation == UINavigationControllerOperationPop);
    
    JGAImageCell *cell = (JGAImageCell *)[self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]];
    NSLog(@"FRAME: %@", NSStringFromCGRect(cell.frame));
    
    CGRect adjusted = [self.tableView.superview convertRect:cell.frame fromView:self.tableView];
    NSLog(@"ADJUSTEd: %@", NSStringFromCGRect(adjusted));
    
    if ([toVC isKindOfClass:[JGADetailViewController class]]) {
        [toVC view];
        [(JGADetailViewController *)toVC setInitialStateFromCell:cell];
    }
    
    animator.targetRect = adjusted;
    return animator;
}

@end
