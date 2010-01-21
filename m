From: Jerome Glisse <glisse-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org>
Subject: Re: [PATCH] drm/ttm: Fix race condition in
	ttm_bo_delayed_delete
Date: Thu, 21 Jan 2010 13:29:20 +0100
Message-ID: <20100121122920.GB3837@localhost.localdomain>
References: <4B54B949.9010906@vmware.com>
	<ff13bc9a1001181433v1694e681l9f7ce9d880132dc3@mail.gmail.com>
	<4B56E8EE.8090706@shipmail.org> <4B56F308.5090603@shipmail.org>
	<4B56F401.8070700@vmware.com>
	<ff13bc9a1001201122y110fb003k704bc6d05d2aea07@mail.gmail.com>
	<4B5764BA.7080801@vmware.com>
	<ff13bc9a1001201245g6ee25219q851b7989968f4c7b@mail.gmail.com>
	<4B576FF5.9040907@shipmail.org>
	<ff13bc9a1001201949l4691f202v2a2874b9cef86f37@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ff13bc9a1001201949l4691f202v2a2874b9cef86f37-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Cc: "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, "dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Thomas Hellstrom <thomas-4+hqylr40dJg9hUCZPvPmw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Jan 21, 2010 at 04:49:39AM +0100, Luca Barbieri wrote:
> > We had to do a similar thing in the
> > Poulsbo driver and it turned out that we could save a significant amount of
> > CPU by using a delayed workqueue, collecting objects and destroying them
> > periodically.
> Yes, indeed, we don't really care about a fence expiring unless we
> want to use that buffer or we are out of memory.
> Processing each fence, especially if there is an interrupt per fence,
> seems unnecessary, since you can just do that work in the cases
> mentioned above.
> 
> So, here is a new proposal that should have the best features of all
> previously considered methods.
> Assume first that there is a single FIFO channel.
> 
> We introduce a list of fence nodes, each containing:
> - A list of buffers NOT to be destroyed having the fence as their sync
> object (or possibly one for each memory type)
> - A delayed-destroy list of buffers having the fence as their sync object
> 
> Fence nodes are added at the end upon emission.
> They are removed and freed when the buffer count drops to 0 (meaning
> all buffers have been moved to later fences).
> Thus, the number of fence nodes does not grow without bounds, but is
> bounded by the number of buffers.
> .
> The LRU lists are changed to only contain unfenced buffers and buffers
> are initially put on it.
> When a buffer is fenced, it is removed from the LRU list or its
> current fence list, and added to the new fence (possibly destroying
> the old fence node in the process).
> The reference count of buffer objects is only increased when they are
> put in a delayed destruction list.
> 
> Upon deletion, they are destroyed immediately if they are on the LRU
> list and moved to the corresponding delayed-delete list if they are in
> the fenced list.
> 
> ttm_bo_delayed_delete is no longer called by any workqueue, but only
> on when we run out of memory, before we try eviction.
> It processes the list until the first unsignalled fence, destroying
> all buffers it finds and freeing all the fence nodes.
> All the buffers in the alive lists are put in the LRU list, in the
> correct order.
> We may either keep an alive list per memory type, or sort the buffers
> by memory type (so they are put in the memory type LRU list) at this
> point
> 
> Thus, after ttm_bo_delayed_delete, there is the following scenario:
> 1. Inactive buffers with no references are destroyed
> 2. Inactive buffers with references are in the LRU list
> 3. Fenced buffers with no references are in the delayed-destroy list
> attached to their fence
> 4. Fenced buffers with references are in the alive list attached to their fence
> 
> This should have about the same CPU and memory usage of the current
> code, but the following advantages:
> 1. Delayed deletion does not run periodically, but exactly when needed
> (at allocation time, before eviction)
> 2. Delayed deletion always deletes all buffers that can be deleted,
> since it processes them in fence order
> 3. The LRU list at eviction time contains exactly all evictable buffers
> 4. Each buffer is always on an LRU _or_ on a delayed destroy list, so
> only one node is necessary
> 5. Once buffer deletion determines a fence is signalled, it can
> destroyed all its to-be-destroyed buffers without any more checking
> 6. Some fence logic (such as signalling of all fences on channel
> forced closing) can be moved  from drivers to TTM
> 7. Some channel logic can be moved from drivers to TTM
> 8. The code should be simpler and more elegant
> 
> Note that using a buffer with the CPU doesn't change its position in
> the LRU list.
> This is good, because evicting a buffer used by the CPU is actually a
> good thing, since it will move to a region of memory slower for the
> GPU but possibly faster for the CPU.
> However, for buffers in system memory, if the LRU list is used for
> swapping, CPU access should move the buffer to the front of list
> (using the LRU list for this is probably a bad idea though, since
> system memory swapping should be at page granularity).
> 
> For multiple channels, things are slightly more complex.
> First, we need to built the fence data structure for each channel.
> Also, we need the fence/buffer nodes to be separate
> Delayed destruction continues to work, but the reference count needs
> to be set to the number of channels fencing the buffer on destruction.
> Putting buffers in the LRU list can be done by doing n-way merging
> between the channel fence lists, assigning each fence a global
> sequence number, and using that to merge and put back buffers in the
> LRU.
> n-way merging can be done with a small heap on the stack on current
> hardware where channels are limited.
> Furthermore, we need to keep a reference count, so that buffers are
> put in the LRU (or destroyed) only after they are off all the
> channels.
> 
> The LRU list semantics are relaxed. If a buffer has both its fence
> emitted before another buffer, and also signaled before it, then it
> will be considered as "less recently" used, and the opposite thing
> happens if both are after. Otherwise, the order is undetermined.
> 
> This should still guarantee good eviction behavior, and allows to have
> the LRU list only contain evictable buffers, while not requiring to
> use a dynamic priority queue.
> Otherwise, a red-black tree (or an indirect heap with back references)
> indexed by the global fence sequence number can guarantee strict
> emission-time LRU semantics. This seems unnecessary though.
> 
> Thoughts? Opinions?
> Any possible improvement?
> 

I love the first solution but solution to multi fifo side
looks overkilling. So i am wondering if we aren't tackling
the issue from the wrong side. Below is slightly different
approach to the issue.

Idea is that memory management is about having bo in place
for the GPU. So instead of looking at the problem from the
bo side, look at it from the GPU address space side.

For simplicity here i am using only one space VRAM (but GTT
or others can be deal the sameway). So now we split the
problem to look at it as a transaction any time the driver
want to do somethings it ask to ttm to create new transaction
each transaction is associated to a fence and list of buffer
with their possible placement (i will explain how it can
fit multi fifo gpu well too and how it also allow easy support
to GPU with virtual address space which is somethings slowly
becoming a reality i think).

TTM receive a transaction it takes a transaction lock and give
transaction number to this new transaction. Then it goes over
the BO list and try to come up with the best placement for
each of them.

To do so TTM know the situation of the address space from
the previous active recorded transaction. Let N be the previous
active transaction and N+1 the new one. BO are described as
Name(offset,size), vram size is 500:
Trans[N]: A(0,100), B(100,200), C(400,100)
Trans[N+1]: wants A(?,100), and D(?,200)

So TTM need to evict either B or C to put D. Now if for each
transaction we record for each segment allocated the bo the
fence(s) &  associated transaction number to this we can
support cleverly the multi fifo GPU.

We need to associate with each a fence an fifoID (could be
named more genericly channel or somethings else as others hw
have similar things for instance separate dma unit). Now in
order to avoid having fifo waiting too much on each others
all we need to do is evict the bo which either have the same
fifoID that the transaction N+1 (ie transaction N+1 will be
executed in the same fifo so we know that we don't have to
wait for the other fifo) or the BO with the oldest transaction
number/fence ie the one that will most likely soon won't be
needed anymore by GPU.

The TTM transaction function is also responsible for handling
BO deletion, each time a BO is bound to GPU space (ie in one
of the active transaction) TTM takes a ref. When a new transaction
comme TTM query for each segement if all fence are expired or
not. If all fence are expired and if there is only 1 ref left
then that means the BO have been deleted and we could simply
remove it from the space (GPU is done with it and userspace
don't care about it anymore).

Also TTM will had the N+1 fence to the fence list of BO already
in a current suitable position, in the example above, the
segment where A is will be associated with fence N and fence
N + 1. A segment is idle when all the fences associated to
it are signaled (this way we support multi-fifo).

Once placement are selected TTM transaction record N+1 as
the new current state. Here is pseudo code as it speaks
more.

struct ttm_trans_bo {
	struct list_head list;
	struct bo *bo;
	struct fence_nodes *fences;
	struct placement pl;
	u64 gpuaddr;
};

struct ttm_trans {
	struct fence *fence; // transaction fence
	u32 step; // transaction step
	struct list_head bos; // list of struct ttm_trans_bo
	struct list_head evicts; // list of struct ttm_trans_bo
};

int ttm_trans_new(ttmdev, struct ttm_trans *t);

Upon successfull return ttm_trans_new will fill evicts list
with a list of buffer needed to be evicted for this transactions
and will complete bos list by setting gpuaddr and narrowing
done the placement info to the placement ttm picked up.

Then there is 2 differents possibility. If evicts list is empty
driver can directly move bo into the respective gpuaddr and
schedule the command it wants to execute.

If evicts list is not empty then driver as to go through it
and for each entry it has to go through fences and wait for
them to be signaled before evicting the bo, once all the bo
are evicted it can go through bos list and load bo at the
proper address. Using a list of fences for each evicted bos
is to allow having a bo being shared btw fifos.

This design put the burden on the driver, for instance on
some hw with multi-fifo the hw can schedule every transaction
into the GPU fifo ring:
-wait fence A,B,C....
-evict bo ....
-copy bo ...
-command stream
-evict transaction fence
GPU need to have wait for functionality and way to wait for
fence (depend on the hw) but also need to be able to change
the GART by itself.

On GPU with no such support it will have to work with the CPU
TTM can provide helper workqueue to do this in the most reasonable
way.

This design depreciated all bo move functionality, and all bo
validation one. There is no more delayed delete list or rcu list
per space but rather a transaction struct per space recording
the current state of the placement from CPU point of view, this
state is being updated by querying fence each time there is
a call to ttm_trans_new. The pinned buffer can be associated
to some transaction that never ends until unpinned.

This design also have nice feature for instance when pinninp
unpinning a buffer you can provide in the evicts list the
list of buffer to unpin and in the bos list the list of buffer
to pin, this way TTM has a change to place the new pinned buffer
as the same place as the old one.

I also believe it fits well to GPU with multi-fifos and last
it could also be cleverly use with GPU with virtual address
space for each fifos.

Cheers,
Jerome
