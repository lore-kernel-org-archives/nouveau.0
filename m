From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau/bios: fix DCB v1.5 parsing
Date: Thu, 15 Nov 2012 22:09:14 +0100
Message-ID: <20121115210914.GA6970@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

memcmp->nv_strncmp conversion should have inverted the return value.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
See http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=drivers/gpu/drm/nouveau/nouveau_bios.c;h=a0a3fe3c016be86665db1369c44bef832f829a1a;hb=a0d271cbfed1dd50278c6b06bead3d00ba0a88f9#l5652 (3.6)
and http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=drivers/gpu/drm/nouveau/core/include/core/object.h;h=818feabbf4a0969f090f897852fe4476a422b1b6;hb=77b67063bb6bce6d475e910d3b886a606d0d91f7#l179 (nv_strncmp definition)
---
 drivers/gpu/drm/nouveau/core/subdev/bios/dcb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/bios/dcb.c b/drivers/gpu/drm/nouveau/core/subdev/bios/dcb.c
index 7d75038..acb6936 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/bios/dcb.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/bios/dcb.c
@@ -64,7 +64,7 @@ dcb_table(struct nouveau_bios *bios, u8 *ver, u8 *hdr, u8 *cnt, u8 *len)
 		}
 	} else
 	if (*ver >= 0x15) {
-		if (!nv_strncmp(bios, dcb - 7, 7, "DEV_REC")) {
+		if (nv_strncmp(bios, dcb - 7, 7, "DEV_REC")) {
 			u16 i2c = nv_ro16(bios, dcb + 2);
 			*hdr = 4;
 			*cnt = (i2c - dcb) / 10;
-- 
1.7.12
