From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] acpi: allow non-optimus setups to load vbios from
	acpi
Date: Wed, 26 Mar 2014 19:37:21 -0400
Message-ID: <1395877041-8646-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: patrick.clara-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, cllorenz-KiJTPfjSHVUubQSw3dWLiw@public.gmane.org
List-Id: nouveau.vger.kernel.org

There appear to be a crop of new hardware where the vbios is not
available from PROM/PRAMIN, but there is a valid _ROM method in ACPI.
The data read from PCIROM almost invariably contains invalid
instructions (still has the x86 opcodes), which makes this a low-risk
way to try to obtain a valid vbios image.

Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=76475
Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # v2.6.35+
---

Not sure if the stable CC is warranted... it's technically not a
regression. But it's a simple change that enables hardware to work.

Patrick/Claas -- please test this out (if you're applying this to a linux
tree, you'll have to do it manually, but it should be fairly obvious where
this should apply).

 drm/nouveau_acpi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drm/nouveau_acpi.c b/drm/nouveau_acpi.c
index 83face3..2792069 100644
--- a/drm/nouveau_acpi.c
+++ b/drm/nouveau_acpi.c
@@ -389,9 +389,6 @@ bool nouveau_acpi_rom_supported(struct pci_dev *pdev)
 	acpi_status status;
 	acpi_handle dhandle, rom_handle;
 
-	if (!nouveau_dsm_priv.dsm_detected && !nouveau_dsm_priv.optimus_detected)
-		return false;
-
 	dhandle = ACPI_HANDLE(&pdev->dev);
 	if (!dhandle)
 		return false;
-- 
1.8.3.2
