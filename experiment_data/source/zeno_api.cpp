#include "zeno_api.h"

#include <set>
#include <stack>
#include <cassert>

class SimpleIDManager {
private:
    std::stack<int32_t> _id_stack;
    std::set<int32_t> _id_alloc_set;

public:
    SimpleIDManager(uint32_t num_ids=8192, uint32_t start_id=1) {
        for (int32_t i = num_ids-1+start_id; i >= start_id; i--) {
            _id_stack.push(i);
        }
    }
    int32_t NextID() {
        if (_id_stack.empty())
            return -1;
        int32_t id = _id_stack.top();
        _id_stack.pop();
        _id_alloc_set.insert(id);
        return id;
    }

    void FreeID(int32_t id) {
        if (_id_alloc_set.find(id) != _id_alloc_set.end())
            return;
        _id_alloc_set.erase(id);
        _id_stack.push(id);
    }
};

global_memory_t global_mem;
SimpleIDManager id_manager;

int32_t zeno_delete_object(int32_t object_id, int32_t group_id) {
    id_manager.FreeID(object_id);
    return 0;
}

void zeno_get_u4(uint32_t* dest_word, uint32_t target_addr,
                 uint32_t pe, uint32_t nelems, uint32_t stride ) {
    assert(stride % 4 == 0);
    for (uint32_t i = 0, addr=target_addr; i < nelems; i++, addr+=stride) {
        dest_word[i] = global_mem[pe][addr];
    }
}

void zeno_put_u4(uint32_t* src_word,
                 uint32_t target_addr, uint32_t pe,
                 uint32_t nelems, uint32_t stride ) {
    assert(stride % 4 == 0);
    for (uint32_t i = 0, addr=target_addr; i < nelems; i++, addr+=stride) {
        global_mem[pe][addr] = src_word[i];
    }
}

global_object_t zeno_create_object(uint32_t num_pages, int32_t node_id) {
    global_object_t object;
    int32_t next_id = id_manager.NextID();
    assert(next_id >= 0);
    object.object_id = next_id;
    object.group_id = 0;
    return object;
}

void zeno_put_word(const global_object_t* obj, uint32_t value, uint32_t address) {
    zeno_put_u4(&value, address, obj->object_id, 1, 4);
}

uint32_t zeno_get_word(const global_object_t* obj, uint32_t address) {
    uint32_t word = 0;
    zeno_get_u4(&word, address, obj->object_id, 1, 4);
    return word;
}

