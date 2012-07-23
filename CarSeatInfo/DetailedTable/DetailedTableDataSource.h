//
//  DetailedTableDataSource.h
//  CarSeatInfo
//
//  Created by kiwitech on 20/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailedTableDataSource : NSObject
@property (nonatomic, strong) NSString *headerTitle;
@property (nonatomic, strong) NSString *description;
@property (nonatomic) BOOL open;
@end
