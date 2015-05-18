//
//  DownloadPictureThread.h
//  TestPthread
//
//  Created by xugang on 5/18/15.
//  Copyright (c) 2015 RongCloud. All rights reserved.
//

#ifndef __TestPthread__DownloadPictureThread__
#define __TestPthread__DownloadPictureThread__

#include <stdio.h>
#include "XGThread.h"
#import <Foundation/Foundation.h>
#import "XGMutex.h"

typedef void (^notify_block)(NSData *);

class DownloadPictureThread : public XGThread {
public:
  NSString *urlString;
  NSData *imageData;
  notify_block callback_block;
  XGMutex m_mutex;

public:
  DownloadPictureThread(NSString *urlStr, notify_block cb);
  int Run();
  int OnComplete();
  virtual ~DownloadPictureThread();
};

#endif /* defined(__TestPthread__DownloadPictureThread__) */
