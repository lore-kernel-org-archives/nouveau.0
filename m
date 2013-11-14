From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: null deref in nouveau_clock_init on pre-nv40 cards
Date: Thu, 14 Nov 2013 03:38:32 -0500
Message-ID: <CAKb7Uvj2QnG_pEigTN3Co4QrRQ3SzLeG9n125AFWtXkxgMX+sQ@mail.gmail.com>
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
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi Ben,

Pre-nv40 cards don't have domains defined, which the
nouveau_clock_init code assumes exists. The following
(white-space-damaged, sorry) patch fixes boot for me, haven't really
tested the pre-nv40 cards in my system much further. I assume there's
some proper fix here.

  -ilia

diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/base.c
b/drivers/gpu/drm/nouveau/core/subdev/clock/base.c
index ce82dc4..acc4ac8 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/clock/base.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/clock/base.c
@@ -411,6 +411,7 @@ _nouveau_clock_init(struct nouveau_object *object)
        memset(&clk->bstate, 0x00, sizeof(clk->bstate));
        INIT_LIST_HEAD(&clk->bstate.list);
        clk->bstate.pstate = 0xff;
+       if (!clock) return 0;

        while (clock->name != nv_clk_src_max) {
                ret = clk->read(clk, clock->name);
