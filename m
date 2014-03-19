From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] disp/nvd0-: allow 540MHz data rate for nvd0+
	devices
Date: Wed, 19 Mar 2014 10:43:09 -0400
Message-ID: <1395240189-7719-1-git-send-email-imirkin@alum.mit.edu>
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
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "D. Moens" <d-bugzilla-vUpi/VKO0VA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=76319
Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

It's unclear to me whether GF11x devices actually support this, but
the disp "split" is at nvd0, so I went with that. The marketing docs
are fairly unclear. However most of them don't actually have DP in the
first place, so it may not be a huge issue.

I don't have the hardware for testing this myself, but hopefully
someone can verify that this doesn't break "regular" non-4K setups.

 nvkm/engine/disp/dport.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/nvkm/engine/disp/dport.c b/nvkm/engine/disp/dport.c
index 1bd4c63..1ea3e65 100644
--- a/nvkm/engine/disp/dport.c
+++ b/nvkm/engine/disp/dport.c
@@ -273,12 +273,15 @@ nouveau_dp_train(struct nouveau_disp *disp, const struct nouveau_dp_func *func,
 		.outp = outp,
 		.head = head,
 	}, *dp = &_dp;
-	const u32 bw_list[] = { 270000, 162000, 0 };
+	const u32 bw_list[] = { 540000, 270000, 162000, 0 };
 	const u32 *link_bw = bw_list;
 	u8  hdr, cnt, len;
 	u32 data;
 	int ret;
 
+	if (nouveau_device(disp)->card_type < NV_D0)
+		link_bw++;
+
 	/* find the bios displayport data relevant to this output */
 	data = nvbios_dpout_match(bios, outp->hasht, outp->hashm, &dp->version,
 				 &hdr, &cnt, &len, &dp->info);
-- 
1.8.3.2
