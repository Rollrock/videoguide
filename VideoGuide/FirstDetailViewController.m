//
//  FirstDetailViewController.m
//  VideoGuide
//
//  Created by zhuang chaoxiao on 14-2-10.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import "FirstDetailViewController.h"
#import "JSONKit.h"

#define IMAGE_HEIGHT  250
#define IMAGE_WIDHT   310
#define IMAGE_X_TIP   5
#define IMAGE_Y_TIP   5

@interface FirstDetailViewController ()
{
    NSMutableArray * _picArray;
    NSMutableString * _descStr;
    NSMutableString * _fileName;
}
@end

@implementation FirstDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(id)initWithTag:(NSString*)strTag
{
    self = [super init];
    
    if( self)
    {
        _fileName = [[NSMutableString alloc]init];
        [_fileName appendString:@"people_"];
        [_fileName appendString:strTag];
        [_fileName appendString:@".txt"];
    }
    
    return self;
}


-(void)readDataFromFile
{
    NSString * filePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:_fileName];
    NSString * strFile = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    NSData * data = [strFile dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary * dict = [data objectFromJSONData];
    
    NSArray * array = [dict objectForKey:@"pic"];
    
    for( NSDictionary * subDict in array )
    {
        NSString * str = [subDict objectForKey:@"name"];
        [_picArray addObject: str];
    }
    
    [_descStr appendString:[dict objectForKey:@"desc"]];

}





-(void)layoutView
{
    
    CGRect rect = CGRectZero;
     
    UIScrollView * scrView = [[UIScrollView alloc]initWithFrame:rect];
    
    for (NSInteger index = 0; index < [_picArray count]; ++ index)
    {
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:rect];
        UIImage * img = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",[_picArray objectAtIndex:index]]];
        imgView.image = img;
        
        float height = (IMAGE_WIDHT*img.size.height)/img.size.width;
        
       // rect = CGRectMake(IMAGE_X_TIP, IMAGE_Y_TIP + rect.origin.y + rect.size.height, IMAGE_WIDHT, img.size.height);
        
         rect = CGRectMake(IMAGE_X_TIP, IMAGE_Y_TIP + rect.origin.y , IMAGE_WIDHT, height);
        
        imgView.frame = rect;
        
        [scrView addSubview:imgView];
    }
    
    
    
    UILabel * labDesc = [[UILabel alloc]initWithFrame:rect];
    labDesc.numberOfLines = 0;
    labDesc.backgroundColor = [UIColor  clearColor];
    //labDesc.text = @"啊升级放辣椒放辣椒放辣阿道夫理解啊来得及发垃圾的垃圾的了；大姐夫大家发来；京东方；按季度；按季度；阿姐夫垃圾分类；啊加地方；垃圾的分类；甲氨蝶呤；附近阿里的减肥了；啊加地方垃圾地方垃圾堆里；阿姐夫了；啊加地方；啊加地方；按季度；辣椒发送aafasdadf啊发发送到发送到发的发生的罚单顶顶顶顶椒放辣椒放辣椒的放辣椒发几爱死";
    labDesc.text = _descStr;
    NSDictionary * attribute = @{NSFontAttributeName:labDesc.font};
    
    CGSize size = [labDesc.text  boundingRectWithSize:CGSizeMake(IMAGE_WIDHT, 9999.0f) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    rect = CGRectMake(IMAGE_X_TIP, rect.origin.y + rect.size.height + IMAGE_Y_TIP, IMAGE_WIDHT, size.height);
    labDesc.frame = rect;
    [scrView addSubview:labDesc];
    
    ////////-----
    scrView.frame = CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height);
    scrView.contentSize = CGSizeMake(320, rect.origin.y + rect.size.height);
    
    [self.view addSubview:scrView];
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _picArray = [[NSMutableArray alloc]init];
    _descStr = [[NSMutableString alloc]init];
    
    //-------
    [self readDataFromFile];
    
    [self layoutView];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end