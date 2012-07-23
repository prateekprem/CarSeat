//
//  KTTabBarDataSource.m
//  KTTabBar
//
//  Created by RAVI DAS on 29/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KTTabBarDataSource.h"



@implementation KTTabBarDataSource

@synthesize selectedItemImage = _selectedItemImage;
@synthesize deSelectedItemImage = _deSelectedItemImage;
@synthesize title = _title;
@synthesize yOffset;
@synthesize index;

-(id)initWithKTTabBarDataSource:(KTTabBarDataSource *)data
{
    self = [super init];
    if(self){
        
        self.selectedItemImage = data.selectedItemImage;
        self.deSelectedItemImage= data.deSelectedItemImage;
        self.title = data.title;
        self.index = data.index;
        
    }
    return self;
}

@end
