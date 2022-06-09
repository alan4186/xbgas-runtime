
typedef struct {
    int32_t object_id;
    int32_t group_id;
} global_object_id_t;


global_object_id_t zeno_create_object(uint32_t num_pages, int32_t node_pid_id);
int32_t zeno_delete_object(int32_t object_id, int32_t group_id);


/*
# Calling Convention
#   - a0 = base address
#   - a1 = obj address
#   - a2 = obj ID
#   - a3 = nelems
#   - a4 = stride (in bytes)
*/
void zeno_put_u1( uint32_t base_src, uint32_t obj_addr, uint32_t obj_id,
                  uint32_t nelems, uint32_t stride );

void zeno_put_u4( uint32_t base_src, uint32_t base_dest, uint32_t pe,
                  uint32_t nelems, uint32_t stride );

void zeno_get_u1( uint32_t base_src, uint32_t base_dest, uint32_t pe,
                  uint32_t nelems, uint32_t stride );

void zeno_get_u4( uint32_t base_src, uint32_t base_dest, uint32_t pe,
                  uint32_t nelems, uint32_t stride );

/*
# Calling Convention
#   - a0 = src obj address
#   - a1 = dst obj address
#   - a2 = src obj ID
#   - a3 = dst obj ID
#   - a4 = nelems
#   - a5 = stride (in bytes)
*/
void zeno_copy_u1( uint32_t src_obj_addr, uint32_t dst_obj_addr,
                   uint32_t src_obj_id, uint32_t dst_obj_id,
                   uint32_t nelems, uint32_t stride );

void zeno_copy_u4( uint32_t src_obj_addr, uint32_t dst_obj_addr,
                   uint32_t src_obj_id, uint32_t dst_obj_id,
                   uint32_t nelems, uint32_t stride );

void halt(uint32_t code);

