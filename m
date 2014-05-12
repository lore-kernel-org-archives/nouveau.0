From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH] therm/fan/tach: default to 2 pulses per revolution
Date: Mon, 12 May 2014 23:19:07 +0200
Message-ID: <1399929547-19775-1-git-send-email-martin.peres@free.fr>
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
Cc: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>

I spent some time this weekend trying to find in the vbios the number of
pulses per revolutions in the vbios but couldn't find it. It would seem
all my cards have 2 pulses per revolution so let's stick to that until
further notice.

Thermal table's id 0x48 may indicate this information but it would seem
that changing the value results in the blob power or clock gating the
RPM counter... We should ask NVIDIA about that, should be trivial-enough
for them to answer.

Signed-off-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
---
 nvkm/subdev/therm/nva3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/nvkm/subdev/therm/nva3.c b/nvkm/subdev/therm/nva3.c
index 3b2c458..0478b2e 100644
--- a/nvkm/subdev/therm/nva3.c
+++ b/nvkm/subdev/therm/nva3.c
@@ -36,7 +36,7 @@ nva3_therm_fan_sense(struct nouveau_therm *therm)
 	u32 tach = nv_rd32(therm, 0x00e728) & 0x0000ffff;
 	u32 ctrl = nv_rd32(therm, 0x00e720);
 	if (ctrl & 0x00000001)
-		return tach * 60;
+		return tach * 60 / 2;
 	return -ENODEV;
 }
 
-- 
1.9.2
