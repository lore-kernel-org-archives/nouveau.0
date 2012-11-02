From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/4] nouveau: NVPlatformProbe,
	handle shareable entities
Date: Fri,  2 Nov 2012 03:57:42 +0000
Message-ID: <1351828662-10807-5-git-send-email-emil.l.velikov@gmail.com>
References: <op.wm4fbfzs8t7z9u@arch-laptop>
	<1351828662-10807-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1351828662-10807-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

During NVPciProbe, xf86ConfigPciEntity() implicitly calls checks and sets
the entity as shared
Here we are only allocating the screen, thus need to explicitly call the
functions

ZaphodHead and Xinerama should finally work

Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=56347

Reported-By: Vladimir Chebotarev <exc-7nl8rL9eBqAvJsYlp49lxw@public.gmane.org>
Reported-By: Damian Nowak <nowaker-qMBiBlq7xnnVItvQsEIGlw@public.gmane.org>
Tested-By: Damian Nowak <nowaker-qMBiBlq7xnnVItvQsEIGlw@public.gmane.org>
Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nv_driver.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/src/nv_driver.c b/src/nv_driver.c
index f184cd4..83bb7f4 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -353,6 +353,11 @@ NVPlatformProbe(DriverPtr driver,
 		scr_flags = XF86_ALLOCATE_GPU_SCREEN;
 
 	scrn = xf86AllocateScreen(driver, scr_flags);
+	if (!scrn)
+		return FALSE;
+	
+	if (xf86IsEntitySharable(entity_num))
+		xf86SetEntityShared(entity_num);
 	xf86AddEntityToScreen(scrn, entity_num);
 
 	NVInitScrn(scrn, entity_num);
-- 
1.8.0
