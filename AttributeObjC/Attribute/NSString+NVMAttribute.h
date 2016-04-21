//
//  NSString+NVMAttribute.h
//  Attribute
//
//  Created by PhilCai on 4/21/16.
//  Copyright © 2016 Phil. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NVMAttribute.h"

@interface NSString (NVMAttribute)

- (NVMAttribute *)attribute;

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
