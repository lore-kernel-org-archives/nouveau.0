From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nv50: decode PGRAPH status registers on
 TLB flush fail
Date: Sun, 11 Nov 2012 19:52:59 +0100
Message-ID: <20121111185259.GA3530@joi.lan>
References: <1352238533-14920-4-git-send-email-marcin.slusarz@gmail.com>
	<20121107000847.GA21065@turiel.redhat.com>
	<20121107190441.GC24379@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121107190441.GC24379-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, Nov 07, 2012 at 08:04:41PM +0100, Marcin Slusarz wrote:
> On Wed, Nov 07, 2012 at 10:08:47AM +1000, Ben Skeggs wrote:
> > On Tue, Nov 06, 2012 at 10:48:52PM +0100, Marcin Slusarz wrote:
> > > Now it outputs:
> > > nouveau E[  PGRAPH][0000:02:00.0] PGRAPH TLB flush idle timeout fail
> > > nouveau E[  PGRAPH][0000:02:00.0] PGRAPH_STATUS: BUSY DISPATCH VFETCH CCACHE_UNK4 STRMOUT_GSCHED_UNK5 UNK14XX UNK1CXX CLIPID ZCULL ENG2D UNK34XX TPRAST TPROP ROP (0x011fde03)
> > > nouveau E[  PGRAPH][0000:02:00.0] PGRAPH_VSTATUS: CCACHE (0x00145b4d) (0x0000002d) ENG2D ROP (0x0034db40)
> > 
> > How about this instead?
> > 
> > PGRAPH_STATUS  : 0x011fde03 [BUSY DISPATCH VFETCH CCACHE_UNK4 STRMOUT_GSCHED_UNK5 UNK14XX UNK1CXX CLIPID ZCULL ENG2D UNK34XX TPRAST TPROP ROP]
> > PGRAPH_VSTATUS0: 0x00145b4d [CCACHE]
> > PGRAPH_VSTATUS1: 0x0000002d []
> > PGRAPH_VSTATUS2: 0x0034db40 [ENG2D ROP]
> 
> Looks good too. I'll post updated patch tomorrow.

I removed square brackets to make this code as simple as possible (think about
last space before ]).
---
From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nv50: decode PGRAPH status registers on TLB flush fail

Now it prints:
nouveau E[  PGRAPH][0000:02:00.0] PGRAPH TLB flush idle timeout fail
nouveau E[  PGRAPH][0000:02:00.0] PGRAPH_STATUS  : 0x011fde03 BUSY DISPATCH VFETCH CCACHE_UNK4 STRMOUT_GSCHED_UNK5 UNK14XX UNK1CXX CLIPID ZCULL ENG2D UNK34XX TPRAST TPROP ROP
nouveau E[  PGRAPH][0000:02:00.0] PGRAPH_VSTATUS0: 0x00145b4d CCACHE
nouveau E[  PGRAPH][0000:02:00.0] PGRAPH_VSTATUS0: 0x0000002d
nouveau E[  PGRAPH][0000:02:00.0] PGRAPH_VSTATUS0: 0x0034db40 ENG2D ROP

instead of:
[drm] nouveau 0000:02:00.0: PGRAPH TLB flush idle timeout fail: 0x011fde03 0x00145b4d 0x0000002d 0x0034db40

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/engine/graph/nv50.c | 76 ++++++++++++++++++++++--
 1 file changed, 72 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
index ab3b9dc..0d67e86 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
@@ -184,6 +184,65 @@ nv50_graph_tlb_flush(struct nouveau_engine *engine)
 	return 0;
 }
 
+static const struct nouveau_bitfield nv50_pgraph_status[] = {
+	{ 0x00000001, "BUSY" }, /* set when any bit is set */
+	{ 0x00000002, "DISPATCH" },
+	{ 0x00000004, "UNK2" },
+	{ 0x00000008, "UNK3" },
+	{ 0x00000010, "UNK4" },
+	{ 0x00000020, "UNK5" },
+	{ 0x00000040, "M2MF" },
+	{ 0x00000080, "UNK7" },
+	{ 0x00000100, "CTXPROG" },
+	{ 0x00000200, "VFETCH" },
+	{ 0x00000400, "CCACHE_UNK4" },
+	{ 0x00000800, "STRMOUT_GSCHED_UNK5" },
+	{ 0x00001000, "UNK14XX" },
+	{ 0x00002000, "UNK24XX_CSCHED" },
+	{ 0x00004000, "UNK1CXX" },
+	{ 0x00008000, "CLIPID" },
+	{ 0x00010000, "ZCULL" },
+	{ 0x00020000, "ENG2D" },
+	{ 0x00040000, "UNK34XX" },
+	{ 0x00080000, "TPRAST" },
+	{ 0x00100000, "TPROP" },
+	{ 0x00200000, "TEX" },
+	{ 0x00400000, "TPVP" },
+	{ 0x00800000, "MP" },
+	{ 0x01000000, "ROP" },
+	{}
+};
+
+static const char *const nv50_pgraph_vstatus_0[] = {
+	"VFETCH", "CCACHE", "UNK4", "UNK5", "GSCHED", "STRMOUT", "UNK14XX", NULL
+};
+
+static const char *const nv50_pgraph_vstatus_1[] = {
+	"TPRAST", "TPROP", "TEXTURE", "TPVP", "MP", NULL
+};
+
+static const char *const nv50_pgraph_vstatus_2[] = {
+	"UNK24XX", "CSCHED", "UNK1CXX", "CLIPID", "ZCULL", "ENG2D", "UNK34XX",
+	"ROP", NULL
+};
+
+static void nouveau_pgraph_vstatus_print(struct nv50_graph_priv *priv, int r,
+		const char *const units[], u32 status)
+{
+	int i;
+
+	nv_error(priv, "PGRAPH_VSTATUS%d: 0x%08x", r, status);
+
+	for (i = 0; units[i] && status; i++) {
+		if ((status & 7) == 1)
+			pr_cont(" %s", units[i]);
+		status >>= 3;
+	}
+	if (status)
+		pr_cont(" (invalid: 0x%x)", status);
+	pr_cont("\n");
+}
+
 static int
 nv84_graph_tlb_flush(struct nouveau_engine *engine)
 {
@@ -219,10 +278,19 @@ nv84_graph_tlb_flush(struct nouveau_engine *engine)
 		 !(timeout = ptimer->read(ptimer) - start > 2000000000));
 
 	if (timeout) {
-		nv_error(priv, "PGRAPH TLB flush idle timeout fail: "
-			      "0x%08x 0x%08x 0x%08x 0x%08x\n",
-			 nv_rd32(priv, 0x400700), nv_rd32(priv, 0x400380),
-			 nv_rd32(priv, 0x400384), nv_rd32(priv, 0x400388));
+		nv_error(priv, "PGRAPH TLB flush idle timeout fail\n");
+
+		tmp = nv_rd32(priv, 0x400700);
+		nv_error(priv, "PGRAPH_STATUS  : 0x%08x", tmp);
+		nouveau_bitfield_print(nv50_pgraph_status, tmp);
+		pr_cont("\n");
+
+		nouveau_pgraph_vstatus_print(priv, 0, nv50_pgraph_vstatus_0,
+				nv_rd32(priv, 0x400380));
+		nouveau_pgraph_vstatus_print(priv, 1, nv50_pgraph_vstatus_1,
+				nv_rd32(priv, 0x400384));
+		nouveau_pgraph_vstatus_print(priv, 2, nv50_pgraph_vstatus_2,
+				nv_rd32(priv, 0x400388));
 	}
 
 	nv50_vm_flush_engine(&engine->base, 0x00);
-- 
1.7.12
