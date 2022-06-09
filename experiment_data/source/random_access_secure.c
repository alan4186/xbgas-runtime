#include <stdio.h>
#include <stdint.h>

#include "zeno_lib.h"

// Program parameters
#define NUM_ACCESSES (4*1024)
#define PAGE_SIZE 4096 // Bytes
#define NUM_PAGES 8
#define OBJ_SIZE PAGE_SIZE*NUM_PAGES
#define BLOCK_SIZE 64 // Bytes
#define OBJ_ID_MASK 0x0000007F
//#define OBJ_ADDR_MASK 0x00001FC0 // Align addresses to blocks, dont go over the object size
#define OBJ_ADDR_MASK 0x00003FC0 // Align addresses to blocks, dont go over the object size

// Custom RNG parameters
#define MY_RAND_MAX = 2147483647
#define SEED  0xdeadbeef
int main () {

  uint32_t put_block[BLOCK_SIZE >> 2];
  uint32_t get_block[BLOCK_SIZE >> 2];
  uint32_t my_rand_state = SEED;
  global_object_id_t obj_arr[NUM_OBJ];
  uint32_t obj_index;
  uint32_t obj_addr;

  // Init put_block
  for(int i=0; i<(BLOCK_SIZE>>2); i++) {
    put_block[i] = i;
  }

  // Allocate objects and store IDs in an array
  for(int i=0; i<NUM_OBJ; i++) {
    obj_arr[i] = zeno_create_object(NUM_PAGES, -1);
  }

  // Write Main Loop
  for(int i=0; i<NUM_ACCESSES; i++) {

    // Get random object ID
    my_rand_state = (my_rand_state * 1103515245 + 12345) % 2147483648;
    obj_index = (my_rand_state>>16) & OBJ_ID_MASK;
    while(obj_index >= NUM_OBJ){
      obj_index -= NUM_OBJ;
    }

    // Get random object Address
    my_rand_state = (my_rand_state * 1103515245 + 12345) % 2147483648;
    obj_addr = (my_rand_state>>16) & OBJ_ADDR_MASK;

    // Write block to object address
    zeno_put_u4((uint32_t)put_block, obj_addr, obj_arr[obj_index].object_id, BLOCK_SIZE>>2, 4);

    /*
    printf("-------------------------------------------------------------------------------\n");
    printf("Write #%d\n", i);
    printf("Object Index: %d\n", obj_index);
    printf("Object ID: %d\n", obj_arr[obj_index].object_id);
    printf("Object Addr: %08x\n", obj_addr);
    */

  }

  // Reset RNG to read back same blocks
  my_rand_state = SEED;

  // Read Main Loop
  for(int i=0; i<NUM_ACCESSES; i++) {

    // Get random object ID
    my_rand_state = (my_rand_state * 1103515245 + 12345) % 2147483648;
    obj_index = (my_rand_state>>16) & OBJ_ID_MASK;
    while(obj_index >= NUM_OBJ){
      obj_index -= NUM_OBJ;
    }
    // Get random object Address
    my_rand_state = (my_rand_state * 1103515245 + 12345) % 2147483648;
    obj_addr = (my_rand_state>>16) & OBJ_ADDR_MASK;

    // Get block to object address
    zeno_get_u4((uint32_t)get_block, obj_addr, obj_arr[obj_index].object_id, BLOCK_SIZE>>2, 4);

    for(int j=0; j<(BLOCK_SIZE>>2); j++) {
      if(get_block[j] != j) {
        halt(-2);
      }
    }
  }

  halt(-1);
}

