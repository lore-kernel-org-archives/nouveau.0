From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH] io-mapping: ensure io_mapping_map_atomic _is_ atomic
Date: Thu, 15 Sep 2011 20:48:07 +0200
Message-ID: <1316112487-15583-1-git-send-email-daniel.vetter@ffwll.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>
Cc: linux-kernel@vger.kernel.org, DRI mailing list <dri-devel@lists.freedesktop.org>, intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, stable@kernel.org
List-Id: nouveau.vger.kernel.org

For the !HAVE_ATOMIC_IOMAP case the stub functions did not call
pagefault_disable/_enable. The i915 driver relies on the map
actually being atomic, otherwise it can deadlock with it's own
pagefault handler in the gtt pwrite fastpath.

This is exercised by gem_mmap_gtt from the intel-gpu-toosl gem
testsuite.

Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=38115
Cc: stable@kernel.org
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 include/linux/io-mapping.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/include/linux/io-mapping.h b/include/linux/io-mapping.h
index 8cdcc2a1..6b3bef1 100644
--- a/include/linux/io-mapping.h
+++ b/include/linux/io-mapping.h
@@ -138,12 +138,14 @@ static inline void __iomem *
 io_mapping_map_atomic_wc(struct io_mapping *mapping,
 			 unsigned long offset)
 {
+	pagefault_disable();
 	return ((char __force __iomem *) mapping) + offset;
 }
 
 static inline void
 io_mapping_unmap_atomic(void __iomem *vaddr)
 {
+	pagefault_enable();
 }
 
 /* Non-atomic map/unmap */
-- 
1.7.6
