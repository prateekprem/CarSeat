//
//  ViewWithTitle.m
//  CarSeatInfo
//
//  Created by kiwitech on 20/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewWithTitle.h"
#import "CGCommon.h"

@implementation ViewWithTitle
@synthesize titleLabel=_titleLabel;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        CGRect rect = self.bounds;
        rect.origin.x += 20;
        rect.size.width -= 20;
        rect.origin.y +=3;
        rect.size.height -= 10;
        
        self.titleLabel = [[UILabel alloc]initWithFrame:rect];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        [self.titleLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleHeight];
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
        self.titleLabel.shadowColor = [UIColor lightGrayColor];
        [self.titleLabel setShadowOffset:CGSizeMake(2, 2)];

        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)setTitle:(NSString *)title
{
    self.titleLabel.text = title;
  
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
return;
CGContextRef context = UIGraphicsGetCurrentContext();
CGColorRef whiteColor = [UIColor whiteColor].CGColor;
CGColorRef lightGrayColor = self.backgroundColor.CGColor;
CGRect paperRect = self.bounds;
drawLinearGradient(context, paperRect, whiteColor, lightGrayColor);

drawBorder(context, paperRect, whiteColor,1.0);
CGColorRef separatorColor = [UIColor colorWithRed:208.0/255.0 green:208.0/255.0 
                                             blue:208.0/255.0 alpha:1.0].CGColor;
drawLine(context, paperRect, separatorColor);
// Drawing code
}


@end
