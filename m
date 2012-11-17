From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/bios: fix DCB v1.5 parsing
Date: Sat, 17 Nov 2012 21:33:15 +0100
Message-ID: <20121117203315.GA23587@joi.lan>
References: <20121115210914.GA6970@joi.lan>
	<CAPM=9tx7nxB1ncQUZrBCh2xyKNxEz77=QMyandzoKmY3yopXEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPM=9tx7nxB1ncQUZrBCh2xyKNxEz77=QMyandzoKmY3yopXEA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Nov 16, 2012 at 09:36:56PM +1000, Dave Airlie wrote:
> On Fri, Nov 16, 2012 at 7:09 AM, Marcin Slusarz
> <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > memcmp->nv_strncmp conversion should have inverted the return value.
> >
> > Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> > See http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=drivers/gpu/drm/nouveau/nouveau_bios.c;h=a0a3fe3c016be86665db1369c44bef832f829a1a;hb=a0d271cbfed1dd50278c6b06bead3d00ba0a88f9#l5652 (3.6)
> > and http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=drivers/gpu/drm/nouveau/core/include/core/object.h;h=818feabbf4a0969f090f897852fe4476a422b1b6;hb=77b67063bb6bce6d475e910d3b886a606d0d91f7#l179 (nv_strncmp definition)
> 
> Christ fix that nv_strncmp to act like the C one, or give it a very
> different name!

Please don't kill the messenger.

---
From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] drm/nouveau/bios: fix DCB v1.5 parsing

memcmp->nv_strncmp conversion, in addition to name change, should have
inverted the return value.

But nv_strncmp does not act like strncmp - it does not check for string
terminator, returns true/false instead of -1/0/1 and has different
parameters order.
Let's rename it to nv_memcmp and let it act like memcmp.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/include/core/object.h | 14 +++++++++-----
 drivers/gpu/drm/nouveau/core/subdev/bios/dcb.c     |  2 +-
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/include/core/object.h b/drivers/gpu/drm/nouveau/core/include/core/object.h
index 818feab..486f1a9 100644
--- a/drivers/gpu/drm/nouveau/core/include/core/object.h
+++ b/drivers/gpu/drm/nouveau/core/include/core/object.h
@@ -175,14 +175,18 @@ nv_mo32(void *obj, u32 addr, u32 mask, u32 data)
 	return temp;
 }
 
-static inline bool
-nv_strncmp(void *obj, u32 addr, u32 len, const char *str)
+static inline int
+nv_memcmp(void *obj, u32 addr, const char *str, u32 len)
 {
+	unsigned char c1, c2;
+
 	while (len--) {
-		if (nv_ro08(obj, addr++) != *(str++))
-			return false;
+		c1 = nv_ro08(obj, addr++);
+		c2 = *(str++);
+		if (c1 != c2)
+			return c1 - c2;
 	}
-	return true;
+	return 0;
 }
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/core/subdev/bios/dcb.c b/drivers/gpu/drm/nouveau/core/subdev/bios/dcb.c
index 7d75038..c511971 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/bios/dcb.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/bios/dcb.c
@@ -64,7 +64,7 @@ dcb_table(struct nouveau_bios *bios, u8 *ver, u8 *hdr, u8 *cnt, u8 *len)
 		}
 	} else
 	if (*ver >= 0x15) {
-		if (!nv_strncmp(bios, dcb - 7, 7, "DEV_REC")) {
+		if (!nv_memcmp(bios, dcb - 7, "DEV_REC", 7)) {
 			u16 i2c = nv_ro16(bios, dcb + 2);
 			*hdr = 4;
 			*cnt = (i2c - dcb) / 10;
-- 
1.7.12
