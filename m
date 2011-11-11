From: Eric Appleman <erappleman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] master-compat: Compile i915 DRM for
 out-of-tree. Optimus laptops need it.
Date: Fri, 11 Nov 2011 05:25:17 -0500
Message-ID: <4EBCF80D.4050705@gmail.com>
References: <4EBCF7BF.3080600@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------040307090400000805000703"
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4EBCF7BF.3080600-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

This is a multi-part message in MIME format.
--------------040307090400000805000703
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2011 05:23 AM, Eric Appleman wrote:
> Hi, a machine with both an Intel and Nvidia GPU needs both drivers 
> built as modules otherwise the former will not work properly.
>
> - Eric
Sorry, Thunderbird is bad with attachments.

--------------040307090400000805000703
Content-Type: text/plain;
 name="makefile_i915_drm.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="makefile_i915_drm.txt"

diff --git a/nouveau/Makefile b/nouveau/Makefile
index 0a37e33..7405d43 100644
--- a/nouveau/Makefile
+++ b/nouveau/Makefile
@@ -59,7 +59,7 @@ DRMCFG := \
 	CONFIG_DRM_MGA=n \
 	CONFIG_DRM_I810=n \
 	CONFIG_DRM_I830=n \
-	CONFIG_DRM_I915=n \
+	CONFIG_DRM_I915=m \
 	CONFIG_DRM_SIS=n \
 	CONFIG_DRM_SAVAGE=n \
 	CONFIG_DRM_VIA=n \

--------------040307090400000805000703
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------040307090400000805000703--
