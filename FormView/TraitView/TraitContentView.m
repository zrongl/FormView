//
//  TraitView.m
//  CplusVSObjC
//
//  Created by ronglei on 14/10/24.
//  Copyright (c) 2014年 com.lashou. All rights reserved.
//

#import "TraitContentView.h"
#import "TraitItemView.h"

#define MARGIN_TOP  14.f
#define MARGIN_LEFT 14.f
#define HER_SPACE   12.f
#define VER_SPACE   14.f
#define ITEM_H 40.f
#define ITEM_W 250.f

@interface TraitContentView()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) NSArray *titlesArray;

@end

@implementation TraitContentView

+ (TraitContentView *)viewFromNib
{
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:self options:nil];
    if (array && [array count]) {
        return array[0];
    }else {
        return nil;
    }
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    _titlesArray = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", nil];
}

- (void)updateContents
{
    int count = (int)_titlesArray.count;
    int colNum = (count%3) == 0 ? (count/3) : (count/3 + 1);
    
    for (int i = 0; i < count; i ++) {
        int row = i % 3;
        int col = i / 3;
        TraitItemView *itemView = [TraitItemView viewFromNib];
        CGRect frame = itemView.frame;
        frame.origin.x = (MARGIN_LEFT + col*ITEM_W + col*VER_SPACE);
        frame.origin.y = (MARGIN_TOP + row*ITEM_H + row*HER_SPACE);
        [itemView setFrame:frame];
        [_scrollView addSubview:itemView];
    }
    
    _scrollView.contentSize = CGSizeMake(colNum *_scrollView.frame.size.width , _scrollView.frame.size.height);
}

@end
