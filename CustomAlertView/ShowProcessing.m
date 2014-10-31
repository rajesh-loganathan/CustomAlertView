//
//  ShowProcessing.m
//  Bulletin-Tabbar
//
//  Created by Rajesh on 02/06/14.
//  Copyright (c) 2014 Rajesh. All rights reserved.
//

#import "ShowProcessing.h"


@implementation ShowProcessing
- (id)init
{
    Alert= [[UIAlertView alloc] initWithTitle:nil
                                      message:nil
                                     delegate:self
                            cancelButtonTitle:nil
                            otherButtonTitles:nil];
    Alert.frame = CGRectMake(0, 0, 200, 40);
    
    @try
    {
        [self CustomView]; // (Or) [self SpinnerAction];
    }
    @catch (NSException *e)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please Wait" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        [alert show];
    }
    return self;
}


//-- Custom processing alertview with gif image
- (void)CustomView
{
    //-- Set View as subview for alertview
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Alert.frame.size.width, Alert.frame.size.height)];
    
    //-- Set title label
    UILabel *TextLabel = [[UILabel alloc] init];
    TextLabel.text = @"Please Wait";
    TextLabel.backgroundColor = [UIColor clearColor];
    
    //-- Set processing imageview with gif image
    //-- Get custom image form this link http://preloaders.net/en/circular
    UIImageView *imageView = [[UIImageView alloc]init ];
    imageView.image = [UIImage animatedImageNamed:@"Loader-" duration:1.0f];
    
    //-- Use view as accessoryView for iOS 7 & higher
    if([[[UIDevice currentDevice] systemVersion] floatValue ] >= 7.0f)
    {
        //-- For iOS8 & above
        if([[[UIDevice currentDevice] systemVersion] floatValue ] >= 8.0f)
        {
            TextLabel.frame = CGRectMake(view.frame.origin.x + 50, view.frame.origin.y+3, 100, 40);
            
            imageView.frame =  CGRectMake(view.frame.origin.x + 160, view.frame.origin.y+10, 25, 25);
        }
        else
        {
            TextLabel.frame = CGRectMake(view.frame.origin.x+30, view.frame.origin.y, 100, 40);
            
            imageView.frame =  CGRectMake(view.frame.origin.x + 140, view.frame.origin.y+5, 30, 30);
        }
        view.backgroundColor = [UIColor clearColor];
        [Alert setValue:view forKey:@"accessoryView"];
    }
    
    //-- Use view as subview for iOS 6.1 & lower
    else
    {
        //-- View Frame
        view.frame = CGRectMake(view.frame.origin.x+3, view.frame.origin.y, 278, 70);
        view.backgroundColor = [UIColor whiteColor];
        
        //--Border for view
        CALayer *layer = view.layer;
        [layer setMasksToBounds:YES];
        [layer setCornerRadius: 10.0];
        [layer setBorderWidth: 2.0];
        view.layer.borderWidth = 1.0;
        view.layer.borderColor = [UIColor whiteColor].CGColor;
        view.alpha = 0.7;
        //-- Text label Frame
        TextLabel.frame = CGRectMake(view.frame.origin.x+70, view.frame.origin.y+15, 100, 40);
        [TextLabel setTextColor:[UIColor blackColor]];
        
        //-- Processing imageview frame
        imageView.frame =  CGRectMake(view.frame.origin.x + 180, view.frame.origin.y+20, 30, 30);
        
        [Alert addSubview:view];
    }
    
    [view addSubview:TextLabel];
    [view addSubview:imageView];
    [Alert show];
}

//-- Get spinner into alertview if needed
- (void)SpinnerAction
{
    //-- Add Spinner if needed
    spinner.frame = CGRectMake(30,20, 30, 30);
    spinner.color = [UIColor redColor];
    [spinner startAnimating];
    [Alert addSubview:spinner];
}

//-- To stop / remove processing from view
- (void)ProcessingStop
{
    //[spinner stopAnimating];
    [Alert dismissWithClickedButtonIndex:0 animated:YES];
}

@end


