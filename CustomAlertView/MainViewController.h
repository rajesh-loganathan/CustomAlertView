//
//  MainViewController.h
//  CustomAlertView
//
//  Created by Rajesh on 09/06/14.
//  Copyright (c) 2014 Rajesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowProcessing.h"

@interface MainViewController : UIViewController
{
    ShowProcessing *show;
}
- (IBAction)ShowProcessingAction:(id)sender;

@end
