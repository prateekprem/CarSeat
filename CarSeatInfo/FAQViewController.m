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
    DetailedTableDataSource *faq = [[DetailedTableDataSource alloc]init];
    faq.headerTitle = @"Question1: Benefits of Apple?";
    faq.description = @"Blanket rolls may be placed on both sides of the hjkhj  hkh h jhjk hjkh jkh jkhjk jkh h jhjkh jkhjkhjk hjk jkhj jhjkhjkh jhjk jkhj jkhjk hjkhjkh jkh hjk jhj jkhjk hjk hjhjkh jkh jk jkhjk hjkh jkhjk hjk hjkh jkhjk hjk hjkh jkh hjkh jk khjk jkh jkh jkhjkhjk jkhjk jkhjk jkh jkh hjk hjkh jkhjkhjkjkh jkh jk hjkh jk h jkh jkh jkhjkh jkh jkhjk hjkhjkh jkh hkjh jkhkjh h jkh jkh h kjjh jkh jkh h jkh jk hjkh jkhjkhkjhkjhjkhh jkhjk hhjkh jkh kjh jk hhkhk hkjhjkjh khjh   Last main  Prateek,";
    DetailedTableDataSource *faq1 = [[DetailedTableDataSource alloc]init];
    faq1.headerTitle = @"Question2: Vitamin in Orange?";
    faq1.description = @"answer2";
    DetailedTableDataSource *faq2 = [[DetailedTableDataSource alloc]init];
    faq2.headerTitle = @"Question3: Vitamin A source?";
    faq2.description = @"answer3";
    NSArray* dataSource = [[NSArray alloc]initWithObjects:faq,faq1,faq2, nil];
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
