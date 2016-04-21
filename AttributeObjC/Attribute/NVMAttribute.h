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

typedef NVMAttribute*(^NVMAttributeRangeBlock)(NSRange);
typedef NVMAttribute*(^NVMAttributeIntBlock)(NSUInteger);
typedef NVMAttribute*(^NVMAttributeIntIntBlock)(NSUInteger, NSUInteger);

@interface NVMAttribute : NSObject

- (instancetype)initWithString:(NSString *)string;

@property (nonatomic, strong) NSMutableAttributedString *string;

- (NVMAttributeFontBlock)font;
- (NVMAttributeColorBlock)textColor;
- (NVMAttributeColorBlock)backgroundColor;
- (NVMAttributeColorBlock)strokeColor;
- (NVMAttributeFloatBlock)strokeWidth;

- (NVMAttributeRangeBlock)range;
/// 和range作用相同
- (NVMAttributeIntIntBlock)fromTo;

- (NVMAttributeIntBlock)from;
- (NVMAttributeIntBlock)to;


@end
