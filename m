From: Giuseppe Bilotta <giuseppe.bilotta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] xf86-video-nouveau: add macros to retrieve the
	subsystem vendor/device
Date: Thu, 27 Sep 2007 01:28:20 +0200
Message-ID: <1190849301-9084-1-git-send-email-giuseppe.bilotta@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Giuseppe Bilotta <giuseppe.bilotta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Giuseppe Bilotta <giuseppe.bilotta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nv_pcicompat.h |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/src/nv_pcicompat.h b/src/nv_pcicompat.h
index 4ead510..8f9dfe2 100644
--- a/src/nv_pcicompat.h
+++ b/src/nv_pcicompat.h
@@ -10,6 +10,8 @@
 #define PCI_DEV_VENDOR_ID(_device) ((_device)->vendor_id)
 #define PCI_DEV_DEVICE_ID(_device) ((_device)->device_id)
 #define PCI_DEV_REVISION(_device) ((_device)->revision)
+#define PCI_DEV_SUBVENDOR_ID(_device) ((_device)->subvendor_id)
+#define PCI_DEV_SUBDEVICE_ID(_device) ((_device)->subdevice_id)
 
 #define PCI_DEV_FUNC(_device) ((_device)->func)
 #define PCI_DEV_BUS(_device) ((_device)->bus)
@@ -28,6 +30,8 @@
 #define PCI_DEV_VENDOR_ID(_device) ((_device)->vendor)
 #define PCI_DEV_DEVICE_ID(_device) ((_device)->chipType)
 #define PCI_DEV_REVISION(_device) ((_device)->chipRev)
+#define PCI_DEV_SUBVENDOR_ID(_device) ((_device)->subsysVendor)
+#define PCI_DEV_SUBDEVICE_ID(_device) ((_device)->subsysCard)
 
 #define PCI_DEV_FUNC(_device) ((_device)->func)
 #define PCI_DEV_BUS(_device) ((_device)->bus)
-- 
1.5.3.2
