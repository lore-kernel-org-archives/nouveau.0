From: Mark Carey <mark-CklgBQt3EwWO6V2BHUzxHg@public.gmane.org>
Subject: Re: [patch] "Junior" ToDo Warn if Modesetting Disabled
Date: Mon, 27 Aug 2012 09:05:58 +1200
Message-ID: <20120827090558.33082n3ef2x2nbg6@www.careysoft.co.nz>
References: <20120826211500.18936vaz6qo2nkes@www.careysoft.co.nz>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=_2x7yp45vi9s0g"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20120826211500.18936vaz6qo2nkes-H39yYvbTrNBS04pZAofVr6U/zSkkHjvu@public.gmane.org>
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

This message is in MIME format.

--=_2x7yp45vi9s0g
Content-Type: text/plain;
 charset=ISO-8859-1;
 DelSp="Yes";
 format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

v2 spaces to tabs as per RSpliets feedback on IRC




--=_2x7yp45vi9s0g
Content-Type: text/x-patch;
 charset=UTF-8;
 name="modeset.patch"
Content-Disposition: attachment;
 filename="modeset.patch"
Content-Transfer-Encoding: 7bit

From 55370ae2ef1df30a7d15b454fc6189f74675e011 Mon Sep 17 00:00:00 2001
From: Mark Carey <mark-CklgBQt3EwWO6V2BHUzxHg@public.gmane.org>
Date: Sun, 26 Aug 2012 22:09:17 +1200
Subject: [PATCH] drm/nouveau: warn during init if modesetting disabled

Reported-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Signed-off-by: Mark Carey <mark-CklgBQt3EwWO6V2BHUzxHg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 9fb56b3..aa9d3f6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -655,8 +655,11 @@ nouveau_drm_init(void)
 			nouveau_modeset = 1;
 	}
 
-	if (!nouveau_modeset)
+	if (!nouveau_modeset) {
+		NV_FATAL(NULL, "modesetting disabled\n");
+		NV_FATAL(NULL, "modesetting required for normal operation\n");
 		return 0;
+	}
 
 	nouveau_register_dsm_handler();
 	return drm_pci_init(&driver, &nouveau_drm_pci_driver);
-- 
1.7.5.1


--=_2x7yp45vi9s0g
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--=_2x7yp45vi9s0g--
