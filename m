From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] MAINTAINERS: nouveau mailing list is moderated
Date: Thu, 16 Jan 2020 09:06:40 -0800
Message-ID: <2684257e-1027-1c1b-d794-78bb1864b437@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: nouveau.vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Mark the nouveau@ mailing list as moderated for non-subscribers.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 MAINTAINERS |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20200116.orig/MAINTAINERS
+++ linux-next-20200116/MAINTAINERS
@@ -5315,7 +5315,7 @@ F:	Documentation/devicetree/bindings/dis
 DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
 M:	Ben Skeggs <bskeggs@redhat.com>
 L:	dri-devel@lists.freedesktop.org
-L:	nouveau@lists.freedesktop.org
+L:	nouveau@lists.freedesktop.org (moderated for non-subscribers)
 T:	git git://github.com/skeggsb/linux
 S:	Supported
 F:	drivers/gpu/drm/nouveau/
@@ -16914,7 +16914,7 @@ R:	Karol Herbst <karolherbst@gmail.com>
 R:	Pekka Paalanen <ppaalanen@gmail.com>
 S:	Maintained
 L:	linux-kernel@vger.kernel.org
-L:	nouveau@lists.freedesktop.org
+L:	nouveau@lists.freedesktop.org (moderated for non-subscribers)
 F:	kernel/trace/trace_mmiotrace.c
 F:	include/linux/mmiotrace.h
 F:	arch/x86/mm/kmmio.c
