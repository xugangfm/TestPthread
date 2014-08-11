//
//  ViewController.m
//  TestPthread
//
//  Created by xugang on 8/11/14.
//  Copyright (c) 2014 RongCloud. All rights reserved.
//

#import "ViewController.h"

ViewController * handle;

@interface ViewController ()

@end

void* download(void *xxx){
   
    printf("%s",xxx);
    
    NSString *url = [[NSString alloc]initWithUTF8String:(char*)xxx];
    
    dispatch_async(dispatch_get_main_queue(), ^(){
    
    handle.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
    
    });
    
    return NULL;
}


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    handle = self;
	// Do any additional setup after loading the view, typically from a nib.
    self.imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    
    [self.view addSubview:_imageView];
    
    //self.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://news.ifeng.com/coop/20140810/41516951_0.shtml#p=2"]]];
    
   NSString *url = @"http://img.pconline.com.cn/images/upload/upc/tx/auto5/1311/22/c3/28884281_28884281_1385103688875_800x1200.jpg";
    
    pthread_attr_init(&attr);
    
    pthread_attr_setdetachstate(&attr,PTHREAD_CREATE_DETACHED);
    

    
    //pthread_create(&m_pid,&attr,download,(void*)[url UTF8String]);
    
    pthread_create(&m_pid,NULL,download,(void*)[url UTF8String]);
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
