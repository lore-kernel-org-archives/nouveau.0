From: Pierre Moreau <pierre.morrow@free.fr>
Subject: [PATCH v2 1/2] drm/nouveau/fb/nv50: Add PFB writes
Date: Fri,  3 Oct 2014 16:36:00 +0200
Message-ID: <1412346960-26876-1-git-send-email-pierre.morrow@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

(This is a v2 of patch "drm/nouveau/disp/nv50: Add PFB writes")

This fix a GPU lockup on 9400M (NVAC) when using acceleration, see
https://bugs.freedesktop.org/show_bug.cgi?id=27501

v2:
- Move code to subdev/fb/nv50.c as suggested by Roy Spliet;
- Remove arbitrary writes to 100c18/100c24 as suggested by Roy Spliet;
- Replace write to 100c1c of arbitrary value by the address of a scratch page
  as proposed by Ilia Mirkin;
- Remove enabling of bits 16 and 0 as they don't yield in any changes.

Signed-off-by: Pierre Moreau <pierre.morrow@free.fr>
---
 drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c b/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
index 4150b0d..5c84d13 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
@@ -289,6 +289,17 @@ nv50_fb_init(struct nouveau_object *object)
 	if (ret)
 		return ret;
 
+	/* Not a clue what this is exactly. Without enabling bit 1 of
+	 * 100c14, system will lockup while initialising the card
+	 * (#27501)
+	 */
+	if (nv_device(priv)->chipset == 0xac) {
+		if ((nv_rd32(priv, 0x100c14) & 0x00000002) == 0x00000000) {
+			nv_wr32(priv, 0x100c1c, priv->r100c08 >> 8);
+			nv_mask(priv, 0x100c14, 0x00000000, 0x00000002);
+		}
+	}
+
 	/* Not a clue what this is exactly.  Without pointing it at a
 	 * scratch page, VRAM->GART blits with M2MF (as in DDX DFS)
 	 * cause IOMMU "read from address 0" errors (rh#561267)
-- 
2.1.2
