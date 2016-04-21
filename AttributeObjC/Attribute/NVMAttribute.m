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

#pragma mark - Range

- (NVMAttributeRangeBlock)range {
  return ^NVMAttribute *(NSRange range) {
    [self.ranges removeAllObjects];
    [self.ranges addObject:[NSValue valueWithRange:range]];
    return self;
  };
}

- (NVMAttributeIntIntBlock)fromTo {
  return ^NVMAttribute *(NSUInteger from, NSUInteger to) {
    [self.ranges removeAllObjects];
    [self.ranges addObject:[NSValue valueWithRange:NSMakeRange(from, to - from)]];
    return self;
  };
}

- (NVMAttributeIntBlock)from {
  return ^NVMAttribute *(NSUInteger from) {
    [self.ranges removeAllObjects];
    [self.ranges addObject:[NSValue valueWithRange:NSMakeRange(from, self.string.length - from)]];
    return self;
  };
}

- (NVMAttributeIntBlock)to {
  return ^NVMAttribute *(NSUInteger to) {
    [self.ranges removeAllObjects];
    [self.ranges addObject:[NSValue valueWithRange:NSMakeRange(0, to)]];
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
