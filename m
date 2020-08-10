From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 1/2] drm/nouveau/kms/nv140-: Include correct push header in crcc37d.c
Date: Mon, 10 Aug 2020 17:18:37 -0400
Message-ID: <20200810211838.37862-2-lyude@redhat.com>
References: <20200810211838.37862-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200810211838.37862-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>, "open list:DRM DRIVER FOR NVIDIA
        GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

Looks like when we converted everything over to Nvidia's class headers,
we mistakenly included the nvif/push507b.h instead of nvif/pushc37b.h,
which resulted in breaking CRC reporting for volta+:

nouveau 0000:1f:00.0: disp: chid 0 stat 10003361 reason 3
[RESERVED_METHOD] mthd 0d84 data 00000000 code 00000000
nouveau 0000:1f:00.0: disp: chid 0 stat 10003360 reason 3
[RESERVED_METHOD] mthd 0d80 data 00000000 code 00000000
nouveau 0000:1f:00.0: DRM: CRC notifier ctx for head 3 not finished
after 50ms

So, fix that.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: c4b27bc8682c ("drm/nouveau/kms/nv50-: convert core crc_set_src() to new push macros")
---
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c b/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
index 9afe9a87bde0c..814e5bd974460 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
@@ -6,7 +6,7 @@
 #include "disp.h"
 #include "head.h"
 
-#include <nvif/push507c.h>
+#include <nvif/pushc37b.h>
 
 #include <nvhw/class/clc37d.h>
 
-- 
2.26.2
