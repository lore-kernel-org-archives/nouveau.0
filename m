From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29129] New: Cannot set refresh rate on nv50
Date: Sat, 17 Jul 2010 05:39:23 -0700 (PDT)
Message-ID: <bug-29129-8800@http.bugs.freedesktop.org/>
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
List-Id: nouveau.vger.kernel.org

https://bugs.freedesktop.org/show_bug.cgi?id=29129

           Summary: Cannot set refresh rate on nv50
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
               URL: http://marc.info/?l=linux-kernel&m=127913459017236&w=2
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: svenjoac-Mmb7MZpHnFY@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Since Linux 2.6.34, it is no longer possible to set the refresh rate with the
"video=...@nn" parameter, e.g. video=1280x1024@75 is ignored.

I bisected this to the following commit:

drm/nv50: enable hpd on any connector we know the gpio line for

Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

diff --git a/drivers/gpu/drm/nouveau/nv50_display.c
b/drivers/gpu/drm/nouveau/nv50_display.c
index 61a89f2..ebcd8bf 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -370,7 +370,9 @@ nv50_display_init(struct drm_device *dev)
         struct nouveau_connector *conn = nouveau_connector(connector);
         struct dcb_gpio_entry *gpio;

-        if (conn->dcb->gpio_tag == 0xff)
+        if (connector->connector_type != DRM_MODE_CONNECTOR_DVII &&
+            connector->connector_type != DRM_MODE_CONNECTOR_DVID &&
+            connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort)
             continue;

         gpio = nouveau_bios_gpio_entry(dev, conn->dcb->gpio_tag);

diff --git a/drivers/gpu/drm/nouveau/nv50_display.c
b/drivers/gpu/drm/nouveau/nv50_display.c
index ebcd8bf..61a89f2 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -370,9 +370,7 @@ nv50_display_init(struct drm_device *dev)
         struct nouveau_connector *conn = nouveau_connector(connector);
         struct dcb_gpio_entry *gpio;

-        if (connector->connector_type != DRM_MODE_CONNECTOR_DVII &&
-            connector->connector_type != DRM_MODE_CONNECTOR_DVID &&
-            connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort)
+        if (conn->dcb->gpio_tag == 0xff)
             continue;

         gpio = nouveau_bios_gpio_entry(dev, conn->dcb->gpio_tag);


It should be noted that since this commit all the card data appear under
/sys/class/drm/card0-DVI-I-1, e.g. /sys/class/drm/card0-DVI-I-1/enabled says
"enabled" and /sys/class/drm/card0-VGA-1/enabled says "disabled", despite the
monitor being connected via VGA.

I only noticed this in 2.6.35-rc5 because the default refresh rate changed to
60 Hz there, see https://bugzilla.kernel.org/show_bug.cgi?id=16402.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
