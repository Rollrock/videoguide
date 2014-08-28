//
//  FourthViewController.m
//  VideoGuide
//
//  Created by zhuang chaoxiao on 14-3-23.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()
{
}

@end

@implementation FourthViewController

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
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationItem setTitle:@"美轮美奂"];
    
    CGRect rect = CGRectZero;
    
    UIScrollView * scrView = [[UIScrollView alloc]initWithFrame:rect];
    
    for (NSInteger index = 1; index <= 5; ++ index)
    {
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:rect];
        UIImage * img = [UIImage imageNamed:[NSString stringWithFormat:@"sex_%d.jpg",index]];
        imgView.image = img;
        
        rect = CGRectMake(5, 5 + rect.origin.y + rect.size.height, 310, img.size.height);
        imgView.frame = rect;
        
        [scrView addSubview:imgView];
    }

    scrView.frame = CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height);
    scrView.contentSize = CGSizeMake(320, rect.origin.y + rect.size.height);
    
    [self.view addSubview:scrView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
