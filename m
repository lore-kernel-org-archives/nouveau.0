From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21273] Driver can't detect video output and xserver
 doesn't start
Date: Fri, 20 Jul 2012 15:18:52 +0000
Message-ID: <bug-21273-8800-liR01ECc5E@http.bugs.freedesktop.org/>
References: <bug-21273-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21273-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=21273

Andrey Gusev <ronne-cmBhpYW9OiY@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #64352|0                           |1
        is obsolete|                            |
  Attachment #64361|0                           |1
        is obsolete|                            |
  Attachment #64362|0                           |1
        is obsolete|                            |
  Attachment #64364|0                           |1
        is obsolete|                            |

--- Comment #73 from Andrey Gusev <ronne-cmBhpYW9OiY@public.gmane.org> 2012-07-20 08:18:52 PDT ---
Created attachment 64417
  --> https://bugs.freedesktop.org/attachment.cgi?id=64417
Log initialization

After this patch
diff -u linux_stock/drivers/gpu/drm/nouveau/nouveau_bios.c
linux-3.4/drivers/gpu/drm/nouveau/nouveau_bios.c
--- linux_stock/drivers/gpu/drm/nouveau/nouveau_bios.c    2012-07-18
23:28:42.467787857 +0400
+++ linux-3.4/drivers/gpu/drm/nouveau/nouveau_bios.c    2012-07-20
00:05:20.048039574 +0400
@@ -6092,10 +6092,18 @@
 #ifdef __powerpc__
     /* Apple iMac G4 NV17 */
     if (of_machine_is_compatible("PowerMac4,5")) {
+        NV_INFO(dev, "Fabricate outputs for Apple iMac G4 NV17\n");
         fabricate_dcb_output(dcb, OUTPUT_TMDS, 0, all_heads, 1);
         fabricate_dcb_output(dcb, OUTPUT_ANALOG, 1, all_heads, 2);
         return;
     }
+    /* Apple PowerMac G4 NV17 */
+    if (of_machine_is_compatible("PowerMac3,6")) {
+        NV_INFO(dev, "Fabricate outputs for Apple PowerMac G4 NV17\n");
+        fabricate_dcb_output(dcb, OUTPUT_TMDS, 0, all_heads, 1);
+        fabricate_dcb_output(dcb, OUTPUT_TMDS, 1, all_heads, 2);
+        return;
+    }
 #endif

     /* Make up some sane defaults */
@@ -6485,19 +6493,23 @@
     if (!NVInitVBIOS(dev))
         return -ENODEV;

+    NV_INFO(dev, "Init BIOS");
     ret = nouveau_parse_vbios_struct(dev);
     if (ret)
         return ret;

-    ret = nouveau_i2c_init(dev);
+    NV_INFO(dev, "Init MXM");
+    ret = nouveau_mxm_init(dev);
     if (ret)
         return ret;

-    ret = nouveau_mxm_init(dev);
+    NV_INFO(dev, "Parse dcd table");
+    ret = parse_dcb_table(dev, bios);
     if (ret)
         return ret;

-    ret = parse_dcb_table(dev, bios);
+    NV_INFO(dev, "Init I2C");
+    ret = nouveau_i2c_init(dev);
     if (ret)
         return ret;

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
