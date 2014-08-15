//
//  ViewController.h
//  AsyncSocketClient
//
//  Created by xugang on 8/14/14.
//  Copyright (c) 2014 RongCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncSocket.h"

@interface ViewController : UIViewController{
    
    AsyncSocket *__asyncSocket;
}

@property(nonatomic,strong) IBOutlet UITextView *textView;
@property (nonatomic,strong) IBOutlet UIButton *button;
@property (nonatomic,strong) IBOutlet UITextField *textField;
-(IBAction)sendMsg:(id)sender;
@end
