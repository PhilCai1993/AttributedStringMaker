//
//  ViewController.swift
//  AttributeSwift
//
//  Created by PhilCai on 4/21/16.
//  Copyright © 2016 Phil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let label = UILabel(frame: view.bounds)
    label.numberOfLines = 0
    view.addSubview(label)
    
    let abc = "abc.font(UIFont.systemFontOfSize(100)).backgroundColor(UIColor.yellowColor()).string"
    let attributedString = abc
      .font(UIFont.systemFontOfSize(30))
      .backgroundColor(UIColor.yellowColor())
      .range(NSMakeRange(3, 15)).textColor(UIColor.purpleColor())
      .from(12).backgroundColor(UIColor.cyanColor())
      .to(10).strokeWidth(1.2).strokeColor(UIColor.redColor())
      .string
    
    
    label.attributedText = attributedString
    
  }
  
}

