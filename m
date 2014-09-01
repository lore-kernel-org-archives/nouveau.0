From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] nvc0: don't make 1d staging textures linear
Date: Mon,  1 Sep 2014 00:45:43 -0400
Message-ID: <1409546743-12074-1-git-send-email-imirkin@alum.mit.edu>
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
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: "10.2 10.3" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Experimentally, the sampler doesn't appear to like these, neither as
buffer nor as rect textures. So remove 1D from the list of texture types
to make linear when used for staging.

This fixes the OSD in mplayer for VDPAU.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "10.2 10.3" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
---
 src/gallium/drivers/nouveau/nvc0/nvc0_miptree.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_miptree.c b/src/gallium/drivers/nouveau/nvc0/nvc0_miptree.c
index 2f3cba8..3baa752 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_miptree.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_miptree.c
@@ -261,7 +261,6 @@ nvc0_miptree_create(struct pipe_screen *pscreen,
 
    if (pt->usage == PIPE_USAGE_STAGING) {
       switch (pt->target) {
-      case PIPE_TEXTURE_1D:
       case PIPE_TEXTURE_2D:
       case PIPE_TEXTURE_RECT:
          if (pt->last_level == 0 &&
-- 
1.8.5.5
