#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <pthread.h>
#include <semaphore.h>

void sleep_random(int t) {
  sleep((int)(t * (rand() / (RAND_MAX *1.0))));
}

void delay(){
  int i = 10000000;
  while (i--)
    ;
}

#define N  5
sem_t chopstick[N];

void *phi(void *id){  /* 'id' starts from 1 */
  int i, left, right, myid = *(int*)id;
  left = myid - 1;
  right = (myid < N) ? myid : 0;
  for (i = 0; i < 3; i++){
    printf("phi #%d: start of thinking\n", myid);
/**** start *************/
  if (left < right) {
    sem_wait(&chopstick[left]);
    delay();
    sem_wait(&chopstick[right]);
  } else {
    sem_wait(&chopstick[right]);
    delay();
    sem_wait(&chopstick[left]);
  }
/**** end ***************/
    printf("phi #%d: start of eating\n", myid);
    sleep_random(3);
    sem_post(&chopstick[left]);
    sem_post(&chopstick[right]);
    printf("phi #%d: end of eating\n", myid);
  }
}

int main(){
  int i, id[N];
  pthread_t t[N];
  srand((int)time(0));
  for (i = 0; i < N; i++){
    id[i] = i + 1;
    sem_init(&chopstick[i], 0, 1);
  }
  for (i = 0; i < N; i++)
    pthread_create(&t[i], NULL, phi, &id[i]);
  for (i = 0; i < N; i++)
    pthread_join(t[i], NULL);
  return 0;
}
