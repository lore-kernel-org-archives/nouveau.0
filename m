From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 2/5] nv50/ir: keep track of whether the program
	uses fp64
Date: Fri, 18 Jul 2014 09:57:26 -0400
Message-ID: <1405691849-18853-3-git-send-email-imirkin@alum.mit.edu>
References: <1405691849-18853-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1405691849-18853-1-git-send-email-imirkin@alum.mit.edu>
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

---
 src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h   | 1 +
 src/gallium/drivers/nouveau/codegen/nv50_ir_target.cpp | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h b/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
index f829aac..3a89a29 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
@@ -183,6 +183,7 @@ struct nv50_ir_prog_info
       boolean sampleInterp;      /* perform sample interp on all fp inputs */
       uint8_t backFaceColor[2];  /* input/output indices of back face colour */
       uint8_t globalAccess;      /* 1 for read, 2 for wr, 3 for rw */
+      boolean fp64;              /* program uses fp64 math */
       boolean nv50styleSurfaces; /* generate gX[] access for raw buffers */
       uint8_t resInfoCBSlot;     /* cX[] used for tex handles, surface info */
       uint16_t texBindBase;      /* base address for tex handles (nve4) */
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_target.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_target.cpp
index 0397bdc..7992f53 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_target.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_target.cpp
@@ -379,9 +379,13 @@ Program::emitBinary(struct nv50_ir_prog_info *info)
 
       assert(emit->getCodeSize() == fn->binPos);
 
-      for (int b = 0; b < fn->bbCount; ++b)
-         for (Instruction *i = fn->bbArray[b]->getEntry(); i; i = i->next)
+      for (int b = 0; b < fn->bbCount; ++b) {
+         for (Instruction *i = fn->bbArray[b]->getEntry(); i; i = i->next) {
             emit->emitInstruction(i);
+            if (i->sType == TYPE_F64 || i->dType == TYPE_F64)
+               info->io.fp64 = true;
+         }
+      }
    }
    info->bin.relocData = emit->getRelocInfo();
 
-- 
1.8.5.5
