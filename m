From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: gk20a: Fix type of dividend in
	do_div()
Date: Thu,  2 Oct 2014 11:53:30 +0200
Message-ID: <1412243610-14324-1-git-send-email-thierry.reding@gmail.com>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The semantics of do_div() are (see include/asm-generic/div64.h):

	uint32_t do_div(uint64_t *n, uint32_t base)

Using a different type will therefore cause the following warning (as
seen on xtensa/allmodconfig):

	  CC [M]  drivers/gpu/drm/nouveau/core/subdev/clock/gk20a.o
	In file included from arch/xtensa/include/generated/asm/div64.h:1:0,
	                 from include/linux/kernel.h:124,
	                 from include/linux/list.h:8,
	                 from include/linux/preempt.h:10,
	                 from include/linux/spinlock.h:50,
	                 from include/linux/mmzone.h:7,
	                 from include/linux/gfp.h:5,
	                 from include/linux/slab.h:14,
	                 from drivers/gpu/drm/nouveau/core/os.h:5,
	                 from drivers/gpu/drm/nouveau/core/include/core/object.h:4,
	                 from drivers/gpu/drm/nouveau/core/include/core/device.h:4,
	                 from drivers/gpu/drm/nouveau/core/include/subdev/clock.h:4,
	                 from drivers/gpu/drm/nouveau/core/subdev/clock/gk20a.c:90:
	drivers/gpu/drm/nouveau/core/subdev/clock/gk20a.c: In function 'gk20a_pllg_calc_rate':
	include/asm-generic/div64.h:43:28: warning: comparison of distinct pointer types lacks a cast
	  (void)(((typeof((n)) *)0) == ((uint64_t *)0)); \
	                            ^
	drivers/gpu/drm/nouveau/core/subdev/clock/gk20a.c:146:2: note: in expansion of macro 'do_div'
	  do_div(rate, divider);
	  ^
	drivers/gpu/drm/nouveau/core/subdev/clock/gk20a.c:146:2: warning: right shift count >= width of type
	In file included from arch/xtensa/include/generated/asm/div64.h:1:0,
	                 from include/linux/kernel.h:124,
	                 from include/linux/list.h:8,
	                 from include/linux/preempt.h:10,
	                 from include/linux/spinlock.h:50,
	                 from include/linux/mmzone.h:7,
	                 from include/linux/gfp.h:5,
	                 from include/linux/slab.h:14,
	                 from drivers/gpu/drm/nouveau/core/os.h:5,
	                 from drivers/gpu/drm/nouveau/core/include/core/object.h:4,
	                 from drivers/gpu/drm/nouveau/core/include/core/device.h:4,
	                 from drivers/gpu/drm/nouveau/core/include/subdev/clock.h:4,
	                 from drivers/gpu/drm/nouveau/core/subdev/clock/gk20a.c:90:
	include/asm-generic/div64.h:48:11: warning: passing argument 1 of '__div64_32' from incompatible pointer type
	   __rem = __div64_32(&(n), __base); \
	           ^
	drivers/gpu/drm/nouveau/core/subdev/clock/gk20a.c:146:2: note: in expansion of macro 'do_div'
	  do_div(rate, divider);
	  ^
	include/asm-generic/div64.h:35:17: note: expected 'uint64_t *' but argument is of type 'u32 *'
	 extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/clock/gk20a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/gk20a.c b/drivers/gpu/drm/nouveau/core/subdev/clock/gk20a.c
index 425a8d5e9129..c571437afbd2 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/clock/gk20a.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/clock/gk20a.c
@@ -138,7 +138,7 @@ gk20a_pllg_read_mnp(struct gk20a_clock_priv *priv)
 static u32
 gk20a_pllg_calc_rate(struct gk20a_clock_priv *priv)
 {
-	u32 rate;
+	u64 rate;
 	u32 divider;
 
 	rate = priv->parent_rate * priv->n;
-- 
2.1.0
