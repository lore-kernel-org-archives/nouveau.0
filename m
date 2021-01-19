From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/5] drm/nouveau/kms/nv140-: Add CRC methods to
 gv100_disp_core_mthd_head
Date: Mon, 18 Jan 2021 20:48:49 -0500
Message-ID: <20210119014849.2509965-6-lyude@redhat.com>
References: <20210119014849.2509965-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20210119014849.2509965-1-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Simon Ser <contact-sV0wSBM+kKVWj0EZb7rXcA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Noticed this while trying to figure out the bit that we need to set in
order to get cursor CRCs to come up correctly on volta+: we never actually
went and added these methods to gv100_disp_core_mthd_head in
drm/nouveau/nvkm/engine/disp/coregv100.c which means we don't trace their
values when disp tracing is enabled in nvkm. So, fix that.

Cc: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Cc: Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Simon Ser <contact-sV0wSBM+kKVWj0EZb7rXcA@public.gmane.org>
Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c
index e20a48f201f6..448a515057c7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c
@@ -106,6 +106,8 @@ gv100_disp_core_mthd_head = {
 		{ 0x20a4, 0x6820a4 },
 		{ 0x20a8, 0x6820a8 },
 		{ 0x20ac, 0x6820ac },
+		{ 0x2180, 0x682180 },
+		{ 0x2184, 0x682184 },
 		{ 0x218c, 0x68218c },
 		{ 0x2194, 0x682194 },
 		{ 0x2198, 0x682198 },
-- 
2.29.2
