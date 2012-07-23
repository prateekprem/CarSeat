
/*
     File: SectionHeaderView.m
 Abstract: A view to display a section header, and support opening and closing a section.
 
  Version: 2.0
 
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple
 Inc. ("Apple") in consideration of your agreement to the following
 terms, and your use, installation, modification or redistribution of
 this Apple software constitutes acceptance of these terms.  If you do
 not agree with these terms, please do not use, install, modify or
 redistribute this Apple software.
 
 In consideration of your agreement to abide by the following terms, and
 subject to these terms, Apple grants you a personal, non-exclusive
 license, under Apple's copyrights in this original Apple software (the
 "Apple Software"), to use, reproduce, modify and redistribute the Apple
 Software, with or without modifications, in source and/or binary forms;
 provided that if you redistribute the Apple Software in its entirety and
 without modifications, you must retain this notice and the following
 text and disclaimers in all such redistributions of the Apple Software.
 Neither the name, trademarks, service marks or logos of Apple Inc. may
 be used to endorse or promote products derived from the Apple Software
 without specific prior written permission from Apple.  Except as
 expressly stated in this notice, no other rights or licenses, express or
 implied, are granted by Apple herein, including but not limited to any
 patent rights that may be infringed by your derivative works or by other
 works in which the Apple Software may be incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
 FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
 
 Copyright (C) 2011 Apple Inc. All Rights Reserved.
 
 */

#import "SectionHeaderView.h"
#import "CGCommon.h"

@implementation SectionHeaderView


@synthesize titleLabel=_titleLabel, leftDisclosureButton=_leftDisclosureButton, rightDisclosureButton = _rightDisclosureButton, delegate=_delegate, section=_section;


+ (Class)layerClass {
    
    return [CAGradientLayer class];
}


-(id)initWithFrame:(CGRect)frame title:(NSString*)title section:(NSInteger)sectionNumber delegate:(id <SectionHeaderViewDelegate>)delegate {
    
    self = [super initWithFrame:frame];
    
    if (self != nil) {
        
        // Set up the tap gesture recognizer.
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleOpen:)];
        [self addGestureRecognizer:tapGesture];

        _delegate = delegate;        
        self.userInteractionEnabled = YES;
        
        
        // Create and configure the title label.
        _section = sectionNumber;
        CGRect titleLabelFrame = self.bounds;
        titleLabelFrame.origin.x += 35.0;
        titleLabelFrame.size.width -= 35.0;
        CGRectInset(titleLabelFrame, 0.0, 5.0);
        UILabel *label = [[UILabel alloc] initWithFrame:titleLabelFrame];
        label.text = title;
        label.font = [UIFont fontWithName:@"Helvetica-Light" size:17.0];
        label.textColor = [UIColor darkGrayColor];
        label.backgroundColor = [UIColor clearColor];
        [self addSubview:label];
        _titleLabel = label;
        
        UIImage *imgSelected = [UIImage imageNamed:@"hand_selected_ipad"];
        UIImage *imgDeSelected = [UIImage imageNamed:@"hand_unselected_ipad"];

        // Create and configure the left disclosure button.
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftButton.frame = CGRectMake(0.0, 5.0, 35.0,35.0);;//CGRectMake(0.0, 5.0, imgSelected.size.width, imgSelected.size.height-5);
        [leftButton setImage:imgDeSelected forState:UIControlStateNormal];
        [leftButton setImage:imgSelected forState:UIControlStateSelected];
        [leftButton addTarget:self action:@selector(toggleOpen:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:leftButton];
        _leftDisclosureButton = leftButton;
        
        // Create and configure the right disclosure button.
        int rightMargine=20.0;
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.frame = CGRectMake(self.frame.size.width-35-rightMargine, 5.0, 35.0,35.0);;//CGRectMake(self.frame.size.width-imgSelected.size.width-20, 5.0, imgSelected.size.width, imgSelected.size.height-5);
        [rightButton setImage:[UIImage imageNamed:@"down_arrow_ipad"] forState:UIControlStateNormal];
        [rightButton setImage:[UIImage imageNamed:@"black_arrow_ipad"] forState:UIControlStateSelected];
        [rightButton addTarget:self action:@selector(toggleOpen:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:rightButton];
        _rightDisclosureButton = rightButton;
        
        
        // Set the colors for the gradient layer.
        static NSMutableArray *colors = nil;
        if (colors == nil) {
            colors = [[NSMutableArray alloc] initWithCapacity:3];
            UIColor *color = nil;
            color = [UIColor colorWithRed:0.82 green:0.84 blue:0.87 alpha:1.0];
            [colors addObject:(id)[color CGColor]];
            color = [UIColor colorWithRed:0.41 green:0.41 blue:0.59 alpha:1.0];
            [colors addObject:(id)[color CGColor]];
            color = [UIColor colorWithRed:0.41 green:0.41 blue:0.59 alpha:1.0];
            [colors addObject:(id)[color CGColor]];
        }
        [(CAGradientLayer *)self.layer setColors:colors];
        [(CAGradientLayer *)self.layer setLocations:[NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.48], [NSNumber numberWithFloat:1.0], nil]];
    }
    
    return self;
}


-(IBAction)toggleOpen:(id)sender {
    
    [self toggleOpenWithUserAction:YES];
}


-(void)toggleOpenWithUserAction:(BOOL)userAction {
    
    // Toggle the disclosure button state.
    self.leftDisclosureButton.selected = !self.leftDisclosureButton.selected;
    self.rightDisclosureButton.selected = !self.rightDisclosureButton.selected;
    // If this was a user action, send the delegate the appropriate message.
    if (userAction) {
        if (self.leftDisclosureButton.selected || self.rightDisclosureButton.selected) {
            if ([self.delegate respondsToSelector:@selector(sectionHeaderView:sectionOpened:)]) {
                [self.delegate sectionHeaderView:self sectionOpened:self.section];
            }
        }
        else {
            if ([self.delegate respondsToSelector:@selector(sectionHeaderView:sectionClosed:)]) {
                [self.delegate sectionHeaderView:self sectionClosed:self.section];
            }
        }
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
-(void)drawRect:(CGRect)rect
{
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
}




@end
