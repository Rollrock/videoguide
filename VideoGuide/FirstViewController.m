//
//  FirstViewController.m
//  VideoGuide
//
//  Created by zhuang chaoxiao on 14-2-10.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import "FirstViewController.h"
#import "firstCellView.h"
#import "FirstDetailViewController.h"
#import "JSONKit.h"
#import "YouMiWallSpot.h"
#import "YouMiWallSpotView.h"
#import "YouMiWall.h"

#define ALLOW_MONTH 10
#define ALLOW_DAY  10


@interface FirstViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * _cellView;
    
    NSMutableArray * _dataArray;
    
}
@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    [self.navigationItem setTitle:@"离您最近的美女"];
    ///
    _dataArray = [[NSMutableArray alloc]init];
    
    ////
    [self readDataFromFile];
    
    ///
    CGRect rect;
    
    rect = CGRectMake(0, 0,self.view.bounds.size.width , self.view.bounds.size.height);
    
    _cellView = [[UITableView alloc]initWithFrame:rect];
    _cellView.delegate = self;
    _cellView.dataSource = self;
    
    _cellView.backgroundColor = [UIColor grayColor];
    
    
    [self.view addSubview:_cellView];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    
    [self showYouMiAdv];
    
}


-(void)readDataFromFile
{
    NSString * filePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"peoples.txt"];
    NSString * strFile = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    NSData * data = [strFile dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary * dict = [data objectFromJSONData];
    
    NSArray * array = [dict objectForKey:@"data"];
    
    for( NSDictionary * subDict in array )
    {
        [_dataArray addObject:subDict];
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * strTag = [(NSDictionary*)[_dataArray objectAtIndex:indexPath.row] objectForKey:@"tag"];
    
    FirstDetailViewController * vc = [[FirstDetailViewController alloc]initWithTag:strTag];
    
    [self.navigationController pushViewController:vc animated:YES];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellId = @"cellId";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];

    if( cell == nil )
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    else
    {
        
        firstCellView * cellView = (firstCellView*)[cell viewWithTag:10086];
        
        if( cellView != nil )
        {
            [cellView removeFromSuperview];
        }
    }
    
    firstCellView * cellView = [[firstCellView alloc]initWithDict:[_dataArray objectAtIndex:indexPath.row] withStr:@"观看代表作>>"];
    cellView.tag = 10086;
    [cell.contentView addSubview:cellView];
    
    return cell;
}



-(BOOL)canShowAdv
{
    NSDateComponents * data = [[NSDateComponents alloc]init];
    NSCalendar * cal = [NSCalendar currentCalendar];
    
    [data setCalendar:cal];
    [data setYear:2014];
    [data setMonth:ALLOW_MONTH];
    [data setDay:ALLOW_DAY];
    
    NSDate * farDate = [cal dateFromComponents:data];
    
    NSDate *now = [NSDate date];
    
    NSTimeInterval farSec = [farDate timeIntervalSince1970];
    NSTimeInterval nowSec = [now timeIntervalSince1970];
    
    
    if( nowSec - farSec >= 0 )
    {
        return YES;
    }
    
    return  NO;
}


-(void)showYouMiAdv
{
    if( [self canShowAdv] )
    {
        [YouMiWall showOffers:NO didShowBlock:^{
            NSLog(@"有米推荐墙已显示");
        } didDismissBlock:^{
            NSLog(@"有米推荐墙已退出");
            
         }];

    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
