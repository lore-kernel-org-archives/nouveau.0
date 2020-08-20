From: Lyude Paul <lyude@redhat.com>
Subject: [RFC v2 13/20] drm/i915/dp: Extract
 drm_dp_downstream_read_info()
Date: Thu, 20 Aug 2020 14:30:05 -0400
Message-ID: <20200820183012.288794-14-lyude@redhat.com>
References: <20200820183012.288794-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20200820183012.288794-1-lyude@redhat.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, Lucas De Marchi <lucas.demarchi@intel.com>, open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>, Wambui Karuga <wambui.karugax@gmail.com>
List-Id: nouveau.vger.kernel.org

We're going to be doing the same probing process in nouveau for
determining downstream DP port capabilities, so let's deduplicate the
work by moving i915's code for handling this into a shared helper:
drm_dp_downstream_read_info().

Note that when we do this, we also do make some functional changes while
we're at it:
* We always clear the downstream port info before trying to read it,
  just to make things easier for the caller
* We skip reading downstream port info if the DPCD indicates that we
  don't support downstream port info
* We only read as many bytes as needed for the reported number of
  downstream ports, no sense in reading the whole thing every time

v2:
* Fixup logic for calculating the downstream port length to account for
  the fact that downstream port caps can be either 1 byte or 4 bytes
  long. We can actually skip fixing the max_clock/max_bpc helpers here
  since they all check for DP_DETAILED_CAP_INFO_AVAILABLE anyway.
* Fix ret code check for drm_dp_dpcd_read

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_helper.c         | 46 +++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c | 14 ++------
 include/drm/drm_dp_helper.h             |  3 ++
 3 files changed, 51 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 4c21cf69dad5a..4f845995f1f66 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -423,6 +423,52 @@ bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
 }
 EXPORT_SYMBOL(drm_dp_send_real_edid_checksum);
 
+static u8 drm_dp_downstream_port_count(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
+{
+	u8 port_count = dpcd[DP_DOWN_STREAM_PORT_COUNT] & DP_PORT_COUNT_MASK;
+
+	if (dpcd[DP_DOWNSTREAMPORT_PRESENT] & DP_DETAILED_CAP_INFO_AVAILABLE && port_count > 4)
+		port_count = 4;
+
+	return port_count;
+}
+
+/**
+ * drm_dp_downstream_read_info() - read DPCD downstream port info if available
+ * @aux: DisplayPort AUX channel
+ * @dpcd: A cached copy of the port's DPCD
+ * @downstream_ports: buffer to store the downstream port info in
+ *
+ * Returns: 0 if either the downstream port info was read successfully or
+ * there was no downstream info to read, or a negative error code otherwise.
+ */
+int drm_dp_downstream_read_info(struct drm_dp_aux *aux,
+				const u8 dpcd[DP_RECEIVER_CAP_SIZE],
+				u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS])
+{
+	int ret;
+	u8 len;
+
+	memset(downstream_ports, 0, DP_MAX_DOWNSTREAM_PORTS);
+
+	/* No downstream info to read */
+	if (!drm_dp_is_branch(dpcd) ||
+	    dpcd[DP_DPCD_REV] < DP_DPCD_REV_10 ||
+	    !(dpcd[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_PRESENT))
+		return 0;
+
+	len = drm_dp_downstream_port_count(dpcd);
+	if (dpcd[DP_DOWNSTREAMPORT_PRESENT] & DP_DETAILED_CAP_INFO_AVAILABLE)
+		len *= 4;
+
+	ret = drm_dp_dpcd_read(aux, DP_DOWNSTREAM_PORT_0, downstream_ports, len);
+	if (ret < 0)
+		return ret;
+
+	return ret == len ? 0 : -EIO;
+}
+EXPORT_SYMBOL(drm_dp_downstream_read_info);
+
 /**
  * drm_dp_downstream_max_clock() - extract branch device max
  *                                 pixel rate for legacy VGA
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 1e29d3a012856..984e49194ca31 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4685,18 +4685,8 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
 			return false;
 	}
 
-	if (!drm_dp_is_branch(intel_dp->dpcd))
-		return true; /* native DP sink */
-
-	if (intel_dp->dpcd[DP_DPCD_REV] == 0x10)
-		return true; /* no per-port downstream info */
-
-	if (drm_dp_dpcd_read(&intel_dp->aux, DP_DOWNSTREAM_PORT_0,
-			     intel_dp->downstream_ports,
-			     DP_MAX_DOWNSTREAM_PORTS) < 0)
-		return false; /* downstream port status fetch failed */
-
-	return true;
+	return drm_dp_downstream_read_info(&intel_dp->aux, intel_dp->dpcd,
+					   intel_dp->downstream_ports) == 0;
 }
 
 static bool
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 5c28199248626..1349f16564ace 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1613,6 +1613,9 @@ int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
 bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
 				    u8 real_edid_checksum);
 
+int drm_dp_downstream_read_info(struct drm_dp_aux *aux,
+				const u8 dpcd[DP_RECEIVER_CAP_SIZE],
+				u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS]);
 int drm_dp_downstream_max_clock(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
 				const u8 port_cap[4]);
 int drm_dp_downstream_max_bpc(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
-- 
2.26.2
