//
//  HeadRowView.h
//  CEBCreditCard
//
//  Created by ronglei on 15/1/13.
//
//

#import <UIKit/UIKit.h>
#import "UIView+Additions.h"

@protocol HeadColViewDelelgate;

@interface HeadColView : UIView

@property (strong, nonatomic) NSArray *dataSource;
@property (assign, nonatomic) id<HeadColViewDelelgate>delegate;

- (instancetype)initWithFrame:(CGRect)frame data:(NSArray *)data;
- (void)setTableViewContentOffset:(CGPoint)offset;

@end

@protocol HeadColViewDelelgate <NSObject>
@optional

- (void)headColDidScroll:(CGPoint)offset;

@end