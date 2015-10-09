//
//  UIBreakTextField.m
//  UItextFieldText
//
//  Created by 戚小建 on 15/9/22.
//  Copyright (c) 2015年 jianke. All rights reserved.
//

#import "UITruncatingTextField.h"

@implementation UITruncatingTextField

/**/
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    
//    
//    
//}

- (void)becomeTruncatingMode
{
    if (_label == nil) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEndBeginEditing:) name:UITextFieldTextDidEndEditingNotification object:nil];
        [self addObserver:self forKeyPath:@"text" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        _label.font = self.font;
        _label.textColor = [UIColor colorWithCGColor:self.textColor.CGColor];
        _label.backgroundColor = [UIColor clearColor];
        
        _label.userInteractionEnabled = NO;
        _label.text = self.text;
        _label.hidden = !_truncatingmode;
        [self addSubview:_label];
    }
    
    _label.lineBreakMode = _lineBreakMode;
    [self showLabel];
    _truncatingmode = YES;
    
    [self resignFirstResponder];
}

- (void)becomeNormalMode
{
    [self hideLabel];
    _truncatingmode = NO;
}

#pragma mark -
- (void)showLabel
{
    _label.hidden = NO;
    self.textColor = [UIColor clearColor];
}

- (void)hideLabel
{
    _label.hidden = YES;
    self.textColor = [UIColor colorWithCGColor:_label.textColor.CGColor];
    
}

- (void)textDidChange:(NSNotification *)notification
{
    if (notification.object == self) {
        _label.text = self.text;
    }
    
}
- (void)didBeginEditing:(NSNotification *)notification
{
    if (notification.object == self) {
        [self hideLabel];
    }
    
}

- (void)didEndBeginEditing:(NSNotification *)notification
{
    if (notification.object == self) {
        if (_truncatingmode) {
            [self showLabel];
        }
    }
    
}
#pragma mark - kvo /kvc
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context

{
    _label.text = self.text;
}

- (void)dealloc
{
//    [self removeObserver:self forKeyPath:@"text" context:nil];
    
    
}
@end
