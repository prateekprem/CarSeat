

#import "DBFile.h"
#import "TouchSQL.h"


//static sqlite3 *database = nil;
//static NSString *dataBPath;
//static sqlite3 *wordTable;
//static sqlite3_stmt *selectstmt;

static CSqliteDatabase *db;


@implementation DBFile


+(void)createDBcopy:(NSString*)fileName
{
	// Check if the SQL database has already been saved to the users phone, if not then copy it over
	BOOL success;
	
	// Create a FileManager object, we will use this to check the status
	// of the database and to copy it over if required
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSArray *paths =NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *DBPath=[documentsDirectory stringByAppendingPathComponent:fileName];
	// Check if the database has already been created in the users filesystem
	success = [fileManager fileExistsAtPath:DBPath];
	
	// If the database already exists then return without doing anything
    if(success) return;
	
	// If not then proceed to copy the database from the application to the users filesystem
	// Get the path to the database in the application package
	NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];
	
	// Copy the database from the package to the users filesystem
	[fileManager copyItemAtPath:databasePathFromApp toPath:DBPath error:nil];
	
	[fileManager release];
	
}


+ (void)openDb:(NSString *)fileName
{
    if(!db)
    {
        [self createDBcopy:fileName];
        db = [[CSqliteDatabase alloc] initInMemory] ;
        [db open:fileName outError:NULL];
        
    }
	

}
	

+ (NSString *) getDBPath:(NSString *)fileName {
	
	//Search for standard documents using NSSearchPathForDirectoriesInDomains
	//First Param = Searching the documents directory
	//Second Param = Searching the Users directory and not the System
	//Expand any tildes and identify home directories.
	//NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
//	NSString *documentsDir = [paths objectAtIndex:0];
//	return [documentsDir stringByAppendingPathComponent:@"DICT.db"];
	
	NSString *path=[NSString stringWithFormat:@"%@/%@",[[NSBundle mainBundle]resourcePath],fileName];
	return path;
}


	
+(NSArray *) getData :(NSString*)query
{
	//[DataBase lockme:theDBLock];
	
	
	NSError *err = NULL;
	NSArray *rows = [[db rowsForExpression:query error:&err] mutableCopy];
	NSLog(@"%@", err);
	
    for(NSMutableDictionary *dic in rows)
    {
        dic = (NSMutableDictionary*)[dic mutableCopy];
        for(NSString *key in [dic allKeys])
            if(![dic valueForKey:key])
            {
                [dic removeObjectForKey:key
                 ];
                [dic setObject:@" " forKey:key];
            }
    }
    
	//for returning array....  Hide this line if need only string or single word.....
	return rows;
	
}

+(BOOL) executeQuery:(NSString*)query
{
    
    
	
	NSError *err = NULL;
	BOOL error = [db executeExpression:query error:&err];
    
    [db commit];
    return error;
}
	

+(NSArray *)getAllTables
{
    NSString *query = @"SELECT name FROM sqlite_master WHERE type = 'table'";
    return [self getData:query];
}


+(NSArray*)getAllColumnsForTable:(NSString*)tableName
{

    NSString *query = [NSString stringWithFormat:@"PRAGMA table_info(%@)",tableName];
    return [self getData:query];
    
   
}







@end
