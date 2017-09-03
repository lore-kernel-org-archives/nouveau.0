From: Thomas Meyer <thomas@m3y3r.de>
Subject: [PATCH 4/10] drm/nouveau/bios/init: Use ARRAY_SIZE macro
Date: Sun, 03 Sep 2017 14:19:31 +0200
Message-ID: <1504439110050-1505010213-4-diffsplit-thomas@m3y3r.de>
References: <1504439110050-939061377-0-diffsplit-thomas@m3y3r.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1504439110050-939061377-0-diffsplit-thomas@m3y3r.de>
Sender: linux-kernel-owner@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Use ARRAY_SIZE macro, rather than explicitly coding some variant of it
yourself.
Found with: find -type f -name "*.c" -o -name "*.h" | xargs perl -p -i -e
's/\bsizeof\s*\(\s*(\w+)\s*\)\s*\ /\s*sizeof\s*\(\s*\1\s*\[\s*0\s*\]\s*\)
/ARRAY_SIZE(\1)/g' and manual check/verification.

Signed-off-by: Thomas Meyer <thomas@m3y3r.de>
---

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
index b58ee99f7bfc..440efa333d6c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
@@ -21,6 +21,7 @@
  *
  * Authors: Ben Skeggs
  */
+#include <linux/kernel.h>
 #include <subdev/bios.h>
 #include <subdev/bios/bit.h>
 #include <subdev/bios/bmp.h>
@@ -2271,7 +2272,7 @@ static struct nvbios_init_opcode {
 	[0xaa] = { init_reserved },
 };
 
-#define init_opcode_nr (sizeof(init_opcode) / sizeof(init_opcode[0]))
+#define init_opcode_nr (ARRAY_SIZE(init_opcode))
 
 int
 nvbios_exec(struct nvbios_init *init)
