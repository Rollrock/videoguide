//
//  ThirdViewController.m
//  VideoGuide
//
//  Created by zhuang chaoxiao on 14-2-11.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import "ThirdViewController.h"
#import "JSONKit.h"
#import "MyWebViewController.h"

#define KNOWLEDGE_FILE_NAME @"knowledge.txt"
#define KNOWLEDGE_DOWN_URL  @"http://www.999dh.net/VideoGuide/knowledge.txt"

@interface ThirdViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _cellView;
    
    NSMutableArray * _dataArray;
    
    NSURLConnection * coon;
    NSMutableData * data;
}
@end

@implementation ThirdViewController

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
    
    [self downLoadInfoFile];
    
    [self.navigationItem setTitle:@"屌丝遇到白富美"];
    ///
    _dataArray = [[NSMutableArray alloc]init];
    
    
    ///
    CGRect rect;
    
    rect = CGRectMake(0, 0,self.view.bounds.size.width , self.view.bounds.size.height);
    
    _cellView = [[UITableView alloc]initWithFrame:rect];
    _cellView.delegate = self;
    _cellView.dataSource = self;
    
    _cellView.backgroundColor = [UIColor grayColor];
    
    
    [self.view addSubview:_cellView];
    
    self.view.backgroundColor = [UIColor greenColor];
    
}


-(void)downLoadInfoFile
{
    NSURL * url = [NSURL URLWithString:KNOWLEDGE_DOWN_URL];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    NSMutableData *da = [[NSMutableData alloc]init];
    NSURLConnection * con = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:YES];
    
    data = da;
    coon = con;
    
    if( coon != nil)
    {
        NSLog(@"create connection success");
    }
    else
    {
        NSLog(@"create connection failed");
    }

}

-(void)connection:(NSURLConnection*)connection didFailWithError:(NSError *)error
{
    NSLog(@"connection error happended");
}

-(void)connection:(NSURLConnection*)connection didReceiveData:(NSData *)da
{
    NSLog(@"connection receive data:%@",da);
    [data appendData:da];
    
}


-(void)parseData
{
    NSString *documentsDirectory =[NSHomeDirectory()stringByAppendingPathComponent:@"Documents"];
    NSString* path = [NSString stringWithFormat:@"%@/%@",documentsDirectory,KNOWLEDGE_FILE_NAME];
    NSData * da = [NSData dataWithContentsOfFile:path];
    
    NSString * str = [[NSString alloc]initWithData:da encoding:NSUTF8StringEncoding];
    
    da = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary * dict = [da objectFromJSONData];
    
    NSArray * array  = [dict objectForKey:@"data"];
    
    for(NSDictionary * subDict in array )
    {
        if( [subDict isKindOfClass:[NSDictionary class]])
        {
            [_dataArray addObject:subDict];
            
        }
    }
    
    [_cellView reloadData];

    //[self laytouView];
    
}

-(void)connectionDidFinishLoading:(NSURLConnection*)connection
{
    NSLog(@"download success");
    
    NSString *documentsDirectory =[NSHomeDirectory()stringByAppendingPathComponent:@"Documents"];
    NSString* path = [NSString stringWithFormat:@"%@/%@",documentsDirectory,KNOWLEDGE_FILE_NAME];
    
    if( [data writeToFile:path atomically:YES])
    {
        NSLog(@"save file success");
        
        //NSString * text = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        [self parseData];
    }
    else
    {
        NSLog(@"save file failed");
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyWebViewController * vc = [[MyWebViewController alloc]initWithNibName:nil bundle:nil];
    vc.urlStr = [(NSDictionary*)[_dataArray objectAtIndex:indexPath.row] objectForKey:@"url"];
    
    [self.navigationController pushViewController:vc animated:YES];
}

/*
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}
*/


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
        /*
        firstCellView * cellView = (firstCellView*)[cell viewWithTag:10086];
        if( cellView != nil )
        {
            [cellView removeFromSuperview];
        }
         */
    }

    
    
    cell.textLabel.text = [(NSDictionary*)[_dataArray objectAtIndex:indexPath.row] objectForKey:@"title"];
    
    
    return cell;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

