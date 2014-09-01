From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 1/3] nv50: set the miptree address when clearing
	bo's in vp2 init
Date: Mon,  1 Sep 2014 13:23:39 -0400
Message-ID: <1409592221-521-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: "10.2 10.3" <mesa-stable@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

The mt address is about to be used more, make sure it's set
appropriately.

Reported-by: Emil Velikov <emil.l.velikov@gmail.com>
Tested-by: Emil Velikov <emil.l.velikov@gmail.com>
Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "10.2 10.3" <mesa-stable@lists.freedesktop.org>
---
 src/gallium/drivers/nouveau/nv50/nv84_video.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/gallium/drivers/nouveau/nv50/nv84_video.c b/src/gallium/drivers/nouveau/nv50/nv84_video.c
index a39f572..b26e1ee 100644
--- a/src/gallium/drivers/nouveau/nv50/nv84_video.c
+++ b/src/gallium/drivers/nouveau/nv50/nv84_video.c
@@ -482,12 +482,14 @@ nv84_create_decoder(struct pipe_context *context,
       mip.level[0].pitch = surf.width * 4;
       mip.base.domain = NOUVEAU_BO_VRAM;
       mip.base.bo = dec->mbring;
+      mip.base.address = dec->mbring->offset;
       context->clear_render_target(context, &surf.base, &color, 0, 0, 64, 4760);
       surf.offset = dec->vpring->size / 2 - 0x1000;
       surf.width = 1024;
       surf.height = 1;
       mip.level[0].pitch = surf.width * 4;
       mip.base.bo = dec->vpring;
+      mip.base.address = dec->vpring->offset;
       context->clear_render_target(context, &surf.base, &color, 0, 0, 1024, 1);
       surf.offset = dec->vpring->size - 0x1000;
       context->clear_render_target(context, &surf.base, &color, 0, 0, 1024, 1);
-- 
1.8.5.5
