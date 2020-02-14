From: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH AUTOSEL 5.5 494/542] drm/nouveau/disp/nv50-:
 prevent oops when no channel method map provided
Date: Fri, 14 Feb 2020 10:48:06 -0500
Message-ID: <20200214154854.6746-494-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200214154854.6746-1-sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

[ Upstream commit 0e6176c6d286316e9431b4f695940cfac4ffe6c2 ]

The implementations for most channel types contains a map of methods to
priv registers in order to provide debugging info when a disp exception
has been raised.

This info is missing from the implementation of PIO channels as they're
rather simplistic already, however, if an exception is raised by one of
them, we'd end up triggering a NULL-pointer deref.  Not ideal...

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=206299
Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
index bcf32d92ee5a9..50e3539f33d22 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
@@ -74,6 +74,8 @@ nv50_disp_chan_mthd(struct nv50_disp_chan *chan, int debug)
 
 	if (debug > subdev->debug)
 		return;
+	if (!mthd)
+		return;
 
 	for (i = 0; (list = mthd->data[i].mthd) != NULL; i++) {
 		u32 base = chan->head * mthd->addr;
-- 
2.20.1
