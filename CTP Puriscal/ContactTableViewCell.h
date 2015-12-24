//
//  ContactTableViewCell.h
//  CTP Puriscal
//
//  Created by user on 12/23/15.
//  Copyright © 2015 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblOptionName;
@property (weak, nonatomic) IBOutlet UILabel *lblOptionDetail;
@property (weak, nonatomic) IBOutlet UILabel *lblOptionActionName;
@property (weak, nonatomic) IBOutlet UIImageView *imgOption;

@end
