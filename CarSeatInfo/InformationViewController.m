//
//  InformationViewController.m
//  CarSeatInfo
//
//  Created by RAVI DAS on 12/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "InformationViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "DetailInfoViewController.h"

#import "UIColor+Additions.h"
#import "AppDelegate.h"

@interface InformationViewController ()

@end

@implementation InformationViewController

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
    
    self.title = @"Safety Information";
 
     
    //safetyInfoTable = [[UITableView alloc] initWithFrame:CGRectMake(123, 105, 800, 637) style:UITableViewStyleGrouped]; 
    //[safetyInfoTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    safetyInfoTable.backgroundView = [[UIView alloc] initWithFrame:safetyInfoTable.bounds];
    safetyInfoTable.backgroundView.backgroundColor = [UIColor whiteColor];
    [safetyInfoTable addBorder:1 Red:131/255.0 Green:131/255.0 Blue:131/255.0 Alpha:1.0];
    //safetyInfoTable.delegate = self;
    //safetyInfoTable.dataSource = self;
    //[self.view addSubview:safetyInfoTable];
    
    safetyInfoArr = [[NSMutableArray alloc] init];
    
    [safetyInfoArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"1",@"id",@"Installation Help",@"title",@"html1",@"html", nil]];
    
    [safetyInfoArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"2",@"id",@"Shopping For Car Seats",@"title",@"html2",@"html", nil]];
 
    [safetyInfoArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"3",@"id",@"Air Bag Safety",@"title",@"html3",@"html", nil]];
   
    [safetyInfoArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"4",@"id",@"Buckle-Up the Right Way",@"title",@"html4",@"html", nil]];    
    
    
}
 

#pragma mark - Table View Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return [safetyInfoArr count];
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	return 54.0f;
 }



// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *MyIdentifier = @"MyIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	
	if (cell == nil) 
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                      reuseIdentifier:MyIdentifier];
        [cell.contentView addBorder:1 Red:131/255.0 Green:131/255.0 Blue:131/255.0 Alpha:1];
        
        cell.contentView.layer.cornerRadius = 10;
      
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 500, 20)];
        [textLabel setBackgroundColor:[UIColor clearColor]];
        [textLabel setTag:1];
        [cell.contentView addSubview:textLabel];
        
        UIImageView *lockImgView = [[UIImageView alloc] initWithFrame:CGRectMake(780.0f, 19.0f, 14.0f, 16.0f)];
		[lockImgView setBackgroundColor:[UIColor clearColor]];
		[lockImgView setTag:2];
		[cell.contentView addSubview:lockImgView];
    }
    
    UIImageView *lockImageView = (UIImageView *)[cell viewWithTag:2];
  	[lockImageView setImage:[UIImage imageNamed:@"arrow_L_ipad"]];
    
    UILabel *titleLabel = (UILabel *) [cell viewWithTag:1];
    
    titleLabel.text = [[safetyInfoArr objectAtIndex:indexPath.section] objectForKey:@"title"];
    
    [titleLabel setTextColor:[UIColor colorWithRed:136/255.0 green:136/255.0 blue:136/255.0 alpha:1.0f]];
    
    [titleLabel setFont:[UIFont fontWithName:@"Helvetica regular" size:14.0f]];
       
    //[cell.textLabel setTextColor:[UIColor grayColor]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    return cell;
    
}
 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailInfoViewController *detail = [[DetailInfoViewController alloc] initWithNibName:@"DetailInfoView_iPad" bundle:[NSBundle mainBundle]];
    
     AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  [appDelegate.safetynavController pushViewController:detail animated:FALSE];
      
}


#pragma mark - life cycle

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
