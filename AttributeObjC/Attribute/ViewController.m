//
//  ViewController.m
//  Attribute
//
//  Created by PhilCai on 4/21/16.
//  Copyright © 2016 Phil. All rights reserved.
//

#import "ViewController.h"
#import "NVMAttribute.h"
#import "NSString+NVMAttribute.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  UITextView *l = [UITextView new];
  l.frame = self.view.bounds;
  l.textAlignment = NSTextAlignmentCenter;
  [self.view addSubview:l];
  
  
  
  NSMutableAttributedString *ats =
  @"504277874我们邀你加入自带杯的行列多一点循环使用,504277874 多一点绿色的可能,504277874"
          .font([UIFont systemFontOfSize:30])
          .range(NSMakeRange(2, 3)).textColor([UIColor redColor])
//          .range(NSMakeRange(0, 5)).backgroundColor([UIColor greenColor])
//          .range(NSMakeRange(6, 5)).backgroundColor([UIColor yellowColor])
//          .range(NSMakeRange(1, 1)).font([UIFont systemFontOfSize:60])
//          .range(NSMakeRange(3, 5)).strokeColor([UIColor blueColor]).strokeWidth(2.5)
          .fromTo(12,18).textColor([UIColor brownColor])
          .from(15).backgroundColor([UIColor lightGrayColor])
          .to(8).font([UIFont boldSystemFontOfSize:25])
          .pattern(@"[0-9]{5,9}").font([UIFont systemFontOfSize:100]).textColor([UIColor yellowColor])
          .string;
  
  NSLog(@"%@", ats);

  
  l.attributedText = ats;
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
