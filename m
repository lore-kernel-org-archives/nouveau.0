From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH] drm/nvd7/therm: handle another kind of PWM fans
Date: Mon, 12 May 2014 19:02:21 +0200
Message-ID: <1399914141-17660-1-git-send-email-martin.peres@free.fr>
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

Signed-off-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Tested-by: SaveTheRobots <john.rowley08-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/therm/nvd0.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/nvd0.c b/drivers/gpu/drm/nouveau/core/subdev/therm/nvd0.c
index 43fec17..bbf117b 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/therm/nvd0.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/therm/nvd0.c
@@ -40,6 +40,7 @@ pwm_info(struct nouveau_therm *therm, int line)
 		case 0x00: return 2;
 		case 0x19: return 1;
 		case 0x1c: return 0;
+		case 0x1e: return 2;
 		default:
 			break;
 		}
-- 
1.9.2
