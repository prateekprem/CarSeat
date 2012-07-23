//
//  DBController.m
//  CarSeatInfo
//
//  Created by kiwitech on 23/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "FAQ.h"
#import "DBFile.h"
#import "DetailedTableDataSource.h"
#import "DBController.h"

@implementation DBController
+(NSMutableArray*)getFAQs
{
    DetailedTableDataSource *obj; 
    NSArray *array= [DBFile getData:[NSString stringWithFormat:@"select faq_id, question, answer  from faq"]];
    NSMutableArray *tmpArray = [[NSMutableArray alloc]init];
    for(NSDictionary *dic in array)
    {
        NSLog(@"%@",dic);
        obj = [[DetailedTableDataSource alloc]init];
        obj.description         = [dic objectForKey:@"question"];
        obj.headerTitle   = [dic objectForKey:@"answer"];
        [tmpArray addObject:obj];
    }
    return tmpArray;
}
@end
