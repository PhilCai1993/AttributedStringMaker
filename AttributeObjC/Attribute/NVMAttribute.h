//
//  NVMAttribute.h
//  Attribute
//
//  Created by PhilCai on 4/21/16.
//  Copyright © 2016 Phil. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NVMAttribute;

typedef NVMAttribute*(^NVMAttributeFontBlock)(UIFont *);
typedef NVMAttribute*(^NVMAttributeColorBlock)(UIColor *);
typedef NVMAttribute*(^NVMAttributeFloatBlock)(CGFloat);
typedef NVMAttribute*(^NVMAttributeShadowBlock)(NSShadow *) ;
typedef NVMAttribute*(^NVMAttributeStringBlock)(NSString *);
typedef NVMAttribute*(^NVMAttributeAttachmentBlock)(NSTextAttachment *) ;
typedef NVMAttribute*(^NVMAttributeRangeBlock)(NSRange);

typedef NVMAttribute*(^NVMAttributeIntBlock)(NSInteger);
typedef NVMAttribute*(^NVMAttributeIntIntBlock)(NSInteger, NSInteger);

@interface NVMAttribute : NSObject

- (instancetype)initWithString:(NSString *)string;

@property (nonatomic, strong) NSMutableAttributedString *string;

- (NVMAttributeFontBlock)font;
- (NVMAttributeColorBlock)textColor;
- (NVMAttributeColorBlock)backgroundColor;
- (NVMAttributeColorBlock)strokeColor;
- (NVMAttributeFloatBlock)strokeWidth;
- (NVMAttributeIntBlock)ligature;
- (NVMAttributeFloatBlock)kern;
- (NVMAttributeIntBlock)strikethroughStyle;
- (NVMAttributeIntBlock)underlineStyle;
- (NVMAttributeShadowBlock)shadow;
- (NVMAttributeStringBlock)textEffectLetterPress;
- (NVMAttributeAttachmentBlock)attachment;
- (NVMAttributeStringBlock)link;
- (NVMAttributeFloatBlock)offset;
- (NVMAttributeColorBlock)underlineColor;
- (NVMAttributeColorBlock)strikethroughColor;
- (NVMAttributeFloatBlock)oblique;
- (NVMAttributeFloatBlock)expand;
- (NVMAttributeIntBlock)writingDirection;
- (NVMAttributeIntBlock)verticalGlyphForm;

- (NVMAttributeRangeBlock)range;
/// 和range作用相同
- (NVMAttributeIntIntBlock)fromTo;

- (NVMAttributeIntBlock)from;
- (NVMAttributeIntBlock)to;

/// 正则匹配所有的
- (NVMAttributeStringBlock)pattern;

@end
