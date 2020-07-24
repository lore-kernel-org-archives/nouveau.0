From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 1/2] drm/probe_helper: Add drm_connector_helper_funcs->get_modes_ctx()
Date: Fri, 24 Jul 2020 13:04:56 -0400
Message-ID: <20200724170457.711072-2-lyude@redhat.com>
References: <20200724170457.711072-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200724170457.711072-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

Currently nouveau relies on being able to use the
drm_connector_helper_funcs->mode_valid() hook within
drm_connector_helper_funcs->get_modes() so that we can ignore invalid
modes when figuring out the connector's native mode. Since we're about
to add a ->mode_valid_ctx() hook for MST, we'll also need to be able to
pass down the current drm acquisition context for use in ->get_modes().
So, add another version of ->get_modes() which accepts an acquisition
context, ->get_modes_ctx().

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_probe_helper.c       | 11 +++++--
 include/drm/drm_modeset_helper_vtables.h | 42 ++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index d6017726cc2a..fbda6e527b4b 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -377,7 +377,8 @@ EXPORT_SYMBOL(drm_helper_probe_detect);
  *    drm_mode_probed_add(). New modes start their life with status as OK.
  *    Modes are added from a single source using the following priority order.
  *
- *    - &drm_connector_helper_funcs.get_modes vfunc
+ *    - &drm_connector_helper_funcs.get_modes_ctx vfunc if set, otherwise
+ *      &drm_connector_helper_funcs.get_modes is used
  *    - if the connector status is connector_status_connected, standard
  *      VESA DMT modes up to 1024x768 are automatically added
  *      (drm_add_modes_noedid())
@@ -506,7 +507,13 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 		goto prune;
 	}
 
-	count = (*connector_funcs->get_modes)(connector);
+	if (connector_funcs->get_modes_ctx) {
+		count = connector_funcs->get_modes_ctx(connector, &ctx);
+		if (count < 0)
+			goto retry;
+	} else {
+		count = connector_funcs->get_modes(connector);
+	}
 
 	/*
 	 * Fallback for when DDC probe failed in drm_get_edid() and thus skipped
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index 4efec30f8bad..c1eb96404bcf 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -904,6 +904,48 @@ struct drm_connector_helper_funcs {
 	 */
 	int (*get_modes)(struct drm_connector *connector);
 
+	/**
+	 * @get_modes_ctx:
+	 *
+	 * This function should fill in all modes currently valid for the sink
+	 * into the &drm_connector.probed_modes list. It should also update the
+	 * EDID property by calling drm_connector_update_edid_property().
+	 *
+	 * The usual way to implement this is to cache the EDID retrieved in the
+	 * probe callback somewhere in the driver-private connector structure.
+	 * In this function drivers then parse the modes in the EDID and add
+	 * them by calling drm_add_edid_modes(). But connectors that driver a
+	 * fixed panel can also manually add specific modes using
+	 * drm_mode_probed_add(). Drivers which manually add modes should also
+	 * make sure that the &drm_connector.display_info,
+	 * &drm_connector.width_mm and &drm_connector.height_mm fields are
+	 * filled in.
+	 *
+	 * Virtual drivers that just want some standard VESA mode with a given
+	 * resolution can call drm_add_modes_noedid(), and mark the preferred
+	 * one using drm_set_preferred_mode().
+	 *
+	 * This function is only called after the @detect hook has indicated
+	 * that a sink is connected and when the EDID isn't overridden through
+	 * sysfs or the kernel commandline.
+	 *
+	 * This callback is used by the probe helpers in e.g.
+	 * drm_helper_probe_single_connector_modes().
+	 *
+	 * To allow for accessing the atomic state of modesetting objects, the
+	 * helper libraries always call this with ctx set to a valid context,
+	 * and &drm_mode_config.connection_mutex will always be locked with
+	 * the ctx parameter set to @ctx. This allows for taking additional
+	 * locks as required.
+	 *
+	 * Returns:
+	 *
+	 * The number of modes added by calling drm_mode_probed_add(), or a
+	 * negative error code on failure.
+	 */
+	int (*get_modes_ctx)(struct drm_connector *connector,
+			     struct drm_modeset_acquire_ctx *ctx);
+
 	/**
 	 * @detect_ctx:
 	 *
-- 
2.26.2
