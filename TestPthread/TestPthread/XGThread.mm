//
//  XGThread.cpp
//  TestPthread
//
//  Created by xugang on 5/18/15.
//  Copyright (c) 2015 RongCloud. All rights reserved.
//

#include "XGThread.h"

void *XGThread::ThreadFunction(void *param) {
  (static_cast<XGThread *>(param))->Run();
  int ret = (static_cast<XGThread *>(param))->OnComplete();
  printf("OnComplete =>%d", ret);
  return 0;
}

int XGThread::Start() {
  pthread_attr_init(&attr);

  pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);
  stauts = pthread_create(&m_pid, &attr, ThreadFunction, this);
  return stauts;
}
int XGThread::OnComplete() { return 0; }