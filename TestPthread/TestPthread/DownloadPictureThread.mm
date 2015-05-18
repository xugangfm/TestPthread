//
//  DownloadPictureThread.cpp
//  TestPthread
//
//  Created by xugang on 5/18/15.
//  Copyright (c) 2015 RongCloud. All rights reserved.
//

#include "DownloadPictureThread.h"

DownloadPictureThread::DownloadPictureThread(NSString *urlStr,
                                             notify_block cb) {
  imageData = nil;
  urlString = urlStr;
  callback_block = [cb copy];
}

int DownloadPictureThread::Run() {
  NSLog(@"%s", __FUNCTION__);
  m_mutex.Lock();
  imageData =
      [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:urlString]];
  m_mutex.Unlock();
  return 0;
}
int DownloadPictureThread::OnComplete() {
  NSLog(@"%s", __FUNCTION__);
  if (callback_block) {
    callback_block(imageData);
  }
  NSLog(@"delete this before");
  delete this;
  NSLog(@"delete this after");
  return 0;
}

DownloadPictureThread::~DownloadPictureThread() { NSLog(@"%s", __FUNCTION__); }