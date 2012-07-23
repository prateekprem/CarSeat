//
//  SeatCheckerViewController.m
//  CarSeatInfo
//
//  Created by RAVI DAS on 12/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SeatCheckerViewController.h"
#import "SeatCheckerImageGalleryViewController.h"
#import "AppDelegate.h"
 

@interface SeatCheckerViewController ()

@end

@implementation SeatCheckerViewController

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
    self.title = @"Seat Checker";
}
 

-(IBAction)submitBtnPressed:(id)sender
{
  //  SeatCheckerImageGalleryViewController *SeatCheckerTableViewCtrl = [[SeatCheckerImageGalleryViewController alloc] initWithNibName:@"SeatCheckerImageGalleryView_iPad" bundle:[NSBundle mainBundle]];
    
   // [self.presentingViewController removeFromParentViewController];
    
    [appDelegate switchToNavigation];
 
    
//    HomeViewController *home = [[HomeViewController alloc] initWithNibName:@"HomeView_iPad" bundle:nil];
//    _navigationController = [[UINavigationController alloc] initWithRootViewController:home];
//    [_navigationController setNavigationBarHidden:TRUE animated:FALSE];
    
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
