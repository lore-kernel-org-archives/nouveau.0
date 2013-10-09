From: Albert Pool <albertpool-2BgBnwcziRhmR6Xm/wNWPw@public.gmane.org>
Subject: [PATCH] drm/nouveau: Do not show an error if the TMDS
	table pointer is invalid
Date: Wed,  9 Oct 2013 21:40:26 +0200
Message-ID: <1381347626-3472-1-git-send-email-albertpool@solcon.nl>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Albert Pool <albertpool-2BgBnwcziRhmR6Xm/wNWPw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Optimus cards with no outputs trigger this message (NVD7, for example)
This commit changes the warning into an informational message.
The return value of the function is not used, so I left it at -EINVAL.

Signed-off-by: Albert Pool <albertpool-2BgBnwcziRhmR6Xm/wNWPw@public.gmane.org>
Cc: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 3e72876..7681b01 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -936,7 +936,8 @@ static int parse_bit_tmds_tbl_entry(struct drm_device *dev, struct nvbios *bios,
 
 	tmdstableptr = ROM16(bios->data[bitentry->offset]);
 	if (!tmdstableptr) {
-		NV_ERROR(drm, "Pointer to TMDS table invalid\n");
+		/* Happens on NVD7 and other Optimus cards with no outputs */
+		NV_INFO(drm, "TMDS table not found\n");
 		return -EINVAL;
 	}
 
-- 
1.7.10.4
