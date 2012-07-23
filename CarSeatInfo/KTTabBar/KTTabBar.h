//
//  KTTabBar.h
//  KTTabBar
//
//  Created by RAVI DAS on 29/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KTTabBarItem.h"

@protocol tabDelete <NSObject> 
- (void)tapped:(int)selectedItem;
@end

//@protocol setBackDelegate <NSObject>
//-(void) setBackBtn:(UIButton *)sender;
//@end

@class AppDelegate;


@interface KTTabBar : UIViewController<KTTabBarItemDelegate,UIGestureRecognizerDelegate>
{
    NSMutableArray *items;
    
    IBOutlet UIScrollView *tabBar;
    BOOL selectEnable;
    UIViewController *rootViewController;
    BOOL showTabBar;
    id <tabDelete> delegate;
    
    
    @private
     IBOutlet UIImageView *tabBarBackgroundImage;
      
    IBOutlet UIView *headerView;
    IBOutlet UILabel *titleLbl;
    UIButton *backBtn;
 
}

@property (nonatomic, retain) UIButton *backBtn;
@property (nonatomic, retain) UIView *headerView;
@property (retain) id <tabDelete> delegate;
@property (strong,nonatomic) IBOutlet UIView *rootView;
@property (strong, nonatomic) NSMutableArray *items;
@property (strong, nonatomic) id rootViewController;
@property (nonatomic)int selectedItem;
@property (nonatomic)BOOL selectEnable;
@property (nonatomic,retain) UIButton *logoutBtn;
//-(IBAction)tapped:(id)sender;
- (IBAction)detailButtonClicked:(id)sender;
-(void)removeTabBar;
-(void)addItem:(KTTabBarItem*)tabBarItem;
-(void)selectItem:(int)index;
-(void)isEnabled:(BOOL)enabled;
-(KTTabBarItem*)itemAtIndex:(int)index;

//-(void) setBackBtn:(UIButton *)sender;
- (IBAction)backButtonClicked:(id)sender;

@end
