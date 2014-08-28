//
//  MainViewController.m
//  VideoGuide
//
//  Created by zhuang chaoxiao on 14-2-10.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import "MainViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "AboutUsViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController

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
    
    
    CGFloat yPos1 = 0;
    CGFloat yPos2 = 0;
    CGFloat yPos3 = 0;
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGFloat height = rect.size.height;
    
    NSLog(@"height:%f",height);
    
    
    if( height >= 568 )
    {
        yPos1 = 100;
        yPos2 = 220;
        yPos3 = 430;
    }
    else
    {
        yPos1 = 80;
        yPos2 = 180;
        yPos3 = 370;
    }
    
    {
        CGRect rect;
        rect = CGRectMake(20, yPos1, 100, 100);
        
        UIImage * img = [UIImage imageNamed:@"round_1"];
        UIButton * btn = [[UIButton alloc]initWithFrame:rect];
        
        btn.layer.cornerRadius = 100/2;
        btn.layer.masksToBounds = YES;
        
        [btn setBackgroundImage:img forState:UIControlStateNormal];
        [self.view addSubview:btn];
        
        btn.tag = 0;
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    {
        CGRect rect;
        rect = CGRectMake(200, yPos1, 100, 100);
        
        UIImage * img = [UIImage imageNamed:@"round_2"];
        UIButton * btn = [[UIButton alloc]initWithFrame:rect];
        btn.layer.cornerRadius = 100/2;
        btn.layer.masksToBounds = YES;
        
        [btn setBackgroundImage:img forState:UIControlStateNormal];
        [self.view addSubview:btn];
        
        btn.tag = 1;
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
   
    
    {
        CGRect rect;
        rect = CGRectMake(70, yPos2, 180, 180);
        
        UIImage * img = [UIImage imageNamed:@"round_3"];
        UIButton * btn = [[UIButton alloc]initWithFrame:rect];
        btn.layer.cornerRadius = 180/2;
        btn.layer.masksToBounds = YES;
        
        [btn setBackgroundImage:img forState:UIControlStateNormal];
        [self.view addSubview:btn];
        
        btn.tag = 2;
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    {
        CGRect rect;
        rect = CGRectMake(20, yPos3, 100, 100);
        
        UIImage * img = [UIImage imageNamed:@"round_4"];
        UIButton * btn = [[UIButton alloc]initWithFrame:rect];
        btn.layer.cornerRadius = 100/2;
        btn.layer.masksToBounds = YES;
        
        [btn setBackgroundImage:img forState:UIControlStateNormal];
        [self.view addSubview:btn];
        
        btn.tag = 3;
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    {
        CGRect rect;
        rect = CGRectMake(200, yPos3, 100, 100);
        
        UIImage * img = [UIImage imageNamed:@"round_5"];
        UIButton * btn = [[UIButton alloc]initWithFrame:rect];
        
        btn.layer.cornerRadius = 100/2;
        btn.layer.masksToBounds = YES;
        
        [btn setBackgroundImage:img forState:UIControlStateNormal];
        
        [self.view addSubview:btn];
        
        btn.tag = 4;
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }

    
    [self.navigationItem setTitle:@"小区美女对对碰"];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}


-(void)btnClicked:(UIButton*)btn
{
    NSLog(@"tag:%d",btn.tag);
    
    
    if( 0 == btn.tag )
    {
        //女忧
        FirstViewController * vc = [[FirstViewController alloc]init];
        
        [self.navigationController setNavigationBarHidden:NO animated:NO];
        [self.navigationController pushViewController:vc animated:YES];
 
    }
    else if( 2 == btn.tag )
    {
        //电影
        SecondViewController * vc = [[SecondViewController alloc]init];
        [self.navigationController setNavigationBarHidden:NO animated:NO];
        [self.navigationController pushViewController:vc animated:YES];

    }
    else if( 1 == btn.tag )
    {
        //知识
        ThirdViewController * vc = [[ThirdViewController alloc]init];
        [self.navigationController setNavigationBarHidden:NO animated:NO];
        [self.navigationController pushViewController:vc animated:YES];

    }
    else if( 3 == btn.tag )
    {
        FourthViewController * vc = [[FourthViewController alloc]init];
        [self.navigationController setNavigationBarHidden:NO animated:NO];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    else if( 4 == btn.tag )
    {
        AboutUsViewController * vc = [[AboutUsViewController alloc]init];
        [self.navigationController setNavigationBarHidden:NO animated:NO];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    else
    {
        
    }
}

/*
-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"viewDidAppear");
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
 */

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
