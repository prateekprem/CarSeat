//
//  DetailedTableView.h
//  CarSeatInfo
//
//  Created by kiwitech on 20/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailedTableView : UITableView
{
    NSArray* dataSourceArr;
}
- (void)setDataSourceArr:(NSArray *)dataSource;
@end
