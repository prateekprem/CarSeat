//
//  InformationViewController.h
//  CarSeatInfo
//
//  Created by RAVI DAS on 12/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InformationViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
     IBOutlet UITableView *safetyInfoTable;
     NSMutableArray *safetyInfoArr;
}

 

@end
