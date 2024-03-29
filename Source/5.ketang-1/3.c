#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

int sum1 = 0, sum2 = 0;

void *p1(){
  int i, tmp = 0;
  for (i = 1; i <= 100; i++)
    tmp += i;
  sum1 += tmp;
}

void p2(){
  int i, tmp = 0;
  for (i = 101; i <= 200; i++)
    tmp += i;
  sum2 += tmp;
}

void p3(){
  printf("sum: %d\n", sum1 + sum2);
}

int main(){
  int res;
  pthread_t t;
  void *thread_result;
  res = pthread_create(&t, NULL, p1, NULL);
  if (res != 0){
    perror("failed to create thread");
    exit(1);
  }
  //p2();

  pthread_t t2;
  int res2;
  void *thread_result2;
  res2 = pthread_create(&t2,NULL,(void*)p2,NULL);
  if (res2 != 0) {
    perror("ailed to create thread");
    exit(1);
  }
  res2 = pthread_join(t2,&thread_result2);
  if (res != 0) {
    perror("failed to join thread");
    exit(2);
  }

  res = pthread_join(t, &thread_result);
  if (res != 0){
    perror("failed to join thread");
    exit(2);
  }
  p3();
  return 0;
}
