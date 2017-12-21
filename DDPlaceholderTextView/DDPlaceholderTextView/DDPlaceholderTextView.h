//
//  DDPlaceholderTextView.h
//  DDPlaceholderTextView
//
//  Created by Poseidon on 2017/12/12.
//  Copyright © 2017年 Poseidon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDPlaceholderTextView : UITextView

/**
 *  The text to be displayed when the text view is empty. The default value is `nil`.
 */
@property (copy, nonatomic) NSString *placeHolder;

/**
 *  The color of the place holder text. The default value is `[UIColor lightGrayColor]`.
 */
@property (strong, nonatomic) UIColor *placeHolderTextColor;

@end
