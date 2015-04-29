//
//  TNTableView.m
//  TNMode
//
//  Created by LH on 13-9-14.
//  Copyright (c) 2013年 LH. All rights reserved.
//

#import "TableView.h"
#import "UIImageView+WebCache.h"
#import "const.h"
@interface TableView (Private) <UIScrollViewDelegate>
- (void) config;
- (void) configDisplayProperties;
@end

@implementation TableView

# pragma mark - Initialization / Deallocation

@synthesize pullDelegate;
@synthesize index;
@synthesize refreshView;
@synthesize loadMoreView;
@synthesize indicator;
@synthesize mytableBool;
- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self config];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
       
    }
    
    return self;
}

- (void)dealloc {
    [pullArrowImage release];
    [pullBackgroundColor release];
    [pullTextColor release];
    [pullLastRefreshDate release];
    
    [refreshView release];
    [loadMoreView release];
    [delegateInterceptor release];
    delegateInterceptor = nil;
    [indicator release];
    [super dealloc];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self config];
}
#pragma mark - 创建头部视图
- (void)CreateHeadview:(NSArray *)types andindex:(int)indx
{
    
//    UIView * imagvie = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320,160)];
    
    UIImageView * imageview = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, SCREENWIDTH,150)];
    imageview.userInteractionEnabled = YES;
    imageview.image = [UIImage imageNamed:@"no_phote"];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self.pullDelegate action:@selector(tapImage:)];
    [imageview addGestureRecognizer:tap];
    self.tableHeaderView = imageview;
    [tap release];
//    [self addSubview:imageview];
   
    
    indicator = [[ActivityIndicator alloc]initWithFrame:CGRectMake(0, 2, self.frame.size.width, self.frame.size.height) LabelText:@"正在加载" withdelegate:self andAction:@selector(refresh:)];
    [self addSubview:indicator];
    [indicator startAnimatingActivit];
    [imageview release];

}

# pragma mark - Custom view configuration

- (void) config
{
    /* Message interceptor to intercept scrollView delegate messages */
    delegateInterceptor = [[MessageInterceptor alloc] init];
    delegateInterceptor.middleMan = self;
    delegateInterceptor.receiver = self.delegate;
    super.delegate = (id)delegateInterceptor;
    
    /* Status Properties */
    pullTableIsRefreshing = NO;
    pullTableIsLoadingMore = NO;
    
    //    /* Refresh View */
    refreshView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0, -self.bounds.size.height, self.bounds.size.width, self.bounds.size.height)];
        refreshView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
    refreshView.backgroundColor = UIColorFromRGB(0xefefef);
        refreshView.delegate = self;
        [self addSubview:refreshView];
    //
    /* Load more view init */
    loadMoreView = [[LoadMoreTableFooterView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height, self.bounds.size.width, self.bounds.size.height)];
    loadMoreView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    loadMoreView.delegate = self;
    loadMoreView.backgroundColor = UIColorFromRGB(0xefefef);
    [self addSubview:loadMoreView];
    
}


# pragma mark - View changes

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat visibleTableDiffBoundsHeight = (self.bounds.size.height - MIN(self.bounds.size.height, self.contentSize.height));
    
    CGRect loadMoreFrame = loadMoreView.frame;
    loadMoreFrame.origin.y = self.contentSize.height + visibleTableDiffBoundsHeight;
    loadMoreView.frame = loadMoreFrame;
    
}

#pragma mark - Preserving the original behaviour

- (void)setDelegate:(id<UITableViewDelegate>)delegate
{
    if(delegateInterceptor) {
        super.delegate = nil;
        delegateInterceptor.receiver = delegate;
        super.delegate = (id)delegateInterceptor;
    } else {
        super.delegate = delegate;
    }
}
#pragma mark - 刷新数据
- (void)loaddataToheadview:(ActivityItem *)item
{
    NSLog(@"%@",item.imageurl);
    if([self.tableHeaderView isKindOfClass:[UIImageView class]])
    {
        UIImageView * imageV = (UIImageView *)self.tableHeaderView;
        [imageV setImageWithURL:[NSURL URLWithString:item.imageurl] placeholderImage:[UIImage imageNamed:@"no_phote"]];
    }
}

- (void)reloadData
{
    [super reloadData];
    // Give the footers a chance to fix it self.
    
    [loadMoreView egoRefreshScrollViewDidScroll:self];
}

#pragma mark - Status Propreties

@synthesize pullTableIsRefreshing;
@synthesize pullTableIsLoadingMore;

- (void)setPullTableIsRefreshing:(BOOL)isRefreshing
{
    if(!pullTableIsRefreshing && isRefreshing) {
        // If not allready refreshing start refreshing
        [refreshView startAnimatingWithScrollView:self];
        pullTableIsRefreshing = YES;
    } else if(pullTableIsRefreshing && !isRefreshing) {
        [refreshView egoRefreshScrollViewDataSourceDidFinishedLoading:self];
        pullTableIsRefreshing = NO;
    }
}

- (void)setPullTableIsLoadingMore:(BOOL)isLoadingMore
{
    if(!pullTableIsLoadingMore && isLoadingMore) {
        // If not allready loading more start refreshing
        [loadMoreView startAnimatingWithScrollView:self];
        pullTableIsLoadingMore = YES;
    } else if(pullTableIsLoadingMore && !isLoadingMore) {
        [loadMoreView egoRefreshScrollViewDataSourceDidFinishedLoading:self];
        pullTableIsLoadingMore = NO;
    }
}

#pragma mark - Display properties

@synthesize pullArrowImage;
@synthesize pullBackgroundColor;
@synthesize pullTextColor;
@synthesize pullLastRefreshDate;

- (void)configDisplayProperties
{
    [refreshView setBackgroundColor:self.pullBackgroundColor textColor:self.pullTextColor arrowImage:self.pullArrowImage];
    [loadMoreView setBackgroundColor:self.pullBackgroundColor textColor:self.pullTextColor arrowImage:self.pullArrowImage];
}

- (void)setPullArrowImage:(UIImage *)aPullArrowImage
{
    if(aPullArrowImage != pullArrowImage) {
        [pullArrowImage release];
        pullArrowImage = [aPullArrowImage retain];
        [self configDisplayProperties];
    }
}

- (void)setPullBackgroundColor:(UIColor *)aColor
{
    if(aColor != pullBackgroundColor) {
        [pullBackgroundColor release];
        pullBackgroundColor = [aColor retain];
        [self configDisplayProperties];
    }
}

- (void)setPullTextColor:(UIColor *)aColor
{
    if(aColor != pullTextColor) {
        [pullTextColor release];
        pullTextColor = [aColor retain];
        [self configDisplayProperties];
    }
}

- (void)setPullLastRefreshDate:(NSDate *)aDate
{
    if(aDate != pullLastRefreshDate) {
        [pullLastRefreshDate release];
        pullLastRefreshDate = [aDate retain];
    [refreshView refreshLastUpdatedDate];
    }
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    [refreshView egoRefreshScrollViewDidScroll:scrollView];
    [loadMoreView egoRefreshScrollViewDidScroll:scrollView];
    
    // Also forward the message to the real delegate
    if ([delegateInterceptor.receiver
         respondsToSelector:@selector(scrollViewDidScroll:)]) {
        [delegateInterceptor.receiver scrollViewDidScroll:scrollView];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    [refreshView egoRefreshScrollViewDidEndDragging:scrollView];
    [loadMoreView egoRefreshScrollViewDidEndDragging:scrollView];
    
    
    if ([delegateInterceptor.receiver
         respondsToSelector:@selector(scrollViewDidEndDragging:willDecelerate:)]) {
        [delegateInterceptor.receiver scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
    }
}

- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
    [refreshView egoRefreshScrollViewWillBeginDragging:scrollView];
    
    if ([delegateInterceptor.receiver
         respondsToSelector:@selector(scrollViewWillBeginDragging:)]) {
        [delegateInterceptor.receiver scrollViewWillBeginDragging:scrollView];
    }
}



#pragma mark - EGORefreshTableHeaderDelegate


- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view {
    return self.pullLastRefreshDate;
}

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view
{
    pullTableIsRefreshing = YES;
    [pullDelegate pullTableViewDidTriggerRefresh:self];
}

#pragma mark - LoadMoreTableViewDelegate

- (void)loadMoreTableFooterDidTriggerLoadMore:(LoadMoreTableFooterView *)view
{
    pullTableIsLoadingMore = YES;
    [pullDelegate pullTableViewDidTriggerLoadMore:self];
}



@end

