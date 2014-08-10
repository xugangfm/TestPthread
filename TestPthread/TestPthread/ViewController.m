//
//  ViewController.m
//  TestPthread
//
//  Created by xugang on 8/11/14.
//  Copyright (c) 2014 RongCloud. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    
    [self.view addSubview:_imageView];
    
    self.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://news.ifeng.com/coop/20140810/41516951_0.shtml#p=2"]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
