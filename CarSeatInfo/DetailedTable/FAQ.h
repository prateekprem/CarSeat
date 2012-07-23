//
//  FAQ.h
//  DetailTableView
//
//  Created by kiwitech on 20/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FAQ : NSObject
@property (nonatomic, strong) NSString *question;
@property (nonatomic, strong) NSString *answer;
@property (nonatomic) BOOL open;
@end
