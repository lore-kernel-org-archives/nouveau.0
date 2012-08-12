From: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: BIG changes to kernel module
Date: Sun, 12 Aug 2012 17:58:12 +0300
Message-ID: <1344783492.4613.1.camel@maxim-laptop>
References: <CACAvsv6XAV4n=9n32weJeLWCQjv2ip2QMz3Zg96DySvyoe6SSw@mail.gmail.com>
	<20120805205637.GA3107@joi.lan>
	<20120806065814.GB17565@turiel.redhat.com>
	<CAGZ4FESnhO84LaUvotRzkbo6w_SkD34q5eW9ide4jGNQH4=Epg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-i5jBpOqgMQ55WE4lT0xT"
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAGZ4FESnhO84LaUvotRzkbo6w_SkD34q5eW9ide4jGNQH4=Epg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--=-i5jBpOqgMQ55WE4lT0xT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Just tried this tree.
First to compile I had to use attached patch.
I double checked that I use nouveau tree with nothing on top of it.
tree pulled today from git://anongit.freedesktop.org/nouveau/linux-2.6,
branch master.

re-clocking obliviously stopped working and gave me a kernel panic.
3D appears to work, but I didn't test deeply.

First suspend worked, 2nd suspend caused almost same PFIFO context
unload timeout:

nouveau  [     DRM][0000:01:00.0] suspending fbcon...
nouveau  [     DRM][0000:01:00.0] suspending display...
sd 0:0:0:0: [sda] Stopping diskSUBSYSTEM=scsi
DEVICE=+scsi:0:0:0:0
nouveau  [     DRM][0000:01:00.0] unpinning framebuffer(s)...
nouveau  [     DRM][0000:01:00.0] evicting buffers...
nouveau  [     DRM][0000:01:00.0] suspending client object trees...
fnouveau E[   PFIFO][0000:01:00.0] channel 4 unload timeout
fnouveau E[   PFIFO][0000:01:00.0][0xc000826f][ffff880036e47000] failed
to detach PGRAPH context, -16
fnouveau E[  PGRAPH][0000:01:00.0][0x03005014][ffff88007ade4000] failed
suspend, -16
nouveau W[  PGRAPH][0000:01:00.0][0x02005039][ffff88003684e100] parent
failed suspend, -16
fnouveau E[    2955] 0xcccc0000:0xbeef5039 suspend failed with -16
fnouveau E[    2955] 0xdddddddd:0xcccc0000 suspend failed with -16
fnouveau E[    2955] 0xffffffff:0xdddddddd suspend failed with -16
fnouveau E[    2955] 0xffffffff:0xffffffff suspend failed with -16
nouveau  [     DRM][0000:01:00.0] resuming display...

Thanks for the huge work on this!

Best regards,
Maxim Levitsky


--=-i5jBpOqgMQ55WE4lT0xT
Content-Disposition: attachment; filename="patch"
Content-Type: text/plain; name="patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

commit ba9f878c75ba412a1f3e1db50569ae3e16b65ec9
Author: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date:   Sun Aug 12 17:53:25 2012 +0300

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index ef96bdb..ed16b6e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -41,6 +41,8 @@
 #include "nouveau_ttm.h"
 #include "nouveau_gem.h"
 
+#include <drm/ttm/ttm_bo_driver.h>
+
 /*
  * NV10-NV40 tiling helpers
  */
@@ -459,10 +461,12 @@ nouveau_ttm_tt_create(struct ttm_bo_device *bdev, unsigned long size,
 	struct nouveau_drm *drm = nouveau_bdev(bdev);
 	struct drm_device *dev = drm->dev;
 
+#if (defined(CONFIG_AGP) || (defined(CONFIG_AGP_MODULE) && defined(MODULE)))
 	if (drm->agp.stat == ENABLED) {
 		return ttm_agp_tt_create(bdev, dev->agp->bridge, size,
 					 page_flags, dummy_read);
 	}
+#endif
 
 	return nouveau_sgdma_create_ttm(bdev, size, page_flags, dummy_read);
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.h b/drivers/gpu/drm/nouveau/nouveau_drm.h
index 5693518..2b5c962 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.h
@@ -25,6 +25,8 @@
 #include "ttm/ttm_module.h"
 #include "ttm/ttm_page_alloc.h"
 
+#include <drm/nouveau_drm.h>
+
 struct nouveau_channel;
 
 #define DRM_FILE_PAGE_OFFSET (0x100000000ULL >> PAGE_SHIFT)
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 4bddb9e..9e1de65 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -31,7 +31,6 @@
 #include "nouveau_drm.h"
 #include "nouveau_ttm.h"
 #include "nouveau_gem.h"
-
 static int
 nouveau_vram_manager_init(struct ttm_mem_type_manager *man, unsigned long psize)
 {

--=-i5jBpOqgMQ55WE4lT0xT
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-i5jBpOqgMQ55WE4lT0xT--
