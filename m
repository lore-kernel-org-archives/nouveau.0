From: Calvin Owens <jcalvinowens-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Fwd: [PATCH] nouveau: Fix unconditional return waiting on
	memory
Date: Sun, 7 Apr 2013 21:01:19 -0500
Message-ID: <20130408020117.GA6479@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: jcalvinowens-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: nouveau.vger.kernel.org

----- Forwarded message from Calvin Owens <jcalvinowens-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> -----

From: Calvin Owens <jcalvinowens-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
CC: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Calvin Owens <jcalvinowens-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Thu, 21 Mar 2013 13:10:12 -0500
Subject: [PATCH] nouveau: Fix unconditional return waiting on memory

Typo in nv50_display_flip_wait allows page flipping to run ahead before
memory has time to settle.

Signed-off-by: Calvin Owens <jcalvinowens-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv50_display.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index 2db5799..96bc2f3 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -479,7 +479,7 @@ nv50_display_flip_wait(void *data)
 {
 	struct nv50_display_flip *flip = data;
 	if (nouveau_bo_rd32(flip->disp->sync, flip->chan->addr / 4) ==
-					      flip->chan->data);
+					      flip->chan->data)
 		return true;
 	usleep_range(1, 2);
 	return false;
-- 
1.7.3.4

----- End forwarded message -----
