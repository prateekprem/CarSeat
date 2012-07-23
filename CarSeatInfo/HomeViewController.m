//
//  HomeViewController.m
//  CarSeatInfo
//
//  Created by RAVI DAS on 12/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"
#import "SeatCheckerImageGalleryViewController.h"
#import "AnimateViews.h"
#import "AppDelegate.h"

#define yearCount = 4;
#define mounthCount = 2;


@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize yearField,monthField,FeetField,inchField;
@synthesize mHeightField,poundsField,OzWeightField,KgField;
@synthesize tblView;


@synthesize yearImgView,monthImgView,feetImgView,inchImgView,mHeightImgView,poundImgView,ozWeightImgView,kgImgView;


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
	// Do any additional setup after loading the view.
    
    tblView = [[UITableView alloc] init];
    specialNeedsArr = [[NSMutableArray alloc] init];
        
    [specialNeedsArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Manufacture1",@"Manufacture",@"123456",@"phoneNumber",@"WebSite1",@"WebSite", nil]];
    
    [specialNeedsArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Manufacture2",@"Manufacture",@"234567",@"phoneNumber",@"WebSite2",@"WebSite", nil]];
    
    [specialNeedsArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Manufacture3",@"Manufacture",@"3456789",@"phoneNumber",@"WebSite3",@"WebSite", nil]];
    
    [specialNeedsArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Manufacture4",@"Manufacture",@"4567890",@"phoneNumber",@"WebSite4",@"WebSite", nil]];
          
}


#pragma mark - TextField delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
//    if(selectedImgViewTag == -1)
//    {
//        [selectedImgView setImage:[UIImage imageNamed:@""]];
//        
//    }
//    selectedImgViewTag = textField.tag;
    
    [yearImgView setImage:[UIImage imageNamed:@"btn_year_unselected_L_iPad"]];
    [monthImgView setImage:[UIImage imageNamed:@"btn_month_unselected_L_iPad"]];
    [feetImgView setImage:[UIImage imageNamed:@"btn_feet_unselected_L_iPad"]];
    [inchImgView setImage:[UIImage imageNamed:@"btn_inches_unselected_L_iPad"]];
    [mHeightImgView setImage:[UIImage imageNamed:@"btn_special_unselected_L_iPad"]];
    [poundImgView setImage:[UIImage imageNamed:@"btn_feet_unselected_L_iPad"]];
    [ozWeightImgView setImage:[UIImage imageNamed:@"btn_inches_unselected_L_iPad"]];
    [kgImgView setImage:[UIImage imageNamed:@"btn_special_unselected_L_iPad"]];
    
    if(textField == yearField)
    {
        [yearImgView setImage:[UIImage imageNamed:@"btn_year_selected_L_iPad"]];
    }
    else if(textField == monthField)
         {
               [monthImgView setImage:[UIImage imageNamed:@"btn_month_selected_L_iPad"]];
         }
        else if(textField == FeetField)
             {
                [feetImgView setImage:[UIImage imageNamed:@"btn_feet_selected_L_iPad"]];
             }
             else if(textField == inchField)
                 {
                    [inchImgView setImage:[UIImage imageNamed:@"btn_inches_selected_L_iPad"]];
                 }
                 else if(textField == mHeightField)
                        {
                            [mHeightImgView setImage:[UIImage imageNamed:@"btn_special_selected_L_iPad"]];
                        } 
                        else if(textField == poundsField)
                            {
                               [poundImgView setImage:[UIImage imageNamed:@"btn_feet_selected_L_iPad"]];
                            } 
                            else if(textField == OzWeightField)
                                {
                                    [ozWeightImgView setImage:[UIImage imageNamed:@"btn_inches_selected_L_iPad"]];
                                } 
                                else if(textField == KgField)
                                {
                                    [kgImgView setImage:[UIImage imageNamed:@"btn_special_selected_L_iPad"]];
                                }
    
    return TRUE;
    
    
}
/*
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    
}
 */
 

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSCharacterSet *unwantedCharacters = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
     if([string rangeOfCharacterFromSet:unwantedCharacters].location != NSNotFound)
     {
         return NO;
     }   
    
    
    NSLog(@"string %@",string);
    if([string isEqualToString:@""])
    {
        return TRUE;
    }
     NSString *lenStr = textField.text;
     NSUInteger len = lenStr.length;
    NSString *msg = @"";
    if(textField == yearField && len >= 2)
    {
        msg = @"child age in year is not suitable ! " ; 
    }
    else if(textField == monthField && len > 1 )
        {
             msg = @"child age in month is not suitable ! " ; 
        }
        else if(textField == FeetField && len > 1 )
            {
                msg = @"child height in Feet is not suitable ! " ; 
            }
            else if(textField == inchField && len > 1 )
                {
                    msg = @"child height in inch is not suitable ! " ; 
                }
                else if(textField == mHeightField && len > 1 )
                    {
                        msg = @"child Weight in m is not suitable ! " ; 
                    }
                else if(textField == poundsField && len > 1 )
                    {
                        msg = @"child Weight in pound is not suitable ! " ; 
                    }
                    else if(textField == OzWeightField && len > 1 )
                        {
                            msg = @"child Weight in Oz is not suitable ! " ; 
                        }
                        else if(textField == KgField && len > 1 )
                            {
                                msg = @"child Weight in kg is not suitable ! " ; 
                            }
    
        
    if(msg != @"")
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Please fill correct age" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alert show];
        return NO;
    }
    
    return TRUE;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == yearField)
    {
        int year = [yearField.text intValue];
        if(year > 15)
        {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"child year is not appropriate ! " message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            return FALSE;
        }
        
        [yearField resignFirstResponder];
        [monthField becomeFirstResponder]; 
    }
    else if(textField == monthField)
    {
        int month = [monthField.text intValue];
        
        if(month > 11)
        {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"child month is not appropriate ! " message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            return FALSE;
            
        }
        
        [monthField resignFirstResponder];
        [FeetField becomeFirstResponder]; 
    }
    else if(textField == FeetField)
    {
        int feetHeight = [FeetField.text intValue];
        
        if(feetHeight > 3)
        {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"child height in feet is not appropriate ! " message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            return FALSE;
        }
        [FeetField resignFirstResponder];
        [inchField becomeFirstResponder]; 
    }
    else if(textField == inchField)
    {
        int inchHeight = [inchField.text intValue];
        if(inchHeight > 30)
        {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"child height in inch is not appropriate ! " message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            return FALSE;
        }
        [inchField resignFirstResponder];
        [mHeightField becomeFirstResponder]; 
    }
    else if(textField == mHeightField)
    {
        [mHeightField resignFirstResponder];
        [poundsField becomeFirstResponder]; 
    }
    else if(textField == poundsField)
    {
        int pound = [poundsField.text intValue];
        if(pound > 22)
        {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"child weight in pounds is not appropriate ! " message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            return FALSE;
        }
        [poundsField resignFirstResponder];
        [OzWeightField becomeFirstResponder]; 
    }
    else if(textField == OzWeightField)
    {
        int oz = [OzWeightField.text intValue];
        if(oz > 766)
        {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"child weight in pounds is not appropriate ! " message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            return FALSE;
        }
        [OzWeightField resignFirstResponder];
        [KgField becomeFirstResponder]; 
    }
    else if(textField == KgField)
    {
        int kg = [KgField.text intValue];
        if(kg > 22)
        {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"child weight in pounds is not appropriate ! " message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            return FALSE;
        }
        [KgField resignFirstResponder];
    }
    
    return TRUE;   
}




-(IBAction)menuBtnPressed:(id)sender
{
    UIButton *btn = (UIButton *) sender;
    [self.presentedViewController dismissModalViewControllerAnimated:FALSE];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate switchToTabBar:btn.tag];
 
}

-(IBAction) checkBtnPressed:(id)sender
{
    int year = [yearField.text intValue];
    
    int month = [monthField.text intValue];
      
    if([yearField.text isEqualToString:@""] || [monthField.text isEqualToString:@""] || [FeetField.text isEqualToString:@""] || [inchField.text isEqualToString:@""] || [mHeightField.text isEqualToString:@""] || [poundsField.text isEqualToString:@""] || [OzWeightField.text isEqualToString:@""]  || [KgField.text isEqualToString:@""])
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"required fields are not filled ! " message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
    }
   else if(year > 15)
        {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Please fill correct age ! " message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
           
        }
        else if(month > 11)
        {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Please fill correct age ! " message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
        }
        else
        {
            [self.presentedViewController dismissModalViewControllerAnimated:FALSE];
            
            SeatCheckerImageGalleryViewController *SeatCheckerImageGalleryCtrl = [[SeatCheckerImageGalleryViewController alloc] initWithNibName:@"SeatCheckerImageGalleryView_iPad" bundle:nil];
            
            [self.navigationController pushViewController:SeatCheckerImageGalleryCtrl animated:TRUE];
               
        }
        
}

-(IBAction)sepecialNeedsBtnPressed:(id)sender
{
    specialNeedView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 748)];
    
   UIImageView *specialNeed_bg_imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"trans_L_ipad"]];
     
    UIImage *headerImage = [UIImage imageNamed:@"header_L_ipad"];
    topBarImageView = [[UIImageView alloc] initWithImage:headerImage];
    topBarImageView.frame = CGRectMake(181, 80, headerImage.size.width, headerImage.size.height);
    
    UIImage *tblBGImg = [UIImage imageNamed:@"table_bg_L_ipad"];
    tblView.frame = CGRectMake(topBarImageView.frame.origin.x  , topBarImageView.frame.origin.y + topBarImageView.frame.size.height,topBarImageView.frame.size.width-2 , tblBGImg.size.height);
   //  [tblView setBackgroundView:[[UIImageView alloc] initWithImage:tblBGImg]];
    [tblView addBorder:1.0 Red:131/255.0 Green:131/255.0 Blue:131/255.0 Alpha:1.0];
    [tblView setBackgroundColor:[UIColor whiteColor]];
     
    UIButton *crossBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *crossImg = [UIImage imageNamed:@"close_L_ipad"]; 
    [crossBtn setImage:crossImg forState:UIControlStateNormal];
    crossBtn.frame = CGRectMake(796, 68, crossImg.size.width, crossImg.size.height);
    
    crossBtn.backgroundColor = [UIColor clearColor];
    [crossBtn addTarget:self action:@selector(crossBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [specialNeedView addSubview:specialNeed_bg_imgView];
    
    [specialNeedView addSubview:topBarImageView];
    
    [specialNeedView addSubview:tblView];
    
     [specialNeedView addSubview:crossBtn];
    
    [self.view addSubview:specialNeedView];
    
    tblView.delegate = self;
    tblView.dataSource = self;
    
    [[AnimateViews allocate] startAnimationOnview:specialNeedView toView:self.view animationType:BounceViewAnimationType animationSubType:0]; 
 }

-(IBAction)crossBtnPressed:(id)sender
{
    specialNeedView.transform = CGAffineTransformIdentity;
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.5];
	specialNeedView.transform = CGAffineTransformMakeScale(0.001, 0.001);
	[UIView commitAnimations];
}

#pragma mark - Table View Delegate
  
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
  return [specialNeedsArr count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *MyIdentifier = @"MyIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	
	if (cell == nil) 
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                      reuseIdentifier:MyIdentifier];
        
        UILabel *userNameLbl = [[UILabel alloc]initWithFrame:CGRectMake(25.0f, 15.0f, 165.0f, 20.0f)];
        userNameLbl.textColor = [UIColor colorWithRed:136/255.0 green:136/255.0 blue:136/255.0 alpha:1.0];
        //userNameLbl.textColor = [UIColor grayColor];


        [userNameLbl setTag:1];
		[userNameLbl setBackgroundColor:[UIColor clearColor]];
  		[cell.contentView addSubview:userNameLbl];
 
		UILabel *customTitleLbl = [[UILabel alloc]initWithFrame:CGRectMake(290.0f, 15.0f, 260.0f, 20.0f)];
        customTitleLbl.textColor = [UIColor colorWithRed:136/255.0 green:136/255.0 blue:136/255.0 alpha:1.0];
        [customTitleLbl setTag:2];
		[customTitleLbl setBackgroundColor:[UIColor clearColor]];
	 	[cell.contentView addSubview:customTitleLbl];
        
        UIButton *webSiteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        webSiteBtn.frame = CGRectMake(480, 15, 133, 23);
        [webSiteBtn setTag:4];
        [webSiteBtn setImage:[UIImage imageNamed:@"webSite_btn_L_ipad"] forState:UIControlStateNormal];
        [cell.contentView addSubview:webSiteBtn];
        
         UILabel *webTitleLbl = [[UILabel alloc]initWithFrame:CGRectMake(500, 15, 133, 23)];
        webTitleLbl.textColor = [UIColor colorWithRed:87/255.0 green:83/255.0 blue:83/255.0 alpha:1.0];

        [webTitleLbl setTag:3];
		[webTitleLbl setBackgroundColor:[UIColor clearColor]];
	 	[cell.contentView addSubview:webTitleLbl];
     }
	UILabel *lblUserName = (UILabel *) [cell viewWithTag:1];
    [lblUserName setFont:[UIFont fontWithName:@"Helvetica-Regular" size:15.0f]];
    NSLog(@"%@",[[specialNeedsArr objectAtIndex:indexPath.row] objectForKey:@"Manufacture"]);
    [lblUserName setText:[[specialNeedsArr objectAtIndex:indexPath.row] objectForKey:@"Manufacture"]];	
	
	UILabel *lblCustomTitle = (UILabel *) [cell viewWithTag:2];
    [lblCustomTitle setFont:[UIFont fontWithName:@"Helvetica-Regular" size:14.0f]];
    NSLog(@"%@",[[specialNeedsArr objectAtIndex:indexPath.row] objectForKey:@"phoneNumber"]);
    [lblCustomTitle setText:[[specialNeedsArr objectAtIndex:indexPath.row] objectForKey:@"phoneNumber"]]; 
    
    UILabel *lblwebName = (UILabel *) [cell viewWithTag:3];
    [lblwebName setFont:[UIFont fontWithName:@"Helvetica-Regular" size:14.0f]];
    NSLog(@"%@",[[specialNeedsArr objectAtIndex:indexPath.row] objectForKey:@"WebSite"]);
    [lblwebName setText:[[specialNeedsArr objectAtIndex:indexPath.row] objectForKey:@"WebSite"]];	
    
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    return cell;
 
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
