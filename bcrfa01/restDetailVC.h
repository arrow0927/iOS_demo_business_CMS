//
//  restDetailVC.h
//  bcrfa01
//
//  Created by A M on 11-12-28.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface restDetailVC : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *restImg;
@property (weak, nonatomic) IBOutlet UILabel *Address1;
@property (weak, nonatomic) IBOutlet UILabel *Address2;
@property (weak, nonatomic) IBOutlet UILabel *Address3;
@property (weak, nonatomic) IBOutlet UILabel *telephone;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *url;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) id detailItem;

@end
