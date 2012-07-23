//
//  SeatCheckerImageGalleryViewController.m
//  CarSeatInfo
//
//  Created by RAVI DAS on 17/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SeatCheckerImageGalleryViewController.h"

@interface SeatCheckerImageGalleryViewController ()

@end

@implementation SeatCheckerImageGalleryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    appDelegate.searchBar.text = @"";   
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(IBAction) detailBtnPressed:(id) sender
{
    [self.presentedViewController dismissModalViewControllerAnimated:FALSE];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate switchToTabBar:1];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

@end
