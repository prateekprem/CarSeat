//
//  KTTabBar.m
//  KTTabBar
//
//  Created by RAVI DAS on 29/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KTTabBar.h"
#import "AppDelegate.h"
 

#define TAB_TOP_MARGINE 20
#define TAB_BAR_WIDTH   115 
#define TAB_DETAIL_BTN_HEIGHT 0
#define TAB_BAR_MERGINE 5

#define SECTION_MARGINE 10

@interface KTTabBar (Private)

-(void)reloadItems;
-(void)tapped:(int)itemTapped;
-(void)showTabBar;
-(void)hideTabBar;
-(void)setItemDefaultSize;
-(void)addView:(UIView*)view;
-(void)reloadTabBar;

@end



@implementation KTTabBar
 
@synthesize items = _items;
@synthesize selectedItem;
@synthesize rootViewController;
@synthesize delegate;
@synthesize rootView;
@synthesize selectEnable;
@synthesize logoutBtn=logoutBtn;
@synthesize headerView;
@synthesize backBtn;
  

UIView *preView;
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
         
    }
    return self;
}
*/

-(id)init
{
    self = [super init];
    if(self)
    {
        self.items  = [[NSMutableArray alloc]init];
        showTabBar = TRUE;

    }
    return self;
}




- (IBAction)detailButtonClicked:(id)sender 
{
    showTabBar = !showTabBar;
    
    if(showTabBar)
        [self showTabBar];
    else
        [self hideTabBar];
    
}




- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
}

-(void)showTabBar
{
    [UIView beginAnimations:@"Show" context:nil];
    [UIView setAnimationDuration:1.0 ];
    
    //tabBar.frame = CGRectMake(0, self.view.frame.size.width - tabBar.frame.size.width,tabBar.frame.size.height, tabBar.frame.size.width);
    
    [UIView commitAnimations];
    
    
}

-(void)hideTabBar
{
    
    [UIView beginAnimations:@"Hide" context:nil];
    [UIView setAnimationDuration:1.0 ];
    
    //tabBar.frame = CGRectMake(0, self.view.frame.size.width-TAB_DETAIL_BTN_HEIGHT ,tabBar.frame.size.height, tabBar.frame.size.width);
    
    [UIView commitAnimations];
}


-(void)addItem:(KTTabBarItem*)tabBarItem
{
       
    NSLog(@"%@",self.items);
    tabBarItem.delegate = self;
        
    [self.items addObject:tabBarItem];
    
}

-(KTTabBarItem*)itemAtIndex:(int)index
{
    return [self.items objectAtIndex:index];
}

-(void)setItemDefaultSize
{
//    for(KTTabBarItem * item in self.items)
//        item.frame = CGRectMake(0,0,tabBar.frame.size.width-7,tabBar.frame.size.width-9);
}



-(void)reloadItems
{
    [tabBar setBackgroundColor:[UIColor clearColor]];
   // [self setItemDefaultSize];
    
//    tabBar.contentSize = CGSizeMake(tabBar.frame.size.height,TAB_DETAIL_BTN_HEIGHT);
    //float yOffset=15.0;
    for (int index=0; index<[self.items count]; index++) {
        KTTabBarItem *barItem=[self.items objectAtIndex:index];
         
        barItem.frame=CGRectMake((tabBar.frame.size.width-barItem.frame.size.width)/2+1, barItem.frame.origin.y-7, barItem.frame.size.width, barItem.frame.size.height);
                
         
        [tabBar addSubview:barItem];
      //  yOffset+=barItem.frame.size.height+15.0;
    }
    tabBarBackgroundImage.frame = tabBar.bounds;
    
}
 
-(void)removeTabBar
{
    
    for(KTTabBarItem *item in [self items])
    {
        item.viewController=nil;
        //[appDelegate removeItemsFromView:item];
    }
    
   
    [self.items removeAllObjects];
    
}
-(void)disabledBtn:(int)index
{
    [self tapped:index];

}
-(void)reloadTabBar
{
    [self removeTabBar];
    //[appDelegate loadTabBarItems];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    NSLog(@"gesture reco");
    if ([touch.view isKindOfClass:[UIControl class]]) {
        // we touched a button, slider, or other UIControl
        return NO; // ignore the touch
    }
    return YES; // handle the touch
}

-(void)selectItem:(int)index
{
    selectedItem = index;
    if ([self.items count]) {
         [(KTTabBarItem*)[self.items objectAtIndex:index] setSelected:nil];
    }
   
    //title1.title = [[self.items objectAtIndex:index] title] ;
}
-(void)tapped:(int)itemTapped
{
    
    [self.delegate tapped:itemTapped];

}
-(void)isEnabled:(BOOL)enabled
{
    //NSLog(@"%@",self.items);
    for(KTTabBarItem *item in [self items])
        [item setIsEnabled:enabled];
    
}
-(void)setSelected:(int)selectedItem1
{
    
    //NSLog(@"selected Item %d", selectedItem1);
    selectedItem = selectedItem1;
   
    if(rootViewController)
    {        
        if(rootViewController.view)
                 [rootViewController.view removeFromSuperview];
    }
     if ([self.items count]>selectedItem1)
     {
        rootViewController = [[self.items objectAtIndex:selectedItem1] viewController];
        if([rootViewController isKindOfClass:[[[rootViewController.navigationController  viewControllers]objectAtIndex:0] class]] || !rootViewController.navigationController) 
            {
                backBtn.hidden = TRUE;
            }
         else
             backBtn.hidden = FALSE;
     }
      
    CGRect rect = self.view.bounds;
    rect.origin.y = headerView.frame.size.height;
    rect.size.height = self.view.frame.size.height - rect.origin.y;
    rootViewController.view.frame = rect;
 
    [self.view addSubview:rootViewController.view];
    [self.view bringSubviewToFront:tabBar];
 
    titleLbl.text = rootViewController.title;
    NSLog(@"Title = %@", titleLbl.text);
}

-(void) setBackBtn:(UIButton *)sender
{
    
    if(sender)
    {
        CGRect rect = backBtn.frame;
        sender.frame = rect;
        [headerView addSubview:sender];
        backBtn.hidden = TRUE;
    }
    
}

  

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    // Do any additional setup after loading the view from its nib.
    backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(15,9,72,37);
    [backBtn addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"btn_back_L_ipad"] forState:UIControlStateNormal];
    backBtn.hidden = TRUE;
    [headerView addSubview:backBtn];
    
    [self reloadItems];
    [self selectItem:0];
   
}

-(void)viewWillAppear:(BOOL)animated
{
   
    
}

- (void)viewDidUnload
{
    tabBar = nil;
    rootView = nil;
    headerView = nil;
    items = nil;
    tabBar = nil;
    rootViewController = nil;
    titleLbl   = nil;
    tabBarBackgroundImage = nil;
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return UIInterfaceOrientationPortrait;
}

- (IBAction)backButtonClicked:(id)sender 
{
    [rootViewController.navigationController popViewControllerAnimated:YES];
}
@end
