//
//  OptionTableViewCell.m
//  CTP Puriscal
//
//  Created by user on 12/18/15.
//  Copyright © 2015 user. All rights reserved.
//

#import "OptionTableViewCell.h"

@implementation OptionTableViewCell

- (void)setFrame:(CGRect)frame {
    frame.origin.x += 15;
    frame.size.width -= 2 * 15;
    [super setFrame:frame];
}

@end
