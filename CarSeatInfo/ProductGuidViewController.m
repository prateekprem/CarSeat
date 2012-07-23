//
//  ProductGuidViewController.m
//  CarSeatInfo
//
//  Created by RAVI DAS on 17/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProductGuidViewController.h"
#import "ProductInfoView.h"

@interface ProductGuidViewController ()

@end

@implementation ProductGuidViewController

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
     self.title = @"Product Guide";
    
    ProductInfoView *productView = [[ProductInfoView alloc]initWithFrame:CGRectMake(120, 25, 880, 640)];
    
    [self.view addSubview:productView];
 
    
}

 
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
