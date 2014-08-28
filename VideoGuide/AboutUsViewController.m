//
//  AboutUsViewController.m
//  Disney
//
//  Created by zhuang chaoxiao on 13-10-29.
//  Copyright (c) 2013年 zhuang chaoxiao. All rights reserved.
//

#import "AboutUsViewController.h"
#import "GADBannerView.h"

@interface AboutUsViewController ()<GADBannerViewDelegate>
{
    GADBannerView *_bannerView;
    UIView * _adVgView;
}

@end

@implementation AboutUsViewController

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
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
#endif
    
    [self layoutView];
    
    [self laytouADVView];
    
    self.view.backgroundColor = [UIColor grayColor];
}

-(void)laytouADVView
{
    _bannerView = [[GADBannerView alloc]initWithFrame:CGRectMake(0.0,350,320,50)];//设置位置
    
    _bannerView.adUnitID = @"a1527e3f3d6c7bc";//调用你的id
 
    _bannerView.rootViewController = self;
    
    [self.view addSubview:_bannerView];
    
    [_bannerView loadRequest:[GADRequest request]];
    
}

-(void)layoutView
{
    #define IMAGE_WIDTH_LOCAL 100.0f
    #define IMAGE_HEIGHT_LOCAL 100.0f
    
    CGRect rect = CGRectMake(320/2-IMAGE_WIDTH_LOCAL/2, 10, IMAGE_WIDTH_LOCAL, IMAGE_HEIGHT_LOCAL);
    
    UIImageView * imgView = [[UIImageView alloc]initWithFrame:rect];
    imgView.image = [UIImage imageNamed:@"120_120"];
    imgView.layer.cornerRadius = 15;
    imgView.layer.masksToBounds = YES;
    
    [self.view addSubview:imgView];
    
    rect = CGRectMake(60, 30+100, 280, 200);
    UIImageView * imgBg = [[UIImageView alloc]initWithFrame:rect];
    //imgBg.image = [UIImage imageNamed:@"about_connect_bg"];
    
    rect = CGRectMake(5, 10, 270, 20);
    UILabel * labName = [[UILabel alloc]initWithFrame:rect];
    labName.text = @"联系人:      小土豆";
    labName.backgroundColor = [UIColor clearColor];
    [imgBg addSubview:labName];
    
    rect = CGRectMake(5, 40, 270, 20);
    UILabel * labQQ = [[UILabel alloc]initWithFrame:rect];
    labQQ.text = @"联系QQ:    479408690";
    labQQ.backgroundColor = [UIColor clearColor];
    [imgBg addSubview:labQQ];
    
    rect = CGRectMake(5, 70, 270, 20);
    UILabel * labPhone = [[UILabel alloc]initWithFrame:rect];
    labPhone.text = @"联系电话:  15921931771";
    labPhone.backgroundColor = [UIColor clearColor];
    [imgBg addSubview:labPhone];
    
    [self.view addSubview:imgBg];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end











