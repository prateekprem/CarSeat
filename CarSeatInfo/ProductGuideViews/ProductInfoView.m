//
//  ProductInfoView.m
//  CarSeatInfo
//
//  Created by RAVI DAS on 18/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProductInfoView.h"
#import "ProductCell.h"
#import "ProductCellHeaderView.h"
#import "ProductInfo.h"


@interface ProductInfoView ()
-(void)createHeader;
@end

@implementation ProductInfoView
@synthesize tableDataArrayRef;



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        ProductInfoView *subView = [[[NSBundle mainBundle] loadNibNamed:@"ProductInfoView" owner:self options:nil]objectAtIndex:0];
        dataSourceArray = [[NSMutableArray alloc]init];
        subView.frame = self.bounds;
        [self addSubview:subView];
        [self addBorder:1 Red:131/255.0 Green:131/255.0 Blue:131/255.0 Alpha:1];
        [self loadDummyData];
    }
  return self;
}


-(void)loadDummyData
{
    
    ProductInfo *product;
    
    
    NSMutableDictionary *dic;
    
    //add first product..
    product = [[ProductInfo alloc]init] ;
    product.title = @"ABC";
    dic = [[NSMutableDictionary alloc]init];
    [dic setObject:@"ppp" forKey:@"Product Name"];
    [dic setObject:@"20pounds" forKey:@"Weight"];
    [dic setObject:@"20months" forKey:@"Age"];
    //product.records = [NSArray arrayWithObjects:dic, nil] ;
    //dic = nil;
    NSMutableDictionary *dic1 = [[NSMutableDictionary alloc]init];
    [dic1 setObject:@"ttt" forKey:@"Product Name"];
    [dic1 setObject:@"50pounds" forKey:@"Weight"];
    [dic1 setObject:@"70months" forKey:@"Age"];
    product.records = [NSArray arrayWithObjects:dic,dic1, nil] ;
    dic1 = nil;
    [dataSourceArray addObject:product];
    product = nil;
    
    //add second product..
    product = [[ProductInfo alloc]init] ;
    product.title = @"XYZ";
    dic = [[NSMutableDictionary alloc]init];
    [dic setObject:@"rrr" forKey:@"Product Name"];
    [dic setObject:@"25pounds" forKey:@"Weight"];
    [dic setObject:@"25months" forKey:@"Age"];
    [dic setObject:@"25$" forKey:@"Price"];
    product.records = [NSArray arrayWithObjects:dic, nil] ;
    dic = nil;
    
    [dataSourceArray addObject:product];
    product = nil;

    //add third product..
    product = [[ProductInfo alloc]init] ;
    product.title = @"PQR";
    dic = [[NSMutableDictionary alloc]init];
    [dic setObject:@"qqq" forKey:@"Product Name"];
    [dic setObject:@"30pounds" forKey:@"Weight"];
    [dic setObject:@"35months" forKey:@"Age"];
    [dic setObject:@"30$" forKey:@"Price"];
    [dic setObject:@"ttttt" forKey:@"Type"];
    product.records = [NSArray arrayWithObjects:dic, nil] ;
    dic = nil;
    
    [dataSourceArray addObject:product];
    product = nil;
    
    


    tableDataArrayRef = (NSArray *)[(ProductInfo *)[dataSourceArray objectAtIndex:0] records] ;
    
    [self createHeader];
}


-(void)createHeader
{
    

    float x=0;
    int margine = 5;
    int noOfItems = [dataSourceArray count];
    float headerWidth = (self.frame.size.width - (margine*(noOfItems-1)))/noOfItems;
    
    UIImage *selectedImg   = [UIImage imageNamed:@"btn_dropdown_selected_L_ipad"];
    UIImage *deSelectedImg = [UIImage imageNamed:@"btn_dropdown_unselected_L_ipad"];
    int tag = 0;
    for(ProductInfo *p in dataSourceArray)
    {
        //UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(x, 0, selectedImg.size.width, selectedImg.size.height)];
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(x, 0, headerWidth, headerView.frame.size.height)];
        [btn setImage:selectedImg forState:UIControlStateSelected];
        [btn setImage:deSelectedImg forState:UIControlStateNormal];
        
        UILabel *label = [[UILabel alloc]initWithFrame:btn.bounds];      
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0];
        label.textColor = [UIColor blackColor];
        label.textAlignment = UITextAlignmentCenter;
        label.text = p.title;
        [btn addSubview:label];
        label = nil;
        //btn.titleLabel.textColor = [UIColor blackColor];
        //btn.titleLabel.text = p.title;
        //[btn setTitle:p.title forState:UIControlStateNormal];
        //[btn setTitle:p.title forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(productSelected:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = tag++;
        [headerView addSubview:btn];
        x += btn.frame.size.width+margine;
        
        btn = nil;
    }
}


-(NSArray *)sortWithKey:(NSString *)sortKey Order:(BOOL)order
{
    NSSortDescriptor *alphaDesc = [[NSSortDescriptor alloc] initWithKey:sortKey ascending:order];
    
    NSMutableArray *tmpArray = [tableDataArrayRef mutableCopy];
    [tmpArray sortUsingDescriptors:[NSArray arrayWithObject:alphaDesc]];
    
    return (NSArray *)tmpArray;
}

-(void)selectedFieldIndex:(int)index Order:(int)order
{
    
    NSString *sortKey = [[[tableDataArrayRef objectAtIndex:0] allKeys] objectAtIndex:index];
    
    
     tableDataArrayRef = [self sortWithKey:sortKey Order:order];
    [productTableView reloadData];
}


-(IBAction)productSelected:(id)sender
{
    tableDataArrayRef = [[dataSourceArray objectAtIndex:[sender tag]] records];
    [productTableView reloadData];
}


#pragma mark --------- Table View Delegate ----------------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableDataArrayRef count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    if(!view)
        view = [[ProductCellHeaderView alloc]initWithFrame:CGRectMake(0,0, tableView.frame.size.width, 50.0) andDataSource:[tableDataArrayRef objectAtIndex:0]];
    else
    {
        for(UIView *v in view.subviews)
            [v removeFromSuperview];
        [view createHeaderWithData:[tableDataArrayRef objectAtIndex:0]];
    }
    
    view.delegate = self;
    
    CGRect rect = productTableView.frame;
    if(rect.size.width < view.frame.size.width)
    {    
        rect.size.width = view.frame.size.width;
        productTableView.frame = rect;
        
        [productTableView setContentSize:CGSizeMake(rect.size.width+self.frame.origin.x,productTableView.contentSize.height)];
    }
    [view setNeedsDisplay];
    return view;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"ProductCell"; 
    productCell  = (ProductCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //if (productCell == nil) 
    {
        productCell = [[ProductCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        
    }
    
    if([tableDataArrayRef count]>indexPath.row)
    {
        
        
        [productCell setDataSource:[tableDataArrayRef objectAtIndex:indexPath.row]];
        
        //To set disclouser button...
        //skillCategoryCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return (UITableViewCell*)productCell;
    
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
