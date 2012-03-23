From: Andreas Heider <andreas-nJONrVjOgt4@public.gmane.org>
Subject: [PATCH 1/3] drm/nouveau: Initialize has_optimus
Date: Fri, 23 Mar 2012 22:57:05 +0100
Message-ID: <1332539827-13047-2-git-send-email-andreas@meetr.de>
References: <1332539827-13047-1-git-send-email-andreas@meetr.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1332539827-13047-1-git-send-email-andreas-nJONrVjOgt4@public.gmane.org>
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

During dsm detection it is possible that has_optimus is read uninitialized,
which can lead to optimus being detected erroneously. This patch
initialized has_optimus with 0.

Signed-off-by: Andreas Heider <andreas-nJONrVjOgt4@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_acpi.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
index 7814a76..284bd25 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
@@ -270,7 +270,7 @@ static bool nouveau_dsm_detect(void)
 	struct acpi_buffer buffer = {sizeof(acpi_method_name), acpi_method_name};
 	struct pci_dev *pdev = NULL;
 	int has_dsm = 0;
-	int has_optimus;
+	int has_optimus = 0;
 	int vga_count = 0;
 	bool guid_valid;
 	int retval;
-- 
1.7.9.1
