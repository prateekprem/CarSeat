//
//  ProductCellHeaderView.h
//  CarSeatInfo
//
//  Created by RAVI DAS on 19/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Tag 100


@protocol ProductCellHeaderViewDelegate <NSObject>
-(void)selectedFieldIndex:(int)index Order:(int)order;
@end

@interface ProductCellHeaderView : UIView
{
    BOOL order;
}
@property (nonatomic,strong) id<ProductCellHeaderViewDelegate> delegate; 

- (id)initWithFrame:(CGRect)frame andDataSource:(NSDictionary*)dic;
-(void)createHeaderWithData:(NSDictionary*)dic;
@end
