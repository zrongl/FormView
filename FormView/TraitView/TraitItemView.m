//
//  TraitItemView.m
//  CplusVSObjC
//
//  Created by ronglei on 14/10/24.
//  Copyright (c) 2014年 com.lashou. All rights reserved.
//

#import "TraitItemView.h"

@implementation TraitItemView

+ (TraitItemView *)viewFromNib
{
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:self options:nil];
    if (array && [array count]) {
        return array[0];
    }else {
        return nil;
    }
}

@end
