From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH] drm/nouveau: fix locking in nouveau_crtc_page_flip
Date: Mon, 01 Jul 2013 12:00:09 +0200
Message-ID: <20130701100009.6275.17224.stgit@patser>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

This is a bit messed up because chan->cli->mutex is a different class,
depending on whether it is the global drm client or not. This is
because the global cli->mutex lock can be taken for eviction,
so locking it before pinning the buffer objects may result in a deadlock.

The locking order from outer to inner is:
- &cli->mutex
- ttm_bo
- &drm_client_lock (global &cli->mutex)

Fixes the following lockdep splat:

======================================================
[ INFO: possible circular locking dependency detected ]
3.10.0-rc7+ #101 Not tainted
-------------------------------------------------------
mplayer/4979 is trying to acquire lock:
 (&drm_client_lock_class_key){+.+.+.}, at: [<ffffffffa0346b66>] nouveau_bo_move_m2mf.isra.13+0x4d/0x130 [nouveau]

but task is already holding lock:
 (reservation_ww_class_mutex){+.+.+.}, at: [<ffffffffa019ab8b>] ttm_bo_vm_fault+0x47/0x394 [ttm]

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (reservation_ww_class_mutex){+.+.+.}:
       [<ffffffff810b9dbd>] lock_acquire+0x90/0x1f9
       [<ffffffff816ed517>] mutex_lock_nested+0x56/0x3bb
       [<ffffffffa0347e9c>] nouveau_bo_pin+0x3c/0x15b [nouveau]
       [<ffffffffa0353938>] nouveau_crtc_page_flip+0xef/0x68b [nouveau]
       [<ffffffffa0276595>] drm_mode_page_flip_ioctl+0x289/0x336 [drm]
       [<ffffffffa02651b6>] drm_ioctl+0x4d3/0x619 [drm]
       [<ffffffff81196278>] do_vfs_ioctl+0x90/0x50a
       [<ffffffff81196781>] SyS_ioctl+0x8f/0x9e
       [<ffffffff816fa6a4>] tracesys+0xdd/0xe2

-> #0 (&drm_client_lock_class_key){+.+.+.}:
       [<ffffffff810b9729>] __lock_acquire+0x1c29/0x1c2b
       [<ffffffff810b9dbd>] lock_acquire+0x90/0x1f9
       [<ffffffff816ed517>] mutex_lock_nested+0x56/0x3bb
       [<ffffffffa0346b66>] nouveau_bo_move_m2mf.isra.13+0x4d/0x130 [nouveau]
       [<ffffffffa034745f>] nouveau_bo_move+0xb9/0x3cb [nouveau]
       [<ffffffffa01979e3>] ttm_bo_handle_move_mem+0x24e/0x6b0 [ttm]
       [<ffffffffa0198da4>] ttm_bo_move_buffer+0x157/0x164 [ttm]
       [<ffffffffa0198e51>] ttm_bo_validate+0xa0/0x129 [ttm]
       [<ffffffffa0347c80>] nouveau_bo_validate+0x1c/0x1e [nouveau]
       [<ffffffffa0347d52>] nouveau_ttm_fault_reserve_notify+0xd0/0xd7 [nouveau]
       [<ffffffffa019abad>] ttm_bo_vm_fault+0x69/0x394 [ttm]
       [<ffffffff8114eaed>] __do_fault+0x6e/0x496
       [<ffffffff811515fb>] handle_pte_fault+0x84/0x861
       [<ffffffff81152de4>] handle_mm_fault+0x1e2/0x2b1
       [<ffffffff816f5fec>] __do_page_fault+0x15e/0x517
       [<ffffffff816f63dc>] do_page_fault+0x37/0x6b
       [<ffffffff816f3122>] page_fault+0x22/0x30

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(reservation_ww_class_mutex);
                               lock(&drm_client_lock_class_key);
                               lock(reservation_ww_class_mutex);
  lock(&drm_client_lock_class_key);

 *** DEADLOCK ***

2 locks held by mplayer/4979:
 #0:  (&mm->mmap_sem){++++++}, at: [<ffffffff816f5f8d>] __do_page_fault+0xff/0x517
 #1:  (reservation_ww_class_mutex){+.+.+.}, at: [<ffffffffa019ab8b>] ttm_bo_vm_fault+0x47/0x394 [ttm]

stack backtrace:
CPU: 3 PID: 4979 Comm: mplayer Not tainted 3.10.0-rc7+ #101
Hardware name: Acer Aspire M3985/Aspire M3985, BIOS P01-A1 03/12/2012
 ffffffff8214cdf0 ffff8803c8549678 ffffffff816eb3d8 ffff8803c85496c8
 ffffffff816e5f4f ffff8803c85f86e0 ffff8803c8549750 ffff8803c85f8708
 ffff8803c85f8000 ffff8803c85f8708 ffff8803c85f8730 ffffffff8214cdf0
Call Trace:
 [<ffffffff816eb3d8>] dump_stack+0x19/0x1b
 [<ffffffff816e5f4f>] print_circular_bug+0x1fb/0x20c
 [<ffffffff810b9729>] __lock_acquire+0x1c29/0x1c2b
 [<ffffffff810b9dbd>] lock_acquire+0x90/0x1f9
 [<ffffffffa0346b66>] ? nouveau_bo_move_m2mf.isra.13+0x4d/0x130 [nouveau]
 [<ffffffff810ba731>] ? mark_held_locks+0x6d/0x117
 [<ffffffff816ed517>] mutex_lock_nested+0x56/0x3bb
 [<ffffffffa0346b66>] ? nouveau_bo_move_m2mf.isra.13+0x4d/0x130 [nouveau]
 [<ffffffff810ba99e>] ? trace_hardirqs_on+0xd/0xf
 [<ffffffffa0346b66>] nouveau_bo_move_m2mf.isra.13+0x4d/0x130 [nouveau]
 [<ffffffffa034745f>] nouveau_bo_move+0xb9/0x3cb [nouveau]
 [<ffffffffa01979e3>] ttm_bo_handle_move_mem+0x24e/0x6b0 [ttm]
 [<ffffffffa01989fa>] ? ttm_bo_mem_space+0x18e/0x3e1 [ttm]
 [<ffffffffa0198da4>] ttm_bo_move_buffer+0x157/0x164 [ttm]
 [<ffffffff810b5966>] ? __lock_is_held+0x4f/0x63
 [<ffffffffa0198e51>] ttm_bo_validate+0xa0/0x129 [ttm]
 [<ffffffffa0347c80>] nouveau_bo_validate+0x1c/0x1e [nouveau]
 [<ffffffffa0347d52>] nouveau_ttm_fault_reserve_notify+0xd0/0xd7 [nouveau]
 [<ffffffffa019abad>] ttm_bo_vm_fault+0x69/0x394 [ttm]
 [<ffffffff8114eaed>] __do_fault+0x6e/0x496
 [<ffffffff816ef539>] ? __mutex_unlock_slowpath+0xef/0x189
 [<ffffffff811515fb>] handle_pte_fault+0x84/0x861
 [<ffffffff816f5f8d>] ? __do_page_fault+0xff/0x517
 [<ffffffffa0264e12>] ? drm_ioctl+0x12f/0x619 [drm]
 [<ffffffff81152de4>] handle_mm_fault+0x1e2/0x2b1
 [<ffffffff816f5fec>] __do_page_fault+0x15e/0x517
 [<ffffffff8132e8f5>] ? avc_has_perm_flags+0x3c/0x204
 [<ffffffff810f33e9>] ? rcu_eqs_enter_common.isra.61+0x9c/0x1c6
 [<ffffffff81129495>] ? user_enter+0x75/0xaf
 [<ffffffff810f32cf>] ? rcu_eqs_exit+0x5c/0x9c
 [<ffffffff816f63dc>] do_page_fault+0x37/0x6b
 [<ffffffff816f3122>] page_fault+0x22/0x30

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
---
 drivers/gpu/drm/nouveau/nouveau_display.c |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 5ee23a4..d89d3ef 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -595,7 +595,8 @@ nouveau_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 		chan = drm->channel;
 	spin_unlock(&old_bo->bo.bdev->fence_lock);
 
-	mutex_lock(&chan->cli->mutex);
+	if (chan->cli != &drm->client)
+		mutex_lock(&chan->cli->mutex);
 
 	if (new_bo != old_bo) {
 		ret = nouveau_bo_pin(new_bo, TTM_PL_FLAG_VRAM);
@@ -613,7 +614,8 @@ nouveau_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 		ret = ttm_bo_reserve(&new_bo->bo, false, false, false, 0);
 
 	if (ret) {
-		mutex_unlock(&chan->cli->mutex);
+		if (chan->cli != &drm->client)
+			mutex_unlock(&chan->cli->mutex);
 		goto fail_free;
 	}
 
@@ -623,6 +625,9 @@ nouveau_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 		  fb->bits_per_pixel, fb->pitches[0], crtc->x, crtc->y,
 		  new_bo->bo.offset };
 
+	if (chan->cli == &drm->client)
+		mutex_lock(&chan->cli->mutex);
+
 	/* Emit a page flip */
 	if (nv_device(drm->device)->card_type >= NV_50) {
 		ret = nv50_display_flip_next(crtc, fb, chan, 0);
