From: Peter Wu <peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org>
Subject: lockdep splat while exiting PRIME
Date: Sun, 08 Jun 2014 15:29:45 +0200
Message-ID: <1545835.7YpYcIvGmb@al>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

While trying PRIME, I got a lockdep warning after exiting glxgears. Is
it harmful? The command was:

    DRI_PRIME=1 glxgears

Offload provider is a GT425M (NVC0), output sink is an Intel i5-460M.

Kind regards,
Peter

dmesg:
=============================================
[ INFO: possible recursive locking detected ]
3.15.0-rc8-custom-00058-gd2cfd31 #1 Tainted: G           O 
---------------------------------------------
X/25827 is trying to acquire lock:
 (&dev->struct_mutex){+.+.+.}, at: [<ffffffffa008ebb6>] i915_gem_unmap_dma_buf+0x36/0xd0 [i915]

but task is already holding lock:
 (&dev->struct_mutex){+.+.+.}, at: [<ffffffffa00055c5>] drm_gem_object_handle_unreference_unlocked+0x105/0x130 [drm]

other info that might help us debug this:
 Possible unsafe locking scenario:
       CPU0
       ----
  lock(&dev->struct_mutex);
  lock(&dev->struct_mutex);

 *** DEADLOCK ***
 May be due to missing lock nesting notation
1 lock held by X/25827:
 #0:  (&dev->struct_mutex){+.+.+.}, at: [<ffffffffa00055c5>] drm_gem_object_handle_unreference_unlocked+0x105/0x130 [drm]

stack backtrace:
CPU: 1 PID: 25827 Comm: X Tainted: G           O  3.15.0-rc8-custom-00058-gd2cfd31 #1
Hardware name: CLEVO CO.                        B7130                           /B7130                           , BIOS 6.00 08/27/2010
 ffffffff822588a0 ffff880230767ae0 ffffffff815f14da ffff880226594260
 ffff880230767bb0 ffffffff810a1461 0000000030767bc0 ffff880226594288
 ffff880230767b00 ffff880226594ae0 0000000000464232 0000000000000001
Call Trace:
 [<ffffffff815f14da>] dump_stack+0x4e/0x7a
 [<ffffffff810a1461>] __lock_acquire+0x19d1/0x1ab0
 [<ffffffff810a1d75>] lock_acquire+0x95/0x130
 [<ffffffffa008ebb6>] ? i915_gem_unmap_dma_buf+0x36/0xd0 [i915]
 [<ffffffffa008ebb6>] ? i915_gem_unmap_dma_buf+0x36/0xd0 [i915]
 [<ffffffff815f57f5>] mutex_lock_nested+0x65/0x400
 [<ffffffffa008ebb6>] ? i915_gem_unmap_dma_buf+0x36/0xd0 [i915]
 [<ffffffffa008ebb6>] i915_gem_unmap_dma_buf+0x36/0xd0 [i915]
 [<ffffffff8141eb4c>] dma_buf_unmap_attachment+0x4c/0x70
 [<ffffffffa001beb2>] drm_prime_gem_destroy+0x22/0x40 [drm]
 [<ffffffffa07aa4de>] nouveau_gem_object_del+0x3e/0x60 [nouveau]
 [<ffffffffa000504a>] drm_gem_object_free+0x2a/0x40 [drm]
 [<ffffffffa00055e8>] drm_gem_object_handle_unreference_unlocked+0x128/0x130 [drm]
 [<ffffffffa00056aa>] drm_gem_handle_delete+0xba/0x110 [drm]
 [<ffffffffa0005dc5>] drm_gem_close_ioctl+0x25/0x30 [drm]
 [<ffffffffa0003a80>] drm_ioctl+0x1e0/0x5f0 [drm]
 [<ffffffffa0005da0>] ? drm_gem_handle_create+0x40/0x40 [drm]
 [<ffffffff815f8bbd>] ? _raw_spin_unlock_irqrestore+0x5d/0x80
 [<ffffffff8109f6bd>] ? trace_hardirqs_on_caller+0x15d/0x200
 [<ffffffff8109f76d>] ? trace_hardirqs_on+0xd/0x10
 [<ffffffff815f8ba2>] ? _raw_spin_unlock_irqrestore+0x42/0x80
 [<ffffffffa07a2175>] nouveau_drm_ioctl+0x65/0xa0 [nouveau]
 [<ffffffff811a7fb0>] do_vfs_ioctl+0x2f0/0x4f0
 [<ffffffff811b320c>] ? __fget+0xac/0xf0
 [<ffffffff811b3165>] ? __fget+0x5/0xf0
 [<ffffffff811a8231>] SyS_ioctl+0x81/0xa0
 [<ffffffff816015d2>] system_call_fastpath+0x16/0x1b
