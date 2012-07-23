//
//  ViewWithTitle.h
//  CarSeatInfo
//
//  Created by kiwitech on 20/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewWithTitle : UIView

@property (nonatomic,strong) UILabel *titleLabel;

- (void)setTitle:(NSString *)title;


@end
