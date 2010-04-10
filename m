From: marcin.slusarz@gmail.com
Subject: [PATCH 1/3] fbmem: fix aperture overlapping check
Date: Sat, 10 Apr 2010 21:55:32 +0200
Message-ID: <1270929334-3742-1-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
Cc: nouveau@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Peter Jones <pjones@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Dave Airlie <airlied@redhat.com>
List-Id: nouveau.vger.kernel.org

fb_do_apertures_overlap is returning wrong value when one aperture
is completely whithin the other. Add generic ranges_overlap macro
(probably kernel.h candidate) and use it here.

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Peter Jones <pjones@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 drivers/video/fbmem.c |   24 +++++++++++++++++-------
 1 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbmem.c b/drivers/video/fbmem.c
index a15b44e..41f2e5e 100644
--- a/drivers/video/fbmem.c
+++ b/drivers/video/fbmem.c
@@ -1468,15 +1468,25 @@ static int fb_check_foreignness(struct fb_info *fi)
 	return 0;
 }
 
+/**
+ * ranges_overlap - check whether two ranges overlap (their intersection is not empty)
+ * @start1: start of the first range
+ * @size1:  length of the first range
+ * @start2: start of the second range
+ * @size2:  length of the second range
+ */
+#define ranges_overlap(start1, size1, start2, size2) ({	\
+	typeof(start1) __start1 = (start1);		\
+	typeof(size1)  __size1  = (size1);		\
+	typeof(start2) __start2 = (start2);		\
+	typeof(size2)  __size2  = (size2);		\
+	__start1 < __start2 + __size2 && __start1 + __size1 > __start2; \
+})
+
 static bool fb_do_apertures_overlap(struct fb_info *gen, struct fb_info *hw)
 {
-	/* is the generic aperture base the same as the HW one */
-	if (gen->aperture_base == hw->aperture_base)
-		return true;
-	/* is the generic aperture base inside the hw base->hw base+size */
-	if (gen->aperture_base > hw->aperture_base && gen->aperture_base <= hw->aperture_base + hw->aperture_size)
-		return true;
-	return false;
+	return ranges_overlap(gen->aperture_base, gen->aperture_size,
+				hw->aperture_base, hw->aperture_size);
 }
 /**
  *	register_framebuffer - registers a frame buffer device
-- 
1.7.0.4
