//
//  ReportCell.h
//  CEBCreditCard
//
//  Created by ronglei on 15/1/13.
//
//

#import <UIKit/UIKit.h>

#define CELL_HEIGHT      25.f
#define HEADER_HEIGHT    31.f
#define LR_MARGIN        8.f
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

@interface ReportCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

+ (ReportCell *)cellFromNib;

@end
