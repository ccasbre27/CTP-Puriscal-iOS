//
//  CareerDetailViewController.h
//  CTP Puriscal
//
//  Created by user on 12/19/15.
//  Copyright © 2015 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CareerDetailViewController : UIViewController

@property (nonatomic) long indexSelected;
@property (weak, nonatomic) IBOutlet UILabel *lblIntroduction;
@property (weak, nonatomic) IBOutlet UILabel *lblRequirements;
@property (weak, nonatomic) IBOutlet UILabel *lblProfesionalProfile;
@property (weak, nonatomic) IBOutlet UILabel *lblWorkPlace;
@property (weak, nonatomic) IBOutlet UILabel *lblSubjectsFirstYear;
@property (weak, nonatomic) IBOutlet UILabel *lblSubjectsSecondYear;
@property (weak, nonatomic) IBOutlet UILabel *lblSubjectsThirdYear;

@end
