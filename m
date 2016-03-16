From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH mesa 4/6] nouveau: codegen:
	s/FILE_MEMORY_GLOBAL/FILE_MEMORY_BUFFER/
Date: Wed, 16 Mar 2016 10:55:16 -0400
Message-ID: <CAKb7Uvg=2MpmfYfeRi8NcYYzGkhZy7mDLFw0dFoeWd68Q6EgFA@mail.gmail.com>
References: <1458120239-27659-1-git-send-email-hdegoede@redhat.com>
 <1458120239-27659-4-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2024428482=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1458120239-27659-4-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============2024428482==
Content-Type: multipart/alternative; boundary=047d7b3a9acaad3073052e2bb36c

--047d7b3a9acaad3073052e2bb36c
Content-Type: text/plain; charset=UTF-8

This approach leads to the emitters needing to know about both global and
buffer, even though at that point, they are identical. I was thinking that
in the lowering logic, buffer would just get rewritten as global (with the
offset added), thus not needing any change to the emitters. What do you
think about such an approach?
On Mar 16, 2016 2:24 AM, "Hans de Goede" <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> FILE_MEMORY_GLOBAL is currently only used for buffer handling, as we
> do not yet have (opencl) global memory support. Global memory support
> actually requires some different handling during lowering, so rename
> FILE_MEMORY_GLOBAL to FILE_MEMORY_BUFFER to reflect that the current
> code is for buffer handling, this will allow the later (re-)addition
> of FILE_MEMORY_GLOBAL for regular global memory.
>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  src/gallium/drivers/nouveau/codegen/nv50_ir.h                |  2 +-
>  src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp   | 10
> +++++-----
>  src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gm107.cpp   |  6 +++---
>  src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp    | 10
> +++++-----
>  src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp    | 12
> ++++++------
>  src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp    |  8 ++++----
>  .../drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp        | 10
> +++++-----
>  src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp     |  8 ++++----
>  src/gallium/drivers/nouveau/codegen/nv50_ir_print.cpp        |  2 +-
>  src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp  |  6 +++---
>  src/gallium/drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp  |  2 +-
>  11 files changed, 38 insertions(+), 38 deletions(-)
>
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir.h
> b/src/gallium/drivers/nouveau/codegen/nv50_ir.h
> index 7b0eb2f..fdc2195 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir.h
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir.h
> @@ -332,7 +332,7 @@ enum DataFile
>     FILE_MEMORY_CONST,
>     FILE_SHADER_INPUT,
>     FILE_SHADER_OUTPUT,
> -   FILE_MEMORY_GLOBAL,
> +   FILE_MEMORY_BUFFER,
>     FILE_MEMORY_SHARED,
>     FILE_MEMORY_LOCAL,
>     FILE_SYSTEM_VALUE,
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp
> b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp
> index 70f3c3f..02a1101 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp
> @@ -1641,7 +1641,7 @@ CodeEmitterGK110::emitSTORE(const Instruction *i)
>     int32_t offset = SDATA(i->src(0)).offset;
>
>     switch (i->src(0).getFile()) {
> -   case FILE_MEMORY_GLOBAL: code[1] = 0xe0000000; code[0] = 0x00000000;
> break;
> +   case FILE_MEMORY_BUFFER: code[1] = 0xe0000000; code[0] = 0x00000000;
> break;
>     case FILE_MEMORY_LOCAL:  code[1] = 0x7a800000; code[0] = 0x00000002;
> break;
>     case FILE_MEMORY_SHARED:
>        code[0] = 0x00000002;
> @@ -1678,7 +1678,7 @@ CodeEmitterGK110::emitSTORE(const Instruction *i)
>
>     srcId(i->src(1), 2);
>     srcId(i->src(0).getIndirect(0), 10);
> -   if (i->src(0).getFile() == FILE_MEMORY_GLOBAL &&
> +   if (i->src(0).getFile() == FILE_MEMORY_BUFFER &&
>         i->src(0).isIndirect(0) &&
>         i->getIndirect(0, 0)->reg.size == 8)
>        code[1] |= 1 << 23;
> @@ -1690,7 +1690,7 @@ CodeEmitterGK110::emitLOAD(const Instruction *i)
>     int32_t offset = SDATA(i->src(0)).offset;
>
>     switch (i->src(0).getFile()) {
> -   case FILE_MEMORY_GLOBAL: code[1] = 0xc0000000; code[0] = 0x00000000;
> break;
> +   case FILE_MEMORY_BUFFER: code[1] = 0xc0000000; code[0] = 0x00000000;
> break;
>     case FILE_MEMORY_LOCAL:  code[1] = 0x7a000000; code[0] = 0x00000002;
> break;
>     case FILE_MEMORY_SHARED:
>        code[0] = 0x00000002;
> @@ -1800,7 +1800,7 @@ CodeEmitterGK110::emitMOV(const Instruction *i)
>  static inline bool
>  uses64bitAddress(const Instruction *ldst)
>  {
> -   return ldst->src(0).getFile() == FILE_MEMORY_GLOBAL &&
> +   return ldst->src(0).getFile() == FILE_MEMORY_BUFFER &&
>        ldst->src(0).isIndirect(0) &&
>        ldst->getIndirect(0, 0)->reg.size == 8;
>  }
> @@ -1862,7 +1862,7 @@ CodeEmitterGK110::emitCCTL(const Instruction *i)
>
>     code[0] = 0x00000002 | (i->subOp << 2);
>
> -   if (i->src(0).getFile() == FILE_MEMORY_GLOBAL) {
> +   if (i->src(0).getFile() == FILE_MEMORY_BUFFER) {
>        code[1] = 0x7b000000;
>     } else {
>        code[1] = 0x7c000000;
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gm107.cpp
> b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gm107.cpp
> index e079a57..27f287f 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gm107.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gm107.cpp
> @@ -2417,7 +2417,7 @@ void
>  CodeEmitterGM107::emitCCTL()
>  {
>     unsigned width;
> -   if (insn->src(0).getFile() == FILE_MEMORY_GLOBAL) {
> +   if (insn->src(0).getFile() == FILE_MEMORY_BUFFER) {
>        emitInsn(0xef600000);
>        width = 30;
>     } else {
> @@ -2988,7 +2988,7 @@ CodeEmitterGM107::emitInstruction(Instruction *i)
>        case FILE_MEMORY_CONST : emitLDC(); break;
>        case FILE_MEMORY_LOCAL : emitLDL(); break;
>        case FILE_MEMORY_SHARED: emitLDS(); break;
> -      case FILE_MEMORY_GLOBAL: emitLD(); break;
> +      case FILE_MEMORY_BUFFER: emitLD(); break;
>        default:
>           assert(!"invalid load");
>           emitNOP();
> @@ -2999,7 +2999,7 @@ CodeEmitterGM107::emitInstruction(Instruction *i)
>        switch (insn->src(0).getFile()) {
>        case FILE_MEMORY_LOCAL : emitSTL(); break;
>        case FILE_MEMORY_SHARED: emitSTS(); break;
> -      case FILE_MEMORY_GLOBAL: emitST(); break;
> +      case FILE_MEMORY_BUFFER: emitST(); break;
>        default:
>           assert(!"invalid load");
>           emitNOP();
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp
> b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp
> index 682a19d..7476e21 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp
> @@ -662,7 +662,7 @@ CodeEmitterNV50::emitLOAD(const Instruction *i)
>        code[0] = 0xd0000001;
>        code[1] = 0x40000000;
>        break;
> -   case FILE_MEMORY_GLOBAL:
> +   case FILE_MEMORY_BUFFER:
>        code[0] = 0xd0000001 | (i->getSrc(0)->reg.fileIndex << 16);
>        code[1] = 0x80000000;
>        break;
> @@ -671,7 +671,7 @@ CodeEmitterNV50::emitLOAD(const Instruction *i)
>        break;
>     }
>     if (sf == FILE_MEMORY_LOCAL ||
> -       sf == FILE_MEMORY_GLOBAL)
> +       sf == FILE_MEMORY_BUFFER)
>        emitLoadStoreSizeLG(i->sType, 21 + 32);
>
>     setDst(i, 0);
> @@ -679,7 +679,7 @@ CodeEmitterNV50::emitLOAD(const Instruction *i)
>     emitFlagsRd(i);
>     emitFlagsWr(i);
>
> -   if (i->src(0).getFile() == FILE_MEMORY_GLOBAL) {
> +   if (i->src(0).getFile() == FILE_MEMORY_BUFFER) {
>        srcId(*i->src(0).getIndirect(0), 9);
>     } else {
>        setAReg16(i, 0);
> @@ -699,7 +699,7 @@ CodeEmitterNV50::emitSTORE(const Instruction *i)
>        code[1] = 0x80c00000;
>        srcId(i->src(1), 32 + 14);
>        break;
> -   case FILE_MEMORY_GLOBAL:
> +   case FILE_MEMORY_BUFFER:
>        code[0] = 0xd0000001 | (i->getSrc(0)->reg.fileIndex << 16);
>        code[1] = 0xa0000000;
>        emitLoadStoreSizeLG(i->dType, 21 + 32);
> @@ -737,7 +737,7 @@ CodeEmitterNV50::emitSTORE(const Instruction *i)
>        break;
>     }
>
> -   if (f == FILE_MEMORY_GLOBAL)
> +   if (f == FILE_MEMORY_BUFFER)
>        srcId(*i->src(0).getIndirect(0), 9);
>     else
>        setAReg16(i, 0);
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp
> b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp
> index 8b9328b..6236659 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp
> @@ -280,7 +280,7 @@ void
>  CodeEmitterNVC0::setAddressByFile(const ValueRef& src)
>  {
>     switch (src.getFile()) {
> -   case FILE_MEMORY_GLOBAL:
> +   case FILE_MEMORY_BUFFER:
>        srcAddr32(src, 26, 0);
>        break;
>     case FILE_MEMORY_LOCAL:
> @@ -1768,7 +1768,7 @@ CodeEmitterNVC0::emitCachingMode(CacheMode c)
>  static inline bool
>  uses64bitAddress(const Instruction *ldst)
>  {
> -   return ldst->src(0).getFile() == FILE_MEMORY_GLOBAL &&
> +   return ldst->src(0).getFile() == FILE_MEMORY_BUFFER &&
>        ldst->src(0).isIndirect(0) &&
>        ldst->getIndirect(0, 0)->reg.size == 8;
>  }
> @@ -1779,7 +1779,7 @@ CodeEmitterNVC0::emitSTORE(const Instruction *i)
>     uint32_t opc;
>
>     switch (i->src(0).getFile()) {
> -   case FILE_MEMORY_GLOBAL: opc = 0x90000000; break;
> +   case FILE_MEMORY_BUFFER: opc = 0x90000000; break;
>     case FILE_MEMORY_LOCAL:  opc = 0xc8000000; break;
>     case FILE_MEMORY_SHARED:
>        if (i->subOp == NV50_IR_SUBOP_STORE_UNLOCKED) {
> @@ -1828,7 +1828,7 @@ CodeEmitterNVC0::emitLOAD(const Instruction *i)
>     code[0] = 0x00000005;
>
>     switch (i->src(0).getFile()) {
> -   case FILE_MEMORY_GLOBAL: opc = 0x80000000; break;
> +   case FILE_MEMORY_BUFFER: opc = 0x80000000; break;
>     case FILE_MEMORY_LOCAL:  opc = 0xc0000000; break;
>     case FILE_MEMORY_SHARED:
>        if (i->subOp == NV50_IR_SUBOP_LOAD_LOCKED) {
> @@ -2090,7 +2090,7 @@ CodeEmitterNVC0::emitCCTL(const Instruction *i)
>  {
>     code[0] = 0x00000005 | (i->subOp << 5);
>
> -   if (i->src(0).getFile() == FILE_MEMORY_GLOBAL) {
> +   if (i->src(0).getFile() == FILE_MEMORY_BUFFER) {
>        code[1] = 0x98000000;
>        srcAddr32(i->src(0), 28, 2);
>     } else {
> @@ -3121,7 +3121,7 @@ SchedDataCalculator::checkRd(const Value *v, int
> cycle, int& delay) const
>     case FILE_MEMORY_LOCAL:
>     case FILE_MEMORY_CONST:
>     case FILE_MEMORY_SHARED:
> -   case FILE_MEMORY_GLOBAL:
> +   case FILE_MEMORY_BUFFER:
>     case FILE_SYSTEM_VALUE:
>        // TODO: any restrictions here ?
>        break;
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> index 1e91ad3..91879e4 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> @@ -373,8 +373,8 @@ static nv50_ir::DataFile translateFile(uint file)
>     case TGSI_FILE_PREDICATE:       return nv50_ir::FILE_PREDICATE;
>     case TGSI_FILE_IMMEDIATE:       return nv50_ir::FILE_IMMEDIATE;
>     case TGSI_FILE_SYSTEM_VALUE:    return nv50_ir::FILE_SYSTEM_VALUE;
> -   case TGSI_FILE_BUFFER:          return nv50_ir::FILE_MEMORY_GLOBAL;
> -   case TGSI_FILE_MEMORY:          return nv50_ir::FILE_MEMORY_GLOBAL;
> +   case TGSI_FILE_BUFFER:          return nv50_ir::FILE_MEMORY_BUFFER;
> +   case TGSI_FILE_MEMORY:          return nv50_ir::FILE_MEMORY_BUFFER;
>     case TGSI_FILE_SAMPLER:
>     case TGSI_FILE_NULL:
>     default:
> @@ -2191,7 +2191,7 @@ Converter::getResourceBase(const int r)
>
>     switch (r) {
>     case TGSI_RESOURCE_GLOBAL:
> -      sym = new_Symbol(prog, nv50_ir::FILE_MEMORY_GLOBAL, 15);
> +      sym = new_Symbol(prog, nv50_ir::FILE_MEMORY_BUFFER, 15);
>        break;
>     case TGSI_RESOURCE_LOCAL:
>        assert(prog->getType() == Program::TYPE_COMPUTE);
> @@ -2209,7 +2209,7 @@ Converter::getResourceBase(const int r)
>        break;
>     default:
>        sym = new_Symbol(prog,
> -                       nv50_ir::FILE_MEMORY_GLOBAL, code->resources.at
> (r).slot);
> +                       nv50_ir::FILE_MEMORY_BUFFER, code->resources.at
> (r).slot);
>        break;
>     }
>     return sym;
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
> b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
> index d0936d8..563d7c2 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
> @@ -1141,7 +1141,7 @@ NVC0LoweringPass::handleATOM(Instruction *atom)
>        handleSharedATOM(atom);
>        return true;
>     default:
> -      assert(atom->src(0).getFile() == FILE_MEMORY_GLOBAL);
> +      assert(atom->src(0).getFile() == FILE_MEMORY_BUFFER);
>        base = loadResInfo64(ind, atom->getSrc(0)->reg.fileIndex * 16);
>        assert(base->reg.size == 8);
>        if (ptr)
> @@ -1154,7 +1154,7 @@ NVC0LoweringPass::handleATOM(Instruction *atom)
>        bld.mkOp1v(OP_RDSV, TYPE_U32, bld.getScratch(), bld.mkSysVal(sv,
> 0));
>
>     atom->setSrc(0, cloneShallow(func, atom->getSrc(0)));
> -   atom->getSrc(0)->reg.file = FILE_MEMORY_GLOBAL;
> +   atom->getSrc(0)->reg.file = FILE_MEMORY_BUFFER;
>     if (ptr)
>        base = bld.mkOp2v(OP_ADD, TYPE_U32, base, base, ptr);
>     atom->setIndirect(0, 1, NULL);
> @@ -1571,7 +1571,7 @@ NVC0LoweringPass::handleSurfaceOpNVE4(TexInstruction
> *su)
>        Instruction *red = bld.mkOp(OP_ATOM, su->dType, su->getDef(0));
>        red->subOp = su->subOp;
>        if (!gMemBase)
> -         gMemBase = bld.mkSymbol(FILE_MEMORY_GLOBAL, 0, TYPE_U32, 0);
> +         gMemBase = bld.mkSymbol(FILE_MEMORY_BUFFER, 0, TYPE_U32, 0);
>        red->setSrc(0, gMemBase);
>        red->setSrc(1, su->getSrc(3));
>        if (su->subOp == NV50_IR_SUBOP_ATOM_CAS)
> @@ -1963,7 +1963,7 @@ NVC0LoweringPass::visit(Instruction *i)
>        } else if (i->src(0).getFile() == FILE_SHADER_OUTPUT) {
>           assert(prog->getType() == Program::TYPE_TESSELLATION_CONTROL);
>           i->op = OP_VFETCH;
> -      } else if (i->src(0).getFile() == FILE_MEMORY_GLOBAL) {
> +      } else if (i->src(0).getFile() == FILE_MEMORY_BUFFER) {
>           Value *ind = i->getIndirect(0, 1);
>           Value *ptr = loadResInfo64(ind, i->getSrc(0)->reg.fileIndex *
> 16);
>           // XXX come up with a way not to do this for EVERY little access
> but
> @@ -1987,7 +1987,7 @@ NVC0LoweringPass::visit(Instruction *i)
>        break;
>     case OP_ATOM:
>     {
> -      const bool cctl = i->src(0).getFile() == FILE_MEMORY_GLOBAL;
> +      const bool cctl = i->src(0).getFile() == FILE_MEMORY_BUFFER;
>        handleATOM(i);
>        handleCasExch(i, cctl);
>     }
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
> b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
> index 66e7b2e..4a96d04 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
> @@ -2580,14 +2580,14 @@ MemoryOpt::runOpt(BasicBlock *bb)
>               ldst->op == OP_BAR ||
>               ldst->op == OP_MEMBAR) {
>              purgeRecords(NULL, FILE_MEMORY_LOCAL);
> -            purgeRecords(NULL, FILE_MEMORY_GLOBAL);
> +            purgeRecords(NULL, FILE_MEMORY_BUFFER);
>              purgeRecords(NULL, FILE_MEMORY_SHARED);
>              purgeRecords(NULL, FILE_SHADER_OUTPUT);
>           } else
>           if (ldst->op == OP_ATOM || ldst->op == OP_CCTL) {
> -            if (ldst->src(0).getFile() == FILE_MEMORY_GLOBAL) {
> +            if (ldst->src(0).getFile() == FILE_MEMORY_BUFFER) {
>                 purgeRecords(NULL, FILE_MEMORY_LOCAL);
> -               purgeRecords(NULL, FILE_MEMORY_GLOBAL);
> +               purgeRecords(NULL, FILE_MEMORY_BUFFER);
>                 purgeRecords(NULL, FILE_MEMORY_SHARED);
>              } else {
>                 purgeRecords(NULL, ldst->src(0).getFile());
> @@ -2607,7 +2607,7 @@ MemoryOpt::runOpt(BasicBlock *bb)
>           DataFile file = ldst->src(0).getFile();
>
>           // if ld l[]/g[] look for previous store to eliminate the reload
> -         if (file == FILE_MEMORY_GLOBAL || file == FILE_MEMORY_LOCAL) {
> +         if (file == FILE_MEMORY_BUFFER || file == FILE_MEMORY_LOCAL) {
>              // TODO: shared memory ?
>              rec = findRecord(ldst, false, isAdjacent);
>              if (rec && !isAdjacent)
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_print.cpp
> b/src/gallium/drivers/nouveau/codegen/nv50_ir_print.cpp
> index cfa85ec..73ed753 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_print.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_print.cpp
> @@ -455,7 +455,7 @@ int Symbol::print(char *buf, size_t size,
>     case FILE_MEMORY_CONST:  c = 'c'; break;
>     case FILE_SHADER_INPUT:  c = 'a'; break;
>     case FILE_SHADER_OUTPUT: c = 'o'; break;
> -   case FILE_MEMORY_GLOBAL: c = 'g'; break;
> +   case FILE_MEMORY_BUFFER: c = 'g'; break;
>     case FILE_MEMORY_SHARED: c = 's'; break;
>     case FILE_MEMORY_LOCAL:  c = 'l'; break;
>     default:
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
> b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
> index 2c4d7f5..1cd45a2 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
> @@ -207,7 +207,7 @@ TargetNV50::getFileSize(DataFile file) const
>     case FILE_MEMORY_CONST:  return 65536;
>     case FILE_SHADER_INPUT:  return 0x200;
>     case FILE_SHADER_OUTPUT: return 0x200;
> -   case FILE_MEMORY_GLOBAL: return 0xffffffff;
> +   case FILE_MEMORY_BUFFER: return 0xffffffff;
>     case FILE_MEMORY_SHARED: return 16 << 10;
>     case FILE_MEMORY_LOCAL:  return 48 << 10;
>     case FILE_SYSTEM_VALUE:  return 16;
> @@ -406,7 +406,7 @@ TargetNV50::isAccessSupported(DataFile file, DataType
> ty) const
>     if (ty == TYPE_B96 || ty == TYPE_NONE)
>        return false;
>     if (typeSizeof(ty) > 4)
> -      return (file == FILE_MEMORY_LOCAL) || (file == FILE_MEMORY_GLOBAL);
> +      return (file == FILE_MEMORY_LOCAL) || (file == FILE_MEMORY_BUFFER);
>     return true;
>  }
>
> @@ -508,7 +508,7 @@ int TargetNV50::getLatency(const Instruction *i) const
>     if (i->op == OP_LOAD) {
>        switch (i->src(0).getFile()) {
>        case FILE_MEMORY_LOCAL:
> -      case FILE_MEMORY_GLOBAL:
> +      case FILE_MEMORY_BUFFER:
>           return 100; // really 400 to 800
>        default:
>           return 22;
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp
> b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp
> index a03afa8..bda59a5 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp
> @@ -248,7 +248,7 @@ TargetNVC0::getFileSize(DataFile file) const
>     case FILE_MEMORY_CONST:  return 65536;
>     case FILE_SHADER_INPUT:  return 0x400;
>     case FILE_SHADER_OUTPUT: return 0x400;
> -   case FILE_MEMORY_GLOBAL: return 0xffffffff;
> +   case FILE_MEMORY_BUFFER: return 0xffffffff;
>     case FILE_MEMORY_SHARED: return 16 << 10;
>     case FILE_MEMORY_LOCAL:  return 48 << 10;
>     case FILE_SYSTEM_VALUE:  return 32;
> --
> 2.7.2
>
>

--047d7b3a9acaad3073052e2bb36c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">This approach leads to the emitters needing to know about bo=
th global and buffer, even though at that point, they are identical. I was =
thinking that in the lowering logic, buffer would just get rewritten as glo=
bal (with the offset added), thus not needing any change to the emitters. W=
hat do you think about such an approach?</p>
<div class=3D"gmail_quote">On Mar 16, 2016 2:24 AM, &quot;Hans de Goede&quo=
t; &lt;<a href=3D"mailto:hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org">hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org</a>&gt; w=
rote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">FILE_MEMORY_GL=
OBAL is currently only used for buffer handling, as we<br>
do not yet have (opencl) global memory support. Global memory support<br>
actually requires some different handling during lowering, so rename<br>
FILE_MEMORY_GLOBAL to FILE_MEMORY_BUFFER to reflect that the current<br>
code is for buffer handling, this will allow the later (re-)addition<br>
of FILE_MEMORY_GLOBAL for regular global memory.<br>
<br>
Signed-off-by: Hans de Goede &lt;<a href=3D"mailto:hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org">hde=
goede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
---<br>
=C2=A0src/gallium/drivers/nouveau/codegen/nv50_ir.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp=C2=A0 =C2=
=A0| 10 +++++-----<br>
=C2=A0src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gm107.cpp=C2=A0 =C2=
=A0|=C2=A0 6 +++---<br>
=C2=A0src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp=C2=A0 =C2=
=A0 | 10 +++++-----<br>
=C2=A0src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp=C2=A0 =C2=
=A0 | 12 ++++++------<br>
=C2=A0src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp=C2=A0 =C2=
=A0 |=C2=A0 8 ++++----<br>
=C2=A0.../drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 10 +++++-----<br>
=C2=A0src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp=C2=A0 =C2=A0=
 =C2=A0|=C2=A0 8 ++++----<br>
=C2=A0src/gallium/drivers/nouveau/codegen/nv50_ir_print.cpp=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp=C2=A0 |=
=C2=A0 6 +++---<br>
=C2=A0src/gallium/drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp=C2=A0 |=
=C2=A0 2 +-<br>
=C2=A011 files changed, 38 insertions(+), 38 deletions(-)<br>
<br>
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir.h b/src/gallium/dr=
ivers/nouveau/codegen/nv50_ir.h<br>
index 7b0eb2f..fdc2195 100644<br>
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir.h<br>
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir.h<br>
@@ -332,7 +332,7 @@ enum DataFile<br>
=C2=A0 =C2=A0 FILE_MEMORY_CONST,<br>
=C2=A0 =C2=A0 FILE_SHADER_INPUT,<br>
=C2=A0 =C2=A0 FILE_SHADER_OUTPUT,<br>
-=C2=A0 =C2=A0FILE_MEMORY_GLOBAL,<br>
+=C2=A0 =C2=A0FILE_MEMORY_BUFFER,<br>
=C2=A0 =C2=A0 FILE_MEMORY_SHARED,<br>
=C2=A0 =C2=A0 FILE_MEMORY_LOCAL,<br>
=C2=A0 =C2=A0 FILE_SYSTEM_VALUE,<br>
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp b/s=
rc/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp<br>
index 70f3c3f..02a1101 100644<br>
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp<br>
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp<br>
@@ -1641,7 +1641,7 @@ CodeEmitterGK110::emitSTORE(const Instruction *i)<br>
=C2=A0 =C2=A0 int32_t offset =3D SDATA(i-&gt;src(0)).offset;<br>
<br>
=C2=A0 =C2=A0 switch (i-&gt;src(0).getFile()) {<br>
-=C2=A0 =C2=A0case FILE_MEMORY_GLOBAL: code[1] =3D 0xe0000000; code[0] =3D =
0x00000000; break;<br>
+=C2=A0 =C2=A0case FILE_MEMORY_BUFFER: code[1] =3D 0xe0000000; code[0] =3D =
0x00000000; break;<br>
=C2=A0 =C2=A0 case FILE_MEMORY_LOCAL:=C2=A0 code[1] =3D 0x7a800000; code[0]=
 =3D 0x00000002; break;<br>
=C2=A0 =C2=A0 case FILE_MEMORY_SHARED:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0code[0] =3D 0x00000002;<br>
@@ -1678,7 +1678,7 @@ CodeEmitterGK110::emitSTORE(const Instruction *i)<br>
<br>
=C2=A0 =C2=A0 srcId(i-&gt;src(1), 2);<br>
=C2=A0 =C2=A0 srcId(i-&gt;src(0).getIndirect(0), 10);<br>
-=C2=A0 =C2=A0if (i-&gt;src(0).getFile() =3D=3D FILE_MEMORY_GLOBAL &amp;&am=
p;<br>
+=C2=A0 =C2=A0if (i-&gt;src(0).getFile() =3D=3D FILE_MEMORY_BUFFER &amp;&am=
p;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 i-&gt;src(0).isIndirect(0) &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 i-&gt;getIndirect(0, 0)-&gt;reg.size =3D=3D 8)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0code[1] |=3D 1 &lt;&lt; 23;<br>
@@ -1690,7 +1690,7 @@ CodeEmitterGK110::emitLOAD(const Instruction *i)<br>
=C2=A0 =C2=A0 int32_t offset =3D SDATA(i-&gt;src(0)).offset;<br>
<br>
=C2=A0 =C2=A0 switch (i-&gt;src(0).getFile()) {<br>
-=C2=A0 =C2=A0case FILE_MEMORY_GLOBAL: code[1] =3D 0xc0000000; code[0] =3D =
0x00000000; break;<br>
+=C2=A0 =C2=A0case FILE_MEMORY_BUFFER: code[1] =3D 0xc0000000; code[0] =3D =
0x00000000; break;<br>
=C2=A0 =C2=A0 case FILE_MEMORY_LOCAL:=C2=A0 code[1] =3D 0x7a000000; code[0]=
 =3D 0x00000002; break;<br>
=C2=A0 =C2=A0 case FILE_MEMORY_SHARED:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0code[0] =3D 0x00000002;<br>
@@ -1800,7 +1800,7 @@ CodeEmitterGK110::emitMOV(const Instruction *i)<br>
=C2=A0static inline bool<br>
=C2=A0uses64bitAddress(const Instruction *ldst)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0return ldst-&gt;src(0).getFile() =3D=3D FILE_MEMORY_GLOBAL &a=
mp;&amp;<br>
+=C2=A0 =C2=A0return ldst-&gt;src(0).getFile() =3D=3D FILE_MEMORY_BUFFER &a=
mp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0ldst-&gt;src(0).isIndirect(0) &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0ldst-&gt;getIndirect(0, 0)-&gt;reg.size =3D=3D 8=
;<br>
=C2=A0}<br>
@@ -1862,7 +1862,7 @@ CodeEmitterGK110::emitCCTL(const Instruction *i)<br>
<br>
=C2=A0 =C2=A0 code[0] =3D 0x00000002 | (i-&gt;subOp &lt;&lt; 2);<br>
<br>
-=C2=A0 =C2=A0if (i-&gt;src(0).getFile() =3D=3D FILE_MEMORY_GLOBAL) {<br>
+=C2=A0 =C2=A0if (i-&gt;src(0).getFile() =3D=3D FILE_MEMORY_BUFFER) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0code[1] =3D 0x7b000000;<br>
=C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0code[1] =3D 0x7c000000;<br>
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gm107.cpp b/s=
rc/gallium/drivers/nouveau/codegen/nv50_ir_emit_gm107.cpp<br>
index e079a57..27f287f 100644<br>
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gm107.cpp<br>
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gm107.cpp<br>
@@ -2417,7 +2417,7 @@ void<br>
=C2=A0CodeEmitterGM107::emitCCTL()<br>
=C2=A0{<br>
=C2=A0 =C2=A0 unsigned width;<br>
-=C2=A0 =C2=A0if (insn-&gt;src(0).getFile() =3D=3D FILE_MEMORY_GLOBAL) {<br=
>
+=C2=A0 =C2=A0if (insn-&gt;src(0).getFile() =3D=3D FILE_MEMORY_BUFFER) {<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0emitInsn(0xef600000);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0width =3D 30;<br>
=C2=A0 =C2=A0 } else {<br>
@@ -2988,7 +2988,7 @@ CodeEmitterGM107::emitInstruction(Instruction *i)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0case FILE_MEMORY_CONST : emitLDC(); break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0case FILE_MEMORY_LOCAL : emitLDL(); break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0case FILE_MEMORY_SHARED: emitLDS(); break;<br>
-=C2=A0 =C2=A0 =C2=A0 case FILE_MEMORY_GLOBAL: emitLD(); break;<br>
+=C2=A0 =C2=A0 =C2=A0 case FILE_MEMORY_BUFFER: emitLD(); break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(!&quot;invalid load&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 emitNOP();<br>
@@ -2999,7 +2999,7 @@ CodeEmitterGM107::emitInstruction(Instruction *i)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (insn-&gt;src(0).getFile()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0case FILE_MEMORY_LOCAL : emitSTL(); break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0case FILE_MEMORY_SHARED: emitSTS(); break;<br>
-=C2=A0 =C2=A0 =C2=A0 case FILE_MEMORY_GLOBAL: emitST(); break;<br>
+=C2=A0 =C2=A0 =C2=A0 case FILE_MEMORY_BUFFER: emitST(); break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(!&quot;invalid load&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 emitNOP();<br>
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp b/sr=
c/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp<br>
index 682a19d..7476e21 100644<br>
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp<br>
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nv50.cpp<br>
@@ -662,7 +662,7 @@ CodeEmitterNV50::emitLOAD(const Instruction *i)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0code[0] =3D 0xd0000001;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0code[1] =3D 0x40000000;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0case FILE_MEMORY_GLOBAL:<br>
+=C2=A0 =C2=A0case FILE_MEMORY_BUFFER:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0code[0] =3D 0xd0000001 | (i-&gt;getSrc(0)-&gt;re=
g.fileIndex &lt;&lt; 16);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0code[1] =3D 0x80000000;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
@@ -671,7 +671,7 @@ CodeEmitterNV50::emitLOAD(const Instruction *i)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 if (sf =3D=3D FILE_MEMORY_LOCAL ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sf =3D=3D FILE_MEMORY_GLOBAL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sf =3D=3D FILE_MEMORY_BUFFER)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0emitLoadStoreSizeLG(i-&gt;sType, 21 + 32);<br>
<br>
=C2=A0 =C2=A0 setDst(i, 0);<br>
@@ -679,7 +679,7 @@ CodeEmitterNV50::emitLOAD(const Instruction *i)<br>
=C2=A0 =C2=A0 emitFlagsRd(i);<br>
=C2=A0 =C2=A0 emitFlagsWr(i);<br>
<br>
-=C2=A0 =C2=A0if (i-&gt;src(0).getFile() =3D=3D FILE_MEMORY_GLOBAL) {<br>
+=C2=A0 =C2=A0if (i-&gt;src(0).getFile() =3D=3D FILE_MEMORY_BUFFER) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0srcId(*i-&gt;src(0).getIndirect(0), 9);<br>
=C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0setAReg16(i, 0);<br>
@@ -699,7 +699,7 @@ CodeEmitterNV50::emitSTORE(const Instruction *i)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0code[1] =3D 0x80c00000;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0srcId(i-&gt;src(1), 32 + 14);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0case FILE_MEMORY_GLOBAL:<br>
+=C2=A0 =C2=A0case FILE_MEMORY_BUFFER:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0code[0] =3D 0xd0000001 | (i-&gt;getSrc(0)-&gt;re=
g.fileIndex &lt;&lt; 16);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0code[1] =3D 0xa0000000;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0emitLoadStoreSizeLG(i-&gt;dType, 21 + 32);<br>
@@ -737,7 +737,7 @@ CodeEmitterNV50::emitSTORE(const Instruction *i)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0if (f =3D=3D FILE_MEMORY_GLOBAL)<br>
+=C2=A0 =C2=A0if (f =3D=3D FILE_MEMORY_BUFFER)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0srcId(*i-&gt;src(0).getIndirect(0), 9);<br>
=C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0setAReg16(i, 0);<br>
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp b/sr=
c/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp<br>
index 8b9328b..6236659 100644<br>
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp<br>
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp<br>
@@ -280,7 +280,7 @@ void<br>
=C2=A0CodeEmitterNVC0::setAddressByFile(const ValueRef&amp; src)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 switch (src.getFile()) {<br>
-=C2=A0 =C2=A0case FILE_MEMORY_GLOBAL:<br>
+=C2=A0 =C2=A0case FILE_MEMORY_BUFFER:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0srcAddr32(src, 26, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 case FILE_MEMORY_LOCAL:<br>
@@ -1768,7 +1768,7 @@ CodeEmitterNVC0::emitCachingMode(CacheMode c)<br>
=C2=A0static inline bool<br>
=C2=A0uses64bitAddress(const Instruction *ldst)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0return ldst-&gt;src(0).getFile() =3D=3D FILE_MEMORY_GLOBAL &a=
mp;&amp;<br>
+=C2=A0 =C2=A0return ldst-&gt;src(0).getFile() =3D=3D FILE_MEMORY_BUFFER &a=
mp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0ldst-&gt;src(0).isIndirect(0) &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0ldst-&gt;getIndirect(0, 0)-&gt;reg.size =3D=3D 8=
;<br>
=C2=A0}<br>
@@ -1779,7 +1779,7 @@ CodeEmitterNVC0::emitSTORE(const Instruction *i)<br>
=C2=A0 =C2=A0 uint32_t opc;<br>
<br>
=C2=A0 =C2=A0 switch (i-&gt;src(0).getFile()) {<br>
-=C2=A0 =C2=A0case FILE_MEMORY_GLOBAL: opc =3D 0x90000000; break;<br>
+=C2=A0 =C2=A0case FILE_MEMORY_BUFFER: opc =3D 0x90000000; break;<br>
=C2=A0 =C2=A0 case FILE_MEMORY_LOCAL:=C2=A0 opc =3D 0xc8000000; break;<br>
=C2=A0 =C2=A0 case FILE_MEMORY_SHARED:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0if (i-&gt;subOp =3D=3D NV50_IR_SUBOP_STORE_UNLOC=
KED) {<br>
@@ -1828,7 +1828,7 @@ CodeEmitterNVC0::emitLOAD(const Instruction *i)<br>
=C2=A0 =C2=A0 code[0] =3D 0x00000005;<br>
<br>
=C2=A0 =C2=A0 switch (i-&gt;src(0).getFile()) {<br>
-=C2=A0 =C2=A0case FILE_MEMORY_GLOBAL: opc =3D 0x80000000; break;<br>
+=C2=A0 =C2=A0case FILE_MEMORY_BUFFER: opc =3D 0x80000000; break;<br>
=C2=A0 =C2=A0 case FILE_MEMORY_LOCAL:=C2=A0 opc =3D 0xc0000000; break;<br>
=C2=A0 =C2=A0 case FILE_MEMORY_SHARED:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0if (i-&gt;subOp =3D=3D NV50_IR_SUBOP_LOAD_LOCKED=
) {<br>
@@ -2090,7 +2090,7 @@ CodeEmitterNVC0::emitCCTL(const Instruction *i)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 code[0] =3D 0x00000005 | (i-&gt;subOp &lt;&lt; 5);<br>
<br>
-=C2=A0 =C2=A0if (i-&gt;src(0).getFile() =3D=3D FILE_MEMORY_GLOBAL) {<br>
+=C2=A0 =C2=A0if (i-&gt;src(0).getFile() =3D=3D FILE_MEMORY_BUFFER) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0code[1] =3D 0x98000000;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0srcAddr32(i-&gt;src(0), 28, 2);<br>
=C2=A0 =C2=A0 } else {<br>
@@ -3121,7 +3121,7 @@ SchedDataCalculator::checkRd(const Value *v, int cycl=
e, int&amp; delay) const<br>
=C2=A0 =C2=A0 case FILE_MEMORY_LOCAL:<br>
=C2=A0 =C2=A0 case FILE_MEMORY_CONST:<br>
=C2=A0 =C2=A0 case FILE_MEMORY_SHARED:<br>
-=C2=A0 =C2=A0case FILE_MEMORY_GLOBAL:<br>
+=C2=A0 =C2=A0case FILE_MEMORY_BUFFER:<br>
=C2=A0 =C2=A0 case FILE_SYSTEM_VALUE:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0// TODO: any restrictions here ?<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp b/sr=
c/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp<br>
index 1e91ad3..91879e4 100644<br>
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp<br>
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp<br>
@@ -373,8 +373,8 @@ static nv50_ir::DataFile translateFile(uint file)<br>
=C2=A0 =C2=A0 case TGSI_FILE_PREDICATE:=C2=A0 =C2=A0 =C2=A0 =C2=A0return nv=
50_ir::FILE_PREDICATE;<br>
=C2=A0 =C2=A0 case TGSI_FILE_IMMEDIATE:=C2=A0 =C2=A0 =C2=A0 =C2=A0return nv=
50_ir::FILE_IMMEDIATE;<br>
=C2=A0 =C2=A0 case TGSI_FILE_SYSTEM_VALUE:=C2=A0 =C2=A0 return nv50_ir::FIL=
E_SYSTEM_VALUE;<br>
-=C2=A0 =C2=A0case TGSI_FILE_BUFFER:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn nv50_ir::FILE_MEMORY_GLOBAL;<br>
-=C2=A0 =C2=A0case TGSI_FILE_MEMORY:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn nv50_ir::FILE_MEMORY_GLOBAL;<br>
+=C2=A0 =C2=A0case TGSI_FILE_BUFFER:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn nv50_ir::FILE_MEMORY_BUFFER;<br>
+=C2=A0 =C2=A0case TGSI_FILE_MEMORY:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn nv50_ir::FILE_MEMORY_BUFFER;<br>
=C2=A0 =C2=A0 case TGSI_FILE_SAMPLER:<br>
=C2=A0 =C2=A0 case TGSI_FILE_NULL:<br>
=C2=A0 =C2=A0 default:<br>
@@ -2191,7 +2191,7 @@ Converter::getResourceBase(const int r)<br>
<br>
=C2=A0 =C2=A0 switch (r) {<br>
=C2=A0 =C2=A0 case TGSI_RESOURCE_GLOBAL:<br>
-=C2=A0 =C2=A0 =C2=A0 sym =3D new_Symbol(prog, nv50_ir::FILE_MEMORY_GLOBAL,=
 15);<br>
+=C2=A0 =C2=A0 =C2=A0 sym =3D new_Symbol(prog, nv50_ir::FILE_MEMORY_BUFFER,=
 15);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 case TGSI_RESOURCE_LOCAL:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0assert(prog-&gt;getType() =3D=3D Program::TYPE_C=
OMPUTE);<br>
@@ -2209,7 +2209,7 @@ Converter::getResourceBase(const int r)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0sym =3D new_Symbol(prog,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0nv50_ir::FILE_MEMORY_GLOBAL, code-&gt;<a href=3D"http://resources=
.at" rel=3D"noreferrer" target=3D"_blank">resources.at</a>(r).slot);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0nv50_ir::FILE_MEMORY_BUFFER, code-&gt;<a href=3D"http://resources=
.at" rel=3D"noreferrer" target=3D"_blank">resources.at</a>(r).slot);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 return sym;<br>
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp =
b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp<br>
index d0936d8..563d7c2 100644<br>
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp<br>
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp<br>
@@ -1141,7 +1141,7 @@ NVC0LoweringPass::handleATOM(Instruction *atom)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0handleSharedATOM(atom);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0 =C2=A0 default:<br>
-=C2=A0 =C2=A0 =C2=A0 assert(atom-&gt;src(0).getFile() =3D=3D FILE_MEMORY_G=
LOBAL);<br>
+=C2=A0 =C2=A0 =C2=A0 assert(atom-&gt;src(0).getFile() =3D=3D FILE_MEMORY_B=
UFFER);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0base =3D loadResInfo64(ind, atom-&gt;getSrc(0)-&=
gt;reg.fileIndex * 16);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0assert(base-&gt;reg.size =3D=3D 8);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptr)<br>
@@ -1154,7 +1154,7 @@ NVC0LoweringPass::handleATOM(Instruction *atom)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0bld.mkOp1v(OP_RDSV, TYPE_U32, bld.getScratch(), =
bld.mkSysVal(sv, 0));<br>
<br>
=C2=A0 =C2=A0 atom-&gt;setSrc(0, cloneShallow(func, atom-&gt;getSrc(0)));<b=
r>
-=C2=A0 =C2=A0atom-&gt;getSrc(0)-&gt;reg.file =3D FILE_MEMORY_GLOBAL;<br>
+=C2=A0 =C2=A0atom-&gt;getSrc(0)-&gt;reg.file =3D FILE_MEMORY_BUFFER;<br>
=C2=A0 =C2=A0 if (ptr)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0base =3D bld.mkOp2v(OP_ADD, TYPE_U32, base, base=
, ptr);<br>
=C2=A0 =C2=A0 atom-&gt;setIndirect(0, 1, NULL);<br>
@@ -1571,7 +1571,7 @@ NVC0LoweringPass::handleSurfaceOpNVE4(TexInstruction =
*su)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Instruction *red =3D bld.mkOp(OP_ATOM, su-&gt;dT=
ype, su-&gt;getDef(0));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0red-&gt;subOp =3D su-&gt;subOp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gMemBase)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gMemBase =3D bld.mkSymbol(FILE_MEMORY_GL=
OBAL, 0, TYPE_U32, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gMemBase =3D bld.mkSymbol(FILE_MEMORY_BU=
FFER, 0, TYPE_U32, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0red-&gt;setSrc(0, gMemBase);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0red-&gt;setSrc(1, su-&gt;getSrc(3));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0if (su-&gt;subOp =3D=3D NV50_IR_SUBOP_ATOM_CAS)<=
br>
@@ -1963,7 +1963,7 @@ NVC0LoweringPass::visit(Instruction *i)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (i-&gt;src(0).getFile() =3D=3D FILE_SH=
ADER_OUTPUT) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(prog-&gt;getType() =3D=3D Program=
::TYPE_TESSELLATION_CONTROL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i-&gt;op =3D OP_VFETCH;<br>
-=C2=A0 =C2=A0 =C2=A0 } else if (i-&gt;src(0).getFile() =3D=3D FILE_MEMORY_=
GLOBAL) {<br>
+=C2=A0 =C2=A0 =C2=A0 } else if (i-&gt;src(0).getFile() =3D=3D FILE_MEMORY_=
BUFFER) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Value *ind =3D i-&gt;getIndirect(0, 1);<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Value *ptr =3D loadResInfo64(ind, i-&gt;=
getSrc(0)-&gt;reg.fileIndex * 16);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // XXX come up with a way not to do this=
 for EVERY little access but<br>
@@ -1987,7 +1987,7 @@ NVC0LoweringPass::visit(Instruction *i)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 case OP_ATOM:<br>
=C2=A0 =C2=A0 {<br>
-=C2=A0 =C2=A0 =C2=A0 const bool cctl =3D i-&gt;src(0).getFile() =3D=3D FIL=
E_MEMORY_GLOBAL;<br>
+=C2=A0 =C2=A0 =C2=A0 const bool cctl =3D i-&gt;src(0).getFile() =3D=3D FIL=
E_MEMORY_BUFFER;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0handleATOM(i);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0handleCasExch(i, cctl);<br>
=C2=A0 =C2=A0 }<br>
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp b/src=
/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp<br>
index 66e7b2e..4a96d04 100644<br>
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp<br>
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp<br>
@@ -2580,14 +2580,14 @@ MemoryOpt::runOpt(BasicBlock *bb)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ldst-&gt;op =3D=3D OP_BAR =
||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ldst-&gt;op =3D=3D OP_MEMB=
AR) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0purgeRecords(NULL, FILE_MEM=
ORY_LOCAL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 purgeRecords(NULL, FILE_MEMORY_G=
LOBAL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 purgeRecords(NULL, FILE_MEMORY_B=
UFFER);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0purgeRecords(NULL, FILE_MEM=
ORY_SHARED);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0purgeRecords(NULL, FILE_SHA=
DER_OUTPUT);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ldst-&gt;op =3D=3D OP_ATOM || ldst-&=
gt;op =3D=3D OP_CCTL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ldst-&gt;src(0).getFile() =
=3D=3D FILE_MEMORY_GLOBAL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ldst-&gt;src(0).getFile() =
=3D=3D FILE_MEMORY_BUFFER) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 purgeRecords(NULL, =
FILE_MEMORY_LOCAL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0purgeRecords(NULL, =
FILE_MEMORY_GLOBAL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0purgeRecords(NULL, =
FILE_MEMORY_BUFFER);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 purgeRecords(NULL, =
FILE_MEMORY_SHARED);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 purgeRecords(NULL, =
ldst-&gt;src(0).getFile());<br>
@@ -2607,7 +2607,7 @@ MemoryOpt::runOpt(BasicBlock *bb)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DataFile file =3D ldst-&gt;src(0).getFil=
e();<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // if ld l[]/g[] look for previous store=
 to eliminate the reload<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (file =3D=3D FILE_MEMORY_GLOBAL || fi=
le =3D=3D FILE_MEMORY_LOCAL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (file =3D=3D FILE_MEMORY_BUFFER || fi=
le =3D=3D FILE_MEMORY_LOCAL) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// TODO: shared memory ?<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rec =3D findRecord(ldst, fa=
lse, isAdjacent);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rec &amp;&amp; !isAdjac=
ent)<br>
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_print.cpp b/src/ga=
llium/drivers/nouveau/codegen/nv50_ir_print.cpp<br>
index cfa85ec..73ed753 100644<br>
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_print.cpp<br>
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_print.cpp<br>
@@ -455,7 +455,7 @@ int Symbol::print(char *buf, size_t size,<br>
=C2=A0 =C2=A0 case FILE_MEMORY_CONST:=C2=A0 c =3D &#39;c&#39;; break;<br>
=C2=A0 =C2=A0 case FILE_SHADER_INPUT:=C2=A0 c =3D &#39;a&#39;; break;<br>
=C2=A0 =C2=A0 case FILE_SHADER_OUTPUT: c =3D &#39;o&#39;; break;<br>
-=C2=A0 =C2=A0case FILE_MEMORY_GLOBAL: c =3D &#39;g&#39;; break;<br>
+=C2=A0 =C2=A0case FILE_MEMORY_BUFFER: c =3D &#39;g&#39;; break;<br>
=C2=A0 =C2=A0 case FILE_MEMORY_SHARED: c =3D &#39;s&#39;; break;<br>
=C2=A0 =C2=A0 case FILE_MEMORY_LOCAL:=C2=A0 c =3D &#39;l&#39;; break;<br>
=C2=A0 =C2=A0 default:<br>
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp b/=
src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp<br>
index 2c4d7f5..1cd45a2 100644<br>
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp<br>
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp<br>
@@ -207,7 +207,7 @@ TargetNV50::getFileSize(DataFile file) const<br>
=C2=A0 =C2=A0 case FILE_MEMORY_CONST:=C2=A0 return 65536;<br>
=C2=A0 =C2=A0 case FILE_SHADER_INPUT:=C2=A0 return 0x200;<br>
=C2=A0 =C2=A0 case FILE_SHADER_OUTPUT: return 0x200;<br>
-=C2=A0 =C2=A0case FILE_MEMORY_GLOBAL: return 0xffffffff;<br>
+=C2=A0 =C2=A0case FILE_MEMORY_BUFFER: return 0xffffffff;<br>
=C2=A0 =C2=A0 case FILE_MEMORY_SHARED: return 16 &lt;&lt; 10;<br>
=C2=A0 =C2=A0 case FILE_MEMORY_LOCAL:=C2=A0 return 48 &lt;&lt; 10;<br>
=C2=A0 =C2=A0 case FILE_SYSTEM_VALUE:=C2=A0 return 16;<br>
@@ -406,7 +406,7 @@ TargetNV50::isAccessSupported(DataFile file, DataType t=
y) const<br>
=C2=A0 =C2=A0 if (ty =3D=3D TYPE_B96 || ty =3D=3D TYPE_NONE)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 if (typeSizeof(ty) &gt; 4)<br>
-=C2=A0 =C2=A0 =C2=A0 return (file =3D=3D FILE_MEMORY_LOCAL) || (file =3D=
=3D FILE_MEMORY_GLOBAL);<br>
+=C2=A0 =C2=A0 =C2=A0 return (file =3D=3D FILE_MEMORY_LOCAL) || (file =3D=
=3D FILE_MEMORY_BUFFER);<br>
=C2=A0 =C2=A0 return true;<br>
=C2=A0}<br>
<br>
@@ -508,7 +508,7 @@ int TargetNV50::getLatency(const Instruction *i) const<=
br>
=C2=A0 =C2=A0 if (i-&gt;op =3D=3D OP_LOAD) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (i-&gt;src(0).getFile()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0case FILE_MEMORY_LOCAL:<br>
-=C2=A0 =C2=A0 =C2=A0 case FILE_MEMORY_GLOBAL:<br>
+=C2=A0 =C2=A0 =C2=A0 case FILE_MEMORY_BUFFER:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 100; // really 400 to 800<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 22;<br>
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp b/=
src/gallium/drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp<br>
index a03afa8..bda59a5 100644<br>
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp<br>
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp<br>
@@ -248,7 +248,7 @@ TargetNVC0::getFileSize(DataFile file) const<br>
=C2=A0 =C2=A0 case FILE_MEMORY_CONST:=C2=A0 return 65536;<br>
=C2=A0 =C2=A0 case FILE_SHADER_INPUT:=C2=A0 return 0x400;<br>
=C2=A0 =C2=A0 case FILE_SHADER_OUTPUT: return 0x400;<br>
-=C2=A0 =C2=A0case FILE_MEMORY_GLOBAL: return 0xffffffff;<br>
+=C2=A0 =C2=A0case FILE_MEMORY_BUFFER: return 0xffffffff;<br>
=C2=A0 =C2=A0 case FILE_MEMORY_SHARED: return 16 &lt;&lt; 10;<br>
=C2=A0 =C2=A0 case FILE_MEMORY_LOCAL:=C2=A0 return 48 &lt;&lt; 10;<br>
=C2=A0 =C2=A0 case FILE_SYSTEM_VALUE:=C2=A0 return 32;<br>
--<br>
2.7.2<br>
<br>
</blockquote></div>

--047d7b3a9acaad3073052e2bb36c--

--===============2024428482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2024428482==--
