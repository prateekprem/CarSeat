//
//  DBFile.h



#import <Foundation/Foundation.h>
#import <sqlite3.h>


@interface DBFile : NSObject {


	sqlite3 *dbConnection;
   
}

+(void)createDBcopy:(NSString*)fileName;
+ (NSString *) getDBPath:(NSString *)fileName;
+(NSArray *) getData :(NSString*)query;
+ (void)openDb:(NSString *)fileName;
+(BOOL) executeQuery:(NSString*)query;
+(NSArray *)getAllTables;
@end
