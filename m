From: Lyude <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH i-g-t 3/4] lib/igt_kms: Hook up connector
 dithering prop
Date: Tue, 17 Mar 2020 21:00:46 -0400
Message-ID: <20200318010047.237024-4-lyude@redhat.com>
References: <20200318010047.237024-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200318010047.237024-1-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: igt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Nvidia display hardware provides a set of flexible dithering options for
CRTCs. This dithering is actually noticeable in the CRC output for all
available tap points, and can be seen as CRC values for identical frames
cycling between either 2 or 4 values repeatedly (each one of these
values is a different dithering phase applied to the source output). Of
course, this is very likely to break tests using CRC readback since we
don't expect the CRC to change if the source content hasn't changed.

So, hook up support for configuring the dithering property and reset it
to off from igt_display_reset() when applicable.

Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 lib/igt_kms.c | 6 ++++++
 lib/igt_kms.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 54de45e5..2bbb363e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -418,6 +418,7 @@ const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
 	[IGT_CONNECTOR_LINK_STATUS] = "link-status",
 	[IGT_CONNECTOR_MAX_BPC] = "max bpc",
 	[IGT_CONNECTOR_HDR_OUTPUT_METADATA] = "HDR_OUTPUT_METADATA",
+	[IGT_CONNECTOR_DITHERING_MODE] = "dithering mode",
 };
 
 /*
@@ -1799,6 +1800,10 @@ static void igt_output_reset(igt_output_t *output)
 	if (igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA))
 		igt_output_set_prop_value(output,
 					  IGT_CONNECTOR_HDR_OUTPUT_METADATA, 0);
+
+	if (igt_output_has_prop(output, IGT_CONNECTOR_DITHERING_MODE))
+		igt_output_set_prop_enum(output, IGT_CONNECTOR_DITHERING_MODE,
+					 "off");
 }
 
 /**
@@ -1813,6 +1818,7 @@ static void igt_output_reset(igt_output_t *output)
  * - %IGT_CONNECTOR_BROADCAST_RGB (if applicable)
  *   %IGT_CONNECTOR_CONTENT_PROTECTION (if applicable)
  *   %IGT_CONNECTOR_HDR_OUTPUT_METADATA (if applicable)
+ * - %IGT_CONNECTOR_DITHERING_MODE (if applicable)
  * - igt_output_override_mode() to default.
  *
  * For pipes:
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index cd3fdbc0..998ed241 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -127,6 +127,7 @@ enum igt_atomic_connector_properties {
        IGT_CONNECTOR_LINK_STATUS,
        IGT_CONNECTOR_MAX_BPC,
        IGT_CONNECTOR_HDR_OUTPUT_METADATA,
+       IGT_CONNECTOR_DITHERING_MODE,
        IGT_NUM_CONNECTOR_PROPS
 };
 
-- 
2.24.1
