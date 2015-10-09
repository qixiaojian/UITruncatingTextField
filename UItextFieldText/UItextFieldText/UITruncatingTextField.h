//
//  UIBreakTextField.h
//  UItextFieldText
//
//  Created by 戚小建 on 15/9/22.
//  Copyright (c) 2015年 jianke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITruncatingTextField : UITextField
{
    UILabel *_label;
    BOOL _truncatingmode;
}

@property(nonatomic) NSLineBreakMode lineBreakMode;

- (void)becomeTruncatingMode;
- (void)becomeNormalMode;


@end
