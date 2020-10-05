From: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] device: return error for unknown chipsets
Date: Mon,  5 Oct 2020 15:52:30 +0200
Message-ID: <20201005135230.735914-1-kherbst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: dann frazier <dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Previously the code relied on device->pri to be NULL and to fail probing
later. We really should just return an error inside nvkm_device_ctor for
unsupported GPUs.

Fixes: 24d5ff40a732 ("drm/nouveau/device: rework mmio mapping code to get rid of second map")

Signed-off-by: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: dann frazier <dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 drm/nouveau/nvkm/engine/device/base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drm/nouveau/nvkm/engine/device/base.c b/drm/nouveau/nvkm/engine/device/base.c
index 9f4ac2672..68d665414 100644
--- a/drm/nouveau/nvkm/engine/device/base.c
+++ b/drm/nouveau/nvkm/engine/device/base.c
@@ -3149,6 +3149,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 		case 0x168: device->chip = &nv168_chipset; break;
 		default:
 			nvdev_error(device, "unknown chipset (%08x)\n", boot0);
+			ret = -ENOSYS;
 			goto done;
 		}
 
-- 
2.26.2
