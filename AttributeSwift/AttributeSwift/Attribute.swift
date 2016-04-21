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
  
  func font(f: UIFont) -> Attribute {
    setAttribute([NSFontAttributeName : f])
    return self
  }
  
  func textColor(c: UIColor) -> Attribute {
    setAttribute([NSForegroundColorAttributeName : c])
    return self
  }
  
  func backgroundColor(c: UIColor) -> Attribute {
    setAttribute([NSBackgroundColorAttributeName : c])
    return self
  }
  
  func strokeColor(c: UIColor) -> Attribute {
    setAttribute([NSStrokeColorAttributeName : c])
    return self
  }
  
  func strokeWidth(c: Double) -> Attribute {
    setAttribute([NSStrokeWidthAttributeName : c])
    return self
  }
  
  func range(range: NSRange) -> Attribute {
    ranges.removeAll()
    ranges.append(range)
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



