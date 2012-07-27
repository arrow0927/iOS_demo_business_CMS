//
//  ModelController.h
//  bcrfa01
//
//  Created by A M on 11-12-31.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//
/*
 
 This is a singleton that acts as the data source for the magazines that will be displayed. It is accessed and modified by several view controllers
 
 */

#import <Foundation/Foundation.h>
@class DataViewController;
@class webOrpdfViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>



+(ModelController *)getSingleton;

-(webOrpdfViewController*)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
-(void)setDataModelFor:(UIButton*)button;
- (NSUInteger)indexOfViewController:(webOrpdfViewController *)viewController;
@end
