From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/4] nouveau: fix entity handling in
	NvPlatformProbe
Date: Thu,  1 Nov 2012 14:40:58 +0000
Message-ID: <1351780858-13631-5-git-send-email-emil.l.velikov@gmail.com>
References: <1351780858-13631-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1351780858-13631-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

Ensure that the entity is shareable, making ZaphodHeads work again
Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=56347

Connect entity to screen - should fix relative screen positioning in xorg.conf
Reported-by: shox on IRC

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nv_driver.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/src/nv_driver.c b/src/nv_driver.c
index c1a50cd..7c7f822 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -84,6 +84,7 @@ NVPlatformProbe(DriverPtr driver,
 {
 	ScrnInfoPtr scrn = NULL;
 	uint32_t scr_flags = 0;
+	EntityInfoPtr pEnt = NULL;
 
 	if (!dev->pdev)
 		return FALSE;
@@ -112,6 +113,11 @@ NVPlatformProbe(DriverPtr driver,
 	scrn->LeaveVT          = NVLeaveVT;
 	scrn->FreeScreen       = NVFreeScreen;
 
+	xf86SetEntitySharable(entity_num);
+
+	pEnt = xf86GetEntityInfo(entity_num);
+	xf86SetEntityInstanceForScreen(scrn, pEnt->index, xf86GetNumEntityInstances(pEnt->index) - 1);
+	free(pEnt);
 	return TRUE;
 }
 #endif
-- 
1.8.0
