//
//  AppDelegate.m
//  CarSeatInfo
//
//  Created by RAVI DAS on 12/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "DBFile.h"
#import "AppDelegate.h"
#import "HomeViewController.h"
#import "SeatCheckerViewController.h"
#import "ProductGuidViewController.h"
#import "InformationViewController.h"
#import "FAQViewController.h"
#import "AboutViewController.h"
#import "MultiMediaViewController.h"
#import "SeatCheckerImageGalleryViewController.h"
#import "KTTabBar.h"
#import "KTTabBarItem.h"
#import "KTTabBarDataSource.h"
 
#import <QuartzCore/QuartzCore.h>

@implementation NSString (NSStringCategory)
-(CGFloat)getWidth
{
    return 150;
}

-(CGFloat)getHeightWithWidth:(CGFloat)width AndFont:(UIFont*)font
{
    CGSize constraintSize;
    constraintSize.width = width;
    constraintSize.height = MAXFLOAT;
    
    CGSize size = [self sizeWithFont:font constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
    return size.height;
}
@end
 
@implementation UIView (UIViewCategory)

-(void)addBorder:(float)width Red:(float)red Green:(float)green Blue:(float)blue Alpha:(float)alpha
{
    self.layer.borderWidth = width;
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGFloat values[4] = {red, green, blue, alpha}; 
    CGColorRef color = CGColorCreate(space, values); 
    self.layer.borderColor = color;
    CGColorRelease(color);
    CGColorSpaceRelease(space);
    
}
@end

AppDelegate *appDelegate;


@interface AppDelegate ()
- (void)initializeTabbarAndNavigation;
-(void)loadTabBarItems;
-(void)homeBtnPressed:(id)sender;
-(void)backBtnPressed:(id)sender;
@end

@implementation AppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;
@synthesize tabBarController = _tabBarController;
@synthesize safetynavController,searchBar;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [DBFile openDb:@"Car_seat.db"];
     appDelegate = self;
   
    [self loadTabBarItems];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
         
    ipad = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
    [self initializeTabbarAndNavigation];
 
    [self.window addSubview:_navigationController.view];
 
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)initializeTabbarAndNavigation 
{
    HomeViewController *home = [[HomeViewController alloc] initWithNibName:@"HomeView_iPad" bundle:nil];
    _navigationController = [[UINavigationController alloc] initWithRootViewController:home];
    [_navigationController setNavigationBarHidden:TRUE animated:FALSE];
         
}


-(void)loadTabBarItems
{
    if(self.tabBarController) self.tabBarController =nil;
    
    self.tabBarController = [[KTTabBar alloc]init];
    
    int indexCount=0;
    //ADD Item For Agenda...
    SeatCheckerViewController *seatCheckerCtrl  = [[SeatCheckerViewController alloc] initWithNibName:@"SeatCheckerView_iPad" bundle:nil];
    //Data Source for TabBarItems....
    KTTabBarDataSource *seatCheckerDataSource = [[KTTabBarDataSource alloc]init];
    seatCheckerDataSource.selectedItemImage = @"tab_seat_selected_L_iPad";
    seatCheckerDataSource.deSelectedItemImage = @"tab_seat_unselected_L_iPad";
    seatCheckerDataSource.yOffset=5.0;
    seatCheckerDataSource.index = indexCount++;
    //agendaDataSource.title = @"Agenda";
    //ADD TabBarItem....
    KTTabBarItem *SeatCheckerCtrl_Item = [[KTTabBarItem alloc]initWithDataSource:seatCheckerDataSource];
    SeatCheckerCtrl_Item.viewController = seatCheckerCtrl;
    
    
    // ADD more item to Agenda  2
    ProductGuidViewController *ProductGuidCtrl  = [[ProductGuidViewController alloc] initWithNibName:@"ProductGuidView_iPad" bundle:nil];
   
    //Data Source for TabBarItems....
    KTTabBarDataSource *productGuidDataSource = [[KTTabBarDataSource alloc]init];
    productGuidDataSource.selectedItemImage = @"tab_product_selected_L_iPad";
    productGuidDataSource.deSelectedItemImage = @"tab_product_unselected_L_iPad";
    productGuidDataSource.yOffset=5.0+108;
    productGuidDataSource.index = indexCount++;
    //agendaDataSource.title = @"Agenda";
    //ADD TabBarItem....
    KTTabBarItem *ProductGuidCtrl_Item = [[KTTabBarItem alloc]initWithDataSource:productGuidDataSource];
    ProductGuidCtrl_Item.viewController = ProductGuidCtrl;
    
    // ADD more item to Agenda  3
    
     InformationViewController *informationCtrl  = [[InformationViewController alloc] initWithNibName:@"InformationView_iPad" bundle:nil];
    
    safetynavController = [[UINavigationController alloc] initWithRootViewController:informationCtrl];
    [safetynavController setNavigationBarHidden:TRUE];
    safetynavController.title = @"Safety Information";
    
    //Data Source for TabBarItems....
    KTTabBarDataSource *informationDataSource = [[KTTabBarDataSource alloc]init];
    informationDataSource.selectedItemImage = @"tab_safety_selected_L_iPad";
    informationDataSource.deSelectedItemImage = @"tab_safety_unselected_L_iPad";
    informationDataSource.yOffset=5.0+108*2;
    informationDataSource.index = indexCount++;
    //agendaDataSource.title = @"Agenda";
    //ADD TabBarItem....
    KTTabBarItem *InformationCtrl_Item = [[KTTabBarItem alloc]initWithDataSource:informationDataSource];
    InformationCtrl_Item.viewController = safetynavController;
     
    
    // ADD more item to Agenda  4
    FAQViewController *faqCtrl  = [[FAQViewController alloc] initWithNibName:@"FAQView_iPad" bundle:nil];
    //Data Source for TabBarItems....
    KTTabBarDataSource *faqDataSource = [[KTTabBarDataSource alloc]init];
    faqDataSource.selectedItemImage = @"tab_faq_selected_L_iPad";
    faqDataSource.deSelectedItemImage = @"tab_faq_unselected_L_iPad";
    faqDataSource.yOffset=5.0+108*3;
    faqDataSource.index = indexCount++;
    //agendaDataSource.title = @"Agenda";
    //ADD TabBarItem....
    KTTabBarItem *faqCtrl_Item = [[KTTabBarItem alloc]initWithDataSource:faqDataSource];
    faqCtrl_Item.viewController = faqCtrl;
 
     // ADD more item to Agenda  5
    AboutViewController *aboutCtrl  = [[AboutViewController alloc] initWithNibName:@"AboutView_iPad" bundle:nil];
    //Data Source for TabBarItems....
    KTTabBarDataSource *aboutDataSource = [[KTTabBarDataSource alloc]init];
    aboutDataSource.selectedItemImage = @"tab_about_selected_L_iPad";
    aboutDataSource.deSelectedItemImage = @"tab_about_unselected_L_iPad";
    aboutDataSource.yOffset=5.0+108*4;
    aboutDataSource.index = indexCount++;
    //agendaDataSource.title = @"Agenda";
    //ADD TabBarItem....
    KTTabBarItem *aboutCtrl_Item = [[KTTabBarItem alloc]initWithDataSource:aboutDataSource];
    aboutCtrl_Item.viewController = aboutCtrl;
    
    
    // ADD more item to Agenda  6
    MultiMediaViewController *multiMediaCtrl  = [[MultiMediaViewController alloc] initWithNibName:@"MultiMediaView_iPad" bundle:nil];
    //Data Source for TabBarItems....
    KTTabBarDataSource *multimediaDataSource = [[KTTabBarDataSource alloc]init];
    multimediaDataSource.selectedItemImage = @"tab_multimedia_selected_L_iPad";
    multimediaDataSource.deSelectedItemImage = @"tab_multimedia_unselected_L_iPad";
    multimediaDataSource.yOffset=5.0+108*5;
    multimediaDataSource.index = indexCount++;
    //agendaDataSource.title = @"Agenda";
    //ADD TabBarItem....
    KTTabBarItem *multiMediaCtrl_Item = [[KTTabBarItem alloc]initWithDataSource:multimediaDataSource];
    multiMediaCtrl_Item.viewController = multiMediaCtrl;
     
    
    [self.tabBarController addItem:SeatCheckerCtrl_Item];
    
    [self.tabBarController addItem:ProductGuidCtrl_Item];
    
    [self.tabBarController addItem:InformationCtrl_Item];
    
    [self.tabBarController addItem:faqCtrl_Item];
    
    [self.tabBarController addItem:aboutCtrl_Item];
    
    [self.tabBarController addItem:multiMediaCtrl_Item];
 
    [self.tabBarController.view superview];// to alloc IBOutlets...
    //Add Searchbar and Home Button on TabBar....
    
    CGRect rectBorder = self.tabBarController.headerView.frame;
    
    searchBar = [[UISearchBar alloc]initWithFrame: CGRectMake(rectBorder.size.width - 235, 10, 150, 36)];
    [self.tabBarController.headerView addSubview:searchBar];
   
    UIImageView* iview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_bar"]];
    iview.frame = CGRectMake(0, 0, 200, 44);
    
    [[[searchBar subviews] objectAtIndex:0] removeFromSuperview];
   
    UIButton *homeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *img = [UIImage imageNamed:@"btn_home_L_ipad"];
    homeBtn.frame = CGRectMake(searchBar.frame.origin.x+ searchBar.frame.size.width+10, 12, img.size.width, img.size.height);
    [homeBtn setBackgroundImage:img forState:UIControlStateNormal];
    [homeBtn addTarget:self action:@selector(homeBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.tabBarController.headerView addSubview:homeBtn];
        
      
}
 

-(void)homeBtnPressed:(id)sender
{
    if([self.tabBarController.view superview] != nil)
        [self.tabBarController.view removeFromSuperview];
      
    [self.navigationController popToRootViewControllerAnimated:YES];
    [self.window addSubview:_navigationController.view];
}

- (void) switchToNavigation
{
    if([self.tabBarController.view superview] != nil)
        [self.tabBarController.view removeFromSuperview];
           
    NSArray *arr = [_navigationController viewControllers];
    if([arr count] == 1)
    {
         SeatCheckerImageGalleryViewController *SeatCheckerTableViewCtrl = [[SeatCheckerImageGalleryViewController alloc] initWithNibName:@"SeatCheckerImageGalleryView_iPad" bundle:[NSBundle mainBundle]];
        [_navigationController pushViewController:SeatCheckerTableViewCtrl animated:FALSE];
   }
   [self.window addSubview:_navigationController.view];
    
}


- (void) switchToTabBar :(int) tag
{
    if([self.navigationController.view superview] != nil)
        [self.navigationController.view removeFromSuperview];
   
    [self.window addSubview:self.tabBarController.view];
    
    //[self.window.rootViewController = self.tabBarController;
    [self.tabBarController selectItem:tag];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}
  

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
