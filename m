From: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Subject: [PATCH] nv30: Support negative offsets in indirect
	constant access
Date: Sun, 15 Jul 2012 21:53:43 +0200
Message-ID: <1342382023-16889-2-git-send-email-r.spliet@student.tudelft.nl>
References: <1341944623.1407.3.camel@tellur>
	<1342382023-16889-1-git-send-email-r.spliet@student.tudelft.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1342382023-16889-1-git-send-email-r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Fixes piglit vp-address-01 amongst several others

Signed-off-by: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
---
 src/gallium/drivers/nv30/nv30_state.h    |    2 +-
 src/gallium/drivers/nv30/nv30_vertprog.c |    6 +++---
 src/gallium/drivers/nv30/nvfx_shader.h   |    2 +-
 src/gallium/drivers/nv30/nvfx_vertprog.c |   13 ++++++++++---
 4 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/src/gallium/drivers/nv30/nv30_state.h b/src/gallium/drivers/nv30/nv30_state.h
index 964676a..a44eb59 100644
--- a/src/gallium/drivers/nv30/nv30_state.h
+++ b/src/gallium/drivers/nv30/nv30_state.h
@@ -63,7 +63,7 @@ struct nv30_sampler_view {
 
 struct nv30_shader_reloc {
    unsigned location;
-   unsigned target;
+   signed target;
 };
 
 struct nv30_vertprog_exec {
diff --git a/src/gallium/drivers/nv30/nv30_vertprog.c b/src/gallium/drivers/nv30/nv30_vertprog.c
index 9b5ba35..06e1b8c 100644
--- a/src/gallium/drivers/nv30/nv30_vertprog.c
+++ b/src/gallium/drivers/nv30/nv30_vertprog.c
@@ -149,8 +149,8 @@ nv30_vertprog_validate(struct nv30_context *nv30)
             inst     = vp->insns[reloc->location].data;
             target   = vp->data->start + reloc->target;
 
-            inst[1] &= ~0x0003fc000;
-            inst[1] |= target << 14;
+            inst[1] &= ~0x0007fc000;
+            inst[1] |= (target & 0x1ff) << 14;
             reloc++;
          }
       } else {
@@ -159,7 +159,7 @@ nv30_vertprog_validate(struct nv30_context *nv30)
             target   = vp->data->start + reloc->target;
 
             inst[1] &= ~0x0001ff000;
-            inst[1] |= target << 12;
+            inst[1] |= (target & 0x1ff) << 12;
             reloc++;
          }
       }
diff --git a/src/gallium/drivers/nv30/nvfx_shader.h b/src/gallium/drivers/nv30/nvfx_shader.h
index e343bf0..987e1b0 100644
--- a/src/gallium/drivers/nv30/nvfx_shader.h
+++ b/src/gallium/drivers/nv30/nvfx_shader.h
@@ -416,7 +416,7 @@
 
 struct nvfx_reg {
 	int8_t type;
-	uint32_t index;
+	int32_t index;
 };
 
 struct nvfx_src {
diff --git a/src/gallium/drivers/nv30/nvfx_vertprog.c b/src/gallium/drivers/nv30/nvfx_vertprog.c
index f41f82d..827d518 100644
--- a/src/gallium/drivers/nv30/nvfx_vertprog.c
+++ b/src/gallium/drivers/nv30/nvfx_vertprog.c
@@ -135,12 +135,13 @@ emit_src(struct nv30_context *nv30, struct nvfx_vpc *vpc, uint32_t *hw,
    case NVFXSR_CONST:
       sr |= (NVFX_VP(SRC_REG_TYPE_CONST) <<
              NVFX_VP(SRC_REG_TYPE_SHIFT));
-      if (src.reg.index < 512) {
+      if (src.reg.index < 256 && src.reg.index >= -256) {
          reloc.location = vp->nr_insns - 1;
          reloc.target = src.reg.index;
          util_dynarray_append(&vp->const_relocs, struct nvfx_relocation, reloc);
       } else {
-         hw[1] |= (src.reg.index - 512) << NVFX_VP(INST_CONST_SRC_SHIFT);
+         hw[1] |= (src.reg.index << NVFX_VP(INST_CONST_SRC_SHIFT)) &
+               NVFX_VP(INST_CONST_SRC_MASK);
       }
       break;
    case NVFXSR_NONE:
@@ -169,6 +170,7 @@ emit_src(struct nv30_context *nv30, struct nvfx_vpc *vpc, uint32_t *hw,
          hw[0] |= NVFX_VP(INST_INDEX_INPUT);
       else
          assert(0);
+
       if(src.indirect_reg)
          hw[0] |= NVFX_VP(INST_ADDR_REG_SELECT_1);
       hw[0] |= src.indirect_swz << NVFX_VP(INST_ADDR_SWZ_SHIFT);
@@ -367,7 +369,12 @@ tgsi_src(struct nvfx_vpc *vpc, const struct tgsi_full_src_register *fsrc) {
       src.reg = nvfx_reg(NVFXSR_INPUT, fsrc->Register.Index);
       break;
    case TGSI_FILE_CONSTANT:
-      src.reg = vpc->r_const[fsrc->Register.Index];
+      if(fsrc->Register.Indirect) {
+         src.reg = vpc->r_const[0];
+         src.reg.index = fsrc->Register.Index;
+      } else {
+         src.reg = vpc->r_const[fsrc->Register.Index];
+      }
       break;
    case TGSI_FILE_IMMEDIATE:
       src.reg = vpc->imm[fsrc->Register.Index];
-- 
1.7.10.4
