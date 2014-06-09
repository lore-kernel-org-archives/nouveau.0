From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH] drm/nouveau/doc: update the thermal documentation
Date: Mon,  9 Jun 2014 20:38:36 +0200
Message-ID: <1402339116-19868-1-git-send-email-martin.peres@free.fr>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Changes:
 - Change the maintainer's address (the labri address will expire soon);
 - Drop the note about not all families supporting all fan modes;
 - Add a note about the reported RPM not being accurate when driven outside
   the vbios-defined PWM range.

Signed-off-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
---
 Documentation/thermal/nouveau_thermal | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/thermal/nouveau_thermal b/Documentation/thermal/nouveau_thermal
index efceb78..60bc293 100644
--- a/Documentation/thermal/nouveau_thermal
+++ b/Documentation/thermal/nouveau_thermal
@@ -4,7 +4,7 @@ Kernel driver nouveau
 Supported chips:
 * NV43+
 
-Authors: Martin Peres (mupuf) <martin.peres-BktLLJ5BOkI@public.gmane.org>
+Authors: Martin Peres (mupuf) <martin.peres-GANU6spQydw@public.gmane.org>
 
 Description
 ---------
@@ -68,8 +68,9 @@ Your fan can be driven in different modes:
 
 NOTE: Be sure to use the manual mode if you want to drive the fan speed manually
 
-NOTE2: Not all fan management modes may be supported on all chipsets. We are
-working on it.
+NOTE2: When operating in manual mode outside the vbios-defined
+[PWM_min, PWM_max] range, the reported fan speed (RPM) may not be accurate
+depending on your hardware.
 
 Bug reports
 ---------
-- 
1.9.3
