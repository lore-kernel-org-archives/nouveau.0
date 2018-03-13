From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH v2] drm/nouveau/secboot: remove VLA usage
Date: Tue, 13 Mar 2018 11:24:11 -0500
Message-ID: <20180313162411.GA1983@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: David Laight <David.Laight@ACULAB.COM>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: nouveau.vger.kernel.org

In preparation to enabling -Wvla, remove VLA. In this particular
case directly use macro NVKM_MSGQUEUE_CMDLINE_SIZE instead of local
variable cmdline_size. Also, remove cmdline_size as it is not
actually useful anymore.

The use of stack Variable Length Arrays needs to be avoided, as they
can be a vector for stack exhaustion, which can be both a runtime bug
or a security flaw. Also, in general, as code evolves it is easy to
lose track of how big a VLA can get. Thus, we can end up having runtime
failures that are hard to debug.

Also, fixed as part of the directive to remove all VLAs from
the kernel: https://lkml.org/lkml/2018/3/7/621

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
Changes in v2:
 - Use sizeof(buf) instead of NVKM_MSGQUEUE_CMDLINE_SIZE. This change
   is based on the feedback provided by David Laight. Thanks David.

 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_msgqueue.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_msgqueue.c b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_msgqueue.c
index 6f10b09..1e1f1c6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_msgqueue.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_msgqueue.c
@@ -80,12 +80,11 @@ acr_ls_msgqueue_post_run(struct nvkm_msgqueue *queue,
 			 struct nvkm_falcon *falcon, u32 addr_args)
 {
 	struct nvkm_device *device = falcon->owner->device;
-	u32 cmdline_size = NVKM_MSGQUEUE_CMDLINE_SIZE;
-	u8 buf[cmdline_size];
+	u8 buf[NVKM_MSGQUEUE_CMDLINE_SIZE];
 
-	memset(buf, 0, cmdline_size);
+	memset(buf, 0, sizeof(buf));
 	nvkm_msgqueue_write_cmdline(queue, buf);
-	nvkm_falcon_load_dmem(falcon, buf, addr_args, cmdline_size, 0);
+	nvkm_falcon_load_dmem(falcon, buf, addr_args, sizeof(buf), 0);
 	/* rearm the queue so it will wait for the init message */
 	nvkm_msgqueue_reinit(queue);
 
-- 
2.7.4
