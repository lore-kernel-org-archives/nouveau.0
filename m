From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] drm/nouveau: only runtime suspend by default in optimus
	configuration
Date: Wed, 11 Dec 2013 22:19:01 -0500
Message-ID: <1386818341-11506-1-git-send-email-imirkin@alum.mit.edu>
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
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Dave Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, Stefan Lippers-Hollmann <s.l-h@gmx.de>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

The intent was to only enable it by default for optimus, e.g. see the
runtime_idle callback. The suspend callback may be called directly, e.g.
as a result of nouveau_crtc_set_config.

Reported-by: Stefan Lippers-Hollmann <s.l-h@gmx.de>
Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: stable@vger.kernel.org
---

See http://lists.freedesktop.org/archives/dri-devel/2013-November/049738.html
for my analysis of the situation. Since this has been around since 3.12, I'm
tagging it for stable.

 drivers/gpu/drm/nouveau/nouveau_drm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 7a3759f..98a22e6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -858,6 +858,12 @@ static int nouveau_pmops_runtime_suspend(struct device *dev)
 	if (nouveau_runtime_pm == 0)
 		return -EINVAL;
 
+	/* are we optimus enabled? */
+	if (nouveau_runtime_pm == -1 && !nouveau_is_optimus() && !nouveau_is_v1_dsm()) {
+		DRM_DEBUG_DRIVER("failing to power off - not optimus\n");
+		return -EINVAL;
+	}
+
 	nv_debug_level(SILENT);
 	drm_kms_helper_poll_disable(drm_dev);
 	vga_switcheroo_set_dynamic_switch(pdev, VGA_SWITCHEROO_OFF);
-- 
1.8.3.2
