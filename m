From: Chris Ball <cjb@laptop.org>
Subject: Re: [PATCH] drm/nouveau/kms: Implement KDB debug
	hooks for nouveau KMS.
Date: Mon, 23 Aug 2010 16:50:53 -0400
Message-ID: <m3k4nhqcia.fsf_-_@pullcord.laptop.org>
References: <m3iq9yqd7w.fsf@pullcord.laptop.org>
	<4C5ACF3F.8050409@windriver.com>
	<m3hbj0fju3.fsf_-_@pullcord.laptop.org>
	<m3aaoimqrp.fsf_-_@pullcord.laptop.org> <87eidsemcf.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kgdb-bugreport-bounces@lists.sourceforge.net>
In-Reply-To: <87eidsemcf.fsf@riseup.net> (Francisco Jerez's message of "Sat,
	21 Aug 2010 04:22:24 +0200")
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>,
	<mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>,
	<mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net
To: Francisco Jerez <currojerez@riseup.net>
Cc: David Airlie <airlied@linux.ie>, kgdb-bugreport@lists.sourceforge.net, nouveau@lists.freedesktop.org, Jesse Barnes <jbarnes@virtuousgeek.org>, Jason Wessel <jason.wessel@windriver.com>
List-Id: nouveau.vger.kernel.org

Hi Francisco,

   > There is a problem with this on pre-nv20 cards. Fbcon
   > acceleration won't work properly with IRQs disabled because you
   > miss the context switching interrupts: You'll get a locked up
   > fbcon if you hit sysrq-g when there's some process using the GPU.
   > 
   > I'd suggest disabling acceleration while in debug mode
   > (e.g. using nouveau_fbcon_save_disable_accel()). That aside the
   > patch looks good to me.

Thanks very much for this.  Here's a (only compile-tested) patch for
this, on top of jwessel's current kgdb-next branch.  Jason, would you
mind testing on pre-nv20 and applying?

Thanks,

- Chris.


From: Chris Ball <cjb@laptop.org>
Subject: [PATCH] drm/nouveau/kms: Avoid a hang entering KDB with VT accel on.

Francisco Jerez advises that pre-nv20 cards would hang if we entered
kdb with accel on and IRQs disabled, so we now disable accel before
entering kdb and re-enable it on the way back out.

Signed-off-by: Chris Ball <cjb@laptop.org>
Cc: Francisco Jerez <currojerez@riseup.net>
Cc: Jason Wessel <jason.wessel@windriver.com>
---
 drivers/gpu/drm/nouveau/nv04_crtc.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv04_crtc.c b/drivers/gpu/drm/nouveau/nv04_crtc.c
index fb669dd..427f90e 100644
--- a/drivers/gpu/drm/nouveau/nv04_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv04_crtc.c
@@ -31,10 +31,11 @@
 #include "nouveau_connector.h"
 #include "nouveau_crtc.h"
 #include "nouveau_fb.h"
 #include "nouveau_hw.h"
 #include "nvreg.h"
+#include "nouveau_fbcon.h"
 
 static int
 nv04_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
 			struct drm_framebuffer *old_fb);
 
@@ -858,10 +859,18 @@ nv04_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
 static int
 nv04_crtc_mode_set_base_atomic(struct drm_crtc *crtc,
 			       struct drm_framebuffer *fb,
 			       int x, int y, int enter)
 {
+	struct drm_nouveau_private *dev_priv = crtc->dev->dev_private;
+	struct drm_device *dev = dev_priv->dev;
+
+	if (enter)
+		nouveau_fbcon_save_disable_accel(dev);
+	else
+		nouveau_fbcon_restore_accel(dev);
+
 	return nv04_crtc_do_mode_set_base(crtc, fb, x, y, true);
 }
 
 static void nv04_cursor_upload(struct drm_device *dev, struct nouveau_bo *src,
 			       struct nouveau_bo *dst)
-- 
1.6.2.5

------------------------------------------------------------------------------
Sell apps to millions through the Intel(R) Atom(Tm) Developer Program
Be part of this innovative community and reach millions of netbook users 
worldwide. Take advantage of special opportunities to increase revenue and 
speed time-to-market. Join now, and jumpstart your future.
http://p.sf.net/sfu/intel-atom-d2d
