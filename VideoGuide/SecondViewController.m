//
//  SecondViewController.m
//  VideoGuide
//
//  Created by zhuang chaoxiao on 14-2-10.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import "SecondViewController.h"
#import "firstCellView.h"
#import "JSONKit.h"
#import "SecondDetailViewController.h"

@interface SecondViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * _cellView;
    NSMutableArray * _dataArray;
}
@end

@implementation SecondViewController

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
    
    [self.navigationItem setTitle:@"美女人气排行榜"];

    //
    _dataArray = [[NSMutableArray alloc]init];
    
    [self readDataFromFile];
    
    /////
    
    CGRect rect;
    
    rect = CGRectMake(0, 0,self.view.bounds.size.width , self.view.bounds.size.height);
    
    _cellView = [[UITableView alloc]initWithFrame:rect];
    _cellView.delegate = self;
    _cellView.dataSource = self;
    
    _cellView.backgroundColor = [UIColor grayColor];
    
    
    [self.view addSubview:_cellView];
    
    
    /////
    self.view.backgroundColor = [UIColor grayColor];
}


-(void)readDataFromFile
{
    NSString * filePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"movies.txt"];
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
    
    SecondDetailViewController * vc = [[SecondDetailViewController alloc]initWithTag:strTag];
    
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
    
    firstCellView * cellView = [[firstCellView alloc]initWithDict:[_dataArray objectAtIndex:indexPath.row] withStr:@"前往下载>>"];
    cellView.tag = 10086;
    [cell.contentView addSubview:cellView];
    
    
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
