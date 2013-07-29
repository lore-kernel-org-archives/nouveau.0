From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] drm/nva3-/hda: fix eld writing, needs to be padded
Date: Sun, 28 Jul 2013 22:30:57 -0400
Message-ID: <1375065057-19416-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alex <alupu01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Commits 0a9e2b959 (drm/nvd0/disp: move HDA codec setup to core) and
a4feaf4ea (drm/nva3/disp: move hda codec handling to core) moved code
around but neglected to fill data up to 0x60 as before. This caused
/proc/asound/cardN/eld#3.0 to show eld_valid as 0. With this patch, that
file is again populated with the correct data.

See https://bugs.freedesktop.org/show_bug.cgi?id=67051

Reported-and-tested-by: Alex <alupu01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/engine/disp/hdanva3.c | 2 ++
 drivers/gpu/drm/nouveau/core/engine/disp/hdanvd0.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/hdanva3.c b/drivers/gpu/drm/nouveau/core/engine/disp/hdanva3.c
index 373dbcc..a19e7d7 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/hdanva3.c
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/hdanva3.c
@@ -36,6 +36,8 @@ nva3_hda_eld(struct nv50_disp_priv *priv, int or, u8 *data, u32 size)
 	if (data && data[0]) {
 		for (i = 0; i < size; i++)
 			nv_wr32(priv, 0x61c440 + soff, (i << 8) | data[i]);
+		for (; i < 0x60; i++)
+			nv_wr32(priv, 0x61c440 + soff, (i << 8));
 		nv_mask(priv, 0x61c448 + soff, 0x80000003, 0x80000003);
 	} else
 	if (data) {
diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/hdanvd0.c b/drivers/gpu/drm/nouveau/core/engine/disp/hdanvd0.c
index dc57e24..7176393 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/hdanvd0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/hdanvd0.c
@@ -41,6 +41,8 @@ nvd0_hda_eld(struct nv50_disp_priv *priv, int or, u8 *data, u32 size)
 	if (data && data[0]) {
 		for (i = 0; i < size; i++)
 			nv_wr32(priv, 0x10ec00 + soff, (i << 8) | data[i]);
+		for (; i < 0x60; i++)
+			nv_wr32(priv, 0x10ec00 + soff, (i << 8));
 		nv_mask(priv, 0x10ec10 + soff, 0x80000003, 0x80000003);
 	} else
 	if (data) {
-- 
1.8.1.5
