//
//  QFImageView.h
//  SwiftCallOC
//
//  Created by bingoogol on 14/9/21.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "pinyin.h"

@interface QFImageView : UIImageView {
    id _target;
    SEL _sel;
}

-(void) addTarget:(id)target withSelector:(SEL)sel;

-(void) test;

-(char) getLetter:(NSString*)str;
@end
