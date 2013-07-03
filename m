From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] drm/nva3/disp: Fix HDMI audio regression
Date: Wed,  3 Jul 2013 03:06:02 -0400
Message-ID: <1372835162-8630-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org, Max Baldwin <archerseven@gmail.com>, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

This is the nva3 counterpart to commit beba44b17 (drm/nv84/disp: Fix
HDMI audio regression). The regression happened as a result of
refactoring in commit 8e9e3d2de (drm/nv84/disp: move hdmi control into
core).

Reported-and-tested-by: Max Baldwin <archerseven@gmail.com>
Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

The actual testing was done on a NVCF card (550 Ti). Prior to this,
AC3/DTS audio passthrough worked, but regular audio did not. With this
change, regular audio started to work too. This should probably be
sent to stable as well.

 drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c b/drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c
index f065fc2..db8c6fd 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c
@@ -55,6 +55,10 @@ nva3_hdmi_ctrl(struct nv50_disp_priv *priv, int head, int or, u32 data)
 	nv_wr32(priv, 0x61c510 + soff, 0x00000000);
 	nv_mask(priv, 0x61c500 + soff, 0x00000001, 0x00000001);
 
+	nv_mask(priv, 0x61c5d0 + soff, 0x00070001, 0x00010001); /* SPARE, HW_CTS */
+	nv_mask(priv, 0x61c568 + soff, 0x00010101, 0x00000000); /* ACR_CTRL, ?? */
+	nv_mask(priv, 0x61c578 + soff, 0x80000000, 0x80000000); /* ACR_0441_ENABLE */
+
 	/* ??? */
 	nv_mask(priv, 0x61733c, 0x00100000, 0x00100000); /* RESETF */
 	nv_mask(priv, 0x61733c, 0x10000000, 0x10000000); /* LOOKUP_EN */
-- 
1.8.1.5
