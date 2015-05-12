//
//  TraitItemView.h
//  CplusVSObjC
//
//  Created by ronglei on 14/10/24.
//  Copyright (c) 2014年 com.lashou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TraitItemView : UIView

@property (weak, nonatomic) IBOutlet UILabel *label;

+ (TraitItemView *)viewFromNib;

@end
