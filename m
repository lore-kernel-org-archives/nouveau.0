From: Thomas Hellstrom <thomas-4+hqylr40dJg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] drm/ttm: Fix race condition in
	ttm_bo_delayed_delete
Date: Thu, 21 Jan 2010 13:59:26 +0100
Message-ID: <4B584FAE.8040801@shipmail.org>
References: <4B54B949.9010906@vmware.com>
	<ff13bc9a1001181433v1694e681l9f7ce9d880132dc3@mail.gmail.com>
	<4B56E8EE.8090706@shipmail.org> <4B56F308.5090603@shipmail.org>
	<4B56F401.8070700@vmware.com>
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
Cc: "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>, "dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Jerome Glisse wrote:
> On Thu, Jan 21, 2010 at 04:49:39AM +0100, Luca Barbieri wrote:
>   
>>> We had to do a similar thing in the
>>> Poulsbo driver and it turned out that we could save a significant amount of
>>> CPU by using a delayed workqueue, collecting objects and destroying them
>>> periodically.
>>>       
>> Yes, indeed, we don't really care about a fence expiring unless we
>> want to use that buffer or we are out of memory.
>> Processing each fence, especially if there is an interrupt per fence,
>> seems unnecessary, since you can just do that work in the cases
>> mentioned above.
>>
>> So, here is a new proposal that should have the best features of all
>> previously considered methods.
>> Assume first that there is a single FIFO channel.
>>
>> We introduce a list of fence nodes, each containing:
>> - A list of buffers NOT to be destroyed having the fence as their sync
>> object (or possibly one for each memory type)
>> - A delayed-destroy list of buffers having the fence as their sync object
>>
>> Fence nodes are added at the end upon emission.
>> They are removed and freed when the buffer count drops to 0 (meaning
>> all buffers have been moved to later fences).
>> Thus, the number of fence nodes does not grow without bounds, but is
>> bounded by the number of buffers.
>> .
>> The LRU lists are changed to only contain unfenced buffers and buffers
>> are initially put on it.
>> When a buffer is fenced, it is removed from the LRU list or its
>> current fence list, and added to the new fence (possibly destroying
>> the old fence node in the process).
>> The reference count of buffer objects is only increased when they are
>> put in a delayed destruction list.
>>
>> Upon deletion, they are destroyed immediately if they are on the LRU
>> list and moved to the corresponding delayed-delete list if they are in
>> the fenced list.
>>
>> ttm_bo_delayed_delete is no longer called by any workqueue, but only
>> on when we run out of memory, before we try eviction.
>> It processes the list until the first unsignalled fence, destroying
>> all buffers it finds and freeing all the fence nodes.
>> All the buffers in the alive lists are put in the LRU list, in the
>> correct order.
>> We may either keep an alive list per memory type, or sort the buffers
>> by memory type (so they are put in the memory type LRU list) at this
>> point
>>
>> Thus, after ttm_bo_delayed_delete, there is the following scenario:
>> 1. Inactive buffers with no references are destroyed
>> 2. Inactive buffers with references are in the LRU list
>> 3. Fenced buffers with no references are in the delayed-destroy list
>> attached to their fence
>> 4. Fenced buffers with references are in the alive list attached to their fence
>>
>> This should have about the same CPU and memory usage of the current
>> code, but the following advantages:
>> 1. Delayed deletion does not run periodically, but exactly when needed
>> (at allocation time, before eviction)
>> 2. Delayed deletion always deletes all buffers that can be deleted,
>> since it processes them in fence order
>> 3. The LRU list at eviction time contains exactly all evictable buffers
>> 4. Each buffer is always on an LRU _or_ on a delayed destroy list, so
>> only one node is necessary
>> 5. Once buffer deletion determines a fence is signalled, it can
>> destroyed all its to-be-destroyed buffers without any more checking
>> 6. Some fence logic (such as signalling of all fences on channel
>> forced closing) can be moved  from drivers to TTM
>> 7. Some channel logic can be moved from drivers to TTM
>> 8. The code should be simpler and more elegant
>>
>> Note that using a buffer with the CPU doesn't change its position in
>> the LRU list.
>> This is good, because evicting a buffer used by the CPU is actually a
>> good thing, since it will move to a region of memory slower for the
>> GPU but possibly faster for the CPU.
>> However, for buffers in system memory, if the LRU list is used for
>> swapping, CPU access should move the buffer to the front of list
>> (using the LRU list for this is probably a bad idea though, since
>> system memory swapping should be at page granularity).
>>
>> For multiple channels, things are slightly more complex.
>> First, we need to built the fence data structure for each channel.
>> Also, we need the fence/buffer nodes to be separate
>> Delayed destruction continues to work, but the reference count needs
>> to be set to the number of channels fencing the buffer on destruction.
>> Putting buffers in the LRU list can be done by doing n-way merging
>> between the channel fence lists, assigning each fence a global
>> sequence number, and using that to merge and put back buffers in the
>> LRU.
>> n-way merging can be done with a small heap on the stack on current
>> hardware where channels are limited.
>> Furthermore, we need to keep a reference count, so that buffers are
>> put in the LRU (or destroyed) only after they are off all the
>> channels.
>>
>> The LRU list semantics are relaxed. If a buffer has both its fence
>> emitted before another buffer, and also signaled before it, then it
>> will be considered as "less recently" used, and the opposite thing
>> happens if both are after. Otherwise, the order is undetermined.
>>
>> This should still guarantee good eviction behavior, and allows to have
>> the LRU list only contain evictable buffers, while not requiring to
>> use a dynamic priority queue.
>> Otherwise, a red-black tree (or an indirect heap with back references)
>> indexed by the global fence sequence number can guarantee strict
>> emission-time LRU semantics. This seems unnecessary though.
>>
>> Thoughts? Opinions?
>> Any possible improvement?
>>
>>     
>
> I love the first solution but solution to multi fifo side
> looks overkilling. So i am wondering if we aren't tackling
> the issue from the wrong side. Below is slightly different
> approach to the issue.
>
> Idea is that memory management is about having bo in place
> for the GPU. So instead of looking at the problem from the
> bo side, look at it from the GPU address space side.
>
> For simplicity here i am using only one space VRAM (but GTT
> or others can be deal the sameway). So now we split the
> problem to look at it as a transaction any time the driver
> want to do somethings it ask to ttm to create new transaction
> each transaction is associated to a fence and list of buffer
> with their possible placement (i will explain how it can
> fit multi fifo gpu well too and how it also allow easy support
> to GPU with virtual address space which is somethings slowly
> becoming a reality i think).
>
> TTM receive a transaction it takes a transaction lock and give
> transaction number to this new transaction. Then it goes over
> the BO list and try to come up with the best placement for
> each of them.
>   
Jerome, This seems to have a fundamental flaw of not allowing
simultaneous command submission.

With the current code, A process blocked trying to validate its buffers 
will not block other processes from validating, and we should keep it 
that way.

/Thomas
