From: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH AUTOSEL 5.6 077/129] drm/nouveau/svm: check for
 SVM initialized before migrating
Date: Wed, 15 Apr 2020 07:33:52 -0400
Message-ID: <20200415113445.11881-77-sashal@kernel.org>
References: <20200415113445.11881-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200415113445.11881-1-sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
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
Cc: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

[ Upstream commit 822cab6150d3002952407a8297ff5a0d32bb7b54 ]

When migrating system memory to GPU memory, check that SVM has been
enabled. Even though most errors can be ignored since migration is
a performance optimization, return an error because this is a violation
of the API.

Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index df9bf1fd1bc0b..3ec5da025bea7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -171,6 +171,11 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
 	mm = get_task_mm(current);
 	down_read(&mm->mmap_sem);
 
+	if (!cli->svm.svmm) {
+		up_read(&mm->mmap_sem);
+		return -EINVAL;
+	}
+
 	for (addr = args->va_start, end = args->va_start + size; addr < end;) {
 		struct vm_area_struct *vma;
 		unsigned long next;
-- 
2.20.1
