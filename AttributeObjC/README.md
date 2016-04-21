# AttributedStringObjC

```
 NSMutableAttributedString *ats =
      @"我们邀你加入自带杯的行列多一点循环使用, 多一点绿色的可能"
          .font([UIFont systemFontOfSize:30])
          .range(NSMakeRange(2, 3)).textColor([UIColor redColor])
//          .range(NSMakeRange(0, 5)).backgroundColor([UIColor greenColor])
//          .range(NSMakeRange(6, 5)).backgroundColor([UIColor yellowColor])
//          .range(NSMakeRange(1, 1)).font([UIFont systemFontOfSize:60])
//          .range(NSMakeRange(3, 5)).strokeColor([UIColor blueColor]).strokeWidth(2.5)
          .fromTo(12,18).textColor([UIColor brownColor])
          .from(15).backgroundColor([UIColor lightGrayColor])
          .to(8).font([UIFont boldSystemFontOfSize:25])
          .string;

```


