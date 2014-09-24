From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 1/2] allow path to envyas binary to be specified
Date: Tue, 23 Sep 2014 23:56:10 -0400
Message-ID: <1411530971-3381-1-git-send-email-imirkin@alum.mit.edu>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/shader/Makefile | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/src/shader/Makefile b/src/shader/Makefile
index 46658e9..2d789be 100644
--- a/src/shader/Makefile
+++ b/src/shader/Makefile
@@ -24,20 +24,21 @@ NVF0_SHADERS = xfrm2nvf0.vpc \
 	       videonvf0.fpc
 
 SHADERS = $(NVC0_SHADERS) $(NVE0_SHADERS) $(NVF0_SHADERS)
+ENVYAS ?= envyas
 
 all: $(SHADERS)
 
 $(filter %nvc0.vpc,$(SHADERS)): %.vpc: %.vp
-	cpp -DENVYAS $< | sed -e '/^#/d' | envyas -w -m nvc0 -o $@
+	cpp -DENVYAS $< | sed -e '/^#/d' | $(ENVYAS) -w -m nvc0 -o $@
 $(filter %nvc0.fpc,$(SHADERS)): %.fpc: %.fp
-	cpp -DENVYAS $< | sed -e '/^#/d' | envyas -w -m nvc0 -o $@
+	cpp -DENVYAS $< | sed -e '/^#/d' | $(ENVYAS) -w -m nvc0 -o $@
 
 $(filter %nve0.vpc,$(SHADERS)): %.vpc: %.vp
-	cpp -DENVYAS $< | sed -e '/^#/d' | envyas -w -m nvc0 -V nve4 -o $@
+	cpp -DENVYAS $< | sed -e '/^#/d' | $(ENVYAS) -w -m nvc0 -V nve4 -o $@
 $(filter %nve0.fpc,$(SHADERS)): %.fpc: %.fp
-	cpp -DENVYAS $< | sed -e '/^#/d' | envyas -w -m nvc0 -V nve4 -o $@
+	cpp -DENVYAS $< | sed -e '/^#/d' | $(ENVYAS) -w -m nvc0 -V nve4 -o $@
 
 $(filter %nvf0.vpc,$(SHADERS)): %.vpc: %.vp
-	cpp -DENVYAS $< | sed -e '/^#/d' | envyas -w -m gk110 -o $@
+	cpp -DENVYAS $< | sed -e '/^#/d' | $(ENVYAS) -w -m gk110 -o $@
 $(filter %nvf0.fpc,$(SHADERS)): %.fpc: %.fp
-	cpp -DENVYAS $< | sed -e '/^#/d' | envyas -w -m gk110 -o $@
+	cpp -DENVYAS $< | sed -e '/^#/d' | $(ENVYAS) -w -m gk110 -o $@
-- 
1.8.5.5
