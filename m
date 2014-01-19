From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] drm/nouveau/mxm: fix null deref on load
Date: Sun, 19 Jan 2014 10:30:32 -0500
Message-ID: <1390145432-545-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@linux.ie>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andreas Reis <andreas.reis@gmail.com>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Since commit 61b365a50 (drm/nouveau: populate master subdev pointer only
when fully constructed), the nouveau_mxm(bios) call will return NULL,
since it's still being called from the constructor. Instead, pass the
mxm pointer via the unused data field.

See https://bugs.freedesktop.org/show_bug.cgi?id=73791

Reported-by: Andreas Reis <andreas.reis@gmail.com>
Tested-by: Andreas Reis <andreas.reis@gmail.com>
Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

3.13 release time is approaching, so I'm expanding the To list, as this is a
crashing bug for potentially a lot of people (not sure how common the MXM
stuff is) and it'd be silly not to include the fix because someone along the
chain wasn't around. Hope I'm not stepping on any toes by sending to the full
upstream path...

 drivers/gpu/drm/nouveau/core/subdev/mxm/nv50.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/mxm/nv50.c b/drivers/gpu/drm/nouveau/core/subdev/mxm/nv50.c
index af129c2..0bd3774 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/mxm/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/mxm/nv50.c
@@ -100,7 +100,7 @@ mxm_match_dcb(struct nouveau_mxm *mxm, u8 *data, void *info)
 static int
 mxm_dcb_sanitise_entry(struct nouveau_bios *bios, void *data, int idx, u16 pdcb)
 {
-	struct nouveau_mxm *mxm = nouveau_mxm(bios);
+	struct nouveau_mxm *mxm = data;
 	struct context ctx = { .outp = (u32 *)(bios->data + pdcb) };
 	u8 type, i2cidx, link, ver, len;
 	u8 *conn;
@@ -199,7 +199,7 @@ mxm_dcb_sanitise(struct nouveau_mxm *mxm)
 		return;
 	}
 
-	dcb_outp_foreach(bios, NULL, mxm_dcb_sanitise_entry);
+	dcb_outp_foreach(bios, mxm, mxm_dcb_sanitise_entry);
 	mxms_foreach(mxm, 0x01, mxm_show_unmatched, NULL);
 }
 
-- 
1.8.3.2
