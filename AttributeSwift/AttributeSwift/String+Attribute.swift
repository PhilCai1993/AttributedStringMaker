//
//  String+Attribute.swift
//  AttributeSwift
//
//  Created by PhilCai on 4/21/16.
//  Copyright © 2016 Phil. All rights reserved.
//

import UIKit

extension String {
  
  var font: UIFont -> Attribute { return attribute.font }
  
  var textColor: UIColor -> Attribute { return  attribute.textColor }
  
  var backgroundColor: UIColor -> Attribute { return attribute.backgroundColor }
  
  var strokeColor: UIColor -> Attribute { return attribute.strokeColor }
  
  var strokeWidth: Double -> Attribute { return attribute.strokeWidth }
  
  var range: NSRange -> Attribute { return attribute.range }
  
  var fromTo: (Int, Int) -> Attribute { return attribute.fromTo }
  
  var from: Int -> Attribute { return attribute.from }
  
  var to: Int -> Attribute { return attribute.to }
  
  /// ligature shoud be 0 or 1(2 unsupported on iOS)
  var ligature: Int -> Attribute { return attribute.ligature }
  
  var kern: Double -> Attribute { return attribute.kern }
  
  var strikethroughStyle: NSUnderlineStyle -> Attribute { return attribute.strikethroughStyle }
  
  var underlineStyle: NSUnderlineStyle -> Attribute { return attribute.underlineStyle }
  
  var shadow: NSShadow -> Attribute { return attribute.shadow }
  
  /// only NSTextEffectLetterpressStyle will work
  var textEffectLetterPress: String -> Attribute { return attribute.textEffectLetterPress }
  
  var attachment: NSTextAttachment -> Attribute { return attribute.attachment }
  
  var link: String -> Attribute { return attribute.link }
  
  var offset: Double -> Attribute { return attribute.offset }
  
  var underlineColor: UIColor -> Attribute { return attribute.underlineColor }
  
  var strikethroughColor: UIColor -> Attribute { return attribute.strokeColor }
  
  var oblique: Double -> Attribute { return attribute.oblique }
  
  var expand: Double -> Attribute { return attribute.expand }
  
  var writingDirection: [NSWritingDirection] -> Attribute { return attribute.writingDirection }
  
  var verticalGlyphForm: Int -> Attribute { return attribute.verticalGlyphForm }

}

private var AttributeKey = ""

private extension String {
  var attribute: Attribute {
    var attribute = objc_getAssociatedObject(self, &AttributeKey)
    if attribute == nil {
      attribute = Attribute(self)
      objc_setAssociatedObject(self, &AttributeKey, attribute, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    return attribute as! Attribute
  }
}

