From: asd <asd-jrA/B3VWHiL2D7C+UIOg5A@public.gmane.org>
Subject: nouveau memory leaks
Date: Thu, 4 Sep 2014 15:37:49 +0300
Message-ID: <20140904153749.19fd78ca@marian1000.go.ro>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/UfTSngdxofaxrQEdzT8=4=t"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--MP_/UfTSngdxofaxrQEdzT8=4=t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi
For NV40 attach one patch which leave unused  second channel used on
NV50 and more.
--MP_/UfTSngdxofaxrQEdzT8=4=t
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=nouveau_chan_fix.patch

Index: master_local/drivers/gpu/drm/nouveau/nouveau_chan.c
===================================================================
--- master_local.orig/drivers/gpu/drm/nouveau/nouveau_chan.c	2014-08-29 17:03:06.000000000 +0300
+++ master_local/drivers/gpu/drm/nouveau/nouveau_chan.c	2014-09-04 11:44:53.862385947 +0300
@@ -131,8 +131,13 @@
 	 * pushbuf lives in, this is because the GEM code requires that
 	 * we be able to call out to other (indirect) push buffers
 	 */
-	chan->push.vma.offset = chan->push.buffer->bo.offset;
-	chan->push.handle = NVDRM_PUSH | (handle & 0xffff);
+	if (device->card_type == NV_40) {
+			chan->push.vma.offset = chan->push.buffer->bo.offset;
+			chan->push.handle = NVDRM_PUSH; 
+	} else {
+		chan->push.vma.offset = chan->push.buffer->bo.offset;
+                chan->push.handle = NVDRM_PUSH | (handle & 0xffff);
+	}
 
 	if (device->card_type >= NV_50) {
 		ret = nouveau_bo_vma_add(chan->push.buffer, client->vm,
@@ -190,6 +195,7 @@
 		    u32 parent, u32 handle, u32 engine,
 		    struct nouveau_channel **pchan)
 {
+	struct nouveau_device *device = nv_device(drm->device);
 	static const u16 oclasses[] = { NVE0_CHANNEL_IND_CLASS,
 					NVC0_CHANNEL_IND_CLASS,
 					NV84_CHANNEL_IND_CLASS,
@@ -199,6 +205,9 @@
 	struct nve0_channel_ind_class args;
 	struct nouveau_channel *chan;
 	int ret;
+	/* NV_40 working with ind channel? */
+	if (device->card_type == NV_40)
+			return -EPERM;
 
 	/* allocate dma push buffer */
 	ret = nouveau_channel_prep(drm, cli, parent, handle, 0x12000, &chan);
Index: master_local/drivers/gpu/drm/nouveau/nouveau_drm.c
===================================================================
--- master_local.orig/drivers/gpu/drm/nouveau/nouveau_drm.c	2014-09-03 15:22:11.738698637 +0300
+++ master_local/drivers/gpu/drm/nouveau/nouveau_drm.c	2014-09-04 10:57:08.685701955 +0300
@@ -171,6 +171,7 @@
 	if (device->chipset >= 0xa3 &&
 	    device->chipset != 0xaa &&
 	    device->chipset != 0xac) {
+		printk(KERN_INFO "create unneeded channel");
 		ret = nouveau_channel_new(drm, &drm->client, NVDRM_DEVICE,
 					  NVDRM_CHAN + 1, NvDmaFB, NvDmaTT,
 					  &drm->cechan);

--MP_/UfTSngdxofaxrQEdzT8=4=t
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--MP_/UfTSngdxofaxrQEdzT8=4=t--
