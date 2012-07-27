//
//  DBController.h
//  bcrfa01
//
//  Created by A M on 12-01-10.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "RestaurantObj.h"


@interface DBController : NSObject

@property(nonatomic, copy) NSString *dbName, *dbPath;
@property(nonatomic, retain)NSMutableArray *items;



-(id)initWithDB:(NSString*)_dbName;
-(void)printContentsOfArray;

@end
