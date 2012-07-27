//
//  supp2SearchVC.h
//  bcrfa01
//
//  Created by A M on 11-12-30.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface supp2SearchVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UISearchBar *suppSearchBar;
@property (weak, nonatomic) IBOutlet UITableView *suppTableView;



@end
