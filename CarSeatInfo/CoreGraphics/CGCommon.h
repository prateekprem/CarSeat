//
//  CGCommon.h
//  LearningCoreGraphics
//
//  Created by Prateek Prem on 18/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor,CGColorRef  endColor);

void drawBorder(CGContextRef context,CGRect rect, CGColorRef borderColor, CGFloat lineWidth);

CGRect rectFor1PxStroke(CGRect rect);

void draw1PxStroke(CGContextRef context, CGPoint startPoint, CGPoint endPoint, CGColorRef color);

void drawLine(CGContextRef context, CGRect rect, CGColorRef color);