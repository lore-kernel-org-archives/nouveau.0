From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: [PATCH] drm/nouveau/bios/timing: mark expected switch fall-throughs
Date: Thu, 2 Nov 2017 15:20:33 -0500
Message-ID: <20171102202033.GA10647@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <garsilva@embeddedor.com>
List-Id: nouveau.vger.kernel.org

In preparation to enabling -Wimplicit-fallthrough, mark switch cases
where we are expecting to fall through.

Addresses-Coverity-ID: 1260018
Addresses-Coverity-ID: 1260019
Addresses-Coverity-ID: 1260022
Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/timing.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/timing.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/timing.c
index 7e83c39..20ff517 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/timing.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/timing.c
@@ -115,16 +115,21 @@ nvbios_timingEp(struct nvkm_bios *bios, int idx,
 		switch (min_t(u8, *hdr, 25)) {
 		case 25:
 			p->timing_10_24  = nvbios_rd08(bios, data + 0x18);
+			/* fall through */
 		case 24:
 		case 23:
 		case 22:
 			p->timing_10_21  = nvbios_rd08(bios, data + 0x15);
+			/* fall through */
 		case 21:
 			p->timing_10_20  = nvbios_rd08(bios, data + 0x14);
+			/* fall through */
 		case 20:
 			p->timing_10_CWL = nvbios_rd08(bios, data + 0x13);
+			/* fall through */
 		case 19:
 			p->timing_10_18  = nvbios_rd08(bios, data + 0x12);
+			/* fall through */
 		case 18:
 		case 17:
 			p->timing_10_16  = nvbios_rd08(bios, data + 0x10);
-- 
2.7.4
