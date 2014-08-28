//
//  firstCellView.m
//  VideoGuide
//
//  Created by zhuang chaoxiao on 14-2-10.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import "firstCellView.h"

@implementation firstCellView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
    }
    return self;
}


- (id)initWithDict:(NSDictionary*)dict withStr:(NSString *)str
{
    self = [super init];
    if (self) {
        
        // Initialization code
        
        [self initView:dict withStr:str];
        
    }
    return self;
}


/*
- (id)initWithDict:(NSDictionary*)dict withTip:(BOOL)bFlag
{
    self = [super init];
    if (self) {
        
        // Initialization code
        
        [self initView:dict withTip:bFlag];
        
    }
    return self;
}
*/

-(void)initView:(NSDictionary*)dict withStr:(NSString*)str
{

    CGRect rect;
    rect = CGRectMake(5, 5, 70, 70);
    
    UIImageView * imgView = [[UIImageView alloc]initWithFrame:rect];
    UIImage * img = [UIImage imageNamed: [NSString stringWithFormat:@"%@.jpg",[dict objectForKey:@"tag"]]];
    imgView.image = img;
    imgView.layer.cornerRadius = 15;
    imgView.layer.masksToBounds = YES;
    
    [self addSubview:imgView];
    
    ////////
    rect = CGRectMake(80, 5, 320-100, 15);
    UILabel * labName = [[UILabel alloc]initWithFrame:rect];
    labName.backgroundColor = [UIColor clearColor];
    labName.font = [UIFont systemFontOfSize:16];
    labName.text = [dict objectForKey:@"name"]; //@"小仓玛利亚";
    [self addSubview:labName];
    
    ////
    
    //if( bFlag == YES )
    {
        /*
        rect = CGRectMake(200, 5, 320-100, 15);
        UILabel * labTip = [[UILabel alloc]initWithFrame:rect];
        labTip.backgroundColor = [UIColor clearColor];
        labTip.font = [UIFont systemFontOfSize:15];
        labTip.textColor = [UIColor blueColor];
        labTip.text = str;
        [self addSubview:labTip];
         */
    }

    /////
    rect = CGRectMake(80, 20, 320-100, 55);
    UILabel * labDesc = [[UILabel alloc]initWithFrame:rect];
    labDesc.numberOfLines = 0;
    labDesc.backgroundColor = [UIColor clearColor];
    labDesc.font = [UIFont systemFontOfSize:13];
    labDesc.text = [dict objectForKey:@"desc"]; //@"小仓玛利亚作为日本AV节的大师级人物";
    //[labDesc sizeToFit];
    [self addSubview:labDesc];
    
    ////contact
    rect = CGRectMake(220, 5, 320-100, 15);
    UILabel * contact = [[UILabel alloc]initWithFrame:rect];
    contact.numberOfLines = 0;
    contact.backgroundColor = [UIColor clearColor];
    contact.font = [UIFont systemFontOfSize:13];
    contact.text = [dict objectForKey:@"contact"];
    contact.textColor = [UIColor orangeColor];
    //[labDesc sizeToFit];
    [self addSubview:contact];
    
    //Dis
    rect = CGRectMake(170, 5, 320-100, 15);
    UILabel * dis = [[UILabel alloc]initWithFrame:rect];
    dis.numberOfLines = 0;
    dis.backgroundColor = [UIColor clearColor];
    dis.font = [UIFont systemFontOfSize:13];
    dis.text = [dict objectForKey:@"Dis"];
    dis.textColor = [UIColor redColor];
    //[labDesc sizeToFit];
    [self addSubview:dis];
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
