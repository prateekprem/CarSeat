//
//  ProductInfo.h
//  CarSeatInfo
//
//  Created by RAVI DAS on 18/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductInfo : NSObject
{
    NSString *title;
    NSMutableArray *records;
}
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSMutableArray *records;

@end
