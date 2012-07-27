//
//  CustomCell.h
//  bcrfa01
//
//  Created by A M on 12-01-14.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *hoursLabel;

@property (weak, nonatomic) IBOutlet UILabel *cuisineLabel;


@end
