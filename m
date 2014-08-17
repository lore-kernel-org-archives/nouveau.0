From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH 02/10] therm/fan: do not use the pwm mode when the
	vbios tells us to use the toggle
Date: Sun, 17 Aug 2014 17:33:07 +0200
Message-ID: <1408289594-28587-2-git-send-email-martin.peres@free.fr>
References: <1408289594-28587-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1408289594-28587-1-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
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

Signed-off-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
---
 nvkm/subdev/therm/fanpwm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/nvkm/subdev/therm/fanpwm.c b/nvkm/subdev/therm/fanpwm.c
index 9a5c073..c629d7f 100644
--- a/nvkm/subdev/therm/fanpwm.c
+++ b/nvkm/subdev/therm/fanpwm.c
@@ -25,6 +25,8 @@
 
 #include <core/option.h>
 #include <subdev/gpio.h>
+#include <subdev/bios.h>
+#include <subdev/bios/fan.h>
 
 #include "priv.h"
 
@@ -86,11 +88,15 @@ nouveau_fanpwm_create(struct nouveau_therm *therm, struct dcb_gpio_func *func)
 {
 	struct nouveau_device *device = nv_device(therm);
 	struct nouveau_therm_priv *tpriv = (void *)therm;
+	struct nouveau_bios *bios = nouveau_bios(therm);
 	struct nouveau_fanpwm_priv *priv;
+	struct nvbios_therm_fan fan;
 	u32 divs, duty;
 
+	nvbios_fan_parse(bios, &fan);
+
 	if (!nouveau_boolopt(device->cfgopt, "NvFanPWM", func->param) ||
-	    !therm->pwm_ctrl ||
+	    !therm->pwm_ctrl || fan.type == NVBIOS_THERM_FAN_TOGGLE ||
 	     therm->pwm_get(therm, func->line, &divs, &duty) == -ENODEV)
 		return -ENODEV;
 
-- 
2.0.0
