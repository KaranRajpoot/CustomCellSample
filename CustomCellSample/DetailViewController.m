//
//  DetailViewController.m
//  CustomCellSample
//
//  Created by Roy on 9/25/13.
//  Copyright (c) 2013 KMG Infotech. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize desTextLabel,detail;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  CGSize size=   [detail sizeWithFont:[UIFont fontWithName:@"Helvetica" size:14]constrainedToSize:CGSizeMake(300,FLT_MAX)lineBreakMode:NSLineBreakByTruncatingTail];
    CGRect frame=desTextLabel.frame;
    frame.size.height=size.height+60;
    NSLog(@"%f",frame.size.height);
    desTextLabel.frame=frame;
    desTextLabel.numberOfLines=0;
    desTextLabel.text=detail;
    [desTextLabel sizeToFit];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
