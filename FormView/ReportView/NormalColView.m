//
//  NormalRowView.m
//  CEBCreditCard
//
//  Created by ronglei on 15/1/13.
//
//

#import "NormalColView.h"
#import "ReportCell.h"

@interface NormalColView() <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *dataSource;

@end

@implementation NormalColView

- (instancetype)initWithFrame:(CGRect)frame data:(NSArray *)data
{
    self = [super initWithFrame:frame];
    if (self) {
        _dataSource = [[NSArray alloc] initWithArray:data];
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height) style:UITableViewStylePlain];
        _tableView.bounces = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.allowsSelection = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self addSubview:_tableView];
    }
    
    return self;
}

- (void)setTableViewContentOffset:(CGPoint)offset
{
    [_tableView setContentOffset:offset];
}

#pragma mark - UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, HEADER_HEIGHT)];
        UILabel *textLabel = [[UILabel alloc] initWithFrame:headerView.frame];
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.text = [_dataSource objectAtIndex:0];
        textLabel.font = [UIFont boldSystemFontOfSize:13.f];
        
        headerView.layer.borderColor = [RGBCOLOR(78, 69, 112) CGColor];
        headerView.layer.borderWidth = 0.5f;
        headerView.backgroundColor = RGBCOLOR(87, 80, 112);
        [headerView addSubview:textLabel];
        return headerView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELL_HEIGHT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return HEADER_HEIGHT;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (_dataSource.count - 1);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"ReportCell";
    ReportCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell){
        cell = [ReportCell cellFromNib];
        
    }
    cell.titleLabel.text = [_dataSource objectAtIndex:(indexPath.row + 1)];
    
    return cell;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_delegate && [_delegate respondsToSelector:@selector(normalColDidScroll:)]) {
        [_delegate normalColDidScroll:scrollView.contentOffset];
    }
}
@end
