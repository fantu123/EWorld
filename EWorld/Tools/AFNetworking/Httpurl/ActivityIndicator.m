//
//  ActivityIndicator.m
//  Si Gema
//
//  Created by 瑞德 on 13-7-17.
//  Copyright (c) 2013年 瑞德. All rights reserved.
//

#import "ActivityIndicator.h"
#define ReLabelX 140
@implementation ActivityIndicator
@synthesize refreshSpinner;
@synthesize _refeshSpLabel;
@synthesize Imageview_;
@synthesize delegate;
@synthesize view;
@synthesize bgView;
#define SCREENWIDTH      CGRectGetWidth([UIScreen mainScreen].bounds)
#define SCREENHEIGHT      CGRectGetHeight([UIScreen mainScreen].bounds)
#define IOS7 [[[[UIDevice currentDevice] systemVersion] substringToIndex:1] intValue]>=7

-(void)dealloc
{
    self.delegate = nil;
    self.refreshSpinner = nil;
    self._refeshSpLabel = nil;
    self.view = nil;
    self.bgView = nil;
}
- (id)initWithFrame:(CGRect)frame LabelText:(NSString *)Ltext withdelegate:(id)dele withType:(ActivityIndicatorType)type andAction:(SEL)action
{
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor =[UIColor clearColor];
        bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        [self addSubview:bgView];
        if(type == ActivityIndicatorDefault)
        {
            bgView.backgroundColor = [UIColor whiteColor];
//            bgView.backgroundColor = BackGroundColor;
        }
        else
        {
            bgView.backgroundColor = [UIColor clearColor];
        }
       
        
        
        
        Imageview_ = [UIButton buttonWithType:UIButtonTypeCustom];
        Imageview_.frame = CGRectMake(0, 0, 90, 90);
        Imageview_.center = CGPointMake(bgView.frame.size.width/2,bgView.frame.size.height/2);
        [Imageview_ addTarget:dele action:action forControlEvents:UIControlEventTouchDown];
        [self addSubview:Imageview_];
        
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ReLabelX, 80)];
        [self addSubview:view];
        
        refreshSpinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        refreshSpinner.frame = CGRectMake(0, 0, 40, 40);
        refreshSpinner.hidesWhenStopped = YES;
        [view addSubview:refreshSpinner];
        
        //
        _refeshSpLabel = [[UILabel alloc] initWithFrame:CGRectMake(refreshSpinner.frame.size.width , refreshSpinner.frame.origin.y, 80, 40)];
        _refeshSpLabel.text = Ltext;
        CGSize size = CGSizeMake(100, 40);
        size = [_refeshSpLabel.text sizeWithFont:_refeshSpLabel.font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
        _refeshSpLabel.frame = CGRectMake(_refeshSpLabel.frame.origin.x, _refeshSpLabel.frame.origin.y, size.width, size.height);
        _refeshSpLabel.backgroundColor = [UIColor clearColor];
        _refeshSpLabel.textAlignment = NSTextAlignmentCenter;
        _refeshSpLabel.textColor = [UIColor lightGrayColor];
        _refeshSpLabel.font = [UIFont boldSystemFontOfSize:16.0];
        [view addSubview:_refeshSpLabel];
        view.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        refreshSpinner.center = CGPointMake(view.frame.size.width/2, 20);
        _refeshSpLabel.center = CGPointMake(view.frame.size.width/2, refreshSpinner.frame.origin.y+40);
        NSLog(@"views = %@",self.subviews);
        self.hidden = YES;
    }
    return self;
}

- (void)tap:(id )tap
{
    NSLog(@"马东凯");
}

- (void)startAnimatingActivit{
    self.hidden = NO;
    [refreshSpinner startAnimating];
    [_refeshSpLabel setHidden:NO];
    Imageview_.hidden = YES;
    view.hidden = NO;
    self.hidden = NO;
}
- (void)stopAnimationgActivit{
    [refreshSpinner stopAnimating];
    [_refeshSpLabel setHidden:YES];
    view.hidden = YES;
}
-(void)addImage:(UIImage *)image
{
    [Imageview_ setImage:image forState:UIControlStateNormal];
}
-(void)LoadSuccess
{
    [self stopAnimationgActivit];
    self.hidden = YES;
}
-(void)LoadFailed
{
    view.hidden = YES;
    Imageview_.hidden = NO;
    Imageview_.enabled = YES;
    [self addImage:[UIImage imageNamed:@"base_empty_view"]];
}

- (void)NoResults
{
    view.hidden = YES;
    Imageview_.hidden = NO;
    Imageview_.frame = CGRectMake(0, 0, 200, 200);
    Imageview_.center = CGPointMake(SCREENWIDTH/2, (SCREENHEIGHT-(IOS7?0:20))/2);
//    [self addImage:[UIImage imageNamed:@"kong2"]];
    Imageview_.enabled = NO;
}

- (void)activityHidden
{
    [self stopAnimationgActivit];
    self.hidden = YES;
}
- (void)changeBgFrame:(CGRect)rect
{
    //CGRectMake(0, 45, 320, self.bgView.frame.size.height-45)
    self.frame = rect;
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
