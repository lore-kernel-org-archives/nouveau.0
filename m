From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 3/3] nvc0/ir: describe the tex arguments for
	fermi/kepler
Date: Thu,  7 Aug 2014 21:27:10 -0400
Message-ID: <1407461230-22369-3-git-send-email-imirkin@alum.mit.edu>
References: <1407461230-22369-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1407461230-22369-1-git-send-email-imirkin@alum.mit.edu>
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

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 .../nouveau/codegen/nv50_ir_lowering_nvc0.cpp      | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
index ade315d..7da9b0b 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
@@ -567,6 +567,31 @@ NVC0LoweringPass::handleTEX(TexInstruction *i)
    const int lyr = arg - (i->tex.target.isMS() ? 2 : 1);
    const int chipset = prog->getTarget()->getChipset();
 
+   // Arguments to the TEX instruction are a little insane. Even though the
+   // encoding is identical between SM20 and SM30, the arguments mean
+   // different things between Fermi and Kepler+. A lot of arguments are
+   // optional based on flags passed to the instruction. This summarizes the
+   // order of things.
+   //
+   // Fermi:
+   //  array/indirect
+   //  coords
+   //  sample
+   //  lod bias
+   //  depth compare
+   //  offsets:
+   //    - tg4: 8 bits each, either 2 (1 offset reg) or 8 (2 offset reg)
+   //    - other: 4 bits each, single reg
+   //
+   // Kepler+:
+   //  indirect handle
+   //  array (+ offsets for txd in upper 16 bits)
+   //  coords
+   //  sample
+   //  lod bias
+   //  depth compare
+   //  offsets (same as fermi, except txd which takes it with array)
+
    if (chipset >= NVISA_GK104_CHIPSET) {
       if (i->tex.rIndirectSrc >= 0 || i->tex.sIndirectSrc >= 0) {
          // XXX this ignores tsc, and assumes a 1:1 mapping
-- 
1.8.5.5
