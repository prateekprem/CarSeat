//
//  AppDelegate.h
//  CarSeatInfo
//
//  Created by RAVI DAS on 12/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
 

@interface UIView (UIViewCategory)

-(void)addBorder:(float)width Red:(float)red Green:(float)green Blue:(float)blue Alpha:(float)alpha;
@end


@interface NSString (NSStringCategory)
-(CGFloat)getWidth;
-(CGFloat)getHeightWithWidth:(CGFloat)width AndFont:(UIFont*)font
;
@end

@class KTTabBar;
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    KTTabBar *_tabBarController;
    UISearchBar *searchBar;
    
    BOOL ipad;
    float xOrigin;
}
 
@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) KTTabBar *tabBarController;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) UINavigationController *safetynavController;

- (void) switchToNavigation;
- (void) switchToTabBar :(int) tag;
 

@end

extern AppDelegate *appDelegate;





