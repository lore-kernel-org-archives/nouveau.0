From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: [RFC PATCH v1 08/16] drm/radeon: use common fence implementation
 for fences
Date: Mon, 19 May 2014 12:10:53 +0200
Message-ID: <5379D8AD.1000904@canonical.com>
References: <20140514145134.21163.32350.stgit@patser>
 <20140514145809.21163.64947.stgit@patser> <53738BCC.2070809@vodafone.de>
 <5374131D.4010906@canonical.com> <53748702.6070606@vodafone.de>
 <53748AFA.8010109@canonical.com> <53748BFD.1050608@vodafone.de>
 <5374BB4A.6070102@canonical.com> <5374BEE2.4060608@vodafone.de>
 <5374CC9A.9090905@canonical.com> <5374E1B5.2020408@vodafone.de>
 <5374E410.1080203@canonical.com> <5374E792.4070607@vodafone.de>
 <5379BA04.8000901@canonical.com> <5379C06D.3050507@vodafone.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5379C06D.3050507@vodafone.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?ISO-8859-1?Q?Christian_K=F6nig?= <deathsimple@vodafone.de>, airlied@linux.ie
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

op 19-05-14 10:27, Christian K=F6nig schreef:
> Am 19.05.2014 10:00, schrieb Maarten Lankhorst:
>> op 15-05-14 18:13, Christian K=F6nig schreef:
>>> Am 15.05.2014 17:58, schrieb Maarten Lankhorst:
>>>> op 15-05-14 17:48, Christian K=F6nig schreef:
>>>>> Am 15.05.2014 16:18, schrieb Maarten Lankhorst:
>>>>>> op 15-05-14 15:19, Christian K=F6nig schreef:
>>>>>>> Am 15.05.2014 15:04, schrieb Maarten Lankhorst:
>>>>>>>> op 15-05-14 11:42, Christian K=F6nig schreef:
>>>>>>>>> Am 15.05.2014 11:38, schrieb Maarten Lankhorst:
>>>>>>>>>> op 15-05-14 11:21, Christian K=F6nig schreef:
>>>>>>>>>>> Am 15.05.2014 03:06, schrieb Maarten Lankhorst:
>>>>>>>>>>>> op 14-05-14 17:29, Christian K=F6nig schreef:
>>>>>>>>>>>>>> +    /* did fence get signaled after we enabled the sw irq? =
*/
>>>>>>>>>>>>>> +    if (atomic64_read(&fence->rdev->fence_drv[fence->ring].=
last_seq) >=3D fence->seq) {
>>>>>>>>>>>>>> + radeon_irq_kms_sw_irq_put(fence->rdev, fence->ring);
>>>>>>>>>>>>>> +        return false;
>>>>>>>>>>>>>> +    }
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +    fence->fence_wake.flags =3D 0;
>>>>>>>>>>>>>> +    fence->fence_wake.private =3D NULL;
>>>>>>>>>>>>>> +    fence->fence_wake.func =3D radeon_fence_check_signaled;
>>>>>>>>>>>>>> + __add_wait_queue(&fence->rdev->fence_queue, &fence->fence_=
wake);
>>>>>>>>>>>>>> +    fence_get(f);
>>>>>>>>>>>>> That looks like a race condition to me. The fence needs to be=
 added to the wait queue before the check, not after.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Apart from that the whole approach looks like a really bad id=
ea to me. How for example is lockup detection supposed to happen with this? =

>>>>>>>>>>>> It's not a race condition because fence_queue.lock is held whe=
n this function is called.
>>>>>>>>>>> Ah, I see. That's also the reason why you moved the wake_up_all=
 out of the processing function.
>>>>>>>>>> Correct. :-)
>>>>>>>>>>>> Lockup's a bit of a weird problem, the changes wouldn't allow =
core ttm code to handle the lockup any more,
>>>>>>>>>>>> but any driver specific wait code would still handle this. I d=
id this by design, because in future patches the wait
>>>>>>>>>>>> function may be called from outside of the radeon driver. The =
official wait function takes a timeout parameter,
>>>>>>>>>>>> so lockups wouldn't be fatal if the timeout is set to somethin=
g like 30*HZ for example, it would still return
>>>>>>>>>>>> and report that the function timed out.
>>>>>>>>>>> Timeouts help with the detection of the lockup, but not at all =
with the handling of them.
>>>>>>>>>>>
>>>>>>>>>>> What we essentially need is a wait callback into the driver tha=
t is called in non atomic context without any locks held.
>>>>>>>>>>>
>>>>>>>>>>> This way we can block for the fence to become signaled with a t=
imeout and can then also initiate the reset handling if necessary.
>>>>>>>>>>>
>>>>>>>>>>> The way you designed the interface now means that the driver ne=
ver gets a chance to wait for the hardware to become idle and so never has =
the opportunity to the reset the whole thing.
>>>>>>>>>> You could set up a hangcheck timer like intel does, and end up w=
ith a reliable hangcheck detection that doesn't depend on cpu waits. :-) Or=
 override the default wait function and restore the old behavior.
>>>>>>>>>
>>>>>>>>> Overriding the default wait function sounds better, please implem=
ent it this way.
>>>>>>>>>
>>>>>>>>> Thanks,
>>>>>>>>> Christian. =

>>>>>>>>
>>>>>>>> Does this modification look sane?
>>>>>>> Adding the timeout is on my todo list for quite some time as well, =
so this part makes sense.
>>>>>>>
>>>>>>>> +static long __radeon_fence_wait(struct fence *f, bool intr, long =
timeout)
>>>>>>>> +{
>>>>>>>> +    struct radeon_fence *fence =3D to_radeon_fence(f);
>>>>>>>> +    u64 target_seq[RADEON_NUM_RINGS] =3D {};
>>>>>>>> +
>>>>>>>> +    target_seq[fence->ring] =3D fence->seq;
>>>>>>>> +    return radeon_fence_wait_seq_timeout(fence->rdev, target_seq,=
 intr, timeout);
>>>>>>>> +}
>>>>>>> When this call is comming from outside the radeon driver you need t=
o lock rdev->exclusive_lock here to make sure not to interfere with a possi=
ble reset.
>>>>>> Ah thanks, I'll add that.
>>>>>>
>>>>>>>>      .get_timeline_name =3D radeon_fence_get_timeline_name,
>>>>>>>>      .enable_signaling =3D radeon_fence_enable_signaling,
>>>>>>>>      .signaled =3D __radeon_fence_signaled,
>>>>>>> Do we still need those callback when we implemented the wait callba=
ck?
>>>>>> .get_timeline_name is used for debugging (trace events).
>>>>>> .signaled is the non-blocking call to check if the fence is signaled=
 or not.
>>>>>> .enable_signaling is used for adding callbacks upon fence completion=
, the default 'fence_default_wait' uses it, so
>>>>>> when it works no separate implementation is needed unless you want t=
o do more than just waiting.
>>>>>> It's also used when fence_add_callback is called. i915 can be patche=
d to use it. ;-)
>>>>>
>>>>> I just meant enable_signaling, the other ones are fine with me. The p=
roblem with enable_signaling is that it's called with a spin lock held, so =
we can't sleep.
>>>>>
>>>>> While resetting the GPU could be moved out into a timer the problem h=
ere is that I can't lock rdev->exclusive_lock in such situations.
>>>>>
>>>>> This means when i915 would call into radeon to enable signaling for a=
 fence we can't make sure that there is not GPU reset running on another CP=
U. And touching the IRQ registers while a reset is going on is a really goo=
d recipe to lockup the whole system.
>>>> If you increase the irq counter on all rings before doing a gpu reset,=
 adjust the state and call sw_irq_put when done this race could never happe=
n. Or am I missing something?
>>>>
>>> Beside that's being extremely ugly in the case of a hard PCI reset even=
 touching any register or just accessing VRAM in this moment can crash the =
box. Just working around the enable/disable of the interrupt here won't hel=
p us much.
>>>
>>> Adding another spin lock won't work so well either, because the reset f=
unction itself wants to sleep as well.
>>>
>>> The only solution I see off hand is making the critical reset code path=
 work in atomic context as well, but that's not really doable cause AFAIK w=
e need to work with functions from the PCI subsystem and spinning on a lock=
 for up to a second is not really desirable also.
>> I've checked the code a little but that can be the case now as well. the=
 new implementation's __radeon_fence_wait will be protected by the exclusiv=
e_lock,, but enable_signaling is only protected by the fence_queue.lock and=
 is_signaled is not protected. But this is not a change from the current si=
tuation, so it would only become a problem if the gpu hangs in a cross-devi=
ce situation.
>>
>> I think adding 1 to the irq refcount in the reset sequence and adding a =
down_read_trylock on the exclusive lock would help. If the trylock fails we=
 could perform only the safe actions without touching any of the gpu regist=
ers or vram, adding the refcount is needed to ensure enable_signaling works=
 as intended.
>
> The problem here is that the whole approach collides with the way we do r=
eset handling from a conceptual point of view. Every IOCTL or other call ch=
ain into the driver is protected by the read side of the exclusive_lock sem=
aphore. So in the case of a GPU lockup we can take the write side of the se=
maphore and so make sure that we have nobody else accessing the hardware or=
 internal driver structures only changed at init time.
>
> Leaking a drivers IRQ context into another driver as well as calling into=
 a driver in atomic context is just a quite uncommon approach and should be=
 considered very carefully.
>
> I would rather vote for a completely synchronous interface only allowing =
blocking waits and checks if a fence is signaled from not atomic context.
>
> If a driver needs to avoid blocking it should just use a workqueue and ch=
ecking a fence outside your own driver is probably be better done in a bott=
om halve handler anyway.

Except that you might want to do something like
fence_is_signaled() in another driver to check whether you need to
defer, or can submit the batch buffer immediately, saving a bunch of
context switches. Running the is_signaled atomic is really useful here
because it means you can't do too many scary things in your is_signaled
handler.

In case of enable_signaling it was the only sane solution, because
fence_signal can be called from irq context, and any calls after that to
fence_add_callback and fence_wait aren't allowed to do anything, so
fence_enable_sw_signaling and the default wait implementation must be
atomic. fence_wait itself doesn't have to be, so it's easy to grab
exclusive_lock there.

Simple fence drivers may drop some state after calling fence_signal, so
calling .enable_signaling after fence_signal is bad, and fence_signal
must also wait for any previous call to enable_signaling to be
completed. This means those functions have to be implemented with the
atomic spinlock held and irqs disabled. :-) The .signaled callback could
strictly speaking still be called after fence_signal is called, but
this function is optional.

I tried other locking approaches, but when I used a separate spinlock
for the fence things got even messier and I ended up with impossible to
eliminate locking inversions, or I removed the guarantee that calling
fence_signal meant that enable_signaling had either been not called or
completed, or other bugs and much harder to read code.

~Maarten

Revised diff below.
---
diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeo=
n.h
index 68528619834a..a7d839a158ae 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -64,6 +64,7 @@
  #include <linux/wait.h>
  #include <linux/list.h>
  #include <linux/kref.h>
+#include <linux/fence.h>
  =

  #include <ttm/ttm_bo_api.h>
  #include <ttm/ttm_bo_driver.h>
@@ -113,9 +114,6 @@ extern int radeon_hard_reset;
  #define RADEONFB_CONN_LIMIT			4
  #define RADEON_BIOS_NUM_SCRATCH			8
  =

-/* fence seq are set to this number when signaled */
-#define RADEON_FENCE_SIGNALED_SEQ		0LL
-
  /* internal ring indices */
  /* r1xx+ has gfx CP ring */
  #define RADEON_RING_TYPE_GFX_INDEX		0
@@ -347,12 +345,15 @@ struct radeon_fence_driver {
  };
  =

  struct radeon_fence {
+	struct fence base;
+
  	struct radeon_device		*rdev;
-	struct kref			kref;
  	/* protected by radeon_fence.lock */
  	uint64_t			seq;
  	/* RB, DMA, etc. */
  	unsigned			ring;
+
+	wait_queue_t fence_wake;
  };
  =

  int radeon_fence_driver_start_ring(struct radeon_device *rdev, int ring);
@@ -2256,6 +2257,7 @@ struct radeon_device {
  	struct radeon_mman		mman;
  	struct radeon_fence_driver	fence_drv[RADEON_NUM_RINGS];
  	wait_queue_head_t		fence_queue;
+	unsigned			fence_context;
  	struct mutex			ring_lock;
  	struct radeon_ring		ring[RADEON_NUM_RINGS];
  	bool				ib_pool_ready;
@@ -2346,11 +2348,6 @@ u32 cik_mm_rdoorbell(struct radeon_device *rdev, u32=
 index);
  void cik_mm_wdoorbell(struct radeon_device *rdev, u32 index, u32 v);
  =

  /*
- * Cast helper
- */
-#define to_radeon_fence(p) ((struct radeon_fence *)(p))
-
-/*
   * Registers read & write functions.
   */
  #define RREG8(reg) readb((rdev->rmmio) + (reg))
diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeo=
n/radeon_device.c
index 0e770bbf7e29..19c6911ed49f 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1175,6 +1175,7 @@ int radeon_device_init(struct radeon_device *rdev,
  	for (i =3D 0; i < RADEON_NUM_RINGS; i++) {
  		rdev->ring[i].idx =3D i;
  	}
+	rdev->fence_context =3D fence_context_alloc(RADEON_NUM_RINGS);
  =

  	DRM_INFO("initializing kernel modesetting (%s 0x%04X:0x%04X 0x%04X:0x%04=
X).\n",
  		radeon_family_name[rdev->family], pdev->vendor, pdev->device,
@@ -1565,6 +1566,54 @@ int radeon_resume_kms(struct drm_device *dev, bool r=
esume, bool fbcon)
  	return 0;
  }
  =

+static uint32_t radeon_gpu_mask_sw_irq(struct radeon_device *rdev)
+{
+	uint32_t mask =3D 0;
+	int i;
+
+	if (!rdev->ddev->irq_enabled)
+		return mask;
+
+	/*
+	 * increase refcount on sw interrupts for all rings to stop
+	 * enabling interrupts in radeon_fence_enable_signaling during
+	 * gpu reset.
+	 */
+
+	for (i =3D 0; i < RADEON_NUM_RINGS; ++i) {
+		if (!rdev->ring[i].ready)
+			continue;
+
+		atomic_inc(&rdev->irq.ring_int[i]);
+		mask |=3D 1 << i;
+	}
+	return mask;
+}
+
+static void radeon_gpu_unmask_sw_irq(struct radeon_device *rdev, uint32_t =
mask)
+{
+	unsigned long irqflags;
+	int i;
+
+	if (!mask)
+		return;
+
+	/*
+	 * undo refcount increase, and reset irqs to correct value.
+	 */
+
+	for (i =3D 0; i < RADEON_NUM_RINGS; ++i) {
+		if (!(mask & (1 << i)))
+			continue;
+
+		atomic_dec(&rdev->irq.ring_int[i]);
+	}
+
+	spin_lock_irqsave(&rdev->irq.lock, irqflags);
+	radeon_irq_set(rdev);
+	spin_unlock_irqrestore(&rdev->irq.lock, irqflags);
+}
+
  /**
   * radeon_gpu_reset - reset the asic
   *
@@ -1582,6 +1631,7 @@ int radeon_gpu_reset(struct radeon_device *rdev)
  =

  	int i, r;
  	int resched;
+	uint32_t sw_mask;
  =

  	down_write(&rdev->exclusive_lock);
  =

@@ -1595,6 +1645,7 @@ int radeon_gpu_reset(struct radeon_device *rdev)
  	radeon_save_bios_scratch_regs(rdev);
  	/* block TTM */
  	resched =3D ttm_bo_lock_delayed_workqueue(&rdev->mman.bdev);
+	sw_mask =3D radeon_gpu_mask_sw_irq(rdev);
  	radeon_pm_suspend(rdev);
  	radeon_suspend(rdev);
  =

@@ -1644,6 +1695,7 @@ retry:
  	radeon_pm_resume(rdev);
  	drm_helper_resume_force_mode(rdev->ddev);
  =

+	radeon_gpu_unmask_sw_irq(rdev, sw_mask);
  	ttm_bo_unlock_delayed_workqueue(&rdev->mman.bdev, resched);
  	if (r) {
  		/* bad news, how to tell it to userspace ? */
diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon=
/radeon_fence.c
index a77b1c13ea43..db1f3b4708fa 100644
--- a/drivers/gpu/drm/radeon/radeon_fence.c
+++ b/drivers/gpu/drm/radeon/radeon_fence.c
@@ -39,6 +39,15 @@
  #include "radeon.h"
  #include "radeon_trace.h"
  =

+static const struct fence_ops radeon_fence_ops;
+
+#define to_radeon_fence(p) \
+	({								\
+		struct radeon_fence *__f;				\
+		__f =3D container_of((p), struct radeon_fence, base);	\
+		__f->base.ops =3D=3D &radeon_fence_ops ? __f : NULL;	\
+	})
+
  /*
   * Fences
   * Fences mark an event in the GPUs pipeline and are used
@@ -111,30 +120,55 @@ int radeon_fence_emit(struct radeon_device *rdev,
  		      struct radeon_fence **fence,
  		      int ring)
  {
+	u64 seq =3D ++rdev->fence_drv[ring].sync_seq[ring];
+
  	/* we are protected by the ring emission mutex */
  	*fence =3D kmalloc(sizeof(struct radeon_fence), GFP_KERNEL);
  	if ((*fence) =3D=3D NULL) {
  		return -ENOMEM;
  	}
-	kref_init(&((*fence)->kref));
-	(*fence)->rdev =3D rdev;
-	(*fence)->seq =3D ++rdev->fence_drv[ring].sync_seq[ring];
  	(*fence)->ring =3D ring;
+	__fence_init(&(*fence)->base, &radeon_fence_ops,
+		     &rdev->fence_queue.lock, rdev->fence_context + ring, seq);
+	(*fence)->rdev =3D rdev;
+	(*fence)->seq =3D seq;
  	radeon_fence_ring_emit(rdev, ring, *fence);
  	trace_radeon_fence_emit(rdev->ddev, ring, (*fence)->seq);
  	return 0;
  }
  =

  /**
- * radeon_fence_process - process a fence
- *
- * @rdev: radeon_device pointer
- * @ring: ring index the fence is associated with
+ * radeon_fence_check_signaled - callback from fence_queue
   *
- * Checks the current fence value and wakes the fence queue
- * if the sequence number has increased (all asics).
+ * this function is called with fence_queue lock held, which is also used
+ * for the fence locking itself, so unlocked variants are used for
+ * fence_signal, and remove_wait_queue.
   */
-void radeon_fence_process(struct radeon_device *rdev, int ring)
+static int radeon_fence_check_signaled(wait_queue_t *wait, unsigned mode, =
int flags, void *key)
+{
+	struct radeon_fence *fence;
+	u64 seq;
+
+	fence =3D container_of(wait, struct radeon_fence, fence_wake);
+
+	seq =3D atomic64_read(&fence->rdev->fence_drv[fence->ring].last_seq);
+	if (seq >=3D fence->seq) {
+		int ret =3D __fence_signal(&fence->base);
+
+		if (!ret)
+			FENCE_TRACE(&fence->base, "signaled from irq context\n");
+		else
+			FENCE_TRACE(&fence->base, "was already signaled\n");
+
+		radeon_irq_kms_sw_irq_put(fence->rdev, fence->ring);
+		__remove_wait_queue(&fence->rdev->fence_queue, &fence->fence_wake);
+		fence_put(&fence->base);
+	} else
+		FENCE_TRACE(&fence->base, "pending\n");
+	return 0;
+}
+
+static bool __radeon_fence_process(struct radeon_device *rdev, int ring)
  {
  	uint64_t seq, last_seq, last_emitted;
  	unsigned count_loop =3D 0;
@@ -190,23 +224,22 @@ void radeon_fence_process(struct radeon_device *rdev,=
 int ring)
  		}
  	} while (atomic64_xchg(&rdev->fence_drv[ring].last_seq, seq) > seq);
  =

-	if (wake)
-		wake_up_all(&rdev->fence_queue);
+	return wake;
  }
  =

  /**
- * radeon_fence_destroy - destroy a fence
+ * radeon_fence_process - process a fence
   *
- * @kref: fence kref
+ * @rdev: radeon_device pointer
+ * @ring: ring index the fence is associated with
   *
- * Frees the fence object (all asics).
+ * Checks the current fence value and wakes the fence queue
+ * if the sequence number has increased (all asics).
   */
-static void radeon_fence_destroy(struct kref *kref)
+void radeon_fence_process(struct radeon_device *rdev, int ring)
  {
-	struct radeon_fence *fence;
-
-	fence =3D container_of(kref, struct radeon_fence, kref);
-	kfree(fence);
+	if (__radeon_fence_process(rdev, ring))
+		wake_up_all(&rdev->fence_queue);
  }
  =

  /**
@@ -237,6 +270,69 @@ static bool radeon_fence_seq_signaled(struct radeon_de=
vice *rdev,
  	return false;
  }
  =

+static bool __radeon_fence_signaled(struct fence *f)
+{
+	struct radeon_fence *fence =3D to_radeon_fence(f);
+	struct radeon_device *rdev =3D fence->rdev;
+	unsigned ring =3D fence->ring;
+	u64 seq =3D fence->seq;
+
+	if (atomic64_read(&rdev->fence_drv[ring].last_seq) >=3D seq) {
+		return true;
+	}
+
+	if (down_read_trylock(&rdev->exclusive_lock)) {
+		radeon_fence_process(rdev, ring);
+		up_read(&rdev->exclusive_lock);
+
+		if (atomic64_read(&rdev->fence_drv[ring].last_seq) >=3D seq) {
+			return true;
+		}
+	}
+	return false;
+}
+
+/**
+ * radeon_fence_enable_signaling - enable signalling on fence
+ * @fence: fence
+ *
+ * This function is called with fence_queue lock held, and adds a callback
+ * to fence_queue that checks if this fence is signaled, and if so it
+ * signals the fence and removes itself.
+ */
+static bool radeon_fence_enable_signaling(struct fence *f)
+{
+	struct radeon_fence *fence =3D to_radeon_fence(f);
+	struct radeon_device *rdev =3D fence->rdev;
+
+	if (atomic64_read(&rdev->fence_drv[fence->ring].last_seq) >=3D fence->seq=
 ||
+	    !rdev->ddev->irq_enabled)
+		return false;
+
+	radeon_irq_kms_sw_irq_get(rdev, fence->ring);
+
+	if (down_read_trylock(&rdev->exclusive_lock)) {
+		if (__radeon_fence_process(rdev, fence->ring))
+			wake_up_all_locked(&rdev->fence_queue);
+
+		up_read(&rdev->exclusive_lock);
+	}
+
+	/* did fence get signaled after we enabled the sw irq? */
+	if (atomic64_read(&rdev->fence_drv[fence->ring].last_seq) >=3D fence->seq=
) {
+		radeon_irq_kms_sw_irq_put(rdev, fence->ring);
+		return false;
+	}
+
+	fence->fence_wake.flags =3D 0;
+	fence->fence_wake.private =3D NULL;
+	fence->fence_wake.func =3D radeon_fence_check_signaled;
+	__add_wait_queue(&rdev->fence_queue, &fence->fence_wake);
+	fence_get(f);
+
+	return true;
+}
+
  /**
   * radeon_fence_signaled - check if a fence has signaled
   *
@@ -250,11 +346,13 @@ bool radeon_fence_signaled(struct radeon_fence *fence)
  	if (!fence) {
  		return true;
  	}
-	if (fence->seq =3D=3D RADEON_FENCE_SIGNALED_SEQ) {
-		return true;
-	}
+
  	if (radeon_fence_seq_signaled(fence->rdev, fence->seq, fence->ring)) {
-		fence->seq =3D RADEON_FENCE_SIGNALED_SEQ;
+		int ret;
+
+		ret =3D fence_signal(&fence->base);
+		if (!ret)
+			FENCE_TRACE(&fence->base, "signaled from radeon_fence_signaled\n");
  		return true;
  	}
  	return false;
@@ -283,28 +381,35 @@ static bool radeon_fence_any_seq_signaled(struct rade=
on_device *rdev, u64 *seq)
  }
  =

  /**
- * radeon_fence_wait_seq - wait for a specific sequence numbers
+ * radeon_fence_wait_seq_timeout - wait for a specific sequence numbers
   *
   * @rdev: radeon device pointer
   * @target_seq: sequence number(s) we want to wait for
   * @intr: use interruptable sleep
+ * @timeout: maximum time to wait, or MAX_SCHEDULE_TIMEOUT for infinite wa=
it
   *
   * Wait for the requested sequence number(s) to be written by any ring
   * (all asics).  Sequnce number array is indexed by ring id.
   * @intr selects whether to use interruptable (true) or non-interruptable
   * (false) sleep when waiting for the sequence number.  Helper function
   * for radeon_fence_wait_*().
- * Returns 0 if the sequence number has passed, error for all other cases.
+ * Returns remaining time if the sequence number has passed, 0 when
+ * the wait timeout, or an error for all other cases.
   * -EDEADLK is returned when a GPU lockup has been detected.
   */
-static int radeon_fence_wait_seq(struct radeon_device *rdev, u64 *target_s=
eq,
-				 bool intr)
+static int radeon_fence_wait_seq_timeout(struct radeon_device *rdev,
+					 u64 *target_seq, bool intr,
+					 long timeout)
  {
  	uint64_t last_seq[RADEON_NUM_RINGS];
  	bool signaled;
-	int i, r;
+	int i;
  =

  	while (!radeon_fence_any_seq_signaled(rdev, target_seq)) {
+		long r, waited =3D timeout;
+
+		waited =3D timeout < RADEON_FENCE_JIFFIES_TIMEOUT ?
+			 timeout : RADEON_FENCE_JIFFIES_TIMEOUT;
  =

  		/* Save current sequence values, used to check for GPU lockups */
  		for (i =3D 0; i < RADEON_NUM_RINGS; ++i) {
@@ -319,13 +424,15 @@ static int radeon_fence_wait_seq(struct radeon_device=
 *rdev, u64 *target_seq,
  		if (intr) {
  			r =3D wait_event_interruptible_timeout(rdev->fence_queue, (
  				(signaled =3D radeon_fence_any_seq_signaled(rdev, target_seq))
-				 || rdev->needs_reset), RADEON_FENCE_JIFFIES_TIMEOUT);
+				 || rdev->needs_reset), waited);
  		} else {
  			r =3D wait_event_timeout(rdev->fence_queue, (
  				(signaled =3D radeon_fence_any_seq_signaled(rdev, target_seq))
-				 || rdev->needs_reset), RADEON_FENCE_JIFFIES_TIMEOUT);
+				 || rdev->needs_reset), waited);
  		}
  =

+		timeout -=3D waited - r;
+
  		for (i =3D 0; i < RADEON_NUM_RINGS; ++i) {
  			if (!target_seq[i])
  				continue;
@@ -337,6 +444,12 @@ static int radeon_fence_wait_seq(struct radeon_device =
*rdev, u64 *target_seq,
  		if (unlikely(r < 0))
  			return r;
  =

+		/*
+		 * If this is a timed wait and the wait completely timed out just return.
+		 */
+		if (!timeout)
+			break;
+
  		if (unlikely(!signaled)) {
  			if (rdev->needs_reset)
  				return -EDEADLK;
@@ -379,14 +492,14 @@ static int radeon_fence_wait_seq(struct radeon_device=
 *rdev, u64 *target_seq,
  			}
  		}
  	}
-	return 0;
+	return timeout;
  }
  =

  /**
   * radeon_fence_wait - wait for a fence to signal
   *
   * @fence: radeon fence object
- * @intr: use interruptable sleep
+ * @intr: use interruptible sleep
   *
   * Wait for the requested fence to signal (all asics).
   * @intr selects whether to use interruptable (true) or non-interruptable
@@ -398,20 +511,17 @@ int radeon_fence_wait(struct radeon_fence *fence, boo=
l intr)
  	uint64_t seq[RADEON_NUM_RINGS] =3D {};
  	int r;
  =

-	if (fence =3D=3D NULL) {
-		WARN(1, "Querying an invalid fence : %p !\n", fence);
-		return -EINVAL;
-	}
-
-	seq[fence->ring] =3D fence->seq;
-	if (seq[fence->ring] =3D=3D RADEON_FENCE_SIGNALED_SEQ)
+	if (test_bit(FENCE_FLAG_SIGNALED_BIT, &fence->base.flags))
  		return 0;
  =

-	r =3D radeon_fence_wait_seq(fence->rdev, seq, intr);
-	if (r)
+	seq[fence->ring] =3D fence->seq;
+	r =3D radeon_fence_wait_seq_timeout(fence->rdev, seq, intr, MAX_SCHEDULE_=
TIMEOUT);
+	if (r < 0) {
  		return r;
-
-	fence->seq =3D RADEON_FENCE_SIGNALED_SEQ;
+	}
+	r =3D fence_signal(&fence->base);
+	if (!r)
+		FENCE_TRACE(&fence->base, "signaled from fence_wait\n");
  	return 0;
  }
  =

@@ -434,7 +544,7 @@ int radeon_fence_wait_any(struct radeon_device *rdev,
  {
  	uint64_t seq[RADEON_NUM_RINGS];
  	unsigned i, num_rings =3D 0;
-	int r;
+	long r;
  =

  	for (i =3D 0; i < RADEON_NUM_RINGS; ++i) {
  		seq[i] =3D 0;
@@ -443,20 +553,21 @@ int radeon_fence_wait_any(struct radeon_device *rdev,
  			continue;
  		}
  =

+		if (test_bit(FENCE_FLAG_SIGNALED_BIT, &fences[i]->base.flags)) {
+			/* already signaled */
+			return 0;
+		}
+
  		seq[i] =3D fences[i]->seq;
  		++num_rings;
-
-		/* test if something was allready signaled */
-		if (seq[i] =3D=3D RADEON_FENCE_SIGNALED_SEQ)
-			return 0;
  	}
  =

  	/* nothing to wait for ? */
  	if (num_rings =3D=3D 0)
  		return -ENOENT;
  =

-	r =3D radeon_fence_wait_seq(rdev, seq, intr);
-	if (r) {
+	r =3D radeon_fence_wait_seq_timeout(rdev, seq, intr, MAX_SCHEDULE_TIMEOUT=
);
+	if (r < 0) {
  		return r;
  	}
  	return 0;
@@ -475,6 +586,7 @@ int radeon_fence_wait_any(struct radeon_device *rdev,
  int radeon_fence_wait_next(struct radeon_device *rdev, int ring)
  {
  	uint64_t seq[RADEON_NUM_RINGS] =3D {};
+	long r;
  =

  	seq[ring] =3D atomic64_read(&rdev->fence_drv[ring].last_seq) + 1ULL;
  	if (seq[ring] >=3D rdev->fence_drv[ring].sync_seq[ring]) {
@@ -482,7 +594,10 @@ int radeon_fence_wait_next(struct radeon_device *rdev,=
 int ring)
  		   already the last emited fence */
  		return -ENOENT;
  	}
-	return radeon_fence_wait_seq(rdev, seq, false);
+	r =3D radeon_fence_wait_seq_timeout(rdev, seq, false, MAX_SCHEDULE_TIMEOU=
T);
+	if (r < 0)
+		return r;
+	return 0;
  }
  =

  /**
@@ -504,8 +619,8 @@ int radeon_fence_wait_empty(struct radeon_device *rdev,=
 int ring)
  	if (!seq[ring])
  		return 0;
  =

-	r =3D radeon_fence_wait_seq(rdev, seq, false);
-	if (r) {
+	r =3D radeon_fence_wait_seq_timeout(rdev, seq, false, MAX_SCHEDULE_TIMEOU=
T);
+	if (r < 0) {
  		if (r =3D=3D -EDEADLK)
  			return -EDEADLK;
  =

@@ -525,7 +640,7 @@ int radeon_fence_wait_empty(struct radeon_device *rdev,=
 int ring)
   */
  struct radeon_fence *radeon_fence_ref(struct radeon_fence *fence)
  {
-	kref_get(&fence->kref);
+	fence_get(&fence->base);
  	return fence;
  }
  =

@@ -541,9 +656,8 @@ void radeon_fence_unref(struct radeon_fence **fence)
  	struct radeon_fence *tmp =3D *fence;
  =

  	*fence =3D NULL;
-	if (tmp) {
-		kref_put(&tmp->kref, radeon_fence_destroy);
-	}
+	if (tmp)
+		fence_put(&tmp->base);
  }
  =

  /**
@@ -832,3 +946,51 @@ int radeon_debugfs_fence_init(struct radeon_device *rd=
ev)
  	return 0;
  #endif
  }
+
+static long __radeon_fence_wait(struct fence *f, bool intr, long timeout)
+{
+	struct radeon_fence *fence =3D to_radeon_fence(f);
+	u64 target_seq[RADEON_NUM_RINGS] =3D {};
+	struct radeon_device *rdev =3D fence->rdev;
+	unsigned long r;
+
+	target_seq[fence->ring] =3D fence->seq;
+
+	down_read(&rdev->exclusive_lock);
+	r =3D radeon_fence_wait_seq_timeout(fence->rdev, target_seq, intr, timeou=
t);
+
+	if (r > 0 && !fence_signal(&fence->base))
+		FENCE_TRACE(&fence->base, "signaled from __radeon_fence_wait\n");
+
+	up_read(&rdev->exclusive_lock);
+	return r;
+
+}
+
+static const char *radeon_fence_get_driver_name(struct fence *fence)
+{
+	return "radeon";
+}
+
+static const char *radeon_fence_get_timeline_name(struct fence *f)
+{
+	struct radeon_fence *fence =3D to_radeon_fence(f);
+	switch (fence->ring) {
+	case RADEON_RING_TYPE_GFX_INDEX: return "radeon.gfx";
+	case CAYMAN_RING_TYPE_CP1_INDEX: return "radeon.cp1";
+	case CAYMAN_RING_TYPE_CP2_INDEX: return "radeon.cp2";
+	case R600_RING_TYPE_DMA_INDEX: return "radeon.dma";
+	case CAYMAN_RING_TYPE_DMA1_INDEX: return "radeon.dma1";
+	case R600_RING_TYPE_UVD_INDEX: return "radeon.uvd";
+	default: WARN_ON_ONCE(1); return "radeon.unk";
+	}
+}
+
+static const struct fence_ops radeon_fence_ops =3D {
+	.get_driver_name =3D radeon_fence_get_driver_name,
+	.get_timeline_name =3D radeon_fence_get_timeline_name,
+	.enable_signaling =3D radeon_fence_enable_signaling,
+	.signaled =3D __radeon_fence_signaled,
+	.wait =3D __radeon_fence_wait,
+	.release =3D NULL,
+};


----
