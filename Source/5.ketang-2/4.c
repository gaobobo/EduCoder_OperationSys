#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <pthread.h>
#include <semaphore.h>

#define CUSTOMER_NUM  10

#undef CUSTOMER_NUM
#define CUSTOMER_NUM 2

int customer_state[CUSTOMER_NUM] = {0};

void sleep_random(int t) {
  sleep((int)(t * (rand() / (RAND_MAX *1.0))));
}

void print_cur_state() {
  int i;
  printf("  customers with seats: (");
  for (i = 0; i < CUSTOMER_NUM; i++)
  {
    if (0 != customer_state[i])
      printf(" %d", i+1);
  }
  printf(" )\n");
}

void *customer(void *id)
{
  const int myid = *(int*)id;
  sleep_random(2);
  printf("customer %d: try to get a seat...\n", myid);

  printf("customer %d: sit down\n", myid);
  customer_state[myid-1] = 1;
  print_cur_state();

  sleep_random(3);

  printf("customer %d: stand up\n", myid);
  customer_state[myid-1] = 0;
  print_cur_state();
}

int main()
{
  int i, id[CUSTOMER_NUM], res;
  pthread_t t[CUSTOMER_NUM];

  srand((int)time(0));

  for (i = 0; i < CUSTOMER_NUM; i++)
  {
    id[i] = i + 1;
    pthread_create(&t[i], NULL, customer, &id[i]);
  }
  for (i = 0; i < CUSTOMER_NUM; i++)
  {
    res = pthread_join(t[i], NULL);
    if (res != 0){
      perror("failed to join thread");
      exit(2);
    }
  }
  return 0;
}
