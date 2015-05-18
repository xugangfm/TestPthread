//
//  XGMutex.cpp
//  TestPthread
//
//  Created by xugang on 5/18/15.
//  Copyright (c) 2015 RongCloud. All rights reserved.
//

#include "XGMutex.h"

XGMutex::XGMutex() {
  NSLog(@"%s", __FUNCTION__);
  pthread_mutex_init(&m_mutex, NULL);
}

XGMutex::~XGMutex() {
  NSLog(@"%s", __FUNCTION__);
  pthread_mutex_destroy(&m_mutex);
}

void XGMutex::Lock() const {
  NSLog(@"%s", __FUNCTION__);
  pthread_mutex_lock(&m_mutex);
}

void XGMutex::Unlock() const {
  NSLog(@"%s", __FUNCTION__);
  pthread_mutex_unlock(&m_mutex);
}