From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: Re: [PATCH] drm/ttm: Fix race condition in
	ttm_bo_delayed_delete
Date: Thu, 21 Jan 2010 16:14:39 +0100
Message-ID: <ff13bc9a1001210714m34c3976etc7680f056cb55453@mail.gmail.com>
References: <4B54B949.9010906@vmware.com> <4B56E8EE.8090706@shipmail.org>
	<4B56F308.5090603@shipmail.org> <4B56F401.8070700@vmware.com>
	<ff13bc9a1001201122y110fb003k704bc6d05d2aea07@mail.gmail.com>
	<4B5764BA.7080801@vmware.com>
	<ff13bc9a1001201245g6ee25219q851b7989968f4c7b@mail.gmail.com>
	<4B576FF5.9040907@shipmail.org>
	<ff13bc9a1001201949l4691f202v2a2874b9cef86f37@mail.gmail.com>
	<20100121122920.GB3837@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100121122920.GB3837-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Jerome Glisse <glisse-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org>
Cc: "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, "dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Thomas Hellstrom <thomas-4+hqylr40dJg9hUCZPvPmw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

I'm not sure I understand your proposal correctly.
It seems your proposoal is similar to mine, replacing the term "fence
nodes" with "ttm transactions", but I'm not sure if I understand it
correctly

Here is some pseudocode for a improved, simplified version of my proposal.
It is modified so that there are no longer distinct alive/destroy
lists, but buffers are destroyed if their ref count is zero.

list_head ram_lru_list; /* list of bos */
list_head vram_unfenced_lru_list; /* list of bos */
list_head gart_unfenced_lru_list; /* list of bos */

atomic uint64_t next_seq_num;

// if read_list and write_list are empty, the buffer is unfenced and
MUST be in an unfenced lru list
// otherwise, it is fenced and MUST be, if not zombie, on some
read_list/write_list, or if zombie, on some unfenced_list
struct ttm_buffer_object
{
   kref_t ref;
   list_head read_list; /* list of bo_fence_nodes */
   list_head write_list; /* list of bo_fence_nodes */
   list_head unfenced_list; /* list entry in
[ram|[gart|vram]_unfenced]_lru_list */
   [...]
};

// TODO: we could embed just the first two members in the
ttm_buffer_object, and steal the lowest bit on the fence pointer to
signify that
// this would optimize for the very common single-fence case
struct ttm_bo_fence_node
{
    list_head bo_list; /* list entry in bo.[read|write]_list */
    struct ttm_fence_node* fence;

    struct ttm_buffer_object* bo;
    list_head fence_list; /* list entry in fence.[vram|gart|destroy]_list */
};

struct ttm_fence
{
    void* sync_object; /* may also turned into an object containing a
ttm_fence at the start */
    uint64_t seq_num; /* unique value in order of kmalloc of this ttm_fence */
    list_head bo_list; /* list of bo_fence_nodes */
};

struct ttm_channel
{
    list_head fence_list; /* list of ttm_fence_node */
};

ttm_flush_fences()
{
    list_head vram_list[MAX_CHANNELS];
    list_head gart_list[MAX_CHANNELS];
    foreach channel
    {
        foreach fence in channel
        {
             if(not driver->fence_expired(fence->sync_object))
                 break;
             foreach bo_fence_node in fence.bo_list
             {
                 remove bo_fence_node
                 if bo.read_list and bo.write_list are both empty
                 {
                     if bo.refcount is zero
                         destroy
                     else
                     {
                         append to [vram|gart]_list[channel]
                     }
                 }
             }
        }
    }

    // this is the n-way merge of vram_list[]s into the lru list
    while(vram_list[]s are not all empty)
    {
        // this can use either a simple scan, or an heap
        find channel such that
first_entry(vram_list[channel]).fence.seq_num is smallest

        remove first_entry(vram_list[channel]) and put the bo at the
recent end of vram_unfenced_lru_list
    }

    same thing for gart;
}

// assume buffer is reserved, use current mechanism or mutex for that
// channel may be null for CPU waits
ttm_bo_wait(bo, channel, wait_for_write)
{
     foreach fence_node in bo.write_list
     {
         if(fence_node.channel != channel)
             driver->wait_fence(fence_node.fence.sync_object);
     }

     if(!wait_for_write)
          return;

     foreach fence_node in bo.read_list
     {
         if(fence_node.channel != channel)
              driver->wait_fence(fence_node.fence.sync_object);
     }
}

ttm_out_of_memory() takes memory_alloc_mutex
{
retry:
    ttm_flush_fences();
    if(we have enough space now)
        return;
    foreach in [vram|gart]_unfenced_lru_list
    {
        evict that buffer if it's big enough, no need to check fences
        this uses the current "ghost" mechanism for accelerated moves
        emit evicted_buffer_fence for after emission
    }
    if we didn't find a big enough buffer, evict the biggest buffer
(also consider empty space around it in size)
    if(we have enough space now)
        return;
    if(burn_cpu_time_but_have_lowest_latencies)
    {
        while(!driver->fence_expired(evicted_bo->sync_object) and we
don't have enough space)
        {
            driver->wait_for_any_fence_to_expire();
            ttm_flush_fences();
        }
    }
    else
        ttm_bo_wait(evicted_bo 0)
    goto retry;
}

// assume the buffer has already been put in the desired memory space
// also assume we already waited for the buffer fences
ttm_add_buffer_to_fence(fence, bo)
{
    remove bo from unfenced lru list if it's on it
    for the none or single bo_fence_node in bo.read_list or
bo.write_list with bo_fence_node.fence.channel == fence.channel
    {
        remove bo_fence_node from bo_fence_node.fence.[gart|vram]_list
        if(bo_fence_node.fence has all lists empty)
            remove from channel and free the fence bo_fence_node.fence
        remove bo_fence_node from bo.[read|list]_list
    }

    create a new bo_fence node and use it to add the bo to the fence
}

ttm_bo_refcount_drops_to_zero(bo)
{
    if(bo.read_list is empty and bo.write_list is empty)
        free(bo);
   // otherwise ttm_flush_fences takes care of this, no need to do anything here
}

linux_get_free_page_is_out_of_memory
{
    ttm_flush_fences(); // destroy any buffers we can destroy
}

use_buffer_with_cpu(bo)
{
   if(bo is in vram)
       return; // CPU access should not prevent eviction of VRAM buffers
   if(bo is unfenced and thus on an lru_list)
       move to recent end of lru_list it is on
}

This code does not itself handle inter-channel synchronization, which
is can be done by driver in accelerated moves and before calling
ttm_add_buffer_to_fence(fence, bo)
Drivers without on-GPU synchronization can just do ttm_bo_wait(bo,
channel), others can use whatever scheme they think is best.

Actually we may not need to add any "sync domain" concept to TTM, as
it seems possible to do synchronization in the driver, at least in
this scheme.
