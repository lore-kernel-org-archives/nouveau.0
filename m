From: Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Nouveau dmem NULL Pointer deref (SVM)
Date: Thu, 21 Mar 2019 13:20:33 -0400
Message-ID: <20190321172033.GB4788@redhat.com>
References: <52ff3d91-f2d0-9db8-f273-970f3db2ee1a@mni.thm.de>
 <20190321171207.GA4788@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="8P1HSweYDcXXzwPJ"
Content-Transfer-Encoding: 8bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190321171207.GA4788-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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


--8P1HSweYDcXXzwPJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Mar 21, 2019 at 01:12:07PM -0400, Jerome Glisse wrote:
> On Thu, Mar 21, 2019 at 04:59:14PM +0100, Tobias Klausmann wrote:
> > Hi,
> > 
> > just for your information and maybe for some help: with 5.1rc1 and SVM
> > enabled i see the following backtrace [1] when the nouveau card (reverse
> > prime) goes to sleep, for now i have papered over with [2] which leaves me
> > with userspace hangs. Any pointers where to look for the actual culprit?
> > 
> > PS: Card is: nouveau 0000:01:00.0: NVIDIA GP106 (136000a1)
> > 
> > Greetings,
> > 
> > Tobias
> 
> Can you check if attached patch fix the issue ?

Sorry sent bogus patch here is a good one ...

Cheers,
Jérôme



--8P1HSweYDcXXzwPJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename="0001-gpu-nouveau-empty-chunk-do-not-have-a-buffer-object-.patch"
Content-Transfer-Encoding: 8bit

From 5b413953ba7abd3f92f46ef8261cd64368f0ae84 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date: Thu, 21 Mar 2019 13:08:46 -0400
Subject: [PATCH] gpu/nouveau: empty chunk do not have a buffer object
 associated with them.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Empty chunk do not have a bo associated with them so no need to pin/unpin
on suspend/resume.

Signed-off-by: Jérôme Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index aa9fec80492d..a510dbe9a9cb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -456,11 +456,6 @@ nouveau_dmem_resume(struct nouveau_drm *drm)
 		/* FIXME handle pin failure */
 		WARN_ON(ret);
 	}
-	list_for_each_entry (chunk, &drm->dmem->chunk_empty, list) {
-		ret = nouveau_bo_pin(chunk->bo, TTM_PL_FLAG_VRAM, false);
-		/* FIXME handle pin failure */
-		WARN_ON(ret);
-	}
 	mutex_unlock(&drm->dmem->mutex);
 }
 
@@ -479,9 +474,6 @@ nouveau_dmem_suspend(struct nouveau_drm *drm)
 	list_for_each_entry (chunk, &drm->dmem->chunk_full, list) {
 		nouveau_bo_unpin(chunk->bo);
 	}
-	list_for_each_entry (chunk, &drm->dmem->chunk_empty, list) {
-		nouveau_bo_unpin(chunk->bo);
-	}
 	mutex_unlock(&drm->dmem->mutex);
 }
 
-- 
2.17.1


--8P1HSweYDcXXzwPJ
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--8P1HSweYDcXXzwPJ--
