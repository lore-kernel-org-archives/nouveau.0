From: Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Nouveau dmem NULL Pointer deref (SVM)
Date: Thu, 21 Mar 2019 13:12:08 -0400
Message-ID: <20190321171207.GA4788@redhat.com>
References: <52ff3d91-f2d0-9db8-f273-970f3db2ee1a@mni.thm.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="GvXjxJ+pjyke8COw"
Content-Transfer-Encoding: 8bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52ff3d91-f2d0-9db8-f273-970f3db2ee1a-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: nouveau.vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Mar 21, 2019 at 04:59:14PM +0100, Tobias Klausmann wrote:
> Hi,
> 
> just for your information and maybe for some help: with 5.1rc1 and SVM
> enabled i see the following backtrace [1] when the nouveau card (reverse
> prime) goes to sleep, for now i have papered over with [2] which leaves me
> with userspace hangs. Any pointers where to look for the actual culprit?
> 
> PS: Card is: nouveau 0000:01:00.0: NVIDIA GP106 (136000a1)
> 
> Greetings,
> 
> Tobias

Can you check if attached patch fix the issue ?

Cheers,
Jérôme


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename="0001-gpu-nouveau-initialize-some-fields-of-dmem-no-matter.patch"
Content-Transfer-Encoding: 8bit

From 0304725edbaa3b828598a3babb785e6b9555af0b Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date: Thu, 21 Mar 2019 13:08:46 -0400
Subject: [PATCH] gpu/nouveau: initialize some fields of dmem no matter what
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On GPU that do not support device memory we left dmem fields uninitialized
and this lead to troube in suspend/resume which try to use those fields. It
seems best to initialize those fields no matter what.

Signed-off-by: Jérôme Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index aa9fec80492d..35b6e83ead8a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -593,6 +593,11 @@ nouveau_dmem_init(struct nouveau_drm *drm)
 	unsigned long i, size;
 	int ret;
 
+	mutex_init(&drm->dmem->mutex);
+	INIT_LIST_HEAD(&drm->dmem->chunk_free);
+	INIT_LIST_HEAD(&drm->dmem->chunk_full);
+	INIT_LIST_HEAD(&drm->dmem->chunk_empty);
+
 	/* This only make sense on PASCAL or newer */
 	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_PASCAL)
 		return;
@@ -600,11 +605,6 @@ nouveau_dmem_init(struct nouveau_drm *drm)
 	if (!(drm->dmem = kzalloc(sizeof(*drm->dmem), GFP_KERNEL)))
 		return;
 
-	mutex_init(&drm->dmem->mutex);
-	INIT_LIST_HEAD(&drm->dmem->chunk_free);
-	INIT_LIST_HEAD(&drm->dmem->chunk_full);
-	INIT_LIST_HEAD(&drm->dmem->chunk_empty);
-
 	size = ALIGN(drm->client.device.info.ram_user, DMEM_CHUNK_SIZE);
 
 	/* Initialize migration dma helpers before registering memory */
-- 
2.17.1


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--GvXjxJ+pjyke8COw--
