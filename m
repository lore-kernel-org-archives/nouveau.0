From: Christian Costa <titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH envytools] docs: Fix some spelling and remove some
	trailing spaces.
Date: Mon, 25 Aug 2014 20:58:11 +0200
Message-ID: <1408993096-18883-2-git-send-email-titan.costa@gmail.com>
References: <1408993096-18883-1-git-send-email-titan.costa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1408993096-18883-1-git-send-email-titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

---
 docs/hw/fifo/intro.rst | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/docs/hw/fifo/intro.rst b/docs/hw/fifo/intro.rst
index 8b1d69d..0e023bf 100644
--- a/docs/hw/fifo/intro.rst
+++ b/docs/hw/fifo/intro.rst
@@ -10,7 +10,7 @@ FIFO overview
 Introduction
 ============
 
-Commands to most of the engines are sent through a special engine caled PFIFO.
+Commands to most of the engines are sent through a special engine called PFIFO.
 PFIFO maintains multiple fully independent command queues, known as "channels"
 or "FIFO"s. Each channel is controlled through a "channel control area", which
 is a region of MMIO [pre-NVC0] or VRAM [NVC0+]. PFIFO intercepts all accesses
@@ -40,11 +40,11 @@ The engines that PFIFO controls on NV04:NVC0 are:
 == ========== =========================== =================================================== 
 Id Present on Name                        Description                                        
 == ========== =========================== =================================================== 
-0  all        SOFTWARE                    Not really an engine, causes interrupt for each    
-                                          command, can be used to execute driver functions   
-                                          in sync with other commands.                       
-1  all        :ref:`PGRAPH <graph-intro>` Main engine of the card: 2d, 3d, compute.          
-2  NV31:NV98  :ref:`PMPEG <pmpeg>`        The PFIFO interface to VPE MPEG2 decoding engine.  
+0  all        SOFTWARE                    Not really an engine, causes interrupt for each
+                                          command, can be used to execute driver functions
+                                          in sync with other commands.
+1  all        :ref:`PGRAPH <graph-intro>` Main engine of the card: 2d, 3d, compute.
+2  NV31:NV98  :ref:`PMPEG <pmpeg>`        The PFIFO interface to VPE MPEG2 decoding engine.
    NVA0:NVAA
 3  NV40:NV84  :ref:`PME <me-fifo>`        VPE motion estimation engine.
 4  NV41:NV84  :ref:`PVP1 <pvp1>`          VPE microcoded vector processor.
@@ -64,10 +64,10 @@ The engines that PFIFO controls on NVC0- are:
 ===== ========== =========================== =================================================== 
 Id    Present on Name                        Description                                        
 ===== ========== =========================== =================================================== 
-1f    all        SOFTWARE                    Not really an engine, causes interrupt for each    
-                                             command, can be used to execute driver functions   
-                                             in sync with other commands.                       
-0     all        :ref:`PGRAPH <graph-intro>` Main engine of the card: 2d, 3d, compute.          
+1f    all        SOFTWARE                    Not really an engine, causes interrupt for each
+                                             command, can be used to execute driver functions
+                                             in sync with other commands.
+0     all        :ref:`PGRAPH <graph-intro>` Main engine of the card: 2d, 3d, compute.
 1     all        :ref:`PVDEC <pvdec>`        falcon-based microcoded video decoder.
 2     all        :ref:`PPPP <pppp>`          falcon-based video post-processor.
 3     all        :ref:`PVLD <pvld>`          falcon-based variable length decoder.
@@ -93,7 +93,7 @@ The PFIFO can be split into roughly 4 pieces:
 - PFIFO puller: executes the commands, passes them to the proper engine,
   or to the driver.
 - PFIFO switcher: ticks out the time slices for the channels and saves /
-  restores the state of the channel between PFIFO registers and RAMFC
+  restores the state of the channels between PFIFO registers and RAMFC
   memory.
 
 A channel consists of the following:
@@ -133,7 +133,7 @@ is being submitted. See :ref:`nv03-pfifo-dma` for details.
 
 NV04 PFIFO greatly enhanced the DMA mode and made it controllable directly
 through the channel control area. Thus, commands can now be submitted by
-multiple applications simultanously, without coordination with each other
+multiple applications simultaneously, without coordination with each other
 and without kernel's help. DMA mode is described in :ref:`fifo-dma-pusher`.
 
 NV50 introduced IB mode. IB mode is a modified version of DMA mode that,
@@ -143,8 +143,8 @@ to stitch together parts of multiple memory areas into a single command stream
 memory written by earlier commands. IB mode is described along with DMA mode in
 :ref:`fifo-dma-pusher`.
 
-NVC0 rearchitected the whole PFIFO, made it possible to have up to 3 channels
-executing simultanously, and introduced a new DMA packet format.
+NVC0 rearchitectured the whole PFIFO, made it possible to have up to 3 channels
+executing simultaneously, and introduced a new DMA packet format.
 
 The commands, as stored in CACHE, are tuples of:
 
@@ -180,12 +180,12 @@ and engine-specific documentation.
 
 Pre-NV1A, PFIFO treats everything as little-endian. NV1A introduced big-endian
 mode, which affects pushbuffer/IB reads and semaphores. On NV1A:NV50 cards,
-the endian can be selected per channel via big_endian flag. On NV50+ cards,
+the endianness can be selected per channel via the big_endian flag. On NV50+ cards,
 PFIFO endianness is a global switch.
 
 .. todo:: look for NVC0 PFIFO endian switch
 
 The channel control area endianness is not affected by the big_endian flag or
-NV50+ PFIFO endianness switch. Instead, it follows the PMC MMIO endian switch.
+NV50+ PFIFO endianness switch. Instead, it follows the PMC MMIO endianness switch.
 
 .. todo:: is it still true for NVC0, with VRAM-backed channel control area?
-- 
1.9.1
