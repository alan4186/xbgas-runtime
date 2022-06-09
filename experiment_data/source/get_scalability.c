#include <stdint.h>

#include "zeno_lib.h"

//#define NUM_PAGES (TRANSFER_SIZE >> 12)
#define NUM_PAGES 4
#define NUM_WORDS (TRANSFER_SIZE >> 2)
int main() {
    uint32_t word_arr[NUM_WORDS];
    uint32_t num_pages;

    if(NUM_PAGES == 0)
      num_pages = 1;
    else
      num_pages = NUM_PAGES;

    if(NUM_WORDS == 0)
      halt(-2);

    global_object_id_t obj_arr[NUM_OBJ];

    for(int i=0; i<NUM_OBJ; i++) {
      obj_arr[i] = zeno_create_object(num_pages, i);
    }

    for(int i=0; i<NUM_OBJ; i++) {
      zeno_get_u4((uint32_t)word_arr, 0, obj_arr[i].object_id, NUM_WORDS, 4);
    }

    halt(-1);
}

