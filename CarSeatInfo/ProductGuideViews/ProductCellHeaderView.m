//
//  ProductCellHeaderView.m
//  CarSeatInfo
//
//  Created by RAVI DAS on 19/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProductCellHeaderView.h"
#import "CGCommon.h"



@interface ProductCellHeaderView ()

@end


@implementation ProductCellHeaderView

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame andDataSource:(NSDictionary*)dic
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self createHeaderWithData:dic];
    }
    return self;
}


-(void)createHeaderWithData:(NSDictionary*)dic
{
    float x = 0;
    int margine = 5;
    UIImage *btnImg = [UIImage imageNamed:@"both_nonselected_L_ipad"];
    
    int tag = 0;
    for(NSString *key in dic)
    {
        float width = [key getWidth]-btnImg.size.width-margine;
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(x+10, 0, width-10, self.frame.size.height)];      
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont fontWithName:@"Helvetica-Light" size:17.0];
        label.textColor = [UIColor blackColor];
        label.textAlignment = UITextAlignmentCenter;
        label.text = key;
        [self addSubview:label];
        label = nil;
        x += width+margine;
        
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(x, 0, btnImg.size.width,self.frame.size.height)];
        [btn addTarget:self action:@selector(btnTapped:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = Tag + tag++;
        [btn setImage:btnImg forState:UIControlStateNormal];
        
        [self addSubview:btn];
        x+=btnImg.size.width;
        btn = nil;
        
    }
    CGRect rect = self.frame;
    if(rect.size.width<x)
    {
        rect.size.width = x;
        self.frame = rect;
    }
}

- (IBAction)btnTapped:(UIButton *)sender
{
    
    UIButton *btn = (UIButton *)[self viewWithTag:[sender tag]];

    if(order)
    {
        [btn setImage:[UIImage imageNamed:@"lower_selected_L_ipad"] forState:UIControlStateNormal];
        order = NO;
    }
    else
    {
        [btn setImage:[UIImage imageNamed:@"upper_selected_L_ipad"] forState:UIControlStateNormal];
        order = YES;
    }
    if(delegate)
        [delegate selectedFieldIndex:[sender tag]-Tag Order:order];
     
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 -(void)drawRect:(CGRect)rect
 {
    
     CGContextRef context = UIGraphicsGetCurrentContext();
     CGColorRef whiteColor = [UIColor whiteColor].CGColor;
     CGColorRef lightGrayColor = [UIColor colorWithRed:243.0/255.0 green:243.0/255.0  blue:243.0/255.0 alpha:1.0].CGColor;
     CGRect paperRect = self.bounds;
     drawLinearGradient(context, paperRect, whiteColor, lightGrayColor);
 
     drawBorder(context, paperRect, whiteColor,1.0);
     CGColorRef separatorColor = [UIColor colorWithRed:208.0/255.0 green:208.0/255.0  blue:208.0/255.0 alpha:1.0].CGColor;
     drawLine(context, paperRect, separatorColor);
 }
 



@end
