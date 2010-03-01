From: =?utf-8?q?Marcin=20Ko=C5=9Bcielnicki?= <koriakin-mP9o5jsk0RY@public.gmane.org>
Subject: [PATCH] gallium/nouveau: fix st/xorg build
Date: Mon,  1 Mar 2010 15:58:05 +0000
Message-ID: <1267459085-3708-1-git-send-email-koriakin@0x04.net>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

---
 src/gallium/winsys/drm/nouveau/xorg/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/src/gallium/winsys/drm/nouveau/xorg/Makefile b/src/gallium/winsys/drm/nouveau/xorg/Makefile
index 179b502..71f389d 100644
--- a/src/gallium/winsys/drm/nouveau/xorg/Makefile
+++ b/src/gallium/winsys/drm/nouveau/xorg/Makefile
@@ -36,7 +36,7 @@ all default: $(TARGET)
 
 $(TARGET): $(OBJECTS) Makefile $(TOP)/src/gallium/state_trackers/xorg/libxorgtracker.a $(LIBS)
 	$(TOP)/bin/mklib -noprefix -o $@ \
-	$(OBJECTS) $(LIBS) $(shell pkg-config --libs libdrm) -ldrm_nouveau
+	$(OBJECTS) $(LIBS) $(shell pkg-config --libs libdrm) -ldrm_nouveau -lkms
 
 clean:
 	rm -rf $(OBJECTS) $(TARGET)
-- 
1.6.4.1
