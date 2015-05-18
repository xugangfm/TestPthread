//
//  XGThread.h
//  TestPthread
//
//  Created by xugang on 5/18/15.
//  Copyright (c) 2015 RongCloud. All rights reserved.
//

#ifndef __TestPthread__XGThread__
#define __TestPthread__XGThread__

#include <stdio.h>
#include <pthread.h>
class XGThread {
private:
  pthread_t m_pid;
  pthread_attr_t attr;
  int stauts;
  int result;

public:
  XGThread() {}
  virtual ~XGThread() { NSLog(@"%s", __FUNCTION__); }
  int Start();
  virtual int Run() = 0;
  virtual int OnComplete();

protected:
  static void *ThreadFunction(void *param);
};

#endif /* defined(__TestPthread__XGThread__) */
