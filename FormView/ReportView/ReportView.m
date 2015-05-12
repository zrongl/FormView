//
//  RLReportView.m
//  CEBCreditCard
//
//  Created by ronglei on 15/1/13.
//
//

#import "ReportView.h"
#import "HeadColView.h"
#import "NormalColView.h"

@interface ReportView() <UIScrollViewDelegate, HeadColViewDelelgate, NormalColViewDelegate>

@property (strong, nonatomic) HeadColView *headColView;
@property (strong, nonatomic) NormalColView *normalColView;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (assign, nonatomic) CGFloat headWidth;

@end

@implementation ReportView
- (instancetype)initWithFrame:(CGRect)frame columnData:(NSArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        _headWidth = [self maxWidthFromColumnData:[array objectAtIndex:0] font:[UIFont systemFontOfSize:15.f]];
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(_headWidth, 0, self.width - _headWidth, self.height)];
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.bounces = NO;
        [self addSubview:_scrollView];
        
        _headColView = [[HeadColView alloc] initWithFrame:CGRectMake(0, 0, _headWidth, self.height) data:[array objectAtIndex:0]];
        _headColView.delegate = self;
        [self addSubview:_headColView];
        
        CGFloat offsetX = 0;
        for (int i = 1; i < array.count; i ++) {
            CGFloat width = [self maxWidthFromColumnData:[array objectAtIndex:i] font:[UIFont systemFontOfSize:15.f]];
            NormalColView *view = [[NormalColView alloc] initWithFrame:CGRectMake(offsetX, 0, width, self.height) data:[array objectAtIndex:i]];
            view.delegate = self;
            [_scrollView addSubview:view];
            offsetX += width;
        }
        
        _scrollView.contentSize = CGSizeMake(offsetX, self.height);
    }
    
    return self;
}

- (CGFloat)maxWidthFromColumnData:(NSArray *)array font:(UIFont *)font
{
    CGFloat maxWidth = 0.f;
    for (int i = 0;  i < array.count; i++) {
        NSString *string = [array objectAtIndex:i];
        CGSize size = [string sizeWithFont:font
                          constrainedToSize:CGSizeMake(MAXFLOAT, 0.0)
                              lineBreakMode:NSLineBreakByWordWrapping];
        if (size.width > maxWidth) {
            maxWidth = size.width;
        }
    }
    
    return (maxWidth + 16.f);
}

- (void)updateContentsWith:(NSArray *)array
{
    _headWidth = [self maxWidthFromColumnData:[array objectAtIndex:0] font:[UIFont systemFontOfSize:15.f]];
    _scrollView.frame = CGRectMake(_headWidth, 0, self.width - _headWidth, self.height);
    
    _headColView.frame = CGRectMake(0, 0, _headWidth, self.height);
    _headColView.dataSource = [array objectAtIndex:0];
    
    [_scrollView removeAllSubviews];
    CGFloat offsetX = 0;
    for (int i = 1; i < array.count; i ++) {
        CGFloat width = [self maxWidthFromColumnData:[array objectAtIndex:i] font:[UIFont systemFontOfSize:15.f]];
        NormalColView *view = [[NormalColView alloc] initWithFrame:CGRectMake(offsetX, 0, width, self.height) data:[array objectAtIndex:i]];
        view.delegate = self;
        [_scrollView addSubview:view];
        offsetX += width;
    }
    
    _scrollView.contentSize = CGSizeMake(offsetX, self.height);
}

#pragma mark - HeadRowViewDelelgate
- (void)headColDidScroll:(CGPoint)offset;
{
    for (UIView *view in _scrollView.subviews) {
        if ([view isKindOfClass:[NormalColView class]]) {
            [(NormalColView *)view setTableViewContentOffset:offset];
        }
    }
}

#pragma mark - NormalRowViewDelegate
- (void)normalColDidScroll:(CGPoint)offset;
{
    [_headColView setTableViewContentOffset:offset];
    for (UIView *view in _scrollView.subviews) {
        if ([view isKindOfClass:[NormalColView class]]) {
            [(NormalColView *)view setTableViewContentOffset:offset];
        }
    }
}
@end
