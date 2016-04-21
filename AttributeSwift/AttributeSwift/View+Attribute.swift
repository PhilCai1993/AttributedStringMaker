//
//  View+Attribute.swift
//  AttributeSwift
//
//  Created by PhilCai on 4/21/16.
//  Copyright © 2016 Phil. All rights reserved.
//

import UIKit


extension UILabel {
  func setAttribute(attribute: Attribute) {
    self.attributedText = attribute.string
  }
}

extension UITextView {
  func setAttribute(attribute: Attribute) {
    self.attributedText = attribute.string
  }
}

extension UITextField {
  func setAttribute(attribute: Attribute) {
    self.attributedText = attribute.string
  }
}