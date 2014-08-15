//
//  ViewController.m
//  AsyncSocketClient
//
//  Created by xugang on 8/14/14.
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
    
    __asyncSocket = [[AsyncSocket alloc]initWithDelegate:self];
    
    NSError *err = nil;
    
    if(![__asyncSocket connectToHost:@"" onPort:8888 error:&err ])
        
    {
        
        NSLog(@"Error: %@", err);
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)sendMsg:(id)sender
{
    NSString *text = self.textField.text;
    if (text.length > 0) {
        [__asyncSocket writeData:[text dataUsingEncoding:NSUTF8StringEncoding] withTimeout:60 tag:1];
    }
    
}

-(void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag

{
    
    NSLog(@"thread(%@),onSocket:%p didWriteDataWithTag:%ld",[[NSThread currentThread] name],
          
          sock,tag);
    
}

-(void) onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    
    NSString* aStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"===%@",aStr);
}

@end
