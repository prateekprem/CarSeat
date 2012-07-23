//
//  ProductInfoView.h
//  CarSeatInfo
//
//  Created by RAVI DAS on 18/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductCellHeaderView.h"

@class ProductCell;
@interface ProductInfoView : UIView<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate, ProductCellHeaderViewDelegate>
{
    //@private
    ProductCell *productCell;
    NSArray          *tableDataArrayRef;
    NSMutableArray       *dataSourceArray;
    
    __weak IBOutlet UITableView *productTableView;
    
    IBOutlet UIView *headerView;
    
    ProductCellHeaderView *view;
}
@property(nonatomic, strong) NSArray  *tableDataArrayRef;
-(void)loadDummyData;

@end
