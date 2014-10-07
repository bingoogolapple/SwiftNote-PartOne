//
//  QFImageView.m
//  SwiftCallOC
//
//  Created by bingoogol on 14/9/21.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

#import "QFImageView.h"
// 如果oc要调用Swift里面的代码，需要包含固定头文件
// 项目名称-Swift.h   SwiftCallOC-Swift.h
// #ProjectName#-Swift.h
#import "SwiftCallOC-Swift.h"

@implementation QFImageView

-(void) addTarget:(id)target withSelector:(SEL)sel {
    _target = target;
    _sel = sel;
    self.userInteractionEnabled = YES;
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if(_target) {
        [_target performSelector:_sel withObject:self];
    }
}

-(void) test {
    NSLog(@"test");
    // 调用Swift方法
    TestSwift *ts = [[TestSwift alloc] init];
    [ts someFunc];
    
    NSArray *arr = [ts getArrayByValue:@"王" v2:@"浩"];
    for(NSString *s in arr) {
        NSLog(@"s is %@",s);
    }
}

-(char) getLetter:(NSString *)str {
    char pinyin = pinyinFirstLetter([str characterAtIndex:0]);
    NSLog(@"首字母是%c",pinyin);
    return pinyin;
}

@end
