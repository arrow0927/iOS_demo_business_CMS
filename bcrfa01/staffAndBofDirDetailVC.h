//
//  staffAndBofDirDetailVC.h
//  bcrfa01
//
//  Created by A M on 12-01-02.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface staffAndBofDirDetailVC : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *detailImage;
@property (weak, nonatomic) IBOutlet UILabel *address1;
@property (weak, nonatomic) IBOutlet UILabel *address2;
@property (weak, nonatomic) IBOutlet UILabel *address3;
@property (weak, nonatomic) IBOutlet UILabel *tel;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UITextView *descriptionText;
@property (strong, nonatomic) NSIndexPath * indexPath;
@end
