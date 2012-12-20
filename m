From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] libdrm_nouveau.pc: don't include
	I${includedir}/nouveau
Date: Fri, 21 Dec 2012 00:00:30 +0100
Message-ID: <20121220230030.GB3496@joi.lan>
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
List-Id: nouveau.vger.kernel.org

Nouveau related headers are installed in I${includedir}/libdrm now.
---
 nouveau/libdrm_nouveau.pc.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/nouveau/libdrm_nouveau.pc.in b/nouveau/libdrm_nouveau.pc.in
index 6170613..454fc87 100644
--- a/nouveau/libdrm_nouveau.pc.in
+++ b/nouveau/libdrm_nouveau.pc.in
@@ -7,5 +7,5 @@ Name: libdrm_nouveau
 Description: Userspace interface to nouveau kernel DRM services
 Version: 2.4.33
 Libs: -L${libdir} -ldrm_nouveau
-Cflags: -I${includedir} -I${includedir}/libdrm -I${includedir}/nouveau
+Cflags: -I${includedir} -I${includedir}/libdrm
 Requires.private: libdrm
-- 
1.8.0.2
