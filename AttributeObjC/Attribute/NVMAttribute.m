//
//  NVMAttribute.m
//  Attribute
//
//  Created by PhilCai on 4/21/16.
//  Copyright © 2016 Phil. All rights reserved.
//

#import "NVMAttribute.h"

@interface NVMAttribute()

@property(nonatomic, strong) NSMutableArray<NSValue *> *ranges;

@end

@implementation NVMAttribute

#pragma mark - Init

- (instancetype)initWithString:(NSString *)string {
  if (self = [super init]) {
    _string = [[NSMutableAttributedString alloc] initWithString:string];
    _ranges = [NSMutableArray arrayWithObject:[NSValue valueWithRange:NSMakeRange(0, string.length)]];
  }
  return self;
}

- (NSMutableArray<NSValue *> *)ranges {
  if (!_ranges) {
    _ranges = [NSMutableArray array];
  }
  return _ranges;
}

#pragma mark - Attributes

- (NVMAttributeFontBlock)font {
  return ^NVMAttribute *(UIFont *font) {
    [self setValue:font forAttribute:NSFontAttributeName];
    return self;
  };
}

- (NVMAttributeColorBlock)textColor {
  return ^NVMAttribute *(UIColor *textColor) {
    [self setValue:textColor forAttribute:NSForegroundColorAttributeName];
    return self;
  };
}

- (NVMAttributeColorBlock)backgroundColor {
  return ^NVMAttribute *(UIColor *backgroundColor) {
    [self setValue:backgroundColor forAttribute:NSBackgroundColorAttributeName];
    return self;
  };
}

- (NVMAttributeColorBlock)strokeColor {
  return ^NVMAttribute *(UIColor *strokeColor) {
    [self setValue:strokeColor forAttribute:NSStrokeColorAttributeName];
    return self;
  };
}

- (NVMAttributeFloatBlock)strokeWidth {
  return ^NVMAttribute *(CGFloat width) {
    [self setValue:@(width) forAttribute:NSStrokeWidthAttributeName];
    return self;
  };
}

- (NVMAttributeIntBlock)ligature {
  return ^NVMAttribute *(NSInteger ligature) {
    [self setValue:@(ligature) forAttribute:NSLigatureAttributeName];
    return self;
  };
}

- (NVMAttributeFloatBlock)kern {
  return ^NVMAttribute *(CGFloat kern) {
    [self setValue:@(kern) forAttribute:NSKernAttributeName];
    return self;
  };
}

- (NVMAttributeIntBlock)strikethroughStyle {
  return ^NVMAttribute *(NSUnderlineStyle style) {
    [self setValue:@(style) forAttribute:NSStrikethroughStyleAttributeName];
    return self;
  };
}

- (NVMAttributeIntBlock)underlineStyle {
  return ^NVMAttribute *(NSUnderlineStyle style) {
    [self setValue:@(style) forAttribute:NSUnderlineStyleAttributeName];
    return self;
  };
}

- (NVMAttributeShadowBlock)shadow {
  return ^NVMAttribute *(NSShadow *shadow) {
    [self setValue:shadow forAttribute:NSShadowAttributeName];
    return self;
  };
}

- (NVMAttributeStringBlock)textEffectLetterPress {
  return ^NVMAttribute *(NSString *effect) {
    [self setValue:effect forAttribute:NSTextEffectAttributeName];
    return self;
  };
}

- (NVMAttributeAttachmentBlock)attachment {
  return ^NVMAttribute *(NSTextAttachment *attachment) {
    [self setValue:attachment forAttribute:NSAttachmentAttributeName];
    return self;
  };
}

- (NVMAttributeStringBlock)link {
  return ^NVMAttribute *(NSString *link) {
    [self setValue:link forAttribute:NSLinkAttributeName];
    return self;
  };
}

- (NVMAttributeFloatBlock)offset {
  return ^NVMAttribute *(CGFloat offset) {
    [self setValue:@(offset) forAttribute:NSBaselineOffsetAttributeName];
    return self;
  };
}

- (NVMAttributeColorBlock)underlineColor {
  return ^NVMAttribute *(UIColor *color) {
    [self setValue:color forAttribute:NSUnderlineColorAttributeName];
    return self;
  };
}

- (NVMAttributeColorBlock)strikethroughColor {
  return ^NVMAttribute *(UIColor *color) {
    [self setValue:color forAttribute:NSStrikethroughColorAttributeName];
    return self;
  };
}

- (NVMAttributeFloatBlock)oblique {
  return ^NVMAttribute *(CGFloat oblique) {
    [self setValue:@(oblique) forAttribute:NSObliquenessAttributeName];
    return self;
  };
}

- (NVMAttributeFloatBlock)expand {
  return ^NVMAttribute *(CGFloat expand) {
    [self setValue:@(expand) forAttribute:NSExpansionAttributeName];
    return self;
  };
}

- (NVMAttributeIntBlock)writingDirection {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
  return ^NVMAttribute *(NSTextWritingDirection direction) {
    [self setValue:@(direction) forAttribute:NSWritingDirectionAttributeName];
    return self;
  };
#pragma clang diagnostic pop
}

- (NVMAttributeIntBlock)verticalGlyphForm {
  return ^NVMAttribute *(NSInteger glyph) {
    [self setValue:@(glyph) forAttribute:NSVerticalGlyphFormAttributeName];
    return self;
  };
}

#pragma mark - Range

- (NVMAttributeRangeBlock)range {
  return ^NVMAttribute *(NSRange range) {
    [self.ranges removeAllObjects];
    [self.ranges addObject:[NSValue valueWithRange:range]];
    return self;
  };
}

- (NVMAttributeIntIntBlock)fromTo {
  return ^NVMAttribute *(NSInteger from, NSInteger to) {
    [self.ranges removeAllObjects];
    [self.ranges addObject:[NSValue valueWithRange:NSMakeRange(from, to - from)]];
    return self;
  };
}

- (NVMAttributeIntBlock)from {
  return ^NVMAttribute *(NSInteger from) {
    [self.ranges removeAllObjects];
    [self.ranges addObject:[NSValue valueWithRange:NSMakeRange(from, self.string.length - from)]];
    return self;
  };
}

- (NVMAttributeIntBlock)to {
  return ^NVMAttribute *(NSInteger to) {
    [self.ranges removeAllObjects];
    [self.ranges addObject:[NSValue valueWithRange:NSMakeRange(0, to)]];
    return self;
  };
}

- (NVMAttributeStringBlock)pattern {
  return ^NVMAttribute *(NSString *pattern) {
    [self.ranges removeAllObjects];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    [regex enumerateMatchesInString:self.string.string options:NSMatchingReportProgress range:NSMakeRange(0, self.string.string.length) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
      [self.ranges addObject:[NSValue valueWithRange:[result range]]];
    }];
    return self;
  };
}

#pragma mark - Helper

- (void)setValue:(id)value forAttribute:(NSString *)attributeName ranges:(NSArray <NSValue *> *)ranges {
  BOOL noValue = value == nil;
  BOOL noAttrubuteName = !attributeName || attributeName.length == 0;
  BOOL noRanges = !ranges || ranges.count == 0;
  if (noValue || noAttrubuteName || noRanges) {
    return;
  }
  for (NSValue *rangeValue in ranges) {
    NSRange range = rangeValue.rangeValue;
    [self.string addAttribute:attributeName value:value range:range];
  }
}

- (void)setValue:(id)value forAttribute:(NSString *)attributeName {
  [self setValue:value forAttribute:attributeName ranges:self.ranges];
}

@end
