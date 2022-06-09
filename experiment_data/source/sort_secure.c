#include <stdio.h>
#include <stdint.h>


#include "zeno_lib.h"

// Custom RNG parameters
#define RAND_INT_MAX 65536
#define SEED  0x32159285


// Program parameters
//#define NUM_OBJ 16
#define NUM_INT (4*1024)
#define BUCKET_SIZE  (RAND_INT_MAX/NUM_OBJ)
#define NUM_PAGES 4

uint32_t rand_int(uint32_t rand_state);
void quicksort(uint32_t object_id, int first, int last);

int main () {

  uint32_t rand_state = SEED;
  int bucket_index;
  uint32_t count;
  uint32_t int_arr[NUM_INT];
  uint32_t int_arr2[NUM_INT];
  int32_t obj_addr[NUM_OBJ];
  uint32_t num_pages;
  global_object_id_t obj_arr[NUM_OBJ];

  // Iniitalize random array of integers
  for(int i=0; i<NUM_INT; i++) {
    rand_state = rand_int(rand_state);
    int_arr[i] = (rand_state >> 8) & 0xFFFF;
  }

  // Set the number of pages per object
  if(NUM_PAGES < 1) {
    num_pages = 1;
  }
  else {
    num_pages = NUM_PAGES;
  }


  // Allocate objects for each bucket
  for(int i=0; i<NUM_OBJ; i++) {
    obj_arr[i] = zeno_create_object(num_pages, -1);
    obj_addr[i] = -4;
  }

  // Distribute integers into buckets
  for(int i=0; i<NUM_INT; i++) {
    bucket_index = NUM_OBJ-1;
    while(int_arr[i] < (bucket_index*BUCKET_SIZE) ) {
      bucket_index--;
    }
    // Incriment the bucket address
    obj_addr[bucket_index] += 4;
    // Put word I into it's bucket
    zeno_put_u4((uint32_t)&int_arr[i], obj_addr[bucket_index], obj_arr[bucket_index].object_id, 1, 4);
  }

  // Sort local bucket
  quicksort(obj_arr[0].object_id, 0, (obj_addr[0]>>2));

  // Gather integers into local array.
  count = 0;
  for(int i=0; i<NUM_OBJ; i++) {

    if(count == NUM_INT) {
      break;
    }

    if( obj_addr[i] >= 0) {
      zeno_get_u4((uint32_t)&int_arr2[count], 0, obj_arr[i].object_id, (obj_addr[i]>>2)+1, 4);
      count += (obj_addr[i]>>2) + 1;
    }
  }

  // check quicksort
  uint32_t num_a;
  uint32_t num_b;

  for(int i=0; i< ((obj_addr[0]>>2)-1); i+=1) {

    if(int_arr2[i] > int_arr2[i+1]){
      halt(i);
    }
  }

  halt(-1);

}

// Return a random int in the range [0-65536]
uint32_t rand_int(uint32_t rand_state) {
    return (rand_state * 1103515245 + 12345) % 2147483648;
  /*
    rand_state = (rand_state * 1103515245 + 12345) % 2147483648;
    return (rand_state >> 8) & 0xFFFF;
  */
}

void quicksort(uint32_t object_id, int first, int last){
   int i, j;
   uint32_t pivot, temp;
   uint32_t number_i, number_j, number_pivot;

   if(first<last){
      pivot=first;
      i=first;
      j=last;


      zeno_get_u4((uint32_t)&number_pivot, pivot<<2, object_id, 1, 4);
      zeno_get_u4((uint32_t)&number_i, i<<2, object_id, 1, 4);
      zeno_get_u4((uint32_t)&number_j, j<<2, object_id, 1, 4);

      while(i<j){
         while( number_i<=number_pivot && i<last) {
           i++;
           zeno_get_u4((uint32_t)&number_i, i<<2, object_id, 1, 4);
         }
         while(number_j>number_pivot) {
           j--;
           zeno_get_u4((uint32_t)&number_j, j<<2, object_id, 1, 4);
         }
         if(i<j) {
            temp=number_i;
            number_i=number_j;
            zeno_put_u4((uint32_t)&number_i, i<<2, object_id, 1, 4);
            number_j=temp;
            zeno_put_u4((uint32_t)&number_j, j<<2, object_id, 1, 4);
         }
      }

      temp=number_pivot;
      number_pivot=number_j;
      zeno_put_u4((uint32_t)&number_pivot, pivot<<2, object_id, 1, 4);
      number_j=temp;
      zeno_put_u4((uint32_t)&number_j, j<<2, object_id, 1, 4);

      quicksort(object_id,first,j-1);
      quicksort(object_id,j+1,last);

   }
}
