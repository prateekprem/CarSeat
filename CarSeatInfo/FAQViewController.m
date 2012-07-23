//
//  FAQViewController.m
//  CarSeatInfo
//
//  Created by RAVI DAS on 12/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "ViewWithTitle.h"
#import "FAQViewController.h"
#import "DetailedTableDataSource.h"
#import "DetailedTableView.h"
#import "DBController.h"
#import <QuartzCore/QuartzCore.h>

@interface FAQViewController ()

@end

@implementation FAQViewController

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
    
    UIView *backViewForDetail = [[UIView alloc]initWithFrame:CGRectMake(120, 25,880, 640)];
    backViewForDetail.layer.cornerRadius = 0.5;
    backViewForDetail.layer.masksToBounds = TRUE;
    
    ViewWithTitle *topView = [[ViewWithTitle alloc]initWithFrame:CGRectMake(0, 0, 880, 40)];
    topView.backgroundColor = [UIColor colorWithRed:226/255.0 green:200/255.0 blue:120/255.0 alpha:1.0];
    [topView setTitle:@"FAQ"];
    [topView setNeedsDisplay];
    [backViewForDetail addSubview:topView];
	// Do any additional setup after loading the view.
    self.title = @"Frequently Asked Questions";
    
    NSArray* dataSource = [[NSArray alloc]initWithArray:[DBController getFAQs]];
    DetailedTableView *detailView = [[DetailedTableView alloc]initWithFrame:CGRectMake(0, 40, 880, 640)];
    [backViewForDetail addSubview:detailView];
    [detailView setDataSourceArr:dataSource];
    [detailView reloadData];
    
    [backViewForDetail addBorder:1 Red:143/255.0 Green:143/255.0 Blue:143/255.0 Alpha:0.4];
    [self.view addSubview:backViewForDetail];
    backViewForDetail = nil;
    

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
