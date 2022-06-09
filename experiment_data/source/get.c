#include <stdint.h>

#include "zeno_lib.h"

#define NUM_PAGES (TRANSFER_SIZE >> 12)
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

    global_object_id_t obj_a = zeno_create_object(num_pages, NODE);

    zeno_get_u4((uint32_t)word_arr, 0, obj_a.object_id, NUM_WORDS, 4);

    //zeno_delete_object(obj_a.object_id, obj_a.group_id);

    halt(-1);
}

