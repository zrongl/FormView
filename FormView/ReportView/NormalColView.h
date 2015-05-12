//
//  NormalRowView.h
//  CEBCreditCard
//
//  Created by ronglei on 15/1/13.
//
//

#import <UIKit/UIKit.h>
#import "UIView+Additions.h"

@protocol NormalColViewDelegate;

@interface NormalColView : UIView

@property (assign, nonatomic) id<NormalColViewDelegate>delegate;

- (instancetype)initWithFrame:(CGRect)frame data:(NSArray *)data;
- (void)setTableViewContentOffset:(CGPoint)offset;

@end

@protocol NormalColViewDelegate <NSObject>
@optional

- (void)normalColDidScroll:(CGPoint)offset;

@end