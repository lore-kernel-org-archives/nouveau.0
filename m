From: Lyude Paul <lyude@redhat.com>
Subject: [RFC 16/20] drm/i915/dp: Extract drm_dp_get_sink_count()
Date: Tue, 11 Aug 2020 16:04:53 -0400
Message-ID: <20200811200457.134743-17-lyude@redhat.com>
References: <20200811200457.134743-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20200811200457.134743-1-lyude@redhat.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, Lucas De Marchi <lucas.demarchi@intel.com>, open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>, Wambui Karuga <wambui.karugax@gmail.com>
List-Id: nouveau.vger.kernel.org

And of course, we'll also need to read the sink count from other drivers
as well if we're checking whether or not it's supported. So, let's
extract the code for this into another helper.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_helper.c         | 20 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c | 17 +++++------------
 include/drm/drm_dp_helper.h             |  1 +
 3 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 05bb47e589731..0ff2959c8f8e8 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -722,6 +722,26 @@ bool drm_dp_has_sink_count(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_dp_has_sink_count);
 
+/**
+ * drm_dp_get_sink_count() - Retrieve the sink count for a given sink
+ * @aux: The DP AUX channel to use
+ *
+ * Returns: The current sink count reported by @aux, or a negative error code
+ * otherwise.
+ */
+int drm_dp_get_sink_count(struct drm_dp_aux *aux)
+{
+	u8 count;
+	int ret;
+
+	ret = drm_dp_dpcd_readb(aux, DP_SINK_COUNT, &count);
+	if (ret < 1)
+		return -EIO;
+
+	return DP_GET_SINK_COUNT(count);
+}
+EXPORT_SYMBOL(drm_dp_get_sink_count);
+
 /*
  * I2C-over-AUX implementation
  */
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 35a4779a442e2..e343965a483df 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4648,6 +4648,8 @@ intel_dp_has_sink_count(struct intel_dp *intel_dp)
 static bool
 intel_dp_get_dpcd(struct intel_dp *intel_dp)
 {
+	int ret;
+
 	if (!intel_dp_read_dpcd(intel_dp))
 		return false;
 
@@ -4664,20 +4666,10 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
 	}
 
 	if (intel_dp_has_sink_count(intel_dp)) {
-		u8 count;
-		ssize_t r;
-
-		r = drm_dp_dpcd_readb(&intel_dp->aux, DP_SINK_COUNT, &count);
-		if (r < 1)
+		ret = drm_dp_get_sink_count(&intel_dp->aux);
+		if (ret < 0)
 			return false;
 
-		/*
-		 * Sink count can change between short pulse hpd hence
-		 * a member variable in intel_dp will track any changes
-		 * between short pulse interrupts.
-		 */
-		intel_dp->sink_count = DP_GET_SINK_COUNT(count);
-
 		/*
 		 * SINK_COUNT == 0 and DOWNSTREAM_PORT_PRESENT == 1 implies that
 		 * a dongle is present but no display. Unless we require to know
@@ -4685,6 +4677,7 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
 		 * downstream port information. So, an early return here saves
 		 * time from performing other operations which are not required.
 		 */
+		intel_dp->sink_count = ret;
 		if (!intel_dp->sink_count)
 			return false;
 	}
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index a1413a531eaf4..0c141fc81aaa8 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1635,6 +1635,7 @@ struct drm_dp_desc;
 bool drm_dp_has_sink_count(struct drm_connector *connector,
 			   const u8 dpcd[DP_RECEIVER_CAP_SIZE],
 			   const struct drm_dp_desc *desc);
+int drm_dp_get_sink_count(struct drm_dp_aux *aux);
 
 void drm_dp_remote_aux_init(struct drm_dp_aux *aux);
 void drm_dp_aux_init(struct drm_dp_aux *aux);
-- 
2.26.2
