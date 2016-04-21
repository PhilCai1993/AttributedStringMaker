//
//  String+Attribute.swift
//  AttributeSwift
//
//  Created by PhilCai on 4/21/16.
//  Copyright © 2016 Phil. All rights reserved.
//

import UIKit

extension String {
  
  var font: (UIFont) -> Attribute {
    return attribute.font
  }
  
  var textColor: UIColor -> Attribute {
    return  attribute.textColor
  }

  var backgroundColor: UIColor -> Attribute {
    return attribute.backgroundColor
  }
  
  var strokeColor: UIColor -> Attribute {
    return attribute.strokeColor
  }
  
  var strokeWidth: Double -> Attribute {
    return attribute.strokeWidth
  }
  
  var range: NSRange -> Attribute {
    return attribute.range
  }
 
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

