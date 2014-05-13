From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 2/2] nv50/ir: fix integer mul lowering for u32 x
	u32 -> high u32
Date: Tue, 13 May 2014 11:33:36 -0400
Message-ID: <1399995216-17699-2-git-send-email-imirkin@alum.mit.edu>
References: <1399995216-17699-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1399995216-17699-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: mesa-dev@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org, "10.1 10.2" <mesa-stable@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

UNION appears to expect that all of its defines are conditional.
Otherwise it inserts a mov instruction which overwrites the desired
result. This fixes tests that use UMUL_HI, and much less directly,
unsigned integer division by a constant, which uses this functionality
in its lowering.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "10.1 10.2" <mesa-stable@lists.freedesktop.org>
---

The S32 version of this logic is busted too (thankfully there is no IMUL
instruction so it normally doesn't come up). However division by signed
integer is still broken as a result. Fixing it will require more changes, but
those will rely on the unsigned case working.

 src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
index 63db1d7..b17d57d 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
@@ -75,16 +75,17 @@ expandIntegerMUL(BuildUtil *bld, Instruction *mul)
    i[4] = bld->mkOp3(OP_MAD, fTy, t[3], a[0], b[0], t[2]);
 
    if (highResult) {
-      Value *r[3];
+      Value *r[4];
       Value *imm = bld->loadImm(NULL, 1 << (halfSize * 8));
       c[0] = bld->getSSA(1, FILE_FLAGS);
       c[1] = bld->getSSA(1, FILE_FLAGS);
-      for (int j = 0; j < 3; ++j)
+      for (int j = 0; j < 4; ++j)
          r[j] = bld->getSSA(fullSize);
 
       i[8] = bld->mkOp2(OP_SHR, fTy, r[0], t[1], bld->mkImm(halfSize * 8));
       i[6] = bld->mkOp2(OP_ADD, fTy, r[1], r[0], imm);
-      bld->mkOp2(OP_UNION, TYPE_U32, r[2], r[1], r[0]);
+      bld->mkMov(r[3], r[0])->setPredicate(CC_NC, c[0]);
+      bld->mkOp2(OP_UNION, TYPE_U32, r[2], r[1], r[3]);
       i[5] = bld->mkOp3(OP_MAD, fTy, mul->getDef(0), a[1], b[1], r[2]);
 
       // set carry defs / sources
-- 
1.8.5.5
