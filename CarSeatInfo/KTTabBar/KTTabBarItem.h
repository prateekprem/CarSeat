//
//  KTTabBarItem.h
//  KTTabBar
//
//  Created by RAVI DAS on 29/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class KTTabBarDataSource;


@protocol KTTabBarItemDelegate 


@optional
-(void)setSelected:(int)index;
-(void)disabledBtn:(int)index;
@end


@interface KTTabBarItem : UIView
{
    id<KTTabBarItemDelegate> delegate;
    NSString *title;
    @private
    
    
      IBOutlet UILabel *itemLabel;
      IBOutlet UIImageView *itemImageView;
      UIButton *itemButton;
}

@property (nonatomic) BOOL isEnabled;
@property (strong, nonatomic) id<KTTabBarItemDelegate> delegate;
@property (strong, nonatomic)     NSString *title;
@property(strong,nonatomic)IBOutlet UIImageView *itemImageView;
@property (strong, nonatomic) KTTabBarDataSource *dataSource;
@property (strong, nonatomic) id viewController;
-(void)isEnabled:(BOOL)enabled;
//@property (weak, nonatomic) IBOutlet UILabel *itemLabel;
//@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
//@property (weak, nonatomic) IBOutlet UIButton *itemButton;

-(id)initWithDataSource:(KTTabBarDataSource *)dataSource;

- (void)itemSelected:(id)sender;
-(void)setSelected:(KTTabBarItem*)item;

@end
