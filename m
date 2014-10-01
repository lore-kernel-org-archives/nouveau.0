From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [RFC] Explicit synchronization for Nouveau
Date: Wed, 01 Oct 2014 17:58:52 +0200
Message-ID: <542C24BC.6010705@canonical.com>
References: <1411725612-10455-1-git-send-email-lpeltonen@nvidia.com>
 <20140929074302.GB4109@phenom.ffwll.local>
 <20141001151416.GC25206@eumail.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20141001151416.GC25206-GyFFdlxoGbnFT5IIyIEb6QC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lauri Peltonen <lpeltonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, James Jones <jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ken Adams <kadams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hey,

On 01-10-14 17:14, Lauri Peltonen wrote:
> Thanks Daniel for your input!
> 
> On Mon, Sep 29, 2014 at 09:43:02AM +0200, Daniel Vetter wrote:
>> On Fri, Sep 26, 2014 at 01:00:05PM +0300, Lauri Peltonen wrote:
>>> (2) Stop automatically storing fences to the buffers that user space wants to
>>>     synchronize explicitly.
>>
>> The problem with this approach is that you then need hw faulting to make
>> sure the memory is there. Implicit fences aren't just used for syncing,
>> but also to make sure that the gpu still has access to the buffer as long
>> as it needs it. So you need at least a non-exclusive fence attached for
>> each command submission.
>>
>> Of course on Android you don't have swap (would kill the puny mmc within
>> seconds) and you don't care for letting userspace pin most of memory for
>> gfx. So you'll get away with no fences at all. But for upstream I don't
>> see a good solution unfortunately. Ideas very much welcome.
>>
>>> (3) Allow user space to attach an explicit fence to dma-buf when exporting to
>>>     another driver that uses implicit sync.
>>>
>>> There are still some open issues beyond these.  For example, can we skip
>>> acquiring the ww mutex for explicitly synchronized buffers?  I think we could
>>> eventually, at least on unified memory systems where we don't need to migrate
>>> between heaps (our downstream Tegra GPU driver does not lock any buffers at
>>> submit, it just grabs refcounts for hw).  Another quirk is that now Nouveau
>>> waits on the buffer fences when closing the gem object to ensure that it
>>> doesn't unmap too early.  We need to rework that for explicit sync, but that
>>> shouldn't be difficult.
>>
>> See above, but you can't avoid to attach fences as long as we still use a
>> buffer-object based gfx memory management model. At least afaics. Which
>> means you need the ordering guarantees imposed by ww mutexes to ensure
>> that the oddball implicit ordered client can't deadlock the kernel's
>> memory management code.
> 
> Implicit fences attached to individual buffers are one way for residency
> management.  Do you think a working set based model could work in the DRM
> framework?  For example, something like this:
> 
> - Allow user space to create "working set objects" and associate buffers with
>   them.  If the user space doesn't want to manage working sets explicitly, it
>   could also use an implicit default working set that contains all buffers that
>   are mapped to the channel vm (on Android we could always use the default
>   working set since we don't need to manage residency).  The working sets are
>   initially marked as dirty.
> - User space tells which working sets are referenced by each work submission.
>   Kernel locks these working sets, pins all buffers in dirty working sets, and
>   resets the dirty bits.  After kicking off work, kernel stores the fence to
>   the _working sets_, and then releases the locks (if an implicit default
>   working set is used, then this would be roughly equivalent to storing a fence
>   to channel vm that tells "this is the last hw operation that might have
>   touched buffers in this address space").
> - If swapping doesn't happen, then we just need to check the working set dirty
>   bits at each submit.
> - When a buffer is swapped out, all working sets that refer to it need to be
>   marked as dirty.
> - When a buffer is swapped out or unmapped, we need to wait for the fences from
>   all working sets that refer to the buffer.
> 
> Initially one might think of working sets as a mere optimization - we now need
> to process a few working sets at every submit instead of many individual
> buffers.  However, it makes a huge difference because of fences: fences that
> are attached to buffers are used for implicitly synchronizing work across
> different channels and engines.  They are in the performance critical path, and
> we want to carefully manage them (that's the idea of explicit synchronization).
> The working set fences, on the other hand, would only be used to guarantee that
> we don't swap out or unmap something that the GPU might be accessing.  We never
> need to wait for those fences (except when swapping or unmapping), so we can be
> conservative without hurting performance.
> 
> 
>> Imo de-staging the android syncpt stuff needs to happen first, before drivers
>> can use it. Since non-staging stuff really shouldn't depend upon code from
>> staging.
> 
> Fully agree.  I thought the best way towards that would be to show some driver
> code that _would_ use it. :)
> 
> 
>> I'm all for adding explicit syncing. Our plans are roughly.  - Add both an in
>> and and out fence to execbuf to sync with other rendering and give userspace
>> a fence back. Needs to different flags probably.
>>
>> - Maybe add an ioctl to dma-bufs to get at the current implicit fences
>>   attached to them (both an exclusive and non-exclusive version). This
>>   should help with making explicit and implicit sync work together nicely.
>>
>> - Add fence support to kms. Probably only worth it together with the new
>>   atomic stuff. Again we need an in fence to wait for (one for each
>>   buffer) and an out fence. The later can easily be implemented by
>>   extending struct drm_event, which means not a single driver code line
>>   needs to be changed for this.
>>
>> - For de-staging android syncpts we need to de-clutter the internal
>>   interfaces and also review all the ioctls exposed. Like you say it
>>   should be just the userspace interface for struct drm_fence. Also, it
>>   needs testcases and preferrably manpages.
> 
> This all sounds very similar to what we'd like to do!  Maybe we can move
> forward with these parts, and continue to attach fences at submit until we have
> a satisfactory solution for the pinning problem?

You could neuter implicit fences by always attaching the fences as shared when 
explicit syncing is used. This would work correctly with eviction, and wouldn't
cause any unneeded syncing. :)

~Maarten
