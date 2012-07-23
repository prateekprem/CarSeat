//
//  CGCommon.m
//  LearningCoreGraphics
//
//  Created by Prateek Prem on 18/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CGCommon.h"

CGRect rectFor1PxStroke(CGRect rect) {
    return CGRectMake(rect.origin.x + 0.5, rect.origin.y + 0.5, 
                      rect.size.width - 1, rect.size.height - 1);
}

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef  endColor) 
{
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGFloat  locations[] = {0.0,1.0}; 
    NSArray *colors = [NSArray arrayWithObjects:(__bridge id)startColor, (__bridge id)endColor, nil];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpaceRef, 
                                                        (__bridge CFArrayRef) colors, locations);
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinX(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    CGContextSaveGState(context);
    CGContextAddRect(context, rect);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpaceRef);
}


void draw1PxStroke(CGContextRef context, CGPoint startPoint, CGPoint endPoint, 
                   CGColorRef color) {
    
    CGContextSaveGState(context);
    CGContextSetLineCap(context, kCGLineCapSquare);
    CGContextSetStrokeColorWithColor(context, color);
    CGContextSetLineWidth(context, 1.0);
    CGContextMoveToPoint(context, startPoint.x + 0.5, startPoint.y + 0.5);
    CGContextAddLineToPoint(context, endPoint.x + 0.5, endPoint.y + 0.5);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);        
    
}


void drawLine(CGContextRef context, CGRect rect, CGColorRef color)
{
    CGPoint startPoint = CGPointMake(rect.origin.x, 
                                     rect.origin.y + rect.size.height - 1);
    CGPoint endPoint = CGPointMake(rect.origin.x + rect.size.width - 1, 
                                   rect.origin.y + rect.size.height - 1);
    draw1PxStroke(context, startPoint, endPoint, color);
}

void drawBorder(CGContextRef context,CGRect rect, CGColorRef borderColor, CGFloat lineWidth)
{
    rect.size.height -=1;
    CGRect strokeRect = rectFor1PxStroke(rect);
    CGContextSetStrokeColorWithColor(context, borderColor);
    CGContextSetLineWidth(context, lineWidth);
    CGContextStrokeRect(context, strokeRect);
}



