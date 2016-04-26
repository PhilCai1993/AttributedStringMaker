//
//  NSString+NVMAttribute.m
//  Attribute
//
//  Created by PhilCai on 4/21/16.
//  Copyright © 2016 Phil. All rights reserved.
//

#import "NSString+NVMAttribute.h"
#import <objc/runtime.h>
#import "NVMAttribute.h"

@implementation NSString (NVMAttribute)

- (NVMAttribute *)attribute {
  NVMAttribute *attribute = objc_getAssociatedObject(self, _cmd);
  if (!attribute) {
    attribute = [[NVMAttribute alloc] initWithString:self];
    objc_setAssociatedObject(self, _cmd, attribute, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  }
  return attribute;
}

- (NVMAttributeFontBlock)font {
  return self.attribute.font;
}

- (NVMAttributeColorBlock)textColor {
  return self.attribute.textColor;
}

- (NVMAttributeColorBlock)backgroundColor {
  return self.attribute.backgroundColor;
}

- (NVMAttributeColorBlock)strokeColor {
  return self.attribute.strokeColor;
}

- (NVMAttributeFloatBlock)strokeWidth {
  return self.attribute.strokeWidth;
}

- (NVMAttributeIntBlock)ligature {
  return self.attribute.ligature;
}

- (NVMAttributeFloatBlock)kern {
  return self.attribute.kern;
}

- (NVMAttributeIntBlock)strikethroughStyle {
  return self.attribute.strikethroughStyle;
}

- (NVMAttributeIntBlock)underlineStyle {
  return self.attribute.underlineStyle;
}

- (NVMAttributeShadowBlock)shadow {
  return self.attribute.shadow;
}

- (NVMAttributeStringBlock)textEffectLetterPress {
  return self.attribute.textEffectLetterPress;
}

- (NVMAttributeAttachmentBlock)attachment {
  return self.attribute.attachment;
}

- (NVMAttributeStringBlock)link {
  return self.attribute.link;
}

- (NVMAttributeFloatBlock)offset {
  return self.attribute.offset;
}

- (NVMAttributeColorBlock)underlineColor {
  return self.attribute.underlineColor;
}

- (NVMAttributeColorBlock)strikethroughColor {
  return self.attribute.strikethroughColor;
}

- (NVMAttributeFloatBlock)oblique {
  return self.attribute.oblique;
}

- (NVMAttributeFloatBlock)expand {
  return self.attribute.expand;
}

- (NVMAttributeIntBlock)writingDirection {
  return self.attribute.writingDirection;
}

- (NVMAttributeIntBlock)verticalGlyphForm {
  return self.attribute.verticalGlyphForm;
}

- (NVMAttributeRangeBlock)range {
  return self.attribute.range;
}
/// 和range作用相同
- (NVMAttributeIntIntBlock)fromTo {
  return self.attribute.fromTo;
}

- (NVMAttributeIntBlock)from {
  return self.attribute.from;
}

- (NVMAttributeIntBlock)to {
  return self.attribute.to;
}

- (NVMAttributeStringBlock)pattern {
  return self.attribute.pattern;
}

@end
