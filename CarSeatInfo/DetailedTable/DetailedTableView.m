//
//  DetailedTableView.m
//  CarSeatInfo
//
//  Created by kiwitech on 20/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "SectionInfo.h"
#import "SectionHeaderView.h"
#import "DetailedTableDataSource.h"
#import "DetailedTableView.h"
#import "ViewWithTitle.h"

#define DEFAULT_ROW_HEIGHT 48
#define HEADER_HEIGHT 45


// Private TableViewController properties and methods.
@interface DetailedTableView ()
@property (nonatomic, strong) NSMutableArray* sectionInfoArray;
@property (nonatomic, strong) NSIndexPath* pinchedIndexPath;
@property (nonatomic, assign) NSInteger openSectionIndex;
@property (nonatomic, assign) CGFloat initialPinchHeight;

// Use the uniformRowHeight property if the pinch gesture should change all row heights simultaneously.
@property (nonatomic, assign) NSInteger uniformRowHeight;

- (void)setSectionInfo;
-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView ;

@end
@implementation DetailedTableView
@synthesize pinchedIndexPath;
@synthesize openSectionIndex =  openSectionIndex_ ;
@synthesize initialPinchHeight;
@synthesize uniformRowHeight;
@synthesize sectionInfoArray=_sectionInfoArray;
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
      
              // Initialization code
    }
    return self;
}
- (void)setDataSourceArr:(NSArray *)dataSource
{
    dataSourceArr =[[NSArray alloc]initWithArray:dataSource];
   [self setSectionInfo];
    self.sectionHeaderHeight = HEADER_HEIGHT;
    openSectionIndex_ = NSNotFound;
    self.delegate = (id)self;
    self.dataSource = (id)self;
}
- (void)setSectionInfo
{
    
    
    /*
     Check whether the section info array has been created, and if so whether the section count still matches the current section count. In general, you need to keep the section info synchronized with the rows and section. If you support editing in the table view, you need to appropriately update the section info during editing operations.
     */
	if ((self.sectionInfoArray == nil) || ([self.sectionInfoArray count] != [self numberOfSectionsInTableView:self])) {
		
        // For each play, set up a corresponding SectionInfo object to contain the default height for each row.
		NSMutableArray *infoArray = [[NSMutableArray alloc] init];
		
		for (DetailedTableDataSource *obj in dataSourceArr) {
			
			SectionInfo *sectionInfo = [[SectionInfo alloc] init];			
			sectionInfo.dataSource = obj;
			sectionInfo.open = NO;
			
            NSNumber *defaultRowHeight = [NSNumber numberWithInteger:DEFAULT_ROW_HEIGHT];
            
            [sectionInfo insertObject:defaultRowHeight inRowHeightsAtIndex:0];
            
			[infoArray addObject:sectionInfo];
		}
		
		self.sectionInfoArray = infoArray;
	}         
         

}
#pragma mark Table view data source and delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
    return [self.sectionInfoArray count];
}
-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    SectionInfo *sectionInfo = [self.sectionInfoArray objectAtIndex:section];
    return sectionInfo.open ? 1 : 0;
}
-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc]init];
        {
            CGRect rect = cell.bounds;
            rect.origin.x   += 15;
            rect.size.width = tableView.frame.size.width- 30;
            rect.size.height +=5;
            ViewWithTitle *innerView = [[ViewWithTitle alloc] initWithFrame:rect];
            innerView.backgroundColor = [UIColor whiteColor];
            innerView.titleLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:13.0];
            innerView.titleLabel.textColor = [UIColor grayColor];
            innerView.titleLabel.shadowColor = [UIColor clearColor];
            [innerView.titleLabel setShadowOffset:CGSizeMake(0, 0)];
            
            NSString *title = [[dataSourceArr objectAtIndex:indexPath.section] description];
            CGFloat height = [title getHeightWithWidth:innerView.frame.size.width AndFont:innerView.titleLabel.font];
            
            if(height<DEFAULT_ROW_HEIGHT)height=DEFAULT_ROW_HEIGHT;
            else height+=40;
            rect.size.height = height;
            innerView.frame = rect;
            [innerView setTitle:title];
            [innerView addBorder:1 Red:120/255.0 Green:120/255.0 Blue:120/255.0 Alpha:0.2];
            [cell addSubview:innerView];
            
            rect = cell.frame;
            rect.size.height = height;
            cell.frame = rect;
        }
        //cell.textLabel.text = [[dataSourceArr objectAtIndex:indexPath.section] description];
    }
    return cell;
}
-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section {
    /*
     Create the section header views lazily.
     */
	SectionInfo *sectionInfo = [self.sectionInfoArray objectAtIndex:section];
    if (!sectionInfo.headerView) {
        
        sectionInfo.headerView = [[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.bounds.size.width, HEADER_HEIGHT) title:sectionInfo.dataSource.headerTitle section:section delegate:(id)self];
        sectionInfo.headerView.backgroundColor = [UIColor colorWithRed:243.0/255.0 green:243.0/255.0 
                                                                  blue:243.0/255.0 alpha:1.0];
    }
    
    return sectionInfo.headerView;
}
-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {
    
    SectionInfo *sectionInfo =  [self.sectionInfoArray objectAtIndex:indexPath.section];
    //return [[sectionInfo objectInRowHeightsAtIndex:indexPath.row] floatValue];

    CGFloat height = [[[sectionInfo dataSource] description] getHeightWithWidth:tableView.frame.size.width AndFont:[UIFont fontWithName:@"Helvetica-Light" size:13]];
    
    if(height<DEFAULT_ROW_HEIGHT)return DEFAULT_ROW_HEIGHT;
    else height+=40;
    return height;
    // Alternatively, return rowHeight.
}
#pragma mark Section header delegate


- (void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionOpened:(NSInteger)sectionOpened {
	
	SectionInfo *sectionInfo = [self.sectionInfoArray objectAtIndex:sectionOpened];
	
	sectionInfo.open = YES;
    
    /*
     Create an array containing the index paths of the rows to insert: These correspond to the rows for each quotation in the current section.
     */
    NSInteger countOfRowsToInsert = 1;
    NSMutableArray *indexPathsToInsert = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < countOfRowsToInsert; i++) {
        [indexPathsToInsert addObject:[NSIndexPath indexPathForRow:i inSection:sectionOpened]];
    }
    
    /*
     Create an array containing the index paths of the rows to delete: These correspond to the rows for each quotation in the previously-open section, if there was one.
     */
    NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
    
    NSInteger previousOpenSectionIndex = self.openSectionIndex;
    if (previousOpenSectionIndex != NSNotFound) {
		
        SectionInfo *previousOpenSection = [self.sectionInfoArray objectAtIndex:previousOpenSectionIndex];
        previousOpenSection.open = NO;
        [previousOpenSection.headerView toggleOpenWithUserAction:NO];
        NSInteger countOfRowsToDelete = 1;
        for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:previousOpenSectionIndex]];
        }
    }
    
    // Style the animation so that there's a smooth flow in either direction.
    UITableViewRowAnimation insertAnimation;
    UITableViewRowAnimation deleteAnimation;
    if (previousOpenSectionIndex == NSNotFound || sectionOpened < previousOpenSectionIndex) {
        insertAnimation = UITableViewRowAnimationTop;
        deleteAnimation = UITableViewRowAnimationBottom;
    }
    else {
        insertAnimation = UITableViewRowAnimationBottom;
        deleteAnimation = UITableViewRowAnimationTop;
    }
    
    // Apply the updates.
    [self beginUpdates];
    [self insertRowsAtIndexPaths:indexPathsToInsert withRowAnimation:insertAnimation];
    [self deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:deleteAnimation];
    [self endUpdates];
    self.openSectionIndex = sectionOpened;
    
}


-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionClosed:(NSInteger)sectionClosed {
    
    /*
     Create an array of the index paths of the rows in the section that was closed, then delete those rows from the table view.
     */
    SectionInfo *sectionInfo = [self.sectionInfoArray objectAtIndex:sectionClosed];	
    sectionInfo.open = NO;
    NSInteger countOfRowsToDelete = [self numberOfRowsInSection:sectionClosed];
    
    if (countOfRowsToDelete > 0) {
        NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:sectionClosed]];
        }
        [self deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:UITableViewRowAnimationTop];
    }
    self.openSectionIndex = NSNotFound;
}
@end
