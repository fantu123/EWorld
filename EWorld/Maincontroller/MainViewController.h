//
//  MainViewController.h
//  EWorld
//
//  Created by mac on 15/4/22.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseViewController.h"
#import "JRNavgationBar.h"
#import "const.h"
#import "MainViewCell.h"
#import "BMapKit.h"


@interface MainViewController : BaseViewController<JRNavDelegate,MaincellDelegate,BMKMapViewDelegate,BMKLocationServiceDelegate,CLLocationManagerDelegate,NSURLConnectionDataDelegate,NSURLConnectionDelegate,BMKLocationServiceDelegate>
{
    BMKMapView *_mapView;
    BMKLocationService *_locService;
    JRNavgationBar * NavBar;
    UITableView* mytableview;
    CLLocationManager  *location;
    NSString * citymap;
}
@end
