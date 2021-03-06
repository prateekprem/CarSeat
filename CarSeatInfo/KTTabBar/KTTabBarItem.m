//
//  KTTabBarItem.m
//  KTTabBar
//
//  Created by RAVI DAS on 29/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KTTabBarItem.h"
#import "KTTabBarDataSource.h"
#import "AppDelegate.h"
#import "KTTabBar.h"



@interface KTTabBarItem (Private)

-(void)initItem;
-(void)setDeselected;

@end

@implementation KTTabBarItem

@synthesize dataSource;
@synthesize viewController;
@synthesize itemImageView;
@synthesize delegate;
@synthesize title;
@synthesize isEnabled = isEnabled_;
//@synthesize itemLabel;
//@synthesize itemImageView;
//@synthesize itemButton;


static UIButton *prevSelectedBtnRef;
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
//        NSArray *nibObjects = [[NSBundle mainBundle] loadNibNamed:@"KTTabBarItem" owner:self options:nil];
//		UIView *theEditView = [nibObjects objectAtIndex:0];
//		[self addSubview:theEditView];
//        
//        
//        
//        [self initItem];
        
        
    }
    return self;
    
}

-(id)initWithDataSource:(KTTabBarDataSource *)dataSource1
{
    self = [super init];
    if (self) {
        
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
//        NSArray *nibObjects = [[NSBundle mainBundle] loadNibNamed:@"KTTabBarItem" owner:self options:nil];
//		UIView *theEditView = [nibObjects objectAtIndex:0];
//		[self addSubview:theEditView];
//        
        //self.frame = CGRectMake(0, 0, 60, 60);  
       // theEditView.frame = self.bounds;
        
        dataSource = dataSource1;
        isEnabled_ = TRUE;
        [self initItem];
        
    }
    return self;
}


-(void)drawRect:(CGRect)rect
{
    //itemButton.frame = self.bounds;
    //itemButton.frame = CGRectMake(0,0,itemButton.frame.size.width-0, itemButton.frame.size.height-0);
    //itemLabel.frame = CGRectMake(0,self.frame.size.height-30,self.frame.size.width,30);
 
    //itemButton.center = self.center;
}


- (void)itemSelected:(id)sender {
    if (!isEnabled_) {
        [delegate disabledBtn:[sender tag]];
        return;
    }
    [prevSelectedBtnRef setSelected:FALSE];
    [itemButton setSelected:TRUE];
    prevSelectedBtnRef = itemButton;
    [delegate setSelected:[itemButton tag]];
    
}
         
-(void)isEnabled:(BOOL)enabled
{
    itemButton.userInteractionEnabled  = enabled;

}
-(void)setSelected:(KTTabBarItem*)item
{
    [self itemSelected:itemButton];
    
}

-(void)setDeselected
{
    
}



-(void)setDataSource:(KTTabBarDataSource *)dataSource1
{
    UIImage *selected = [UIImage imageNamed:dataSource1.selectedItemImage];
    UIImage *deSelected = [UIImage imageNamed:dataSource1.deSelectedItemImage];
   
    [itemButton setImage:selected forState:UIControlStateSelected];
    [itemButton setImage:deSelected forState:UIControlStateNormal];
    
    itemLabel.text = dataSource1.title;
}

-(void)initItem
{
    self.frame=CGRectMake(0.0, dataSource.yOffset, 95, 108);
    self.backgroundColor = [UIColor clearColor];
    
    UIImage *selected   =  [UIImage imageNamed:dataSource.selectedItemImage];
    UIImage *deSelected =  [UIImage imageNamed:dataSource.deSelectedItemImage];
    
    itemButton=[[UIButton alloc]initWithFrame:CGRectMake(0.0,0.0 , 95, 108)];
    [itemButton setBackgroundColor:[UIColor clearColor]];
    itemButton.tag = dataSource.index;
    [itemButton addTarget:self action:@selector(itemSelected:) forControlEvents:UIControlEventTouchUpInside];
    [itemButton setImage:selected forState:UIControlStateSelected];
    [itemButton setImage:deSelected forState:UIControlStateNormal];
    [self addSubview:itemButton];
    [self bringSubviewToFront:itemButton];
    //itemButton.frame=CGRectMake(0.0, 0.0, selected.size.width, selected.size.height);
   // title = dataSource.title;
    //itemLabel.text = dataSource.title;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
