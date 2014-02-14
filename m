From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] drm/nv50/disp: use correct register to determine
	DP display bpp
Date: Thu, 13 Feb 2014 21:57:15 -0500
Message-ID: <1392346635-29566-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Torsten Wagner <torsten.wagner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org#3.9+, Michael Gulick <mgulick-I5WecO5yM8GakBO8gow8eQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Commit 0a0afd282f ("drm/nv50-/disp: move DP link training to core and
train from supervisor") added code that uses the wrong register for
computing the display bpp, used for bandwidth calculation. Adjust to use
the same register as used by exec_clkcmp and nv50_disp_intr_unk20_2_dp.

Reported-by: Torsten Wagner <torsten.wagner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reported-by: Michael Gulick <mgulick-I5WecO5yM8GakBO8gow8eQ@public.gmane.org>
Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=67628
Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # 3.9+
Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Ben did a quick test that makes it seem like this is the right thing to
do. And it makes sense based on the surrounding code, and the way in which the
regression manifests itself.

 drivers/gpu/drm/nouveau/core/engine/disp/nv50.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c b/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
index 940eaa5..9ad722e 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
@@ -1142,7 +1142,7 @@ nv50_disp_intr_unk20_2(struct nv50_disp_priv *priv, int head)
 	if (conf != ~0) {
 		if (outp.location == 0 && outp.type == DCB_OUTPUT_DP) {
 			u32 soff = (ffs(outp.or) - 1) * 0x08;
-			u32 ctrl = nv_rd32(priv, 0x610798 + soff);
+			u32 ctrl = nv_rd32(priv, 0x610794 + soff);
 			u32 datarate;
 
 			switch ((ctrl & 0x000f0000) >> 16) {
-- 
1.8.3.2
