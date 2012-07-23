//
//  UIColor+Additions.h
//  CarSeatInfo
//
//  Created by RAVI DAS on 19/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIColor (UIColorAdditions) 

+ (NSString *)stringFromUIColor:(UIColor *)color;

@end

@interface NSString (UIColorAdditions) 

+ (UIColor *)colorFromNSString:(NSString *)string;

@end