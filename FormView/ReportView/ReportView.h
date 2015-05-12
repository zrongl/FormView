//
//  RLReportView.h
//  CEBCreditCard
//
//  Created by ronglei on 15/1/13.
//
//

#import <UIKit/UIKit.h>

@interface ReportView : UIView

- (instancetype)initWithFrame:(CGRect)frame columnData:(NSArray *)columnDatas;
- (void)updateContentsWith:(NSArray *)array;

@end
