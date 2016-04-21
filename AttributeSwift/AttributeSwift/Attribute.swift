//
//  Attribute.swift
//  AttributeSwift
//
//  Created by PhilCai on 4/21/16.
//  Copyright © 2016 Phil. All rights reserved.
//

import UIKit
import ObjectiveC

class Attribute {
  var string: NSMutableAttributedString
  private var ranges: [NSRange] = []

  init(_ string: String) {
    self.string = NSMutableAttributedString(string: string)
    self.ranges.append(NSMakeRange(0, self.string.length))
  }

//  MARK: Attributes
  
  func font(font: UIFont) -> Attribute {
    setAttribute([NSFontAttributeName : font])
    return self
  }
  
  func textColor(color: UIColor) -> Attribute {
    setAttribute([NSForegroundColorAttributeName : color])
    return self
  }
  
  func backgroundColor(color: UIColor) -> Attribute {
    setAttribute([NSBackgroundColorAttributeName : color])
    return self
  }
  
  func strokeColor(color: UIColor) -> Attribute {
    setAttribute([NSStrokeColorAttributeName : color])
    return self
  }
  
  func strokeWidth(width: Double) -> Attribute {
    setAttribute([NSStrokeWidthAttributeName : width])
    return self
  }

  /// ligature shoud be 0 or 1(2 unsupported on iOS)
  func ligature(ligature: Int) -> Attribute {
    setAttribute([NSLigatureAttributeName : ligature])
    return self
  }
  
  func kern(kern: Double) -> Attribute {
    setAttribute([NSKernAttributeName : kern])
    return self
  }
  
  func  strikethroughStyle(style: NSUnderlineStyle) -> Attribute {
    setAttribute([NSStrikethroughStyleAttributeName : style.rawValue])
    return self
  }
  
  func underlineStyle(style: NSUnderlineStyle) -> Attribute {
    setAttribute([NSUnderlineStyleAttributeName : style.rawValue])
    return self
  }
  
  func shadow(shadow: NSShadow) -> Attribute {
    setAttribute([NSShadowAttributeName : shadow])
    return self
  }

  /// only NSTextEffectLetterpressStyle will work
  func textEffectLetterPress(effect: String) -> Attribute {
    setAttribute([NSTextEffectAttributeName : effect])
    return self;
  }
  
  func attachment(attach: NSTextAttachment) -> Attribute {
    setAttribute([NSAttachmentAttributeName : attach])
    return self
  }
  
  func link(URL: String) -> Attribute {
    setAttribute([NSLinkAttributeName : URL])
    return self
  }
  
  func offset(offset: Double) -> Attribute {
    setAttribute([NSBaselineOffsetAttributeName : offset])
    return self
  }
  
  func underlineColor(color: UIColor) -> Attribute {
    setAttribute([NSUnderlineColorAttributeName : color])
    return self
  }
  
  func strikethroughColor(color: UIColor) -> Attribute {
    setAttribute([NSStrikethroughColorAttributeName : color])
    return self
  }
  
  func oblique(oblique: Double) -> Attribute {
    setAttribute([NSObliquenessAttributeName : oblique])
    return self
  }
  
  func expand(expand: Double) -> Attribute {
    setAttribute([NSExpansionAttributeName : expand])
    return self
  }
  
  func writingDirection(directions: [NSWritingDirection]) -> Attribute {
    if let value = directions.first?.rawValue {
      var result = value
      for direction in directions {
        result = result | direction.rawValue
      }
      setAttribute([NSWritingDirectionAttributeName : result])
    }
    return self
  }
  
  func verticalGlyphForm(form: Int) -> Attribute {
    setAttribute([NSVerticalGlyphFormAttributeName : form])
    return self
  }
  
  
//  MARK: range
  
  func range(range: NSRange) -> Attribute {
    ranges.removeAll()
    ranges.append(range)
    return self
  }
  
  func fromTo(from: Int, to: Int) -> Attribute {
    ranges.removeAll()
    ranges.append(NSMakeRange(from, to))
    return self
  }
  
  func from(from: Int) -> Attribute {
    ranges.removeAll()
    ranges.append(NSMakeRange(from, string.length - from))
    return self
  }
  
  func to(to: Int) -> Attribute {
    ranges.removeAll()
    ranges.append(NSMakeRange(0, to))
    return self
  }
  
}


// MARK: Helper

extension Attribute {
  private func setAttribute(attr: [String : AnyObject], ranges: [NSRange]) {
    for range in ranges {
      self.string.addAttributes(attr, range: range)
    }
  }
  
  private func setAttribute(attr: [String : AnyObject]) {
    setAttribute(attr, ranges: ranges)
  }
}



