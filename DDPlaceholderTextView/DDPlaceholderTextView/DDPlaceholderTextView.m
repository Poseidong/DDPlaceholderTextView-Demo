//
//  DDPlaceholderTextView.m
//  DDPlaceholderTextView
//
//  Created by Poseidon on 2017/12/12.
//  Copyright © 2017年 Poseidon. All rights reserved.
//

#import "DDPlaceholderTextView.h"

@implementation DDPlaceholderTextView
#pragma mark - drawRect
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    if ([self.text length] == 0 && self.placeHolder) {
        //没有输入并且placeHolder不为空时 重绘
        //段落格式
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        paragraphStyle.alignment = self.textAlignment;
        
        //字号
        UIFont *font = [UIFont systemFontOfSize:17];
        if (self.font) {
            font = self.font;
        }
        
        NSDictionary *attributes = @{NSFontAttributeName:font,
                                     NSParagraphStyleAttributeName:paragraphStyle,
                                     NSForegroundColorAttributeName:self.placeHolderTextColor
                                     };
        
        CGRect placeholderRect = CGRectMake(5.f, 7.f, rect.size.width-10, rect.size.height-14);
        [self.placeHolder drawInRect:placeholderRect withAttributes:attributes];
    }
}

#pragma mark - setMethod
- (void)setPlaceHolder:(NSString *)placeHolder
{
    if ([placeHolder isEqualToString:_placeHolder]) {
        return;
    }
    _placeHolder = placeHolder;
    [self setNeedsDisplay];
}

- (void)setPlaceHolderTextColor:(UIColor *)placeHolderTextColor
{
    if ([placeHolderTextColor isEqual:_placeHolderTextColor]) {
        return;
    }
    _placeHolderTextColor = placeHolderTextColor;
    [self setNeedsDisplay];
}

#pragma mark - init
- (id)init
{
    self = [super init];
    if(self) {
        [self initState];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        [self initState];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initState];
}

- (void)initState
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textViewTextDidChangeNotification) name:UITextViewTextDidChangeNotification
                                               object:nil];
    self.placeHolder = nil;
    self.placeHolderTextColor = [UIColor lightGrayColor];
}

#pragma mark - nitification
- (void)textViewTextDidChangeNotification
{
    [self setNeedsDisplay];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
