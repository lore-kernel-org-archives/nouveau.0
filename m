From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/4] nouveau: Remove unneeded xf86GetEntityInfo()
Date: Fri,  2 Nov 2012 03:57:39 +0000
Message-ID: <1351828662-10807-2-git-send-email-emil.l.velikov@gmail.com>
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

Retrieving the whole entity information is not needed as we only
use the index - stored already in entity_num

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nv_driver.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/src/nv_driver.c b/src/nv_driver.c
index 9b5b9d6..c885e73 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -261,7 +261,6 @@ NVPciProbe(DriverPtr drv, int entity_num, struct pci_device *pci_dev,
 		{ -1, -1, NULL }
 	};
 	struct nouveau_device *dev = NULL;
-	EntityInfoPtr pEnt = NULL;
 	ScrnInfoPtr pScrn = NULL;
 	drmVersion *version;
 	int chipset, ret;
@@ -340,10 +339,8 @@ NVPciProbe(DriverPtr drv, int entity_num, struct pci_device *pci_dev,
 	pScrn->FreeScreen       = NVFreeScreen;
 
 	xf86SetEntitySharable(entity_num);
-
-	pEnt = xf86GetEntityInfo(entity_num);
-	xf86SetEntityInstanceForScreen(pScrn, pEnt->index, xf86GetNumEntityInstances(pEnt->index) - 1);
-	free(pEnt);
+	xf86SetEntityInstanceForScreen(pScrn, entity_num,
+					xf86GetNumEntityInstances(entity_num) - 1);
 
 	return TRUE;
 }
-- 
1.8.0
