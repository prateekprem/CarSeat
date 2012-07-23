//
//  ProductInfo.m
//  CarSeatInfo
//
//  Created by RAVI DAS on 18/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProductInfo.h"

@implementation ProductInfo

@synthesize title;
@synthesize records;

-(id)init
{
    self = [super init];
    if(self)
    {
        records = [[NSMutableArray alloc]init];
    }
    return self;
}

@end
