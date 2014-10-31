//
//  ShowProcessing.h
//  Bulletin-Tabbar
//
//  Created by Rajesh on 02/06/14.
//  Copyright (c) 2014 Rajesh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShowProcessing : NSObject
{
    UIAlertView *Alert;
    UIActivityIndicatorView *spinner;
}

- (void)ProcessingStop;

@end
