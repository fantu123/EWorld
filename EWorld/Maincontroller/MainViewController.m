//
//  MainViewController.m
//  EWorld
//
//  Created by mac on 15/4/22.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "MainViewController.h"
#import "Searchviewcell.h"
#import "MainViewCell.h"
#import "UItabBarViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;

    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _locService.delegate = self;
}

-(void)viewWillDisappear:(BOOL)animated {

    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
    _locService.delegate = nil;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NavBar = [[JRNavgationBar alloc]initWithFrame:CGRectMake(0,0, SCREENWIDTH, NAVHEIGHT) Option:JRNAVGATIONDEFAULTBAR];
    NavBar.isroot = YES;
    NavBar.delegate = self;
    NavBar.setbtn.hidden = YES;
    NavBar.homebtn.hidden =YES;
    NavBar.backbtn.hidden = YES;
    NavBar.titleLabel.text = @"E世界";
    [self.view addSubview:NavBar];
    
    mytableview = [[UITableView alloc] initWithFrame:CGRectMake(0, NAVHEIGHT, SCREENWIDTH,SCREENHEIGHT) style:UITableViewStylePlain];
    mytableview.dataSource = self;
    mytableview.delegate = self;
    mytableview.scrollEnabled =NO; //设置tableview 不能滚动
    mytableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:mytableview];
    
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    //启动LocationService
    [_locService startUserLocationService];

    
   location = [[CLLocationManager alloc] init];//定义Manager
    // 判断定位操作是否被允许
    if([CLLocationManager locationServicesEnabled]) {
//        locationManager = [[CLLocationManager alloc] init];
        location.delegate = self;
    }else {
        NSLog(@"qwe");
        //提示用户无法进行定位操作
    }
    // 开始定位
    [location startUpdatingLocation];
    
    
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    //此处locations存储了持续更新的位置坐标值，取最后一个值为最新位置，如果不想让其持续
    CLLocation *currentLocation = [locations lastObject];
    CLLocationCoordinate2D coor = currentLocation.coordinate;
    
    NSLog(@"纬度:%f",coor.latitude);
    NSLog(@"经度:%f",coor.longitude);
    [self change];
    
}
-(void)change{
    //22.540681,=114.061324
    CLLocationCoordinate2D coordinate;
    coordinate.latitude =  39.891007;
    coordinate.longitude = 116.635079;
    CLLocation *newLocation=[[CLLocation alloc]initWithLatitude:coordinate.latitude longitude: coordinate.longitude];
    CLGeocoder *geocoder=[[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:newLocation
                   completionHandler:^(NSArray *placemarks,
                                       NSError *error)
     {
         CLPlacemark *placemark=[placemarks objectAtIndex:0];
         NSLog(@"我我的:%@\n country:%@\n postalCode:%@\n ISOcountryCode:%@\n ocean:%@\n inlandWater:%@\n locality:%@\n subLocality:%@ \n administrativeArea:%@\n subAdministrativeArea:%@\n thoroughfare:%@\n subThoroughfare:%@\n",
               placemark.name,
               placemark.country,
               placemark.postalCode,
               placemark.ISOcountryCode,
               placemark.ocean,
               placemark.inlandWater,
               placemark.administrativeArea,
               placemark.subAdministrativeArea,
               placemark.locality,
               placemark.subLocality,
               placemark.thoroughfare,
               placemark.subThoroughfare);
         citymap = placemark.administrativeArea;
          NSLog(@"citymap:%@,%@",citymap,placemark.administrativeArea);
     }];
    if(citymap==nil)
    {
        
    }
    else
    {
         [location stopUpdatingLocation];
          [_locService stopUserLocationService];
         [mytableview reloadData];
    }
   
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"error:%@",error);
}
#pragma ---tableVIew dataSource delegate------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if(cell==nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.row==0) {
        Searchviewcell * searcell = [tableView dequeueReusableCellWithIdentifier:@"searcell"];
        if (searcell==nil) {
            searcell = [[[NSBundle mainBundle]loadNibNamed:@"Searchviewcell" owner:self options:nil]lastObject];
            searcell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        if (citymap==nil) {
             [searcell.citytext setTitle:@"定位中" forState:UIControlStateNormal];
        }
        else
        [searcell.citytext setTitle:citymap forState:UIControlStateNormal];
//        searcell.citytext.titleLabel.text = citymap;
        NSLog(@"%@",citymap);
        return searcell;
    }
    else  if (indexPath.row==1) {
        
        UIImageView * imgview =[[UIImageView alloc]initWithImage:[UIImage  imageNamed:@"flag.png"]];
        imgview.frame = CGRectMake(10, 8, 20, 20);
        [cell.contentView addSubview:imgview];
        
        UILabel * labletext =[[UILabel alloc]initWithFrame:CGRectMake(40, 5, 240, 30)];
        labletext.text = @"足迹:您最近访问的类别会显示在这里";
        labletext.font = [UIFont systemFontOfSize:14];
        labletext.textColor =[UIColor grayColor];
        [cell.contentView addSubview:labletext];
        
        UILabel * lableline =[[UILabel alloc]initWithFrame:CGRectMake(0, 39, SCREENWIDTH, 1)];
        lableline.font = [UIFont systemFontOfSize:14];
        lableline.backgroundColor =[UIColor grayColor];
        [cell.contentView addSubview:lableline];
        
    }
    else
    {
        MainViewCell * maincell = [tableView dequeueReusableCellWithIdentifier:@"maincell"];
        if (maincell==nil) {
            maincell = [[[NSBundle mainBundle]loadNibNamed:@"MainViewCell" owner:self options:nil]lastObject];
            maincell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        maincell.delegate=self;
        return maincell;
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 40;
    }
    else if (indexPath.row==1) {
        return 40;
    }
    else
    return 70;
}
#pragma mark E美丽 教育  公益 其他点击事件 delegate
-(void)didCellClickedeplbutton:(id)aSender{
    NSLog(@"点击E美丽");
    UItabBarViewController * barcontroller = [[UItabBarViewController alloc]init];
    [self.navigationController presentViewController:barcontroller animated:YES completion:nil];
}
-(void)didCellClickedgongyibutton:(id)aSender{
    NSLog(@"点击公益");
}
-(void)didCellClickededubutton:(id)aSender
{
    NSLog(@"点击教育");
}
-(void)didCellClickedotherbutton:(id)aSender
{
    NSLog(@"点击其他");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
