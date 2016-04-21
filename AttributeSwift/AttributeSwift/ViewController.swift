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
    
    let string = "提起异步操作的序列执行，指的是有一系列的异步操作（比如网络请求）的执行有前后的依赖关系，前一个请求执行完毕后，才能执行下一个请求。"
    let attributedString = string
      .font(UIFont.systemFontOfSize(30))
      .backgroundColor(UIColor.yellowColor())
      .underlineColor(UIColor.orangeColor()).underlineStyle(.StyleSingle).offset(-1)
      .range(NSMakeRange(3, 15)).textColor(UIColor.purpleColor())
      .from(12).backgroundColor(UIColor.cyanColor())
      .to(10).strokeWidth(1.2).strokeColor(UIColor.redColor())
      .string
    
    
    label.attributedText = attributedString
    
  }
  
}

