From: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/3] lib: fix devices selection using -a
Date: Mon, 15 Sep 2014 13:25:40 +0200
Message-ID: <1410780342-2808-2-git-send-email-samuel.pitoiset@gmail.com>
References: <1410780342-2808-1-git-send-email-samuel.pitoiset@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1410780342-2808-1-git-send-email-samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 lib/kern.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/kern.c b/lib/kern.c
index 930cd35..7e8f3e9 100644
--- a/lib/kern.c
+++ b/lib/kern.c
@@ -173,7 +173,7 @@ drm_client_init(const char *name, u64 device, const char *cfg,
 	if (ret = -ENOMEM, !(drm = *ppriv = malloc(sizeof(*drm))))
 		goto fail;
 
-	for (minor = DRM_RENDER_MIN; minor <= DRM_RENDER_MAX; minor++) {
+	for (minor = DRM_RENDER_MIN + device; minor <= DRM_RENDER_MAX; minor++) {
 		snprintf(path, sizeof(path), "/dev/dri/renderD%d", minor);
 		if ((drm->fd = open(path, O_RDWR, 0)) < 0)
 			continue;
-- 
2.0.0
