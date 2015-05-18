//
//  XGMutex.h
//  TestPthread
//
//  Created by xugang on 5/18/15.
//  Copyright (c) 2015 RongCloud. All rights reserved.
//

#ifndef __TestPthread__XGMutex__
#define __TestPthread__XGMutex__

#include <stdio.h>
#include <pthread.h>
class XGMutex {
public:
  XGMutex();
  ~XGMutex();
  virtual void Lock() const;
  virtual void Unlock() const;

private:
  mutable pthread_mutex_t m_mutex;
  __darwin_pid_t m_pid;
  pthread_t m_tid;
};
#endif /* defined(__TestPthread__XGMutex__) */
