//
//  DetailInfoViewController.m
//  CarSeatInfo
//
//  Created by RAVI DAS on 19/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailInfoViewController.h"
#import "KTTabBar.h"

@interface DetailInfoViewController ()

@end

@implementation DetailInfoViewController

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
 
 
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(10, 10, 60, 40);
    //[backBtn setTitle:@"Back" forState:UIControlStateNormal];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"btn_back_L_ipad"] forState:UIControlStateNormal];
    backBtn.tag = 101;
    [backBtn addTarget:self action:@selector(backBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //[appDelegate.tabBarController.headerView addSubview:backBtn];
    
     appDelegate.tabBarController.backBtn = backBtn;
     //appDelegate.tabBarController.backBtn = backBtn; 
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = @"Safety Information";
}

-(void)backBtnPressed:(id)sender
{
    [appDelegate.safetynavController popViewControllerAnimated:FALSE];
    NSLog(@"%@",[appDelegate.tabBarController.headerView subviews]);
     
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"are");
    for (UIButton *btn in [appDelegate.tabBarController.headerView subviews]) 
    {
        UIButton *btn1 = (UIButton *)btn;
        if(btn1.tag == 101)
        {
            [btn1 removeFromSuperview];
        }
    }
}

- (void)viewWillUnload
{
    NSLog(@"cvsz");
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
