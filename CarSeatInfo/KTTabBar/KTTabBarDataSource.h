//
//  KTTabBarDataSource.h
//  KTTabBar
//
//  Created by RAVI DAS on 29/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KTTabBarDataSource : NSObject
{
    
}
@property(assign,nonatomic)float yOffset;
@property (strong, nonatomic) NSString *selectedItemImage;
@property (strong, nonatomic) NSString *deSelectedItemImage;
@property (strong, nonatomic) NSString *title;
@property (nonatomic) int index;



-(id)initWithKTTabBarDataSource:(KTTabBarDataSource *)data;

@end
