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
    
    if(![__asyncSocket connectToHost:@"192.168.1.100" onPort:8083 error:&err ])
        
    {
        
        NSLog(@"Error: %@", err);
        
    }
    
    [__asyncSocket readDataWithTimeout:-1 tag:1];
    
    self.textView.editable = NO;
    
    self.textView.text = @"";
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
    
    self.textField.text =@"";
    
}

-(void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag

{
    
    NSLog(@"thread(%@),onSocket:%p didWriteDataWithTag:%ld",[[NSThread currentThread] name],
          
          sock,tag);
    
}

-(void) onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    
    NSString* aStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"===%@",aStr);
    
    self.textView.text = [NSString stringWithFormat:@"%@\n%@\n",self.textView.text,aStr];
    
    [sock readDataWithTimeout:-1 tag:1];
}



@end
