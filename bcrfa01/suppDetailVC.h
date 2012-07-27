//
//  suppDetailVC.h
//  bcrfa01
//
//  Created by A M on 11-12-30.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface suppDetailVC : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *suppImg;
@property (weak, nonatomic) IBOutlet UILabel *suppAdd1;
@property (weak, nonatomic) IBOutlet UILabel *suppAdd2;
@property (weak, nonatomic) IBOutlet UILabel *suppAdd3;
@property (weak, nonatomic) IBOutlet UILabel *suppTel;
@property (weak, nonatomic) IBOutlet UILabel *suppEmail;
@property (weak, nonatomic) IBOutlet UILabel *suppURL;
@property (weak, nonatomic) IBOutlet UITextView *suppText;


@end
