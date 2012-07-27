//
//  ModelController.m
//  bcrfa01
//
//  Created by A M on 11-12-31.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ModelController.h"

#import "webOrpdfViewController.h"

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; 
 it therefore implements pageViewController:viewControllerBeforeViewController: 
 and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, 
 viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

@interface ModelController()
@property (readonly, strong, nonatomic) NSArray *pageData;
@end

//==============================================================================
@implementation ModelController
@synthesize pageData = _pageData;
//@synthesize callingButton = _callingButton;

static ModelController *sharedMagazineModelController = nil;
//==============================================================================
+(ModelController *)getSingleton
{
    if(sharedMagazineModelController != nil)
    {
        NSLog(@"%s %d %s", __FILE__, __LINE__, __PRETTY_FUNCTION__);
        return sharedMagazineModelController;
    }
    @synchronized(self)
    {
        if(sharedMagazineModelController == nil)
        {
            NSLog(@"%s %d %s", __FILE__, __LINE__, __PRETTY_FUNCTION__);
            sharedMagazineModelController = [[self alloc] init];
        }
    }
    
    return sharedMagazineModelController;
}
//==============================================================================
+(id)alloc
{
	@synchronized([sharedMagazineModelController class])
    {
        NSLog(@"%s %d %s", __FILE__, __LINE__, __PRETTY_FUNCTION__);
        NSAssert(sharedMagazineModelController == nil, @"Attempted to allocate a second instance of a singleton.");
        sharedMagazineModelController = [super alloc];
        return sharedMagazineModelController;
    }
	NSLog(@"%s %d %s", __FILE__, __LINE__, __PRETTY_FUNCTION__);
	return nil;
}
//==============================================================================
- (id)init
{
    self = [super init];
    if (sharedMagazineModelController != nil) 
    {
        
        NSLog(@"WARNING: Datamodels may not have been set as yet");
    }
    NSLog(@"%s %d %s", __FILE__, __LINE__, __PRETTY_FUNCTION__);

    return self;
}
//==============================================================================
-(void)setDataModelFor:(UIButton*)button
{
    if(button.tag == 0 )
    { 
        NSLog(@"ModelViewController says the tag of the calling button is %d", button.tag);
        //read the contents of the property list and add it to an array
        NSString *errorDesc = nil;
        NSPropertyListFormat format;
        NSString *plistPath;
        NSString *rootPath = [NSSearchPathForDirectoriesInDomains
                              (NSDocumentDirectory,                                                                  NSUserDomainMask, YES) objectAtIndex:0];
        plistPath = [rootPath stringByAppendingPathComponent:@"pagesMagazine0.plist"];
        if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) 
        {
            plistPath = [[NSBundle mainBundle] 
                         pathForResource:@"pagesMagazine0" ofType:@"plist"];
        }
        NSData *plistXML = [[NSFileManager defaultManager] 
                            contentsAtPath:plistPath];
        _pageData = (NSArray*)[NSPropertyListSerialization propertyListFromData:plistXML
                                              mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                              format:&format
                                              errorDescription:&errorDesc];
               
        if (_pageData!= nil)
        {
            for (id obj in _pageData)
                NSLog(@"_pageData obj: %@", obj);
        }
        else
        {
            NSLog(@"WARNING _pageData array is nil!!");
        }
        NSLog(@"%s %d %s", __FILE__, __LINE__, __PRETTY_FUNCTION__);
        
    }
    if(button.tag == 1 )
    {
        NSLog(@"ModelController says the tag of the calling button is %d", button.tag);
        //read the contents of the property list and add it to an array
        NSString *errorDesc = nil;
        NSPropertyListFormat format;
        NSString *plistPath;
        NSString *rootPath = [NSSearchPathForDirectoriesInDomains
                              (NSDocumentDirectory,                                                                  NSUserDomainMask, YES) objectAtIndex:0];
        plistPath = [rootPath stringByAppendingPathComponent:@"pagesMagazine0.plist"];
        if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) 
        {
            plistPath = [[NSBundle mainBundle] 
                         pathForResource:@"pagesMagazine1" ofType:@"plist"];
        }
        NSData *plistXML = [[NSFileManager defaultManager] 
                            contentsAtPath:plistPath];
        _pageData = (NSArray*)[NSPropertyListSerialization propertyListFromData:plistXML
                                                               mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                                                         format:&format
                                                               errorDescription:&errorDesc];

        if (_pageData!= nil)
        {
            for (id obj in _pageData)
                NSLog(@"_pageData obj: %@", obj);
        }
        else
        {
            NSLog(@"WARNING _pageData array is nil!!");
        }
        NSLog(@"%s %d %s", __FILE__, __LINE__, __PRETTY_FUNCTION__);
    }

}
//==============================================================================
//This is the web or pdf view implementation

- (webOrpdfViewController *)viewControllerAtIndex:(NSUInteger)index 
                                   storyboard:(UIStoryboard *)storyboard
{   
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) 
    {
        NSLog(@"%s %d %s", __FILE__, __LINE__, __PRETTY_FUNCTION__);
        return nil;
    }
    //for the uiweb or pdf view controller this is the implementation
    webOrpdfViewController *wpdfvc = [storyboard instantiateViewControllerWithIdentifier:@"webOrpdfViewController"];
    
    wpdfvc.dataObject = [self.pageData objectAtIndex:index];
    
    
    
    NSLog(@"%s %d %s", __FILE__, __LINE__, __PRETTY_FUNCTION__);
    return wpdfvc;
}



//==============================================================================

- (NSUInteger)indexOfViewController:(webOrpdfViewController *)viewController
{   
    /*
     Return the index of the given data view controller.
     For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
     */
     NSLog(@"%s %d %s", __FILE__, __LINE__, __PRETTY_FUNCTION__);
    return [self.pageData indexOfObject:viewController.dataObject];
}
    //==============================================================================
#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(webOrpdfViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) 
    {
        return nil;
    }
    
    index--;
     NSLog(@"%s %d %s", __FILE__, __LINE__, __PRETTY_FUNCTION__);
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}
    //==============================================================================
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(webOrpdfViewController *)viewController];
    if (index == NSNotFound) 
    {
        NSLog(@"%s %d %s", __FILE__, __LINE__, __PRETTY_FUNCTION__);
        return nil;
    }
    
    index++;
    if (index == [self.pageData count]) 
    {
        NSLog(@"%s %d %s", __FILE__, __LINE__, __PRETTY_FUNCTION__);
        return nil;
    }
    
     NSLog(@"%s %d %s", __FILE__, __LINE__, __PRETTY_FUNCTION__);
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}
    //==============================================================================
@end
