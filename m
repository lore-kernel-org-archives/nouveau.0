From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: properly handle pushbuffer check
	failures
Date: Mon, 7 Mar 2011 12:31:35 +0100
Message-ID: <20110307113135.GA2788@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

When "buffer in list" check does not pass, don't free validation lists - they were
not initialized yet.

Fixes this oops:

[drm] nouveau 0000:02:00.0: push 105 buffer not in list
BUG: unable to handle kernel NULL pointer dereference at 000000000000057c
IP: [<ffffffff81236aa4>] do_raw_spin_lock+0x14/0x13c
PGD 1ac6cb067 PUD 1aaa52067 PMD 0
CPU 0
Modules linked in: nouveau ttm drm_kms_helper snd_hda_codec_realtek snd_hda_intel snd_hda_codec

Pid: 6265, comm: OilRush_x86 Not tainted 2.6.38-rc6-nv+ #632 System manufacturer System Product Name/P6T SE
RIP: 0010:[<ffffffff81236aa4>]  [<ffffffff81236aa4>] do_raw_spin_lock+0x14/0x13c
(...)
Process OilRush_x86 (pid: 6265, threadinfo ffff8801a6aee000, task ffff8801a26c0000)
 0000000000000000 ffff8801ac74c618 0000000000000000 0000000000000578
 0000000000000000 ffff8801ac74c618 0000000000000000 ffff8801bd9d0000
 [<ffffffff81417f78>] _raw_spin_lock+0x1e/0x22
 [<ffffffffa00a2746>] nouveau_bo_fence+0x2e/0x60 [nouveau]
 [<ffffffffa00a540b>] validate_fini_list+0x35/0xeb [nouveau]
 [<ffffffffa00a54d3>] validate_fini+0x12/0x31 [nouveau]
 [<ffffffffa00a6386>] nouveau_gem_ioctl_pushbuf+0xe94/0xf6b [nouveau]
 [<ffffffff8141ac56>] ? sub_preempt_count+0x9e/0xb2
 [<ffffffff81417e94>] ? _raw_spin_unlock_irqrestore+0x30/0x4d
 [<ffffffff8105dea2>] ? __wake_up+0x3f/0x48
 [<ffffffff812aebb4>] drm_ioctl+0x289/0x361
 [<ffffffff8141ac56>] ? sub_preempt_count+0x9e/0xb2
 [<ffffffffa00a54f2>] ? nouveau_gem_ioctl_pushbuf+0x0/0xf6b [nouveau]
 [<ffffffff8141ac56>] ? sub_preempt_count+0x9e/0xb2
 [<ffffffffa010caa2>] nouveau_compat_ioctl+0x16/0x1c [nouveau]
 [<ffffffff81142c0d>] compat_sys_ioctl+0x1c8/0x12d7
 [<ffffffff814179ca>] ? trace_hardirqs_off_thunk+0x3a/0x6c
 [<ffffffff81058099>] sysenter_dispatch+0x7/0x30
 [<ffffffff8141798e>] ? trace_hardirqs_on_thunk+0x3a/0x3c
RIP  [<ffffffff81236aa4>] do_raw_spin_lock+0x14/0x13c
 RSP <ffff8801a6aefb88>
---[ end trace 0014d5d93e6147e1 ]---

Additionally, don't call validate_fini twice in case of validation failure.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 3ce58d2..e8b04f4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -600,7 +600,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 		if (push[i].bo_index >= req->nr_buffers) {
 			NV_ERROR(dev, "push %d buffer not in list\n", i);
 			ret = -EINVAL;
-			goto out;
+			goto out_prevalid;
 		}
 
 		bo[push[i].bo_index].read_domains |= (1 << 31);
@@ -612,7 +612,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 	if (ret) {
 		if (ret != -ERESTARTSYS)
 			NV_ERROR(dev, "validate: %d\n", ret);
-		goto out;
+		goto out_prevalid;
 	}
 
 	/* Apply any relocations that are required */
@@ -705,6 +705,8 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 out:
 	validate_fini(&op, fence);
 	nouveau_fence_unref(&fence);
+
+out_prevalid:
 	kfree(bo);
 	kfree(push);
 
-- 
1.7.4.rc3
