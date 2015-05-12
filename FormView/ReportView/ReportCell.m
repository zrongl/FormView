//
//  ReportCell.m
//  CEBCreditCard
//
//  Created by ronglei on 15/1/13.
//
//

#import "ReportCell.h"

@implementation ReportCell

+ (ReportCell *)cellFromNib
{
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    if (array && [array count]) {
        return array[0];
    }else {
        return nil;
    }
}

- (void)awakeFromNib {
    self.layer.borderWidth = 0.5f;
    self.layer.borderColor = [RGBCOLOR(215, 215, 215) CGColor];
    // Initialization code
}

- (void)layoutSubviews
{
    self.contentView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    CGRect frame = self.contentView.frame;
    frame.size.width -= 2 * LR_MARGIN;
    frame.origin.x = LR_MARGIN;
    _titleLabel.frame = frame;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
