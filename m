From: Matthew Garrett <mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>
Subject: Re: [PATCH] Add in-kernel backlight control support
Date: Wed, 18 Feb 2009 13:21:26 +0000
Message-ID: <20090218132126.GA13672@srcf.ucam.org>
References: <20090218020825.GA5562@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090218020825.GA5562-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Sorry, that broke compiles on <2.6.29. Here's a patch.

diff --git a/linux-core/nouveau_backlight.c b/linux-core/nouveau_backlight.c
index dc75c44..32bb3e5 100644
--- a/linux-core/nouveau_backlight.c
+++ b/linux-core/nouveau_backlight.c
@@ -60,7 +60,9 @@ static int nv40_set_intensity(struct backlight_device *bd)
 }
 
 static struct backlight_ops nv40_bl_ops = {
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,29))
 	.options = BL_CORE_SUSPENDRESUME,
+#endif
 	.get_brightness = nv40_get_intensity,
 	.update_status = nv40_set_intensity,
 };
@@ -85,7 +87,9 @@ static int nv50_set_intensity(struct backlight_device *bd)
 }
 
 static struct backlight_ops nv50_bl_ops = {
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,29))
 	.options = BL_CORE_SUSPENDRESUME,
+#endif
 	.get_brightness = nv50_get_intensity,
 	.update_status = nv50_set_intensity,
 };

-- 
Matthew Garrett | mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org
