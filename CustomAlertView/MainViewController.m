//
//  MainViewController.m
//  CustomAlertView
//
//  Created by Rajesh on 09/06/14.
//  Copyright (c) 2014 Rajesh. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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

    //-- For resign processing when touch anywhere on view
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(StopProcessing)];
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)StopProcessing
{
    [show ProcessingStop];
}

- (IBAction)ShowProcessingAction:(id)sender
{
    show = [[ShowProcessing alloc]init];
}
@end
