//
//  ViewController.h
//  TestPthread
//
//  Created by xugang on 8/11/14.
//  Copyright (c) 2014 RongCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <pthread.h>

@interface ViewController : UIViewController{
    pthread_t m_pid;
    pthread_attr_t attr;
}
@property (nonatomic,strong)UIImageView * imageView;
@end
