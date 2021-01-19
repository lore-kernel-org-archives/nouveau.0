From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/5] drm/nouveau/kms/nvd9-nv138: Fix CRC
 calculation for the cursor channel
Date: Mon, 18 Jan 2021 20:48:48 -0500
Message-ID: <20210119014849.2509965-5-lyude@redhat.com>
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

While working on igt support for nouveau, I noticed that CRC calculation
appeared to be broken when the cursor channel was being used. For example,
if I had an igt test that would compare a software rendered image of a
completely black fb with a green square in it, and then attempt to
reproduce that image by positioning the cursor channel and setting it to a
green rectangle, the CRCs output by the hardware would differ between the
reference fb's CRC and the output's CRC. This was bizarre particularly
because through use of the Chamelium I have, I was able to confirm that the
image coming out of the display was identical between the reference and
output. As well, the issue wouldn't happen when using the outp CRC sources
that use the SF CRC source (so, DisplayPort) - only sources using the SOR
CRC source (so, everything other then DisplayPort and VGA). It also didn't
happen with the ovly plane, only the cursor plane.

Eventually I noticed 0x00000040 being set in the default state cache values
for the CRC methods, which isn't in Nvidia's open-gpu-docs and as such
appears to be inadvertently cleared to 0s when we enable CRCs. After
enabling this again during CRC capture, CRCs appear to be calculated
normally in all circumstances now.

Note that we might need to do this for Volta+ as well, but I'm not
entirely sure yet as there seem to be some bugs with how Volta+ handles
cursors that are currently causing kms_cursor_crc tests to fail.

Cc: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Cc: Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Simon Ser <contact-sV0wSBM+kKVWj0EZb7rXcA@public.gmane.org>
Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/dispnv50/crc907d.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc907d.c b/drivers/gpu/drm/nouveau/dispnv50/crc907d.c
index 0a89ae9523d4..f9cb484437aa 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc907d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc907d.c
@@ -32,7 +32,8 @@ crc907d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source
 		       NVDEF(NV907D, HEAD_SET_CRC_CONTROL, EXPECT_BUFFER_COLLAPSE, FALSE) |
 		       NVDEF(NV907D, HEAD_SET_CRC_CONTROL, TIMESTAMP_MODE, FALSE) |
 		       NVDEF(NV907D, HEAD_SET_CRC_CONTROL, SECONDARY_OUTPUT, NONE) |
-		       NVDEF(NV907D, HEAD_SET_CRC_CONTROL, CRC_DURING_SNOOZE, DISABLE);
+		       NVDEF(NV907D, HEAD_SET_CRC_CONTROL, CRC_DURING_SNOOZE, DISABLE) |
+		       0x00000040;
 	int ret;
 
 	switch (source) {
-- 
2.29.2
