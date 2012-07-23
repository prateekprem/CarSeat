//
//  ProductCell.m
//  CarSeatInfo
//
//  Created by RAVI DAS on 18/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProductCell.h"
#import "CGCommon.h"

@implementation ProductCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setDataSource:(NSDictionary *)dataObj
{
    float x = 0;
    
    for(NSString *key in dataObj)
    {
        float width = [key getWidth];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(x+10, 0, width-10, self.frame.size.height)];      
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont fontWithName:@"Helvetica-Light" size:14.0];
        label.textColor = [UIColor darkGrayColor];
        label.textAlignment = UITextAlignmentLeft;
        label.text = [dataObj objectForKey:key];
        [self addSubview:label];
        
        x += width;
        
        
    }
    
}

-(void)drawRect:(CGRect)rect
{
    /*
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorRef whiteColor = [UIColor whiteColor].CGColor;
    CGColorRef lightGrayColor = [UIColor colorWithRed:243.0/255.0 green:243.0/255.0 
                                                 blue:243.0/255.0 alpha:1.0].CGColor;
    CGRect paperRect = self.bounds;
    drawLinearGradient(context, paperRect, whiteColor, lightGrayColor);
    
    drawBorder(context, paperRect, whiteColor,1.0);
    CGColorRef separatorColor = [UIColor colorWithRed:208.0/255.0 green:208.0/255.0 
                                                 blue:208.0/255.0 alpha:1.0].CGColor;
    drawLine(context, paperRect, separatorColor);
     */
}



@end
