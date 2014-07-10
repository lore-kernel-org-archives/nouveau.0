From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 1/3] nouveau: check if a fence has already been
	signalled
Date: Wed,  9 Jul 2014 23:59:03 -0400
Message-ID: <1404964745-31949-2-git-send-email-imirkin@alum.mit.edu>
References: <1404964745-31949-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1404964745-31949-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

nouveau_fence_update does real work unconditionally. Avoid doing that if
the fence we're checking on has already been signalled.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 src/gallium/drivers/nouveau/nouveau_fence.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/src/gallium/drivers/nouveau/nouveau_fence.c b/src/gallium/drivers/nouveau/nouveau_fence.c
index c686710..a9448a4 100644
--- a/src/gallium/drivers/nouveau/nouveau_fence.c
+++ b/src/gallium/drivers/nouveau/nouveau_fence.c
@@ -174,6 +174,9 @@ nouveau_fence_signalled(struct nouveau_fence *fence)
 {
    struct nouveau_screen *screen = fence->screen;
 
+   if (fence->state == NOUVEAU_FENCE_STATE_SIGNALLED)
+      return TRUE;
+
    if (fence->state >= NOUVEAU_FENCE_STATE_EMITTED)
       nouveau_fence_update(screen, FALSE);
 
-- 
1.8.5.5
