From: Kamil Kaminski <kamilkss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nv50: shader generation patches
Date: Sat, 16 May 2009 07:12:59 +0000
Message-ID: <aa85b9420905160012v4d05bfc4t90280ca1cf42fe67@mail.gmail.com>
References: <4A01664B.3080500@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1463278385=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4A01664B.3080500-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1463278385==
Content-Type: multipart/alternative; boundary=0021cc0223827fdb63046a024a0e

--0021cc0223827fdb63046a024a0e
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Chris,
Did this (and other patches that you wrote) get merged yet? Did you create
an account? I'm interested in your work and would like to test it.

On Wed, May 6, 2009 at 10:28 AM, Christoph Bumiller <
e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org> wrote:

> Hi ! I've been trying to improve NV50 shader generation a bit the last
> couple of weeks, so here is
> what I've produced. I don't know if it's usable for you or just a pile of
> horrible hacks, but at
> least it makes some mesa demos render more correcly, p.e. the teapot (aside
> from mip-mapping issues
> of the floor texture), arbfplight, and I think the gears also didn't appear
> as they should before,
> and I hope it doesn't break others that worked.
> I also tried playing neverball and neverputt, which at some point worked
> fine, but now it locks up
> the GPU again after a certain (short) amount of time. That's probably not
> related to my
> modifications, because it crashes without the patches as well (plus has
> some flickering and other
> graphics errors). It seems to work OK if I run it with valgrind, though.
> There also are and have been some random graphics errors that spam the
> kernel log with invalid
> method NV50TCL_VERTEX_END, so if something doesn't look right, try to
> restart the program, or toggle
> some options in the mesa demos (show help, etc.).
>
> There might, as always, be some bugs in the patches, of course, and the
> they probably can't be
> committed unmodified. I've not put them in the email text but as
> attachments because there's rather
> many changes. There's a short description (commit log) in each patch, but I
> hope the code speaks for
> itself, otherwise I'll provide more explanation / add more comments ...
> later.
> These don't represent everything I've tried to improve, but the rest isn't
> in any usable shape yet.
>
> If anyone who knows their way around the gallium code has time, please have
> a look and tell me what
> you think. Thank you.
>
> Christoph
>
> commit 7ab9fc73707be46375668e557b5a5c1a373096ad
> Author: chr <chr@LAPTOP.(none)>
> Date:   Sun May 3 21:03:35 2009 +0200
>
>    Remove some memory leaks: free allocated temp in all opcode cases
>    of tx_insn; free nv50_regs for immds in LIT and those allocated in
>    tgsi_src.
>    Make LRP use 2 instructions (SUB,MAD) instead of 3 (NEG,MAD,MAD).
>
> diff --git a/src/gallium/drivers/nv50/nv50_program.c
> b/src/gallium/drivers/nv50/nv50_program.c
> index 2d15868..1a94327 100644
> --- a/src/gallium/drivers/nv50/nv50_program.c
> +++ b/src/gallium/drivers/nv50/nv50_program.c
> @@ -28,6 +28,7 @@
>  #include "pipe/p_shader_tokens.h"
>  #include "tgsi/tgsi_parse.h"
>  #include "tgsi/tgsi_util.h"
> +#include "tgsi/tgsi_dump.h"
>
>  #include "nv50_context.h"
>
> @@ -795,12 +796,6 @@ emit_lit(struct nv50_pc *pc, struct nv50_reg **dst,
> unsigned mask,
>        struct nv50_reg *pos128 = alloc_immd(pc,  127.999999);
>        struct nv50_reg *tmp[4];
>
> -       if (mask & (1 << 0))
> -               emit_mov(pc, dst[0], one);
> -
> -       if (mask & (1 << 3))
> -               emit_mov(pc, dst[3], one);
> -
>        if (mask & (3 << 1)) {
>                if (mask & (1 << 1))
>                        tmp[0] = dst[1];
> @@ -823,6 +818,18 @@ emit_lit(struct nv50_pc *pc, struct nv50_reg **dst,
> unsigned mask,
>                emit_mov(pc, dst[2], zero);
>                set_pred(pc, 3, 0, pc->p->exec_tail);
>        }
> +
> +       /* do this last, in case src[i,j] == dst[0,3] */
> +       if (mask & (1 << 0))
> +               emit_mov(pc, dst[0], one);
> +
> +       if (mask & (1 << 3))
> +               emit_mov(pc, dst[3], one);
> +
> +       FREE(pos128);
> +       FREE(neg128);
> +       FREE(zero);
> +       FREE(one);
>  }
>
>  static void
> @@ -885,8 +892,9 @@ tgsi_src(struct nv50_pc *pc, int chan, const struct
> tgsi_full_src_register *src)
>  {
>        struct nv50_reg *r = NULL;
>        struct nv50_reg *temp;
> -       unsigned c;
> +       unsigned sgn, c;
>
> +       sgn = tgsi_util_get_full_src_register_sign_mode(src, chan);
>        c = tgsi_util_get_full_src_register_extswizzle(src, chan);
>        switch (c) {
>        case TGSI_EXTSWIZZLE_X:
> @@ -915,16 +923,18 @@ tgsi_src(struct nv50_pc *pc, int chan, const struct
> tgsi_full_src_register *src)
>                break;
>        case TGSI_EXTSWIZZLE_ZERO:
>                r = alloc_immd(pc, 0.0);
> -               break;
> +               return r;
>        case TGSI_EXTSWIZZLE_ONE:
> -               r = alloc_immd(pc, 1.0);
> -               break;
> +               if (sgn == TGSI_UTIL_SIGN_TOGGLE || sgn ==
> TGSI_UTIL_SIGN_SET)
> +                       return alloc_immd(pc, -1.0);
> +               else
> +                       return alloc_immd(pc, 1.0);
>        default:
>                assert(0);
>                break;
>        }
>
> -       switch (tgsi_util_get_full_src_register_sign_mode(src, chan)) {
> +       switch (sgn) {
>        case TGSI_UTIL_SIGN_KEEP:
>                break;
>        case TGSI_UTIL_SIGN_CLEAR:
> @@ -955,7 +965,7 @@ static boolean
>  nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
>  {
>        const struct tgsi_full_instruction *inst = &tok->FullInstruction;
> -       struct nv50_reg *rdst[4], *dst[4], *src[3][4], *temp;
> +       struct nv50_reg *rdst[4], *dst[4], *src[3][4], *temp = NULL;
>        unsigned mask, sat, unit;
>        int i, c;
>
> @@ -1021,7 +1031,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union
> tgsi_full_token *tok)
>                                continue;
>                        emit_mov(pc, dst[c], temp);
>                }
> -               free_temp(pc, temp);
>                break;
>        case TGSI_OPCODE_DP4:
>                temp = alloc_temp(pc, NULL);
> @@ -1034,7 +1043,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union
> tgsi_full_token *tok)
>                                continue;
>                        emit_mov(pc, dst[c], temp);
>                }
> -               free_temp(pc, temp);
>                break;
>        case TGSI_OPCODE_DPH:
>                temp = alloc_temp(pc, NULL);
> @@ -1047,7 +1055,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union
> tgsi_full_token *tok)
>                                continue;
>                        emit_mov(pc, dst[c], temp);
>                }
> -               free_temp(pc, temp);
>                break;
>        case TGSI_OPCODE_DST:
>        {
> @@ -1072,7 +1079,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union
> tgsi_full_token *tok)
>                                continue;
>                        emit_mov(pc, dst[c], temp);
>                }
> -               free_temp(pc, temp);
>                break;
>        case TGSI_OPCODE_FLR:
>                for (c = 0; c < 4; c++) {
> @@ -1089,7 +1095,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union
> tgsi_full_token *tok)
>                        emit_flr(pc, temp, src[0][c]);
>                        emit_sub(pc, dst[c], src[0][c], temp);
>                }
> -               free_temp(pc, temp);
>                break;
>        case TGSI_OPCODE_KIL:
>                emit_kil(pc, src[0][0]);
> @@ -1110,15 +1115,12 @@ nv50_program_tx_insn(struct nv50_pc *pc, const
> union tgsi_full_token *tok)
>                }
>                break;
>        case TGSI_OPCODE_LRP:
> +               temp = alloc_temp(pc, NULL);
>                for (c = 0; c < 4; c++) {
>                        if (!(mask & (1 << c)))
>                                continue;
> -                       /*XXX: we can do better than this */
> -                       temp = alloc_temp(pc, NULL);
> -                       emit_neg(pc, temp, src[0][c]);
> -                       emit_mad(pc, temp, temp, src[2][c], src[2][c]);
> -                       emit_mad(pc, dst[c], src[0][c], src[1][c], temp);
> -                       free_temp(pc, temp);
> +                       emit_sub(pc, temp, src[1][c], src[2][c]);
> +                       emit_mad(pc, dst[c], temp, src[0][c], src[2][c]);
>                }
>                break;
>        case TGSI_OPCODE_MAD:
> @@ -1164,7 +1166,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union
> tgsi_full_token *tok)
>                                continue;
>                        emit_mov(pc, dst[c], temp);
>                }
> -               free_temp(pc, temp);
>                break;
>        case TGSI_OPCODE_RCP:
>                for (c = 0; c < 4; c++) {
> @@ -1259,7 +1260,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union
> tgsi_full_token *tok)
>                        emit_mul(pc, temp, src[0][1], src[1][0]);
>                        emit_msb(pc, dst[2], src[0][0], src[1][1], temp);
>                }
> -               free_temp(pc, temp);
>                break;
>        case TGSI_OPCODE_END:
>                break;
> @@ -1268,6 +1268,9 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union
> tgsi_full_token *tok)
>                return FALSE;
>        }
>
> +       if (temp)
> +               free_temp(pc, temp);
> +
>        if (sat) {
>                for (c = 0; c < 4; c++) {
>                        struct nv50_program_exec *e;
> @@ -1288,6 +1291,19 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union
> tgsi_full_token *tok)
>                }
>        }
>
> +       for (i = 0; i < inst->Instruction.NumSrcRegs; i++) {
> +               for (c = 0; c < 4; c++) {
> +                       if (!src[i][c])
> +                               continue;
> +                       if (src[i][c]->index == -1 && src[i][c]->type ==
> P_IMMD)
> +                               FREE(src[i][c]);
> +
> +                       /* Might also release temporaries not used anymore
> in this loop,
> +                        * therefore no temp_immd and temp_immd_nr like for
> temp_temp.
> +                        */
> +               }
> +       }
> +
>        kill_temp_temp(pc);
>        return TRUE;
>  }
>
> commit 93d8cfb3e13179d6ed28c4989cefc92389008f0b
> Author: chr <chr@LAPTOP.(none)>
> Date:   Tue May 5 20:54:43 2009 +0200
>
>    - extend nv50_pc to track insn nr, add allow half insn boolean
>    - extend nv50_reg to record insn of last use and FP output hw index
>    - add some functions for later use
>    - modify alloc_reg to prefer final FP output hw if set
>    - record interpolation mode in tx_prep
>    - count number of insns in tx_prep
>    - record depth output, and position and color input indices
>    - inspect instructions for register usage
>    - set pc->allow32 to FALSE on first and last insn
>
>    shouldn't change generated shader code yet
>
> diff --git a/src/gallium/drivers/nv50/nv50_program.c
> b/src/gallium/drivers/nv50/nv50_program.c
> index 1a94327..cb92a31 100644
> --- a/src/gallium/drivers/nv50/nv50_program.c
> +++ b/src/gallium/drivers/nv50/nv50_program.c
> @@ -86,6 +86,9 @@ struct nv50_reg {
>
>        int hw;
>        int neg;
> +
> +       int rhw; /* result hw for FP outputs */
> +       int acc; /* instruction where this reg is last read (first insn ==
> 1) */
>  };
>
>  struct nv50_pc {
> @@ -109,6 +112,12 @@ struct nv50_pc {
>
>        struct nv50_reg *temp_temp[16];
>        unsigned temp_temp_nr;
> +
> +       /* current instruction and total number of insns */
> +       unsigned insn_cur;
> +       unsigned insn_nr;
> +
> +       boolean allow32; /* TRUE when half insns are allowed */
>  };
>
>  static void
> @@ -132,7 +141,24 @@ alloc_reg(struct nv50_pc *pc, struct nv50_reg *reg)
>                return;
>        }
>
> -       for (i = 0; i < NV50_SU_MAX_TEMP; i++) {
> +       i = 0;
> +       if (reg->rhw != -1) {
> +               /* try to allocate temporary with index rhw first */
> +               if (!(pc->r_temp[reg->rhw])) {
> +                       pc->r_temp[reg->rhw] = reg;
> +                       reg->hw = reg->rhw;
> +                       if (pc->p->cfg.high_temp < (reg->rhw + 1))
> +                               pc->p->cfg.high_temp = reg->rhw + 1;
> +                       return;
> +               }
> +        /* If we can't allocate the final destination index of the output,
> +         * put it in a high temporary so we need not shuffle around later.
> +                * (like, $r0 needs to go in $r1 and $r1 in $r0 etc.)
> +         */
> +               i = pc->result_nr * 4;
> +       }
> +
> +       for (; i < NV50_SU_MAX_TEMP; i++) {
>                if (!(pc->r_temp[i])) {
>                        pc->r_temp[i] = reg;
>                        reg->hw = i;
> @@ -160,6 +186,7 @@ alloc_temp(struct nv50_pc *pc, struct nv50_reg *dst)
>                        r->type = P_TEMP;
>                        r->index = -1;
>                        r->hw = i;
> +                       r->rhw = -1;
>                        pc->r_temp[i] = r;
>                        return r;
>                }
> @@ -169,6 +196,56 @@ alloc_temp(struct nv50_pc *pc, struct nv50_reg *dst)
>        return NULL;
>  }
>
> +static struct nv50_reg *
> +alloc_preferred_temp(struct nv50_pc *pc, int hw)
> +{
> +       struct nv50_reg *r;
> +
> +       if (hw >= NV50_SU_MAX_TEMP || hw == -1 || pc->r_temp[hw])
> +               return alloc_temp(pc, NULL);
> +
> +       r = CALLOC_STRUCT(nv50_reg);
> +       r->type = P_TEMP;
> +       r->index = -1;
> +       r->hw = hw;
> +       r->rhw = -1;
> +       pc->r_temp[hw] = r;
> +
> +       return r;
> +}
> +
> +/* Assign the hw of the discarded temporary register src
> + * to the tgsi register dst and free src.
> + */
> +static void
> +assimilate_temp(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg
> *src)
> +{
> +       assert(dst->index != -1 && src->index == -1 && src->hw != -1);
> +
> +       if (dst->hw != -1)
> +               pc->r_temp[dst->hw] = NULL;
> +       pc->r_temp[src->hw] = dst;
> +       dst->hw = src->hw;
> +
> +       FREE(src);
> +}
> +
> +/* release the hardware resource held by r */
> +static void
> +release_hw(struct nv50_pc *pc, struct nv50_reg *r)
> +{
> +       assert(r->type == P_TEMP);
> +       if (r->hw == -1)
> +               return;
> +
> +       assert(pc->r_temp[r->hw] == r);
> +       pc->r_temp[r->hw] = NULL;
> +
> +       r->acc = 0;
> +       if (r->index == -1)
> +               FREE(r);
> +}
> +
>  static void
>  free_temp(struct nv50_pc *pc, struct nv50_reg *r)
>  {
> @@ -251,7 +328,14 @@ alloc_immd(struct nv50_pc *pc, float f)
>        struct nv50_reg *r = CALLOC_STRUCT(nv50_reg);
>        unsigned hw;
>
> -       hw = ctor_immd(pc, f, 0, 0, 0) * 4;
> +       /* don't allocate more space if the value is already there */
> +       for (hw = 0; hw < pc->immd_nr * 4; ++hw)
> +               if (pc->immd_buf[hw] == f)
> +                       break;
> +
> +       if (hw == pc->immd_nr * 4)
> +               hw = ctor_immd(pc, f, 0, 0, 0) * 4;
> +
>        r->type = P_IMMD;
>        r->hw = hw;
>        r->index = -1;
> @@ -355,6 +439,12 @@ set_immd(struct nv50_pc *pc, struct nv50_reg *imm,
> struct nv50_program_exec *e)
>        e->inst[1] |= (val >> 6) << 2;
>  }
>
> +
> +#define INTERP_LINEAR          0
> +#define INTERP_FLAT                    1
> +#define INTERP_PERSPECTIVE     2
> +#define INTERP_CENTROID                4
> +
>  static void
>  emit_interp(struct nv50_pc *pc, struct nv50_reg *dst,
>            struct nv50_reg *src, struct nv50_reg *iv)
> @@ -535,6 +625,14 @@ set_src_2(struct nv50_pc *pc, struct nv50_reg *src,
> struct nv50_program_exec *e)
>        e->inst[1] |= (src->hw << 14);
>  }
>
> +static boolean
> +requires_long(struct nv50_program_exec *e, struct nv50_reg *src)
> +{
> +       if (is_long(e) || src->type == P_IMMD || src->type == P_CONST)
> +               return TRUE;
> +       return FALSE;
> +}
> +
>  static void
>  emit_mul(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src0,
>         struct nv50_reg *src1)
> @@ -870,6 +968,62 @@ emit_kil(struct nv50_pc *pc, struct nv50_reg *src)
>        emit(pc, e);
>  }
>
> +static void
> +emit_nop(struct nv50_pc *pc, boolean l)
> +{
> +       struct nv50_program_exec *e = exec(pc);
> +
> +       e->inst[0] = 0xF0000000;
> +       if (l) {
> +               set_long(pc, e);
> +               e->inst[1] = 0xE0000000;
> +       }
> +
> +       emit(pc, e);
> +}
> +
> +/* Adjust a bitmask that indicates what components of a source are used,
> + * we use this in tx_prep so we only load interpolants that are needed.
> + */
> +static void
> +insn_adjust_mask(const struct tgsi_full_instruction *insn, unsigned *mask)
> +{
> +       const struct tgsi_instruction_ext_texture *tex;
> +
> +       switch (insn->Instruction.Opcode) {
> +       case TGSI_OPCODE_DP3:
> +               *mask = 0x7;
> +               break;
> +       case TGSI_OPCODE_DP4:
> +       case TGSI_OPCODE_DPH:
> +               *mask = 0xF;
> +               break;
> +       case TGSI_OPCODE_LIT:
> +               *mask = 0xB;
> +               break;
> +       case TGSI_OPCODE_RCP:
> +       case TGSI_OPCODE_RSQ:
> +               *mask = 0x1;
> +               break;
> +       case TGSI_OPCODE_TXP:
> +               *mask = 0x8;
> +               /* fall through to TEX */
> +       case TGSI_OPCODE_TEX:
> +               assert(insn->Instruction.Extended);
> +               tex = &insn->InstructionExtTexture;
> +
> +               if (tex->Texture == TGSI_TEXTURE_1D)
> +                       *mask |= 0x1;
> +               else
> +               if (tex->Texture == TGSI_TEXTURE_2D)
> +                       *mask |= 0x3;
> +               else
> +                       *mask |= 0x7;
> +       default:
> +               break;
> +       }
> +}
> +
>  static struct nv50_reg *
>  tgsi_dst(struct nv50_pc *pc, int c, const struct tgsi_full_dst_register
> *dst)
>  {
> @@ -1308,12 +1462,53 @@ nv50_program_tx_insn(struct nv50_pc *pc, const
> union tgsi_full_token *tok)
>        return TRUE;
>  }
>
> +static void
> +set_acc_array(unsigned *p, const struct tgsi_full_src_register *src,
> +                         unsigned mask, unsigned n)
> +{
> +       unsigned k, c;
> +
> +       for (c = 0; c < 4; c++) {
> +               if (!(mask & (1 << c)))
> +                       continue;
> +
> +               k = tgsi_util_get_full_src_register_extswizzle(src, c);
> +               switch (k) {
> +               case TGSI_EXTSWIZZLE_X:
> +               case TGSI_EXTSWIZZLE_Y:
> +               case TGSI_EXTSWIZZLE_Z:
> +               case TGSI_EXTSWIZZLE_W:
> +                       p[src->SrcRegister.Index * 4 + k] = n;
> +                       break;
> +               default:
> +                       break;
> +               }
> +       }
> +}
> +
>  static boolean
>  nv50_program_tx_prep(struct nv50_pc *pc)
>  {
>        struct tgsi_parse_context p;
>        boolean ret = FALSE;
>        unsigned i, c;
> +       unsigned fcol, bcol, fcrd, depr;
> +
> +       /* record interpolation mode from declaration */
> +       boolean centroid_load = FALSE;
> +       boolean perspect_load = FALSE;
> +       unsigned interp_mode[32];
> +
> +       /* track register usage for temps and attrs */
> +       unsigned *last_t_use = NULL;
> +       unsigned *last_a_use = NULL;
> +
> +       depr = fcol = bcol = fcrd = 0xFFFFFFFF;
> +
> +       if (pc->p->type == PIPE_SHADER_FRAGMENT) {
> +               pc->p->cfg.fp.regs[0] = 0x01000404;
> +               pc->p->cfg.fp.regs[1] = 0x00000400;
> +       }
>
>        tgsi_parse_init(&p, pc->p->pipe.tokens);
>        while (!tgsi_parse_end_of_tokens(&p)) {
> @@ -1326,6 +1521,10 @@ nv50_program_tx_prep(struct nv50_pc *pc)
>                        const struct tgsi_full_immediate *imm =
>                                &p.FullToken.FullImmediate;
>
> +#ifdef NV50_PROGRAM_DUMP
> +                       tgsi_dump_immediate(imm);
> +#endif
> +
>                        ctor_immd(pc, imm->u.ImmediateFloat32[0].Float,
>                                      imm->u.ImmediateFloat32[1].Float,
>                                      imm->u.ImmediateFloat32[2].Float,
> @@ -1335,11 +1534,16 @@ nv50_program_tx_prep(struct nv50_pc *pc)
>                case TGSI_TOKEN_TYPE_DECLARATION:
>                {
>                        const struct tgsi_full_declaration *d;
> -                       unsigned last;
> +                       unsigned last, first, mode;
>
>                        d = &p.FullToken.FullDeclaration;
> +                       first = d->DeclarationRange.First;
>                        last = d->DeclarationRange.Last;
>
> +#ifdef NV50_PROGRAM_DUMP
> +                       tgsi_dump_declaration(d);
> +#endif
> +
>                        switch (d->Declaration.File) {
>                        case TGSI_FILE_TEMPORARY:
>                                if (pc->temp_nr < (last + 1))
> @@ -1348,10 +1552,71 @@ nv50_program_tx_prep(struct nv50_pc *pc)
>                        case TGSI_FILE_OUTPUT:
>                                if (pc->result_nr < (last + 1))
>                                        pc->result_nr = last + 1;
> +
> +                               if (!d->Declaration.Semantic)
> +                                       break;
> +
> +                               switch (d->Semantic.SemanticName) {
> +                               case TGSI_SEMANTIC_POSITION:
> +                                       depr = first;
> +                                       pc->p->cfg.fp.regs[2] |=
> 0x00000100;
> +                                       pc->p->cfg.fp.regs[3] |=
> 0x00000011;
> +                                       break;
> +                               default:
> +                                       break;
> +                               }
>                                break;
>                        case TGSI_FILE_INPUT:
> +                       {
>                                if (pc->attr_nr < (last + 1))
>                                        pc->attr_nr = last + 1;
> +
> +                               if (pc->p->type != PIPE_SHADER_FRAGMENT)
> +                                       break;
> +
> +                           switch (d->Declaration.Interpolate) {
> +                               case TGSI_INTERPOLATE_CONSTANT:
> +                                       mode = INTERP_FLAT;
> +                                       break;
> +                               case TGSI_INTERPOLATE_PERSPECTIVE:
> +                                       mode = INTERP_PERSPECTIVE;
> +                                       perspect_load = TRUE;
> +                                       break;
> +                               default:
> +                                       mode = INTERP_LINEAR;
> +                                       break;
> +                               }
> +
> +                               if (d->Declaration.Semantic) {
> +                                       switch (d->Semantic.SemanticName) {
> +                                       case TGSI_SEMANTIC_POSITION:
> +                                               fcrd = first;
> +                                               break;
> +                                       case TGSI_SEMANTIC_COLOR:
> +                                               fcol = first;
> +                                               mode = INTERP_PERSPECTIVE;
> +                                               perspect_load = TRUE;
> +                                               break;
> +                                       case TGSI_SEMANTIC_BCOLOR:
> +                                               bcol = first;
> +                                               mode = INTERP_PERSPECTIVE;
> +                                               perspect_load = TRUE;
> +                                               break;
> +                                       default:
> +                                               break;
> +                                       }
> +                               }
> +
> +                               if (d->Declaration.Centroid) {
> +                                       mode |= INTERP_CENTROID;
> +                                       centroid_load = TRUE;
> +                                       perspect_load = FALSE;
> +                               }
> +
> +                               assert(last < 32);
> +                               for (i = first; i <= last; i++)
> +                                       interp_mode[i] = mode;
> +                       }
>                                break;
>                        case TGSI_FILE_CONSTANT:
>                                if (pc->param_nr < (last + 1))
> @@ -1367,6 +1632,43 @@ nv50_program_tx_prep(struct nv50_pc *pc)
>                }
>                        break;
>                case TGSI_TOKEN_TYPE_INSTRUCTION:
> +               {
> +                       const struct tgsi_full_instruction *insn;
> +                       const struct tgsi_full_src_register *src;
> +                       const struct tgsi_dst_register *dst;
> +                       unsigned mask;
> +
> +                       pc->insn_nr++;
> +
> +                       if (!last_t_use) {
> +                               last_t_use = CALLOC(pc->temp_nr * 4,
> sizeof(unsigned));
> +                               last_a_use = CALLOC(pc->attr_nr * 4,
> sizeof(unsigned));
> +                       }
> +
> +                       insn = &tok->FullInstruction;
> +                       dst = &insn->FullDstRegisters[0].DstRegister;
> +                       mask = dst->WriteMask;
> +
> +#ifdef NV50_PROGRAM_DUMP
> +                       tgsi_dump_instruction(insn, 1);
> +#endif
> +                       if (dst->File == TGSI_FILE_TEMPORARY) {
> +                               for (c = 0; c < 4; c++)
> +                                       if (mask & (1 << c))
> +                                               last_t_use[dst->Index * 4 +
> c] = pc->insn_nr;
> +                       }
> +
> +                       for (i = 0; i < insn->Instruction.NumSrcRegs; ++i)
> {
> +                               src = &insn->FullSrcRegisters[i];
> +                               insn_adjust_mask(insn, &mask);
> +
> +                               if (src->SrcRegister.File ==
> TGSI_FILE_TEMPORARY)
> +                                       set_acc_array(last_t_use, src,
> mask, pc->insn_nr);
> +                               else
> +                               if (src->SrcRegister.File ==
> TGSI_FILE_INPUT)
> +                                       set_acc_array(last_a_use, src,
> mask, pc->insn_nr);
> +                       }
> +               }
>                        break;
>                default:
>                        break;
> @@ -1487,6 +1789,11 @@ nv50_program_tx_prep(struct nv50_pc *pc)
>                }
>        }
>
> +       if (last_t_use)
> +               FREE(last_t_use);
> +       if (last_a_use)
> +               FREE(last_a_use);
> +
>        ret = TRUE;
>  out_err:
>        tgsi_parse_free(&p);
> @@ -1516,8 +1823,15 @@ nv50_program_tx(struct nv50_program *p)
>
>                tgsi_parse_token(&parse);
>
> +               /* don't allow half insn on first and last (not END)
> instruction */
> +               if (pc->insn_cur == 0 || pc->insn_cur + 2 == pc->insn_nr)
> +                       pc->allow32 = FALSE;
> +               else
> +                       pc->allow32 = TRUE;
> +
>                switch (tok->Token.Type) {
>                case TGSI_TOKEN_TYPE_INSTRUCTION:
> +                       ++pc->insn_cur;
>                        ret = nv50_program_tx_insn(pc, tok);
>                        if (ret == FALSE)
>                                goto out_err;
> diff --git a/src/gallium/drivers/nv50/nv50_program.h
> b/src/gallium/drivers/nv50/nv50_program.h
> index 78deed6..3b3b6bb 100644
> --- a/src/gallium/drivers/nv50/nv50_program.h
> +++ b/src/gallium/drivers/nv50/nv50_program.h
> @@ -39,6 +39,11 @@ struct nv50_program {
>                struct {
>                        unsigned attr[2];
>                } vp;
> +               struct {
> +                       unsigned regs[4];
> +                       unsigned map[4];
> +                       unsigned high_map;
> +               } fp;
>        } cfg;
>  };
>
>
> commit ebcc4b9cf61a25d8ef2fa87eecfb5e4e75b47bca
> Author: chr <chr@LAPTOP.(none)>
> Date:   Tue May 5 20:56:12 2009 +0200
>
>    - more correct loading FP interpolants, also consider interpolation mode
>    - use tgsi resource nv50_regs to store attributes
>    - improve values of shader registers
>    - make sure FP depth output goes where it's supposed to go
>    - loop through all instructions and make sure there are no single half
> insns
>
> diff --git a/src/gallium/drivers/nv50/nv50_program.c
> b/src/gallium/drivers/nv50/nv50_program.c
> index cb92a31..9acf882 100644
> --- a/src/gallium/drivers/nv50/nv50_program.c
> +++ b/src/gallium/drivers/nv50/nv50_program.c
> @@ -445,20 +445,29 @@ set_immd(struct nv50_pc *pc, struct nv50_reg *imm,
> struct nv50_program_exec *e)
>  #define INTERP_PERSPECTIVE     2
>  #define INTERP_CENTROID                4
>
> +/* interpolant index has been stored in dst->rhw */
>  static void
> -emit_interp(struct nv50_pc *pc, struct nv50_reg *dst,
> -           struct nv50_reg *src, struct nv50_reg *iv)
> +emit_interp(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *iv,
> +               unsigned mode)
>  {
> +       assert(dst->rhw != -1);
>        struct nv50_program_exec *e = exec(pc);
>
>        e->inst[0] |= 0x80000000;
>        set_dst(pc, dst, e);
> -       alloc_reg(pc, src);
> -       e->inst[0] |= (src->hw << 16);
> -       if (iv) {
> -               e->inst[0] |= (1 << 25);
> -               alloc_reg(pc, iv);
> -               e->inst[0] |= (iv->hw << 9);
> +       e->inst[0] |= (dst->rhw << 16);
> +
> +       if (mode & INTERP_FLAT) {
> +               e->inst[0] |= (1 << 8);
> +       } else {
> +               if (mode & INTERP_PERSPECTIVE) {
> +                       e->inst[0] |= (1 << 25);
> +                       alloc_reg(pc, iv);
> +                       e->inst[0] |= (iv->hw << 9);
> +               }
> +
> +               if (mode & INTERP_CENTROID)
> +                       e->inst[0] |= (1 << 24);
>        }
>
>        emit(pc, e);
> @@ -982,6 +991,43 @@ emit_nop(struct nv50_pc *pc, boolean l)
>        emit(pc, e);
>  }
>
> +static void
> +convert_to_long(struct nv50_pc *pc, struct nv50_program_exec *e)
> +{
> +       unsigned q = 0, m = ~0;
> +
> +       assert(!is_long(e));
> +
> +       switch (e->inst[0] >> 28) {
> +               case 0x1:
> +                       /* MOV */
> +                       q = 0x0403c000;
> +                       m = 0xFFFF7FFF;
> +                       break;
> +               case 0x8:
> +                       /* INTERP */
> +                       m = ~0x02000000;
> +                       if (e->inst[0] & 0x02000000)
> +                               q = 0x00020000;
> +                       break;
> +               case 0xC:
> +                       /* MUL */
> +                       break;
> +               case 0x9:
> +                       /* RCP */
> +                       break;
> +               default:
> +                       assert(0);
> +                       break;
> +       }
> +
> +       set_long(pc, e);
> +       pc->p->exec_size++;
> +
> +       e->inst[0] &= m;
> +       e->inst[1] |= q;
> +}
> +
>  /* Adjust a bitmask that indicates what components of a source are used,
>  * we use this in tx_prep so we only load interpolants that are needed.
>  */
> @@ -1005,20 +1051,21 @@ insn_adjust_mask(const struct tgsi_full_instruction
> *insn, unsigned *mask)
>        case TGSI_OPCODE_RSQ:
>                *mask = 0x1;
>                break;
> -       case TGSI_OPCODE_TXP:
> -               *mask = 0x8;
> -               /* fall through to TEX */
>        case TGSI_OPCODE_TEX:
> +       case TGSI_OPCODE_TXP:
>                assert(insn->Instruction.Extended);
>                tex = &insn->InstructionExtTexture;
>
> +               *mask = 0x7;
>                if (tex->Texture == TGSI_TEXTURE_1D)
> -                       *mask |= 0x1;
> +                       *mask = 0x1;
>                else
>                if (tex->Texture == TGSI_TEXTURE_2D)
> -                       *mask |= 0x3;
> -               else
> -                       *mask |= 0x7;
> +                       *mask = 0x3;
> +
> +               if (insn->Instruction.Opcode == TGSI_OPCODE_TXP)
> +                       *mask |= 0x8;
> +               break;
>        default:
>                break;
>        }
> @@ -1255,6 +1302,7 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union
> tgsi_full_token *tok)
>                emit_kil(pc, src[0][1]);
>                emit_kil(pc, src[0][2]);
>                emit_kil(pc, src[0][3]);
> +               pc->p->cfg.fp.regs[2] |= 0x00100000;
>                break;
>        case TGSI_OPCODE_LIT:
>                emit_lit(pc, &dst[0], mask, &src[0][0]);
> @@ -1503,7 +1551,7 @@ nv50_program_tx_prep(struct nv50_pc *pc)
>        unsigned *last_t_use = NULL;
>        unsigned *last_a_use = NULL;
>
> -       depr = fcol = bcol = fcrd = 0xFFFFFFFF;
> +       depr = fcol = bcol = fcrd = 0xFFFF;
>
>        if (pc->p->type == PIPE_SHADER_FRAGMENT) {
>                pc->p->cfg.fp.regs[0] = 0x01000404;
> @@ -1683,37 +1731,106 @@ nv50_program_tx_prep(struct nv50_pc *pc)
>                for (i = 0; i < pc->temp_nr; i++) {
>                        for (c = 0; c < 4; c++) {
>                                pc->temp[i*4+c].type = P_TEMP;
> -                               pc->temp[i*4+c].hw = -1;
> +                               pc->temp[i*4+c].hw = pc->temp[i*4+c].rhw =
> -1;
>                                pc->temp[i*4+c].index = i;
> +                               pc->temp[i*4+c].acc = last_t_use[i*4+c];
>                        }
>                }
>        }
>
>        if (pc->attr_nr) {
> -               struct nv50_reg *iv = NULL;
> -               int aid = 0;
> +               struct nv50_reg *iv, *iv_c = NULL, *iv_p = NULL;
> +               int oid, off = 4, mid = 0, aid = 0;
> +
> +               /* off = VP output id offset to i*4 (oid = i*4 + off + c)
> +                * aid = FP attribute/interpolant id (incremented only for
> used attrs)
> +                * mid = VP output mapping field ID (HPOS not counted)
> +                */
>
>                pc->attr = CALLOC(pc->attr_nr * 4, sizeof(struct nv50_reg));
>                if (!pc->attr)
>                        goto out_err;
>
> +               i = 0;
>                if (pc->p->type == PIPE_SHADER_FRAGMENT) {
> -                       iv = alloc_temp(pc, NULL);
> -                       emit_interp(pc, iv, iv, NULL);
> -                       emit_flop(pc, 0, iv, iv);
> -                       aid++;
> +
> +                       if (fcrd != 0xFFFF) {
> +                               assert(fcrd == 0); /* position input should
> always be 0 */
> +                               i = 1;
> +                               off = 0;
> +                               for (c = 0; c < 4; ++c) {
> +                                       if (last_a_use[c] == 0)
> +                                               continue;
> +
> +                                       pc->attr[c].index = fcrd;
> +                                       pc->attr[c].type = P_TEMP;
> +                                       pc->attr[c].acc = last_a_use[c];
> +                                       pc->attr[c].hw = pc->attr[c].rhw =
> -1;
> +
> +                                       alloc_reg(pc, &pc->attr[c]);
> +                                       pc->attr[c].rhw = aid++;
> +
> +                                       emit_interp(pc, &pc->attr[c], NULL,
> INTERP_LINEAR);
> +                                       pc->p->cfg.fp.regs[1] |= (1 << (24
> + c));
> +
> +                                       switch (c) {
> +                                       case 0:
> +                                       case 1:
> +                                               /* should probably do
> viewport stuff here */
> +                                               break;
> +                                       case 3:
> +                                               iv_p = &pc->attr[c];
> +                                               emit_flop(pc, 0, iv_p,
> iv_p);
> +                                               break;
> +                                       default:
> +                                               break;
> +                                       }
> +                               }
> +                       }
> +
> +                       if (perspect_load && !iv_p) {
> +                               iv_p = alloc_temp(pc, NULL);
> +                               iv_p->rhw = aid++;
> +                               emit_interp(pc, iv_p, NULL, INTERP_LINEAR);
> +                               emit_flop(pc, 0, iv_p, iv_p);
> +                               pc->p->cfg.fp.regs[1] |= 0x08000000;
> +                       }
> +
> +                       if (centroid_load) {
> +                               iv_c = alloc_temp(pc, NULL);
> +                               iv_c->rhw = iv_p ? aid - 1 : aid++;
> +                               emit_interp(pc, iv_c, NULL,
> INTERP_CENTROID);
> +                               emit_flop(pc, 0, iv_c, iv_c);
> +                               pc->p->cfg.fp.regs[1] |= 0x08000000;
> +                       }
>                }
>
> -               for (i = 0; i < pc->attr_nr; i++) {
> +               for (; i < pc->attr_nr; i++) {
>                        struct nv50_reg *a = &pc->attr[i*4];
> +                       iv = (interp_mode[i] & INTERP_CENTROID) ? iv_c :
> iv_p;
>
>                        for (c = 0; c < 4; c++) {
>                                if (pc->p->type == PIPE_SHADER_FRAGMENT) {
> -                                       struct nv50_reg *at =
> -                                               alloc_temp(pc, NULL);
> -                                       pc->attr[i*4+c].type = at->type;
> -                                       pc->attr[i*4+c].hw = at->hw;
> -                                       pc->attr[i*4+c].index = at->index;
> +                                       a[c].hw = a[c].rhw = -1;
> +                                       a[c].index = -1;
> +                                       if (last_a_use[i*4+c] == 0)
> +                                               continue;
> +
> +                                       if (i == fcol || i == bcol)
> +                                               pc->p->cfg.fp.regs[0] +=
> 0x00010000;
> +                                       pc->p->cfg.fp.regs[1] +=
> 0x00010000;
> +
> +                                       a[c].index = i;
> +                                       a[c].type = P_TEMP;
> +                                       a[c].acc = last_a_use[i*4+c];
> +
> +                                       alloc_reg(pc, &a[c]);
> +                                       a[c].rhw = aid++;
> +                                       emit_interp(pc, &a[c], iv,
> interp_mode[i]);
> +
> +                                       oid = off + i * 4 + c;
> +                                       pc->p->cfg.fp.map[mid / 4] |= oid
> << (8 * (mid % 4));
> +                                       mid++;
>                                } else {
>                                        pc->p->cfg.vp.attr[aid/32] |=
>                                                (1 << (aid % 32));
> @@ -1722,18 +1839,16 @@ nv50_program_tx_prep(struct nv50_pc *pc)
>                                        pc->attr[i*4+c].index = i;
>                                }
>                        }
> +               }
>
> -                       if (pc->p->type != PIPE_SHADER_FRAGMENT)
> -                               continue;
> +               if (pc->p->type == PIPE_SHADER_FRAGMENT) {
> +                       pc->p->cfg.fp.high_map = (mid / 4) + ((mid % 4) ? 1
> : 0);
>
> -                       emit_interp(pc, &a[0], &a[0], iv);
> -                       emit_interp(pc, &a[1], &a[1], iv);
> -                       emit_interp(pc, &a[2], &a[2], iv);
> -                       emit_interp(pc, &a[3], &a[3], iv);
> +                       if (iv_p && iv_p->index == -1)
> +                               free_temp(pc, iv_p);
> +                       if (iv_c)
> +                               free_temp(pc, iv_c);
>                }
> -
> -               if (iv)
> -                       free_temp(pc, iv);
>        }
>
>        if (pc->result_nr) {
> @@ -1748,9 +1863,15 @@ nv50_program_tx_prep(struct nv50_pc *pc)
>                                if (pc->p->type == PIPE_SHADER_FRAGMENT) {
>                                        pc->result[i*4+c].type = P_TEMP;
>                                        pc->result[i*4+c].hw = -1;
> +                                       if (i == depr) {
> +                                               pc->result[i*4+c].rhw = ((c
> == 2) ?
> +                                                       (pc->result_nr - 1)
> * 4 : -1);
> +                                       } else
> +                                               pc->result[i*4+c].rhw =
> rid++;
>                                } else {
>                                        pc->result[i*4+c].type = P_RESULT;
>                                        pc->result[i*4+c].hw = rid++;
> +                                       pc->result[i*4+c].rhw = -1;
>                                }
>                                pc->result[i*4+c].index = i;
>                        }
> @@ -1805,6 +1926,7 @@ nv50_program_tx(struct nv50_program *p)
>  {
>        struct tgsi_parse_context parse;
>        struct nv50_pc *pc;
> +       unsigned i, k;
>        boolean ret;
>
>        pc = CALLOC_STRUCT(nv50_pc);
> @@ -1843,10 +1965,42 @@ nv50_program_tx(struct nv50_program *p)
>
>        if (p->type == PIPE_SHADER_FRAGMENT) {
>                struct nv50_reg out;
> -
>                out.type = P_TEMP;
> -               for (out.hw = 0; out.hw < pc->result_nr * 4; out.hw++)
> -                       emit_mov(pc, &out, &pc->result[out.hw]);
> +
> +               for (i = 0; i < pc->result_nr * 4; i++) {
> +                       if (pc->result[i].rhw == -1)
> +                               continue;
> +                       if (pc->result[i].hw != pc->result[i].rhw) {
> +                               out.hw = pc->result[i].rhw;
> +                               emit_mov(pc, &out, &pc->result[i]);
> +                       }
> +                       if (pc->p->cfg.high_result < pc->result[i].rhw + 1)
> +                               pc->p->cfg.high_result = pc->result[i].rhw
> + 1;
> +               }
> +       }
> +
> +       /* look for single half instructions and make them long */
> +       struct nv50_program_exec *e, *e_prev;
> +
> +       for (k = 0, e = pc->p->exec_head, e_prev = NULL; e; e = e->next) {
> +               if (!is_long(e))
> +                       k++;
> +
> +               if (!e->next || is_long(e->next)) {
> +                       if (k & 1)
> +                               convert_to_long(pc, e);
> +                       k = 0;
> +               }
> +
> +               if (e->next)
> +                       e_prev = e;
> +       }
> +
> +       if (!is_long(pc->p->exec_tail)) {
> +               /* this may occur if moving FP results */
> +               assert(e_prev && !is_long(e_prev));
> +               convert_to_long(pc, e_prev);
> +               convert_to_long(pc, pc->p->exec_tail);
>        }
>
>        assert(is_long(pc->p->exec_tail) && !is_immd(pc->p->exec_head));
> @@ -1973,7 +2127,7 @@ nv50_program_validate_code(struct nv50_context *nv50,
> struct nv50_program *p)
>                if (is_long(e))
>                        NOUVEAU_ERR("0x%08x\n", e->inst[1]);
>        }
> -
> +       FREE(up);
>  #endif
>
>        up = ptr = MALLOC(p->exec_size * 4);
> @@ -2058,6 +2212,7 @@ nv50_fragprog_validate(struct nv50_context *nv50)
>        struct nouveau_grobj *tesla = nv50->screen->tesla;
>        struct nv50_program *p = nv50->fragprog;
>        struct nouveau_stateobj *so;
> +       unsigned i;
>
>        if (!p->translated) {
>                nv50_program_validate(nv50, p);
> @@ -2068,24 +2223,30 @@ nv50_fragprog_validate(struct nv50_context *nv50)
>        nv50_program_validate_data(nv50, p);
>        nv50_program_validate_code(nv50, p);
>
> -       so = so_new(64, 2);
> +       so = so_new(32, 2);
>        so_method(so, tesla, NV50TCL_FP_ADDRESS_HIGH, 2);
>        so_reloc (so, p->buffer, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD |
>                  NOUVEAU_BO_HIGH, 0, 0);
>        so_reloc (so, p->buffer, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD |
>                  NOUVEAU_BO_LOW, 0, 0);
>        so_method(so, tesla, 0x1904, 4);
> -       so_data  (so, 0x00040404); /* p: 0x01000404 */
> +       so_data  (so, p->cfg.fp.regs[0]); /* 0x01000404 / 0x00040404 etc.
> */
>        so_data  (so, 0x00000004);
>        so_data  (so, 0x00000000);
>        so_data  (so, 0x00000000);
> -       so_method(so, tesla, 0x16bc, 3); /*XXX: fixme */
> +       so_method(so, tesla, 0x16bc, 1 + p->cfg.fp.high_map);
>        so_data  (so, 0x03020100);
> -       so_data  (so, 0x07060504);
> -       so_data  (so, 0x0b0a0908);
> +       for (i = 0; i < p->cfg.fp.high_map; i++)
> +               so_data(so, p->cfg.fp.map[i]);
>        so_method(so, tesla, 0x1988, 2);
> -       so_data  (so, 0x08080408); //0x08040404); /* p: 0x0f000401 */
> +       so_data  (so, p->cfg.fp.regs[1]); /* 0x08040404 / 0x0f000401 etc.
> */
>        so_data  (so, p->cfg.high_temp);
> +       so_method(so, tesla, 0x1298, 1);
> +       so_data  (so, p->cfg.high_result);
> +       so_method(so, tesla, 0x19a8, 1);
> +       so_data  (so, p->cfg.fp.regs[2]);
> +       so_method(so, tesla, 0x196c, 1);
> +       so_data  (so, p->cfg.fp.regs[3]);
>        so_method(so, tesla, 0x1414, 1);
>        so_data  (so, 0); /* program start offset */
>        so_ref(so, &nv50->state.fragprog);
>
> commit dacf2f879d63b5bf756da62eee901379336e7335
> Author: chr <chr@LAPTOP.(none)>
> Date:   Tue May 5 20:57:15 2009 +0200
>
>    - avoid overwriting sources before they're used in cases where dst ==
> src
>    - add magical adjustment for register 1988 (I should find out how that
>      really works)
>
> diff --git a/src/gallium/drivers/nv50/nv50_program.c
> b/src/gallium/drivers/nv50/nv50_program.c
> index 9acf882..e4fc261 100644
> --- a/src/gallium/drivers/nv50/nv50_program.c
> +++ b/src/gallium/drivers/nv50/nv50_program.c
> @@ -1162,12 +1162,40 @@ tgsi_src(struct nv50_pc *pc, int chan, const struct
> tgsi_full_src_register *src)
>        return r;
>  }
>
> +/* returns TRUE if instruction can overwrite sources before they're read
> */
> +static boolean
> +direct2dest_op(const struct tgsi_full_instruction *insn)
> +{
> +       if (insn->Instruction.Saturate)
> +               return FALSE;
> +
> +       switch (insn->Instruction.Opcode) {
> +       case TGSI_OPCODE_COS:
> +       case TGSI_OPCODE_DP3:
> +       case TGSI_OPCODE_DP4:
> +       case TGSI_OPCODE_DPH:
> +       case TGSI_OPCODE_KIL:
> +       case TGSI_OPCODE_LIT:
> +       case TGSI_OPCODE_POW:
> +       case TGSI_OPCODE_RCP:
> +       case TGSI_OPCODE_RSQ:
> +       case TGSI_OPCODE_SCS:
> +       case TGSI_OPCODE_SIN:
> +       case TGSI_OPCODE_TEX:
> +       case TGSI_OPCODE_TXP:
> +               return FALSE;
> +       default:
> +               return TRUE;
> +       }
> +}
> +
>  static boolean
>  nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
>  {
>        const struct tgsi_full_instruction *inst = &tok->FullInstruction;
>        struct nv50_reg *rdst[4], *dst[4], *src[3][4], *temp = NULL;
>        unsigned mask, sat, unit;
> +       boolean assimilate = FALSE;
>        int i, c;
>
>        mask = inst->FullDstRegisters[0].DstRegister.WriteMask;
> @@ -1178,6 +1206,12 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union
> tgsi_full_token *tok)
>                        dst[c] = tgsi_dst(pc, c,
> &inst->FullDstRegisters[0]);
>                else
>                        dst[c] = NULL;
> +
> +               rdst[c] = NULL;
> +
> +               src[0][c] = NULL;
> +               src[1][c] = NULL;
> +               src[2][c] = NULL;
>        }
>
>        for (i = 0; i < inst->Instruction.NumSrcRegs; i++) {
> @@ -1195,8 +1229,35 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union
> tgsi_full_token *tok)
>                        rdst[c] = dst[c];
>                        dst[c] = temp_temp(pc);
>                }
> +       } else if (direct2dest_op(inst)) {
> +               for (c = 0; c < 4; c++) {
> +                       if (!dst[c] || dst[c]->type != P_TEMP)
> +                               continue;
> +
> +                       for (i = c + 1; i < 4; i++) {
> +                               if (dst[c] == src[0][i] ||
> +                                       dst[c] == src[1][i] ||
> +                                       dst[c] == src[2][i])
> +                                       break;
> +                       }
> +                       if (i == 4)
> +                               continue;
> +
> +                       assimilate = TRUE;
> +                       rdst[c] = dst[c];
> +                       dst[c] = alloc_preferred_temp(pc, rdst[c]->rhw);
> +               }
> +       } else if (inst->Instruction.Opcode == TGSI_OPCODE_LIT) {
> +               /* XXX: shouldn't give LIT an extra case here */
> +               if (src[0][1] == dst[1] ||
> +                       src[0][3] == dst[1]) {
> +                       assimilate = TRUE;
> +                       rdst[1] = dst[1];
> +                       dst[1] = alloc_temp(pc, NULL);
> +               }
>        }
>
> +       i = -1;
>        switch (inst->Instruction.Opcode) {
>        case TGSI_OPCODE_ABS:
>                for (c = 0; c < 4; c++) {
> @@ -1373,14 +1434,22 @@ nv50_program_tx_insn(struct nv50_pc *pc, const
> union tgsi_full_token *tok)
>                for (c = 0; c < 4; c++) {
>                        if (!(mask & (1 << c)))
>                                continue;
> -                       emit_flop(pc, 0, dst[c], src[0][0]);
> +                       if (i == -1) {
> +                               emit_flop(pc, 0, dst[c], src[0][0]);
> +                               i = c;
> +                       } else
> +                               emit_mov(pc, dst[c], dst[i]);
>                }
>                break;
>        case TGSI_OPCODE_RSQ:
>                for (c = 0; c < 4; c++) {
>                        if (!(mask & (1 << c)))
>                                continue;
> -                       emit_flop(pc, 2, dst[c], src[0][0]);
> +                       if (i == -1) {
> +                               emit_flop(pc, 2, dst[c], src[0][0]);
> +                               i = c;
> +                       } else
> +                               emit_mov(pc, dst[c], dst[i]);
>                }
>                break;
>        case TGSI_OPCODE_SCS:
> @@ -1491,6 +1560,10 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union
> tgsi_full_token *tok)
>                        set_src_0(pc, dst[c], e);
>                        emit(pc, e);
>                }
> +       } else if (assimilate) {
> +               for (c = 0; c < 4; c++)
> +                       if (rdst[c])
> +                               assimilate_temp(pc, rdst[c], dst[c]);
>        }
>
>        for (i = 0; i < inst->Instruction.NumSrcRegs; i++) {
> @@ -1499,10 +1572,9 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union
> tgsi_full_token *tok)
>                                continue;
>                        if (src[i][c]->index == -1 && src[i][c]->type ==
> P_IMMD)
>                                FREE(src[i][c]);
> -
> -                       /* Might also release temporaries not used anymore
> in this loop,
> -                        * therefore no temp_immd and temp_immd_nr like for
> temp_temp.
> -                        */
> +                       else
> +                       if (src[i][c]->acc == pc->insn_cur)
> +                               release_hw(pc, src[i][c]);
>                }
>        }
>
> @@ -1996,6 +2068,18 @@ nv50_program_tx(struct nv50_program *p)
>                        e_prev = e;
>        }
>
> +       /* adjust register 1988 'heuristically' */
> +       /* XXX: make this go away */
> +       for (i = 0, k = 0; k < 4; ++k)
> +               if (pc->p->cfg.fp.regs[1] & (1 << (24 + k)))
> +                       i++;
> +       if (i > 3 || i < ((pc->p->cfg.fp.regs[1] >> 16) & 0xFF) + 3) {
> +               pc->p->cfg.fp.regs[1] &= 0xFFFFFF00;
> +               pc->p->cfg.fp.regs[1] |= ((pc->p->cfg.fp.regs[1] >> 16) &
> 0xFF);
> +       } else {
> +               pc->p->cfg.fp.regs[1] |= (3 - i);
> +       }
> +
>        if (!is_long(pc->p->exec_tail)) {
>                /* this may occur if moving FP results */
>                assert(e_prev && !is_long(e_prev));
>
> commit 4411b1e3b3c11c69ec11148783327759a94165e2
> Author: chr <chr@LAPTOP.(none)>
> Date:   Wed May 6 11:46:17 2009 +0200
>
>    Enable half insns and immediates for MOV and ADD.
>
> diff --git a/src/gallium/drivers/nv50/nv50_program.c
> b/src/gallium/drivers/nv50/nv50_program.c
> index e4fc261..2ab7b57 100644
> --- a/src/gallium/drivers/nv50/nv50_program.c
> +++ b/src/gallium/drivers/nv50/nv50_program.c
> @@ -426,7 +426,7 @@ set_dst(struct nv50_pc *pc, struct nv50_reg *dst,
> struct nv50_program_exec *e)
>  static INLINE void
>  set_immd(struct nv50_pc *pc, struct nv50_reg *imm, struct
> nv50_program_exec *e)
>  {
> -       unsigned val = fui(pc->immd_buf[imm->hw]); /* XXX */
> +       unsigned val = fui(pc->immd_buf[imm->hw - pc->param_nr * 4]);
>
>        set_long(pc, e);
>        /*XXX: can't be predicated - bits overlap.. catch cases where both
> @@ -505,12 +505,11 @@ emit_mov(struct nv50_pc *pc, struct nv50_reg *dst,
> struct nv50_reg *src)
>
>        set_dst(pc, dst, e);
>
> -       if (0 && dst->type != P_RESULT && src->type == P_IMMD) {
> +       if (pc->allow32 && dst->type != P_RESULT && src->type == P_IMMD) {
>                set_immd(pc, src, e);
>                /*XXX: 32-bit, but steals part of "half" reg space - need to
>                 *     catch and handle this case if/when we do half-regs
>                 */
> -               e->inst[0] |= 0x00008000;
>        } else
>        if (src->type == P_IMMD || src->type == P_CONST) {
>                set_long(pc, e);
> @@ -526,13 +525,15 @@ emit_mov(struct nv50_pc *pc, struct nv50_reg *dst,
> struct nv50_reg *src)
>                e->inst[0] |= (src->hw << 9);
>        }
>
> -       /* We really should support "half" instructions here at some point,
> -        * but I don't feel confident enough about them yet.
> -        */
> -       set_long(pc, e);
> -       if (is_long(e) && !is_immd(e)) {
> +       if (!is_long(e) || is_immd(e))
> +               e->inst[0] |= 0x00008000;
> +       else {
>                e->inst[1] |= 0x04000000; /* 32-bit */
> -               e->inst[1] |= 0x0003c000; /* "subsubop" 0xf == mov */
> +
> +               /* XXX: look into this 0x3 or 0xf again */
> +               e->inst[1] |= 0x0000c000; /* "subsubop" 0x3 */
> +               if (!(e->inst[1] & 0x20000000))
> +                       e->inst[1] |= 0x00030000; /* "subsubop" 0xf */
>        }
>
>        emit(pc, e);
> @@ -606,6 +607,7 @@ set_src_1(struct nv50_pc *pc, struct nv50_reg *src,
> struct nv50_program_exec *e)
>        e->inst[0] |= (src->hw << 16);
>  }
>
> +/* XXX: can source 2 really be a constant ? */
>  static void
>  set_src_2(struct nv50_pc *pc, struct nv50_reg *src, struct
> nv50_program_exec *e)
>  {
> @@ -670,7 +672,10 @@ emit_add(struct nv50_pc *pc, struct nv50_reg *dst,
>        check_swap_src_0_1(pc, &src0, &src1);
>        set_dst(pc, dst, e);
>        set_src_0(pc, src0, e);
> -       if (is_long(e))
> +       if (!is_long(e) && src1->type == P_IMMD && pc->allow32)
> +               set_immd(pc, src1, e);
> +       else
> +       if (requires_long(e, src1))
>                set_src_2(pc, src1, e);
>        else
>                set_src_1(pc, src1, e);
> @@ -902,6 +907,7 @@ emit_lit(struct nv50_pc *pc, struct nv50_reg **dst,
> unsigned mask,
>        struct nv50_reg *neg128 = alloc_immd(pc, -127.999999);
>        struct nv50_reg *pos128 = alloc_immd(pc,  127.999999);
>        struct nv50_reg *tmp[4];
> +       boolean allow32 = pc->allow32;
>
>        if (mask & (3 << 1)) {
>                if (mask & (1 << 1))
> @@ -911,6 +917,8 @@ emit_lit(struct nv50_pc *pc, struct nv50_reg **dst,
> unsigned mask,
>                emit_minmax(pc, 4, tmp[0], src[0], zero);
>        }
>
> +       pc->allow32 = FALSE;
> +
>        if (mask & (1 << 2)) {
>                set_pred_wr(pc, 1, 0, pc->p->exec_tail);
>
> @@ -926,6 +934,8 @@ emit_lit(struct nv50_pc *pc, struct nv50_reg **dst,
> unsigned mask,
>                set_pred(pc, 3, 0, pc->p->exec_tail);
>        }
>
> +       pc->allow32 = allow32;
> +
>        /* do this last, in case src[i,j] == dst[0,3] */
>        if (mask & (1 << 0))
>                emit_mov(pc, dst[0], one);
>
> commit 88dbc993e651da91d66c4ca471d11ee5aa2b5085
> Author: chr <chr@LAPTOP.(none)>
> Date:   Wed May 6 11:50:17 2009 +0200
>
>    Use multiple (3 for now: PVP, PFP, PMISC) constant buffers.
>
> diff --git a/src/gallium/drivers/nv50/nv50_program.c
> b/src/gallium/drivers/nv50/nv50_program.c
> index 2ab7b57..6e279bd 100644
> --- a/src/gallium/drivers/nv50/nv50_program.c
> +++ b/src/gallium/drivers/nv50/nv50_program.c
> @@ -426,7 +426,7 @@ set_dst(struct nv50_pc *pc, struct nv50_reg *dst,
> struct nv50_program_exec *e)
>  static INLINE void
>  set_immd(struct nv50_pc *pc, struct nv50_reg *imm, struct
> nv50_program_exec *e)
>  {
> -       unsigned val = fui(pc->immd_buf[imm->hw - pc->param_nr * 4]);
> +       unsigned val = fui(pc->immd_buf[imm->hw]);
>
>        set_long(pc, e);
>        /*XXX: can't be predicated - bits overlap.. catch cases where both
> @@ -478,22 +478,14 @@ set_data(struct nv50_pc *pc, struct nv50_reg *src,
> unsigned m, unsigned s,
>         struct nv50_program_exec *e)
>  {
>        set_long(pc, e);
> -#if 1
> -       e->inst[1] |= (1 << 22);
> -#else
> -       if (src->type == P_IMMD) {
> -               e->inst[1] |= (NV50_CB_PMISC << 22);
> -       } else {
> -               if (pc->p->type == PIPE_SHADER_VERTEX)
> -                       e->inst[1] |= (NV50_CB_PVP << 22);
> -               else
> -                       e->inst[1] |= (NV50_CB_PFP << 22);
> -       }
> -#endif
>
> +       /* XXX: param.bs can be extracted from inst[1] */
> +       e->param.bs = (src->type == P_IMMD) ? 0 : 1;
>        e->param.index = src->hw;
>        e->param.shift = s;
>        e->param.mask = m << (s % 32);
> +
> +       e->inst[1] |= (e->param.bs << 22);
>  }
>
>  static void
> @@ -1502,7 +1494,7 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union
> tgsi_full_token *tok)
>                }
>                break;
>        case TGSI_OPCODE_TEX:
> -       case TGSI_OPCODE_TXP:
> +       case TGSI_OPCODE_TXP: /* XXX: TXP should use w-component as iv on
> interp */
>        {
>                struct nv50_reg *t[4];
>                struct nv50_program_exec *e;
> @@ -1977,7 +1969,7 @@ nv50_program_tx_prep(struct nv50_pc *pc)
>        }
>
>        if (pc->immd_nr) {
> -               int rid = pc->param_nr * 4;
> +               int rid = 0;
>
>                pc->immd = CALLOC(pc->immd_nr * 4, sizeof(struct nv50_reg));
>                if (!pc->immd)
> @@ -2121,7 +2113,7 @@ nv50_program_validate(struct nv50_context *nv50,
> struct nv50_program *p)
>
>  static void
>  nv50_program_upload_data(struct nv50_context *nv50, float *map,
> -                        unsigned start, unsigned count)
> +                       unsigned start, unsigned count, unsigned cbuf)
>  {
>        struct nouveau_channel *chan = nv50->screen->nvws->channel;
>        struct nouveau_grobj *tesla = nv50->screen->tesla;
> @@ -2130,7 +2122,7 @@ nv50_program_upload_data(struct nv50_context *nv50,
> float *map,
>                unsigned nr = count > 2047 ? 2047 : count;
>
>                BEGIN_RING(chan, tesla, 0x00000f00, 1);
> -               OUT_RING  (chan, (NV50_CB_PMISC << 0) | (start << 8));
> +               OUT_RING  (chan, (cbuf << 0) | (start << 8));
>                BEGIN_RING(chan, tesla, 0x40000f04, nr);
>                OUT_RINGp (chan, map, nr);
>
> @@ -2145,35 +2137,48 @@ nv50_program_validate_data(struct nv50_context
> *nv50, struct nv50_program *p)
>  {
>        struct nouveau_winsys *nvws = nv50->screen->nvws;
>        struct pipe_winsys *ws = nv50->pipe.winsys;
> -       unsigned nr = p->param_nr + p->immd_nr;
>
> -       if (!p->data && nr) {
> -               struct nouveau_resource *heap = nv50->screen->vp_data_heap;
> +       if (!p->data[0] && p->immd_nr) {
> +               struct nouveau_resource *heap = nv50->screen->immd_heap[0];
> +
> +               if (nvws->res_alloc(heap, p->immd_nr, p, &p->data[0])) {
> +                       while (heap->next && heap->size < p->immd_nr) {
> +                               struct nv50_program *evict =
> heap->next->priv;
> +                               nvws->res_free(&evict->data[0]);
> +                       }
> +
> +                       if (nvws->res_alloc(heap, p->immd_nr, p,
> &p->data[0]))
> +                               assert(0);
> +               }
> +
> +               /* immediates only need to be uploaded again when freed */
> +               nv50_program_upload_data(nv50, p->immd, p->data[0]->start,
> +
>  p->immd_nr, NV50_CB_PMISC);
> +       }
> +
> +       if (!p->data[1] && p->param_nr) {
> +               struct nouveau_resource *heap =
> nv50->screen->parm_heap[p->type];
>
> -               if (nvws->res_alloc(heap, nr, p, &p->data)) {
> -                       while (heap->next && heap->size < nr) {
> +               if (nvws->res_alloc(heap, p->param_nr, p, &p->data[1])) {
> +                       while (heap->next && heap->size < p->param_nr) {
>                                struct nv50_program *evict =
> heap->next->priv;
> -                               nvws->res_free(&evict->data);
> +                               nvws->res_free(&evict->data[1]);
>                        }
>
> -                       if (nvws->res_alloc(heap, nr, p, &p->data))
> +                       if (nvws->res_alloc(heap, p->param_nr, p,
> &p->data[1]))
>                                assert(0);
>                }
>        }
>
>        if (p->param_nr) {
> +               unsigned cbuf;
>                float *map = ws->buffer_map(ws, nv50->constbuf[p->type],
>                                            PIPE_BUFFER_USAGE_CPU_READ);
> -               nv50_program_upload_data(nv50, map, p->data->start,
> -                                        p->param_nr);
> +               cbuf = (p->type == PIPE_SHADER_VERTEX) ? NV50_CB_PVP :
> NV50_CB_PFP;
> +               nv50_program_upload_data(nv50, map, p->data[1]->start,
> +
>  p->param_nr, cbuf);
>                ws->buffer_unmap(ws, nv50->constbuf[p->type]);
>        }
> -
> -       if (p->immd_nr) {
> -               nv50_program_upload_data(nv50, p->immd,
> -                                        p->data->start + p->param_nr,
> -                                        p->immd_nr);
> -       }
>  }
>
>  static void
> @@ -2193,20 +2198,26 @@ nv50_program_validate_code(struct nv50_context
> *nv50, struct nv50_program *p)
>                upload = TRUE;
>        }
>
> -       if (p->data && p->data->start != p->data_start) {
> +       if ((p->data[0] && p->data[0]->start != p->data_start[0]) ||
> +               (p->data[1] && p->data[1]->start != p->data_start[1]))
> +       {
>                for (e = p->exec_head; e; e = e->next) {
>                        unsigned ei, ci;
>
>                        if (e->param.index < 0)
>                                continue;
>                        ei = e->param.shift >> 5;
> -                       ci = e->param.index + p->data->start;
> +                       ci = e->param.index + p->data[e->param.bs]->start;
>
>                        e->inst[ei] &= ~e->param.mask;
>                        e->inst[ei] |= (ci << e->param.shift);
>                }
>
> -               p->data_start = p->data->start;
> +               if (p->data[0])
> +                       p->data_start[0] = p->data[0]->start;
> +               if (p->data[1])
> +                       p->data_start[1] = p->data[1]->start;
> +
>                upload = TRUE;
>        }
>
> @@ -2364,7 +2375,8 @@ nv50_program_destroy(struct nv50_context *nv50,
> struct nv50_program *p)
>        if (p->buffer)
>                pipe_buffer_reference(&p->buffer, NULL);
>
> -       nv50->screen->nvws->res_free(&p->data);
> +       nv50->screen->nvws->res_free(&p->data[0]);
> +       nv50->screen->nvws->res_free(&p->data[1]);
>
>        p->translated = 0;
>  }
> diff --git a/src/gallium/drivers/nv50/nv50_program.h
> b/src/gallium/drivers/nv50/nv50_program.h
> index 3b3b6bb..9dd0f37 100644
> --- a/src/gallium/drivers/nv50/nv50_program.h
> +++ b/src/gallium/drivers/nv50/nv50_program.h
> @@ -10,6 +10,7 @@ struct nv50_program_exec {
>        unsigned inst[2];
>        struct {
>                int index;
> +               int bs; /* buffer selector */
>                unsigned mask;
>                unsigned shift;
>        } param;
> @@ -24,8 +25,8 @@ struct nv50_program {
>        struct nv50_program_exec *exec_head;
>        struct nv50_program_exec *exec_tail;
>        unsigned exec_size;
> -       struct nouveau_resource *data;
> -       unsigned data_start;
> +       struct nouveau_resource *data[2];
> +       unsigned data_start[2];
>
>        struct pipe_buffer *buffer;
>
> diff --git a/src/gallium/drivers/nv50/nv50_screen.c
> b/src/gallium/drivers/nv50/nv50_screen.c
> index 2980564..268eeeb 100644
> --- a/src/gallium/drivers/nv50/nv50_screen.c
> +++ b/src/gallium/drivers/nv50/nv50_screen.c
> @@ -290,20 +290,61 @@ nv50_screen_create(struct pipe_winsys *ws, struct
> nouveau_winsys *nvws)
>        so_method(so, screen->tesla, 0x16b8, 1);
>        so_data  (so, 8);
>
> -       /* Shared constant buffer */
> -       screen->constbuf = screen->pipe.buffer_create(&screen->pipe, 0, 0,
> 128 * 4 * 4);
> -       if (nvws->res_init(&screen->vp_data_heap, 0, 128)) {
> -               NOUVEAU_ERR("Error initialising constant buffer\n");
> +       /* constant buffers for immediates and VP/FP parameters */
> +       screen->constbuf_misc[0] =
> +               screen->pipe.buffer_create(&screen->pipe, 0, 0, 128 * 4 *
> 4);
> +
> +       screen->constbuf_parm[0] =
> +               screen->pipe.buffer_create(&screen->pipe, 0, 0, 128 * 4 *
> 4);
> +
> +       screen->constbuf_parm[1] =
> +               screen->pipe.buffer_create(&screen->pipe, 0, 0, 128 * 4 *
> 4);
> +
> +       if (nvws->res_init(&screen->immd_heap[0], 0, 128) ||
> +               nvws->res_init(&screen->parm_heap[0], 0, 128) ||
> +               nvws->res_init(&screen->parm_heap[1], 0, 128))
> +       {
> +               NOUVEAU_ERR("Error initialising constant buffers.\n");
>                nv50_screen_destroy(&screen->pipe);
>                return NULL;
>        }
>
>        so_method(so, screen->tesla, 0x1280, 3);
> -       so_reloc (so, screen->constbuf, 0, NOUVEAU_BO_VRAM |
> +       so_reloc (so, screen->constbuf_misc[0], 0, NOUVEAU_BO_VRAM |
>                  NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
> -       so_reloc (so, screen->constbuf, 0, NOUVEAU_BO_VRAM |
> +       so_reloc (so, screen->constbuf_misc[0], 0, NOUVEAU_BO_VRAM |
>                  NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
> -       so_data  (so, (NV50_CB_PMISC << 16) | 0x00001000);
> +       so_data  (so, (NV50_CB_PMISC << 16) | 0x00000800);
> +       so_method(so, screen->tesla, 0x1694, 1);
> +       so_data  (so, 0x00000001 | (NV50_CB_PMISC << 12));
> +       so_method(so, screen->tesla, 0x1694, 1);
> +       so_data  (so, 0x00000031 | (NV50_CB_PMISC << 12));
> +
> +       so_method(so, screen->tesla, 0x1280, 3);
> +       so_reloc (so, screen->constbuf_parm[0], 0, NOUVEAU_BO_VRAM |
> +                 NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
> +       so_reloc (so, screen->constbuf_parm[0], 0, NOUVEAU_BO_VRAM |
> +                 NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
> +       so_data  (so, (NV50_CB_PVP << 16) | 0x00000800);
> +       so_method(so, screen->tesla, 0x1694, 1);
> +       so_data  (so, 0x00000101 | (NV50_CB_PVP << 12));
> +
> +       so_method(so, screen->tesla, 0x1280, 3);
> +       so_reloc (so, screen->constbuf_parm[1], 0, NOUVEAU_BO_VRAM |
> +                 NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
> +       so_reloc (so, screen->constbuf_parm[1], 0, NOUVEAU_BO_VRAM |
> +                 NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
> +       so_data  (so, (NV50_CB_PMISC << 16) | 0x00000800);
> +       so_method(so, screen->tesla, 0x1694, 1);
> +       so_data  (so, 0x00000131 | (NV50_CB_PFP << 12));
> +
> +       /*
> +       // map VP and FP CB index 0 to CB_PMISC
> +       so_method(so, screen->tesla, 0x1694, 1);
> +       so_data  (so, 0x000BBNP1 = 0x00000001);
> +       so_method(so, screen->tesla, 0x1694, 1);
> +       so_data  (so, 0x000BBNP1 = 0x00000031);
> +       */
>
>        /* Texture sampler/image unit setup - we abuse the constant buffer
>         * upload mechanism for the moment to upload data to the tex config
> diff --git a/src/gallium/drivers/nv50/nv50_screen.h
> b/src/gallium/drivers/nv50/nv50_screen.h
> index db567aa..31b8ef2 100644
> --- a/src/gallium/drivers/nv50/nv50_screen.h
> +++ b/src/gallium/drivers/nv50/nv50_screen.h
> @@ -15,8 +15,11 @@ struct nv50_screen {
>        struct nouveau_grobj *m2mf;
>        struct nouveau_notifier *sync;
>
> -       struct pipe_buffer *constbuf;
> -       struct nouveau_resource *vp_data_heap;
> +       struct pipe_buffer *constbuf_misc[1];
> +       struct pipe_buffer *constbuf_parm[2];
> +
> +       struct nouveau_resource *immd_heap[1];
> +       struct nouveau_resource *parm_heap[2];
>
>        struct pipe_buffer *tic;
>        struct pipe_buffer *tsc;
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
>

--0021cc0223827fdb63046a024a0e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Chris,<br>Did this (and other patches that you wrote) get merged yet? Di=
d you create an account? I&#39;m interested in your work and would like to =
test it.<br><br><div class=3D"gmail_quote">On Wed, May 6, 2009 at 10:28 AM,=
 Christoph Bumiller <span dir=3D"ltr">&lt;<a href=3D"mailto:e0425955@studen=
t.tuwien.ac.at" target=3D"_blank">e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org</a>&gt;</sp=
an> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Hi ! I&#39;ve bee=
n trying to improve NV50 shader generation a bit the last couple of weeks, =
so here is<br>


what I&#39;ve produced. I don&#39;t know if it&#39;s usable for you or just=
 a pile of horrible hacks, but at<br>
least it makes some mesa demos render more correcly, p.e. the teapot (aside=
 from mip-mapping issues<br>
of the floor texture), arbfplight, and I think the gears also didn&#39;t ap=
pear as they should before,<br>
and I hope it doesn&#39;t break others that worked.<br>
I also tried playing neverball and neverputt, which at some point worked fi=
ne, but now it locks up<br>
the GPU again after a certain (short) amount of time. That&#39;s probably n=
ot related to my<br>
modifications, because it crashes without the patches as well (plus has som=
e flickering and other<br>
graphics errors). It seems to work OK if I run it with valgrind, though.<br=
>
There also are and have been some random graphics errors that spam the kern=
el log with invalid<br>
method NV50TCL_VERTEX_END, so if something doesn&#39;t look right, try to r=
estart the program, or toggle<br>
some options in the mesa demos (show help, etc.).<br>
<br>
There might, as always, be some bugs in the patches, of course, and the the=
y probably can&#39;t be<br>
committed unmodified. I&#39;ve not put them in the email text but as attach=
ments because there&#39;s rather<br>
many changes. There&#39;s a short description (commit log) in each patch, b=
ut I hope the code speaks for<br>
itself, otherwise I&#39;ll provide more explanation / add more comments ...=
 later.<br>
These don&#39;t represent everything I&#39;ve tried to improve, but the res=
t isn&#39;t in any usable shape yet.<br>
<br>
If anyone who knows their way around the gallium code has time, please have=
 a look and tell me what<br>
you think. Thank you.<br>
<font color=3D"#888888"><br>
Christoph<br>
</font><br>commit 7ab9fc73707be46375668e557b5a5c1a373096ad<br>
Author: chr &lt;chr@LAPTOP.(none)&gt;<br>
Date: =A0 Sun May 3 21:03:35 2009 +0200<br>
<br>
 =A0 =A0Remove some memory leaks: free allocated temp in all opcode cases<b=
r>
 =A0 =A0of tx_insn; free nv50_regs for immds in LIT and those allocated in<=
br>
 =A0 =A0tgsi_src.<br>
 =A0 =A0Make LRP use 2 instructions (SUB,MAD) instead of 3 (NEG,MAD,MAD).<b=
r>
<br>
diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/=
nv50/nv50_program.c<br>
index 2d15868..1a94327 100644<br>
--- a/src/gallium/drivers/nv50/nv50_program.c<br>
+++ b/src/gallium/drivers/nv50/nv50_program.c<br>
@@ -28,6 +28,7 @@<br>
=A0#include &quot;pipe/p_shader_tokens.h&quot;<br>
=A0#include &quot;tgsi/tgsi_parse.h&quot;<br>
=A0#include &quot;tgsi/tgsi_util.h&quot;<br>
+#include &quot;tgsi/tgsi_dump.h&quot;<br>
<br>
=A0#include &quot;nv50_context.h&quot;<br>
<br>
@@ -795,12 +796,6 @@ emit_lit(struct nv50_pc *pc, struct nv50_reg **dst, un=
signed mask,<br>
 =A0 =A0 =A0 =A0struct nv50_reg *pos128 =3D alloc_immd(pc, =A0127.999999);<=
br>
 =A0 =A0 =A0 =A0struct nv50_reg *tmp[4];<br>
<br>
- =A0 =A0 =A0 if (mask &amp; (1 &lt;&lt; 0))<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_mov(pc, dst[0], one);<br>
-<br>
- =A0 =A0 =A0 if (mask &amp; (1 &lt;&lt; 3))<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_mov(pc, dst[3], one);<br>
-<br>
 =A0 =A0 =A0 =A0if (mask &amp; (3 &lt;&lt; 1)) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (mask &amp; (1 &lt;&lt; 1))<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tmp[0] =3D dst[1];<br>
@@ -823,6 +818,18 @@ emit_lit(struct nv50_pc *pc, struct nv50_reg **dst, un=
signed mask,<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0emit_mov(pc, dst[2], zero);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0set_pred(pc, 3, 0, pc-&gt;p-&gt;exec_tail);=
<br>
 =A0 =A0 =A0 =A0}<br>
+<br>
+ =A0 =A0 =A0 /* do this last, in case src[i,j] =3D=3D dst[0,3] */<br>
+ =A0 =A0 =A0 if (mask &amp; (1 &lt;&lt; 0))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_mov(pc, dst[0], one);<br>
+<br>
+ =A0 =A0 =A0 if (mask &amp; (1 &lt;&lt; 3))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_mov(pc, dst[3], one);<br>
+<br>
+ =A0 =A0 =A0 FREE(pos128);<br>
+ =A0 =A0 =A0 FREE(neg128);<br>
+ =A0 =A0 =A0 FREE(zero);<br>
+ =A0 =A0 =A0 FREE(one);<br>
=A0}<br>
<br>
=A0static void<br>
@@ -885,8 +892,9 @@ tgsi_src(struct nv50_pc *pc, int chan, const struct tgs=
i_full_src_register *src)<br>
=A0{<br>
 =A0 =A0 =A0 =A0struct nv50_reg *r =3D NULL;<br>
 =A0 =A0 =A0 =A0struct nv50_reg *temp;<br>
- =A0 =A0 =A0 unsigned c;<br>
+ =A0 =A0 =A0 unsigned sgn, c;<br>
<br>
+ =A0 =A0 =A0 sgn =3D tgsi_util_get_full_src_register_sign_mode(src, chan);=
<br>
 =A0 =A0 =A0 =A0c =3D tgsi_util_get_full_src_register_extswizzle(src, chan)=
;<br>
 =A0 =A0 =A0 =A0switch (c) {<br>
 =A0 =A0 =A0 =A0case TGSI_EXTSWIZZLE_X:<br>
@@ -915,16 +923,18 @@ tgsi_src(struct nv50_pc *pc, int chan, const struct t=
gsi_full_src_register *src)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
 =A0 =A0 =A0 =A0case TGSI_EXTSWIZZLE_ZERO:<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0r =3D alloc_immd(pc, 0.0);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return r;<br>
 =A0 =A0 =A0 =A0case TGSI_EXTSWIZZLE_ONE:<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 r =3D alloc_immd(pc, 1.0);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (sgn =3D=3D TGSI_UTIL_SIGN_TOGGLE || sgn =
=3D=3D TGSI_UTIL_SIGN_SET)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return alloc_immd(pc, -1.0);<=
br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 else<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return alloc_immd(pc, 1.0);<b=
r>
 =A0 =A0 =A0 =A0default:<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0assert(0);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
 =A0 =A0 =A0 =A0}<br>
<br>
- =A0 =A0 =A0 switch (tgsi_util_get_full_src_register_sign_mode(src, chan))=
 {<br>
+ =A0 =A0 =A0 switch (sgn) {<br>
 =A0 =A0 =A0 =A0case TGSI_UTIL_SIGN_KEEP:<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
 =A0 =A0 =A0 =A0case TGSI_UTIL_SIGN_CLEAR:<br>
@@ -955,7 +965,7 @@ static boolean<br>
=A0nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *to=
k)<br>
=A0{<br>
 =A0 =A0 =A0 =A0const struct tgsi_full_instruction *inst =3D &amp;tok-&gt;F=
ullInstruction;<br>
- =A0 =A0 =A0 struct nv50_reg *rdst[4], *dst[4], *src[3][4], *temp;<br>
+ =A0 =A0 =A0 struct nv50_reg *rdst[4], *dst[4], *src[3][4], *temp =3D NULL=
;<br>
 =A0 =A0 =A0 =A0unsigned mask, sat, unit;<br>
 =A0 =A0 =A0 =A0int i, c;<br>
<br>
@@ -1021,7 +1031,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union =
tgsi_full_token *tok)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;<b=
r>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0emit_mov(pc, dst[c], temp);=
<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 free_temp(pc, temp);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
 =A0 =A0 =A0 =A0case TGSI_OPCODE_DP4:<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0temp =3D alloc_temp(pc, NULL);<br>
@@ -1034,7 +1043,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union =
tgsi_full_token *tok)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;<b=
r>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0emit_mov(pc, dst[c], temp);=
<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 free_temp(pc, temp);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
 =A0 =A0 =A0 =A0case TGSI_OPCODE_DPH:<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0temp =3D alloc_temp(pc, NULL);<br>
@@ -1047,7 +1055,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union =
tgsi_full_token *tok)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;<b=
r>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0emit_mov(pc, dst[c], temp);=
<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 free_temp(pc, temp);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
 =A0 =A0 =A0 =A0case TGSI_OPCODE_DST:<br>
 =A0 =A0 =A0 =A0{<br>
@@ -1072,7 +1079,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union =
tgsi_full_token *tok)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;<b=
r>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0emit_mov(pc, dst[c], temp);=
<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 free_temp(pc, temp);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
 =A0 =A0 =A0 =A0case TGSI_OPCODE_FLR:<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (c =3D 0; c &lt; 4; c++) {<br>
@@ -1089,7 +1095,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union =
tgsi_full_token *tok)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0emit_flr(pc, temp, src[0][c=
]);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0emit_sub(pc, dst[c], src[0]=
[c], temp);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 free_temp(pc, temp);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
 =A0 =A0 =A0 =A0case TGSI_OPCODE_KIL:<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0emit_kil(pc, src[0][0]);<br>
@@ -1110,15 +1115,12 @@ nv50_program_tx_insn(struct nv50_pc *pc, const unio=
n tgsi_full_token *tok)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
 =A0 =A0 =A0 =A0case TGSI_OPCODE_LRP:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 temp =3D alloc_temp(pc, NULL);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (c =3D 0; c &lt; 4; c++) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!(mask &amp; (1 &lt;&lt=
; c)))<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;<b=
r>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*XXX: we can do better than =
this */<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 temp =3D alloc_temp(pc, NULL)=
;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_neg(pc, temp, src[0][c])=
;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_mad(pc, temp, temp, src[=
2][c], src[2][c]);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_mad(pc, dst[c], src[0][c=
], src[1][c], temp);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 free_temp(pc, temp);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_sub(pc, temp, src[1][c],=
 src[2][c]);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_mad(pc, dst[c], temp, sr=
c[0][c], src[2][c]);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
 =A0 =A0 =A0 =A0case TGSI_OPCODE_MAD:<br>
@@ -1164,7 +1166,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union =
tgsi_full_token *tok)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;<b=
r>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0emit_mov(pc, dst[c], temp);=
<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 free_temp(pc, temp);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
 =A0 =A0 =A0 =A0case TGSI_OPCODE_RCP:<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (c =3D 0; c &lt; 4; c++) {<br>
@@ -1259,7 +1260,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union =
tgsi_full_token *tok)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0emit_mul(pc, temp, src[0][1=
], src[1][0]);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0emit_msb(pc, dst[2], src[0]=
[0], src[1][1], temp);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 free_temp(pc, temp);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
 =A0 =A0 =A0 =A0case TGSI_OPCODE_END:<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
@@ -1268,6 +1268,9 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union =
tgsi_full_token *tok)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return FALSE;<br>
 =A0 =A0 =A0 =A0}<br>
<br>
+ =A0 =A0 =A0 if (temp)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 free_temp(pc, temp);<br>
+<br>
 =A0 =A0 =A0 =A0if (sat) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (c =3D 0; c &lt; 4; c++) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct nv50_program_exec *e=
;<br>
@@ -1288,6 +1291,19 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union=
 tgsi_full_token *tok)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
 =A0 =A0 =A0 =A0}<br>
<br>
+ =A0 =A0 =A0 for (i =3D 0; i &lt; inst-&gt;Instruction.NumSrcRegs; i++) {<=
br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (c =3D 0; c &lt; 4; c++) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!src[i][c])<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (src[i][c]-&gt;index =3D=
=3D -1 &amp;&amp; src[i][c]-&gt;type =3D=3D P_IMMD)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 FREE(src[i][c=
]);<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Might also release tempora=
ries not used anymore in this loop,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* therefore no temp_immd a=
nd temp_immd_nr like for temp_temp.<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 }<br>
+<br>
 =A0 =A0 =A0 =A0kill_temp_temp(pc);<br>
 =A0 =A0 =A0 =A0return TRUE;<br>
=A0}<br>
<br>commit 93d8cfb3e13179d6ed28c4989cefc92389008f0b<br>
Author: chr &lt;chr@LAPTOP.(none)&gt;<br>
Date: =A0 Tue May 5 20:54:43 2009 +0200<br>
<br>
 =A0 =A0- extend nv50_pc to track insn nr, add allow half insn boolean<br>
 =A0 =A0- extend nv50_reg to record insn of last use and FP output hw index=
<br>
 =A0 =A0- add some functions for later use<br>
 =A0 =A0- modify alloc_reg to prefer final FP output hw if set<br>
 =A0 =A0- record interpolation mode in tx_prep<br>
 =A0 =A0- count number of insns in tx_prep<br>
 =A0 =A0- record depth output, and position and color input indices<br>
 =A0 =A0- inspect instructions for register usage<br>
 =A0 =A0- set pc-&gt;allow32 to FALSE on first and last insn<br>
<br>
 =A0 =A0shouldn&#39;t change generated shader code yet<br>
<br>
diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/=
nv50/nv50_program.c<br>
index 1a94327..cb92a31 100644<br>
--- a/src/gallium/drivers/nv50/nv50_program.c<br>
+++ b/src/gallium/drivers/nv50/nv50_program.c<br>
@@ -86,6 +86,9 @@ struct nv50_reg {<br>
<br>
 =A0 =A0 =A0 =A0int hw;<br>
 =A0 =A0 =A0 =A0int neg;<br>
+<br>
+ =A0 =A0 =A0 int rhw; /* result hw for FP outputs */<br>
+ =A0 =A0 =A0 int acc; /* instruction where this reg is last read (first in=
sn =3D=3D 1) */<br>
=A0};<br>
<br>
=A0struct nv50_pc {<br>
@@ -109,6 +112,12 @@ struct nv50_pc {<br>
<br>
 =A0 =A0 =A0 =A0struct nv50_reg *temp_temp[16];<br>
 =A0 =A0 =A0 =A0unsigned temp_temp_nr;<br>
+<br>
+ =A0 =A0 =A0 /* current instruction and total number of insns */<br>
+ =A0 =A0 =A0 unsigned insn_cur;<br>
+ =A0 =A0 =A0 unsigned insn_nr;<br>
+<br>
+ =A0 =A0 =A0 boolean allow32; /* TRUE when half insns are allowed */<br>
=A0};<br>
<br>
=A0static void<br>
@@ -132,7 +141,24 @@ alloc_reg(struct nv50_pc *pc, struct nv50_reg *reg)<br=
>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;<br>
 =A0 =A0 =A0 =A0}<br>
<br>
- =A0 =A0 =A0 for (i =3D 0; i &lt; NV50_SU_MAX_TEMP; i++) {<br>
+ =A0 =A0 =A0 i =3D 0;<br>
+ =A0 =A0 =A0 if (reg-&gt;rhw !=3D -1) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* try to allocate temporary with index rhw f=
irst */<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!(pc-&gt;r_temp[reg-&gt;rhw])) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pc-&gt;r_temp[reg-&gt;rhw] =
=3D reg;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg-&gt;hw =3D reg-&gt;rhw;<b=
r>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pc-&gt;p-&gt;cfg.high_tem=
p &lt; (reg-&gt;rhw + 1))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pc-&gt;p-&gt;=
cfg.high_temp =3D reg-&gt;rhw + 1;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 =A0/* If we can&#39;t allocate the final destination index of=
 the output,<br>
+ =A0 =A0 =A0 =A0 * put it in a high temporary so we need not shuffle aroun=
d later.<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* (like, $r0 needs to go in $r1 and $r1 in=
 $r0 etc.)<br>
+ =A0 =A0 =A0 =A0 */<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i =3D pc-&gt;result_nr * 4;<br>
+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 for (; i &lt; NV50_SU_MAX_TEMP; i++) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!(pc-&gt;r_temp[i])) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pc-&gt;r_temp[i] =3D reg;<b=
r>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg-&gt;hw =3D i;<br>
@@ -160,6 +186,7 @@ alloc_temp(struct nv50_pc *pc, struct nv50_reg *dst)<br=
>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0r-&gt;type =3D P_TEMP;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0r-&gt;index =3D -1;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0r-&gt;hw =3D i;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 r-&gt;rhw =3D -1;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pc-&gt;r_temp[i] =3D r;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return r;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
@@ -169,6 +196,56 @@ alloc_temp(struct nv50_pc *pc, struct nv50_reg *dst)<b=
r>
 =A0 =A0 =A0 =A0return NULL;<br>
=A0}<br>
<br>
+static struct nv50_reg *<br>
+alloc_preferred_temp(struct nv50_pc *pc, int hw)<br>
+{<br>
+ =A0 =A0 =A0 struct nv50_reg *r;<br>
+<br>
+ =A0 =A0 =A0 if (hw &gt;=3D NV50_SU_MAX_TEMP || hw =3D=3D -1 || pc-&gt;r_t=
emp[hw])<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return alloc_temp(pc, NULL);<br>
+<br>
+ =A0 =A0 =A0 r =3D CALLOC_STRUCT(nv50_reg);<br>
+ =A0 =A0 =A0 r-&gt;type =3D P_TEMP;<br>
+ =A0 =A0 =A0 r-&gt;index =3D -1;<br>
+ =A0 =A0 =A0 r-&gt;hw =3D hw;<br>
+ =A0 =A0 =A0 r-&gt;rhw =3D -1;<br>
+ =A0 =A0 =A0 pc-&gt;r_temp[hw] =3D r;<br>
+<br>
+ =A0 =A0 =A0 return r;<br>
+}<br>
+<br>
+/* Assign the hw of the discarded temporary register src<br>
+ * to the tgsi register dst and free src.<br>
+ */<br>
+static void<br>
+assimilate_temp(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg =
*src)<br>
+{<br>
+ =A0 =A0 =A0 assert(dst-&gt;index !=3D -1 &amp;&amp; src-&gt;index =3D=3D =
-1 &amp;&amp; src-&gt;hw !=3D -1);<br>
+<br>
+ =A0 =A0 =A0 if (dst-&gt;hw !=3D -1)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 pc-&gt;r_temp[dst-&gt;hw] =3D NULL;<br>
+ =A0 =A0 =A0 pc-&gt;r_temp[src-&gt;hw] =3D dst;<br>
+ =A0 =A0 =A0 dst-&gt;hw =3D src-&gt;hw;<br>
+<br>
+ =A0 =A0 =A0 FREE(src);<br>
+}<br>
+<br>
+/* release the hardware resource held by r */<br>
+static void<br>
+release_hw(struct nv50_pc *pc, struct nv50_reg *r)<br>
+{<br>
+ =A0 =A0 =A0 assert(r-&gt;type =3D=3D P_TEMP);<br>
+ =A0 =A0 =A0 if (r-&gt;hw =3D=3D -1)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;<br>
+<br>
+ =A0 =A0 =A0 assert(pc-&gt;r_temp[r-&gt;hw] =3D=3D r);<br>
+ =A0 =A0 =A0 pc-&gt;r_temp[r-&gt;hw] =3D NULL;<br>
+<br>
+ =A0 =A0 =A0 r-&gt;acc =3D 0;<br>
+ =A0 =A0 =A0 if (r-&gt;index =3D=3D -1)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 FREE(r);<br>
+}<br>
+<br>
=A0static void<br>
=A0free_temp(struct nv50_pc *pc, struct nv50_reg *r)<br>
=A0{<br>
@@ -251,7 +328,14 @@ alloc_immd(struct nv50_pc *pc, float f)<br>
 =A0 =A0 =A0 =A0struct nv50_reg *r =3D CALLOC_STRUCT(nv50_reg);<br>
 =A0 =A0 =A0 =A0unsigned hw;<br>
<br>
- =A0 =A0 =A0 hw =3D ctor_immd(pc, f, 0, 0, 0) * 4;<br>
+ =A0 =A0 =A0 /* don&#39;t allocate more space if the value is already ther=
e */<br>
+ =A0 =A0 =A0 for (hw =3D 0; hw &lt; pc-&gt;immd_nr * 4; ++hw)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pc-&gt;immd_buf[hw] =3D=3D f)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
+<br>
+ =A0 =A0 =A0 if (hw =3D=3D pc-&gt;immd_nr * 4)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 hw =3D ctor_immd(pc, f, 0, 0, 0) * 4;<br>
+<br>
 =A0 =A0 =A0 =A0r-&gt;type =3D P_IMMD;<br>
 =A0 =A0 =A0 =A0r-&gt;hw =3D hw;<br>
 =A0 =A0 =A0 =A0r-&gt;index =3D -1;<br>
@@ -355,6 +439,12 @@ set_immd(struct nv50_pc *pc, struct nv50_reg *imm, str=
uct nv50_program_exec *e)<br>
 =A0 =A0 =A0 =A0e-&gt;inst[1] |=3D (val &gt;&gt; 6) &lt;&lt; 2;<br>
=A0}<br>
<br>
+<br>
+#define INTERP_LINEAR =A0 =A0 =A0 =A0 =A00<br>
+#define INTERP_FLAT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01<br>
+#define INTERP_PERSPECTIVE =A0 =A0 2<br>
+#define INTERP_CENTROID =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A04<br>
+<br>
=A0static void<br>
=A0emit_interp(struct nv50_pc *pc, struct nv50_reg *dst,<br>
 =A0 =A0 =A0 =A0 =A0 =A0struct nv50_reg *src, struct nv50_reg *iv)<br>
@@ -535,6 +625,14 @@ set_src_2(struct nv50_pc *pc, struct nv50_reg *src, st=
ruct nv50_program_exec *e)<br>
 =A0 =A0 =A0 =A0e-&gt;inst[1] |=3D (src-&gt;hw &lt;&lt; 14);<br>
=A0}<br>
<br>
+static boolean<br>
+requires_long(struct nv50_program_exec *e, struct nv50_reg *src)<br>
+{<br>
+ =A0 =A0 =A0 if (is_long(e) || src-&gt;type =3D=3D P_IMMD || src-&gt;type =
=3D=3D P_CONST)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return TRUE;<br>
+ =A0 =A0 =A0 return FALSE;<br>
+}<br>
+<br>
=A0static void<br>
=A0emit_mul(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src0=
,<br>
 =A0 =A0 =A0 =A0 struct nv50_reg *src1)<br>
@@ -870,6 +968,62 @@ emit_kil(struct nv50_pc *pc, struct nv50_reg *src)<br>
 =A0 =A0 =A0 =A0emit(pc, e);<br>
=A0}<br>
<br>
+static void<br>
+emit_nop(struct nv50_pc *pc, boolean l)<br>
+{<br>
+ =A0 =A0 =A0 struct nv50_program_exec *e =3D exec(pc);<br>
+<br>
+ =A0 =A0 =A0 e-&gt;inst[0] =3D 0xF0000000;<br>
+ =A0 =A0 =A0 if (l) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 set_long(pc, e);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 e-&gt;inst[1] =3D 0xE0000000;<br>
+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 emit(pc, e);<br>
+}<br>
+<br>
+/* Adjust a bitmask that indicates what components of a source are used,<b=
r>
+ * we use this in tx_prep so we only load interpolants that are needed.<br=
>
+ */<br>
+static void<br>
+insn_adjust_mask(const struct tgsi_full_instruction *insn, unsigned *mask)=
<br>
+{<br>
+ =A0 =A0 =A0 const struct tgsi_instruction_ext_texture *tex;<br>
+<br>
+ =A0 =A0 =A0 switch (insn-&gt;Instruction.Opcode) {<br>
+ =A0 =A0 =A0 case TGSI_OPCODE_DP3:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 *mask =3D 0x7;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 case TGSI_OPCODE_DP4:<br>
+ =A0 =A0 =A0 case TGSI_OPCODE_DPH:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 *mask =3D 0xF;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 case TGSI_OPCODE_LIT:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 *mask =3D 0xB;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 case TGSI_OPCODE_RCP:<br>
+ =A0 =A0 =A0 case TGSI_OPCODE_RSQ:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 *mask =3D 0x1;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 case TGSI_OPCODE_TXP:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 *mask =3D 0x8;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* fall through to TEX */<br>
+ =A0 =A0 =A0 case TGSI_OPCODE_TEX:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 assert(insn-&gt;Instruction.Extended);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 tex =3D &amp;insn-&gt;InstructionExtTexture;<=
br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (tex-&gt;Texture =3D=3D TGSI_TEXTURE_1D)<b=
r>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *mask |=3D 0x1;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 else<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (tex-&gt;Texture =3D=3D TGSI_TEXTURE_2D)<b=
r>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *mask |=3D 0x3;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 else<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *mask |=3D 0x7;<br>
+ =A0 =A0 =A0 default:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 }<br>
+}<br>
+<br>
=A0static struct nv50_reg *<br>
=A0tgsi_dst(struct nv50_pc *pc, int c, const struct tgsi_full_dst_register =
*dst)<br>
=A0{<br>
@@ -1308,12 +1462,53 @@ nv50_program_tx_insn(struct nv50_pc *pc, const unio=
n tgsi_full_token *tok)<br>
 =A0 =A0 =A0 =A0return TRUE;<br>
=A0}<br>
<br>
+static void<br>
+set_acc_array(unsigned *p, const struct tgsi_full_src_register *src,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned mask, unsigned n=
)<br>
+{<br>
+ =A0 =A0 =A0 unsigned k, c;<br>
+<br>
+ =A0 =A0 =A0 for (c =3D 0; c &lt; 4; c++) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!(mask &amp; (1 &lt;&lt; c)))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 k =3D tgsi_util_get_full_src_register_extswiz=
zle(src, c);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 switch (k) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 case TGSI_EXTSWIZZLE_X:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 case TGSI_EXTSWIZZLE_Y:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 case TGSI_EXTSWIZZLE_Z:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 case TGSI_EXTSWIZZLE_W:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p[src-&gt;SrcRegister.Index *=
 4 + k] =3D n;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 default:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 }<br>
+}<br>
+<br>
=A0static boolean<br>
=A0nv50_program_tx_prep(struct nv50_pc *pc)<br>
=A0{<br>
 =A0 =A0 =A0 =A0struct tgsi_parse_context p;<br>
 =A0 =A0 =A0 =A0boolean ret =3D FALSE;<br>
 =A0 =A0 =A0 =A0unsigned i, c;<br>
+ =A0 =A0 =A0 unsigned fcol, bcol, fcrd, depr;<br>
+<br>
+ =A0 =A0 =A0 /* record interpolation mode from declaration */<br>
+ =A0 =A0 =A0 boolean centroid_load =3D FALSE;<br>
+ =A0 =A0 =A0 boolean perspect_load =3D FALSE;<br>
+ =A0 =A0 =A0 unsigned interp_mode[32];<br>
+<br>
+ =A0 =A0 =A0 /* track register usage for temps and attrs */<br>
+ =A0 =A0 =A0 unsigned *last_t_use =3D NULL;<br>
+ =A0 =A0 =A0 unsigned *last_a_use =3D NULL;<br>
+<br>
+ =A0 =A0 =A0 depr =3D fcol =3D bcol =3D fcrd =3D 0xFFFFFFFF;<br>
+<br>
+ =A0 =A0 =A0 if (pc-&gt;p-&gt;type =3D=3D PIPE_SHADER_FRAGMENT) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 pc-&gt;p-&gt;cfg.fp.regs[0] =3D 0x01000404;<b=
r>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 pc-&gt;p-&gt;cfg.fp.regs[1] =3D 0x00000400;<b=
r>
+ =A0 =A0 =A0 }<br>
<br>
 =A0 =A0 =A0 =A0tgsi_parse_init(&amp;p, pc-&gt;p-&gt;pipe.tokens);<br>
 =A0 =A0 =A0 =A0while (!tgsi_parse_end_of_tokens(&amp;p)) {<br>
@@ -1326,6 +1521,10 @@ nv50_program_tx_prep(struct nv50_pc *pc)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const struct tgsi_full_imme=
diate *imm =3D<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&amp;p.Full=
Token.FullImmediate;<br>
<br>
+#ifdef NV50_PROGRAM_DUMP<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tgsi_dump_immediate(imm);<br>
+#endif<br>
+<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ctor_immd(pc, imm-&gt;u.Imm=
ediateFloat32[0].Float,<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0imm-&gt;u.ImmediateFloat32[1].Float,<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0imm-&gt;u.ImmediateFloat32[2].Float,<br>
@@ -1335,11 +1534,16 @@ nv50_program_tx_prep(struct nv50_pc *pc)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case TGSI_TOKEN_TYPE_DECLARATION:<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const struct tgsi_full_decl=
aration *d;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned last;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned last, first, mode;<b=
r>
<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0d =3D &amp;p.FullToken.Full=
Declaration;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 first =3D d-&gt;DeclarationRa=
nge.First;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0last =3D d-&gt;DeclarationR=
ange.Last;<br>
<br>
+#ifdef NV50_PROGRAM_DUMP<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tgsi_dump_declaration(d);<br>
+#endif<br>
+<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0switch (d-&gt;Declaration.F=
ile) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case TGSI_FILE_TEMPORARY:<b=
r>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (pc-&gt;=
temp_nr &lt; (last + 1))<br>
@@ -1348,10 +1552,71 @@ nv50_program_tx_prep(struct nv50_pc *pc)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case TGSI_FILE_OUTPUT:<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (pc-&gt;=
result_nr &lt; (last + 1))<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0pc-&gt;result_nr =3D last + 1;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!d-&gt;De=
claration.Semantic)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 break;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 switch (d-&gt=
;Semantic.SemanticName) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 case TGSI_SEM=
ANTIC_POSITION:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 depr =3D first;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 pc-&gt;p-&gt;cfg.fp.regs[2] |=3D 0x00000100;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 pc-&gt;p-&gt;cfg.fp.regs[3] |=3D 0x00000011;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 break;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 default:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 break;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case TGSI_FILE_INPUT:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (pc-&gt;=
attr_nr &lt; (last + 1))<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0pc-&gt;attr_nr =3D last + 1;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pc-&gt;p-=
&gt;type !=3D PIPE_SHADER_FRAGMENT)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 break;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 switch (d-&gt;Declara=
tion.Interpolate) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 case TGSI_INT=
ERPOLATE_CONSTANT:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 mode =3D INTERP_FLAT;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 break;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 case TGSI_INT=
ERPOLATE_PERSPECTIVE:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 mode =3D INTERP_PERSPECTIVE;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 perspect_load =3D TRUE;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 break;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 default:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 mode =3D INTERP_LINEAR;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 break;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (d-&gt;Dec=
laration.Semantic) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 switch (d-&gt;Semantic.SemanticName) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 case TGSI_SEMANTIC_POSITION:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 fcrd =3D first;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 case TGSI_SEMANTIC_COLOR:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 fcol =3D first;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 mode =3D INTERP_PERSPECTIVE;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 perspect_load =3D TRUE;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 case TGSI_SEMANTIC_BCOLOR:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 bcol =3D first;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 mode =3D INTERP_PERSPECTIVE;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 perspect_load =3D TRUE;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 default:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 }<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (d-&gt;Dec=
laration.Centroid) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 mode |=3D INTERP_CENTROID;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 centroid_load =3D TRUE;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 perspect_load =3D FALSE;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 assert(last &=
lt; 32);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D fi=
rst; i &lt;=3D last; i++)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 interp_mode[i] =3D mode;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case TGSI_FILE_CONSTANT:<br=
>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (pc-&gt;=
param_nr &lt; (last + 1))<br>
@@ -1367,6 +1632,43 @@ nv50_program_tx_prep(struct nv50_pc *pc)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case TGSI_TOKEN_TYPE_INSTRUCTION:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct tgsi_full_instru=
ction *insn;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct tgsi_full_src_re=
gister *src;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct tgsi_dst_registe=
r *dst;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned mask;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pc-&gt;insn_nr++;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!last_t_use) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 last_t_use =
=3D CALLOC(pc-&gt;temp_nr * 4, sizeof(unsigned));<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 last_a_use =
=3D CALLOC(pc-&gt;attr_nr * 4, sizeof(unsigned));<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 insn =3D &amp;tok-&gt;FullIns=
truction;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dst =3D &amp;insn-&gt;FullDst=
Registers[0].DstRegister;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mask =3D dst-&gt;WriteMask;<b=
r>
+<br>
+#ifdef NV50_PROGRAM_DUMP<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tgsi_dump_instruction(insn, 1=
);<br>
+#endif<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (dst-&gt;File =3D=3D TGSI_=
FILE_TEMPORARY) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (c =3D 0;=
 c &lt; 4; c++)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 if (mask &amp; (1 &lt;&lt; c))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 last_t_use[dst-&gt;Index * 4 + c] =3D pc-&gt;insn_nr;<b=
r>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 0; i &lt; insn-&gt=
;Instruction.NumSrcRegs; ++i) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 src =3D &amp;=
insn-&gt;FullSrcRegisters[i];<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 insn_adjust_m=
ask(insn, &amp;mask);<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (src-&gt;S=
rcRegister.File =3D=3D TGSI_FILE_TEMPORARY)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 set_acc_array(last_t_use, src, mask, pc-&gt;insn_nr);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (src-&gt;S=
rcRegister.File =3D=3D TGSI_FILE_INPUT)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 set_acc_array(last_a_use, src, mask, pc-&gt;insn_nr);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0default:<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
@@ -1487,6 +1789,11 @@ nv50_program_tx_prep(struct nv50_pc *pc)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
 =A0 =A0 =A0 =A0}<br>
<br>
+ =A0 =A0 =A0 if (last_t_use)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 FREE(last_t_use);<br>
+ =A0 =A0 =A0 if (last_a_use)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 FREE(last_a_use);<br>
+<br>
 =A0 =A0 =A0 =A0ret =3D TRUE;<br>
=A0out_err:<br>
 =A0 =A0 =A0 =A0tgsi_parse_free(&amp;p);<br>
@@ -1516,8 +1823,15 @@ nv50_program_tx(struct nv50_program *p)<br>
<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tgsi_parse_token(&amp;parse);<br>
<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* don&#39;t allow half insn on first and las=
t (not END) instruction */<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pc-&gt;insn_cur =3D=3D 0 || pc-&gt;insn_c=
ur + 2 =3D=3D pc-&gt;insn_nr)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pc-&gt;allow32 =3D FALSE;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 else<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pc-&gt;allow32 =3D TRUE;<br>
+<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0switch (tok-&gt;Token.Type) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case TGSI_TOKEN_TYPE_INSTRUCTION:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ++pc-&gt;insn_cur;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D nv50_program_tx_ins=
n(pc, tok);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret =3D=3D FALSE)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto out_er=
r;<br>
diff --git a/src/gallium/drivers/nv50/nv50_program.h b/src/gallium/drivers/=
nv50/nv50_program.h<br>
index 78deed6..3b3b6bb 100644<br>
--- a/src/gallium/drivers/nv50/nv50_program.h<br>
+++ b/src/gallium/drivers/nv50/nv50_program.h<br>
@@ -39,6 +39,11 @@ struct nv50_program {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned attr[2];<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} vp;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned regs[4];<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned map[4];<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned high_map;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 } fp;<br>
 =A0 =A0 =A0 =A0} cfg;<br>
=A0};<br>
<br>
<br>commit ebcc4b9cf61a25d8ef2fa87eecfb5e4e75b47bca<br>
Author: chr &lt;chr@LAPTOP.(none)&gt;<br>
Date: =A0 Tue May 5 20:56:12 2009 +0200<br>
<br>
 =A0 =A0- more correct loading FP interpolants, also consider interpolation=
 mode<br>
 =A0 =A0- use tgsi resource nv50_regs to store attributes<br>
 =A0 =A0- improve values of shader registers<br>
 =A0 =A0- make sure FP depth output goes where it&#39;s supposed to go<br>
 =A0 =A0- loop through all instructions and make sure there are no single h=
alf insns<br>
<br>
diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/=
nv50/nv50_program.c<br>
index cb92a31..9acf882 100644<br>
--- a/src/gallium/drivers/nv50/nv50_program.c<br>
+++ b/src/gallium/drivers/nv50/nv50_program.c<br>
@@ -445,20 +445,29 @@ set_immd(struct nv50_pc *pc, struct nv50_reg *imm, st=
ruct nv50_program_exec *e)<br>
=A0#define INTERP_PERSPECTIVE =A0 =A0 2<br>
=A0#define INTERP_CENTROID =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A04<br>
<br>
+/* interpolant index has been stored in dst-&gt;rhw */<br>
=A0static void<br>
-emit_interp(struct nv50_pc *pc, struct nv50_reg *dst,<br>
- =A0 =A0 =A0 =A0 =A0 struct nv50_reg *src, struct nv50_reg *iv)<br>
+emit_interp(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *iv,=
<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned mode)<br>
=A0{<br>
+ =A0 =A0 =A0 assert(dst-&gt;rhw !=3D -1);<br>
 =A0 =A0 =A0 =A0struct nv50_program_exec *e =3D exec(pc);<br>
<br>
 =A0 =A0 =A0 =A0e-&gt;inst[0] |=3D 0x80000000;<br>
 =A0 =A0 =A0 =A0set_dst(pc, dst, e);<br>
- =A0 =A0 =A0 alloc_reg(pc, src);<br>
- =A0 =A0 =A0 e-&gt;inst[0] |=3D (src-&gt;hw &lt;&lt; 16);<br>
- =A0 =A0 =A0 if (iv) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 e-&gt;inst[0] |=3D (1 &lt;&lt; 25);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 alloc_reg(pc, iv);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 e-&gt;inst[0] |=3D (iv-&gt;hw &lt;&lt; 9);<br=
>
+ =A0 =A0 =A0 e-&gt;inst[0] |=3D (dst-&gt;rhw &lt;&lt; 16);<br>
+<br>
+ =A0 =A0 =A0 if (mode &amp; INTERP_FLAT) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 e-&gt;inst[0] |=3D (1 &lt;&lt; 8);<br>
+ =A0 =A0 =A0 } else {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (mode &amp; INTERP_PERSPECTIVE) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 e-&gt;inst[0] |=3D (1 &lt;&lt=
; 25);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 alloc_reg(pc, iv);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 e-&gt;inst[0] |=3D (iv-&gt;hw=
 &lt;&lt; 9);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (mode &amp; INTERP_CENTROID)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 e-&gt;inst[0] |=3D (1 &lt;&lt=
; 24);<br>
 =A0 =A0 =A0 =A0}<br>
<br>
 =A0 =A0 =A0 =A0emit(pc, e);<br>
@@ -982,6 +991,43 @@ emit_nop(struct nv50_pc *pc, boolean l)<br>
 =A0 =A0 =A0 =A0emit(pc, e);<br>
=A0}<br>
<br>
+static void<br>
+convert_to_long(struct nv50_pc *pc, struct nv50_program_exec *e)<br>
+{<br>
+ =A0 =A0 =A0 unsigned q =3D 0, m =3D ~0;<br>
+<br>
+ =A0 =A0 =A0 assert(!is_long(e));<br>
+<br>
+ =A0 =A0 =A0 switch (e-&gt;inst[0] &gt;&gt; 28) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 case 0x1:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* MOV */<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 q =3D 0x0403c000;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 m =3D 0xFFFF7FFF;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 case 0x8:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* INTERP */<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 m =3D ~0x02000000;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (e-&gt;inst[0] &amp; 0x020=
00000)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 q =3D 0x00020=
000;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 case 0xC:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* MUL */<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 case 0x9:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* RCP */<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 default:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 assert(0);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 set_long(pc, e);<br>
+ =A0 =A0 =A0 pc-&gt;p-&gt;exec_size++;<br>
+<br>
+ =A0 =A0 =A0 e-&gt;inst[0] &amp;=3D m;<br>
+ =A0 =A0 =A0 e-&gt;inst[1] |=3D q;<br>
+}<br>
+<br>
=A0/* Adjust a bitmask that indicates what components of a source are used,=
<br>
 =A0* we use this in tx_prep so we only load interpolants that are needed.<=
br>
 =A0*/<br>
@@ -1005,20 +1051,21 @@ insn_adjust_mask(const struct tgsi_full_instruction=
 *insn, unsigned *mask)<br>
 =A0 =A0 =A0 =A0case TGSI_OPCODE_RSQ:<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*mask =3D 0x1;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
- =A0 =A0 =A0 case TGSI_OPCODE_TXP:<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 *mask =3D 0x8;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* fall through to TEX */<br>
 =A0 =A0 =A0 =A0case TGSI_OPCODE_TEX:<br>
+ =A0 =A0 =A0 case TGSI_OPCODE_TXP:<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0assert(insn-&gt;Instruction.Extended);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tex =3D &amp;insn-&gt;InstructionExtTexture=
;<br>
<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 *mask =3D 0x7;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (tex-&gt;Texture =3D=3D TGSI_TEXTURE_1D)=
<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *mask |=3D 0x1;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *mask =3D 0x1;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (tex-&gt;Texture =3D=3D TGSI_TEXTURE_2D)=
<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *mask |=3D 0x3;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 else<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *mask |=3D 0x7;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *mask =3D 0x3;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (insn-&gt;Instruction.Opcode =3D=3D TGSI_O=
PCODE_TXP)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *mask |=3D 0x8;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
 =A0 =A0 =A0 =A0default:<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
 =A0 =A0 =A0 =A0}<br>
@@ -1255,6 +1302,7 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union =
tgsi_full_token *tok)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0emit_kil(pc, src[0][1]);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0emit_kil(pc, src[0][2]);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0emit_kil(pc, src[0][3]);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 pc-&gt;p-&gt;cfg.fp.regs[2] |=3D 0x00100000;<=
br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
 =A0 =A0 =A0 =A0case TGSI_OPCODE_LIT:<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0emit_lit(pc, &amp;dst[0], mask, &amp;src[0]=
[0]);<br>
@@ -1503,7 +1551,7 @@ nv50_program_tx_prep(struct nv50_pc *pc)<br>
 =A0 =A0 =A0 =A0unsigned *last_t_use =3D NULL;<br>
 =A0 =A0 =A0 =A0unsigned *last_a_use =3D NULL;<br>
<br>
- =A0 =A0 =A0 depr =3D fcol =3D bcol =3D fcrd =3D 0xFFFFFFFF;<br>
+ =A0 =A0 =A0 depr =3D fcol =3D bcol =3D fcrd =3D 0xFFFF;<br>
<br>
 =A0 =A0 =A0 =A0if (pc-&gt;p-&gt;type =3D=3D PIPE_SHADER_FRAGMENT) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pc-&gt;p-&gt;cfg.fp.regs[0] =3D 0x01000404;=
<br>
@@ -1683,37 +1731,106 @@ nv50_program_tx_prep(struct nv50_pc *pc)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (i =3D 0; i &lt; pc-&gt;temp_nr; i++) {=
<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (c =3D 0; c &lt; 4; c++=
) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pc-&gt;temp=
[i*4+c].type =3D P_TEMP;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pc-&gt;temp[i=
*4+c].hw =3D -1;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pc-&gt;temp[i=
*4+c].hw =3D pc-&gt;temp[i*4+c].rhw =3D -1;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pc-&gt;temp=
[i*4+c].index =3D i;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pc-&gt;temp[i=
*4+c].acc =3D last_t_use[i*4+c];<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
 =A0 =A0 =A0 =A0}<br>
<br>
 =A0 =A0 =A0 =A0if (pc-&gt;attr_nr) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nv50_reg *iv =3D NULL;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 int aid =3D 0;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nv50_reg *iv, *iv_c =3D NULL, *iv_p =
=3D NULL;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 int oid, off =3D 4, mid =3D 0, aid =3D 0;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* off =3D VP output id offset to i*4 (oid =
=3D i*4 + off + c)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* aid =3D FP attribute/interpolant id (inc=
remented only for used attrs)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* mid =3D VP output mapping field ID (HPOS=
 not counted)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/<br>
<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pc-&gt;attr =3D CALLOC(pc-&gt;attr_nr * 4, =
sizeof(struct nv50_reg));<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!pc-&gt;attr)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto out_err;<br>
<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i =3D 0;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (pc-&gt;p-&gt;type =3D=3D PIPE_SHADER_FR=
AGMENT) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 iv =3D alloc_temp(pc, NULL);<=
br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_interp(pc, iv, iv, NULL)=
;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_flop(pc, 0, iv, iv);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 aid++;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (fcrd !=3D 0xFFFF) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 assert(fcrd =
=3D=3D 0); /* position input should always be 0 */<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i =3D 1;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 off =3D 0;<br=
>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (c =3D 0;=
 c &lt; 4; ++c) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 if (last_a_use[c] =3D=3D 0)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 continue;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 pc-&gt;attr[c].index =3D fcrd;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 pc-&gt;attr[c].type =3D P_TEMP;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 pc-&gt;attr[c].acc =3D last_a_use[c];<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 pc-&gt;attr[c].hw =3D pc-&gt;attr[c].rhw =3D -1;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 alloc_reg(pc, &amp;pc-&gt;attr[c]);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 pc-&gt;attr[c].rhw =3D aid++;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 emit_interp(pc, &amp;pc-&gt;attr[c], NULL, INTERP_LINEAR);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 pc-&gt;p-&gt;cfg.fp.regs[1] |=3D (1 &lt;&lt; (24 + c));<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 switch (c) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 case 0:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 case 1:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 /* should probably do viewport stuff here */<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 case 3:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 iv_p =3D &amp;pc-&gt;attr[c];<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 emit_flop(pc, 0, iv_p, iv_p);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 default:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 }<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (perspect_load &amp;&amp; =
!iv_p) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 iv_p =3D allo=
c_temp(pc, NULL);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 iv_p-&gt;rhw =
=3D aid++;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_interp(p=
c, iv_p, NULL, INTERP_LINEAR);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_flop(pc,=
 0, iv_p, iv_p);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pc-&gt;p-&gt;=
cfg.fp.regs[1] |=3D 0x08000000;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (centroid_load) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 iv_c =3D allo=
c_temp(pc, NULL);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 iv_c-&gt;rhw =
=3D iv_p ? aid - 1 : aid++;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_interp(p=
c, iv_c, NULL, INTERP_CENTROID);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_flop(pc,=
 0, iv_c, iv_c);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pc-&gt;p-&gt;=
cfg.fp.regs[1] |=3D 0x08000000;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 0; i &lt; pc-&gt;attr_nr; i++) {<b=
r>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (; i &lt; pc-&gt;attr_nr; i++) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct nv50_reg *a =3D &amp=
;pc-&gt;attr[i*4];<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 iv =3D (interp_mode[i] &amp; =
INTERP_CENTROID) ? iv_c : iv_p;<br>
<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (c =3D 0; c &lt; 4; c++=
) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (pc-&gt;=
p-&gt;type =3D=3D PIPE_SHADER_FRAGMENT) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 struct nv50_reg *at =3D<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 alloc_temp(pc, NULL);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 pc-&gt;attr[i*4+c].type =3D at-&gt;type;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 pc-&gt;attr[i*4+c].hw =3D at-&gt;hw;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 pc-&gt;attr[i*4+c].index =3D at-&gt;index;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 a[c].hw =3D a[c].rhw =3D -1;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 a[c].index =3D -1;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 if (last_a_use[i*4+c] =3D=3D 0)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 continue;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 if (i =3D=3D fcol || i =3D=3D bcol)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 pc-&gt;p-&gt;cfg.fp.regs[0] +=3D 0x00010000;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 pc-&gt;p-&gt;cfg.fp.regs[1] +=3D 0x00010000;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 a[c].index =3D i;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 a[c].type =3D P_TEMP;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 a[c].acc =3D last_a_use[i*4+c];<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 alloc_reg(pc, &amp;a[c]);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 a[c].rhw =3D aid++;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 emit_interp(pc, &amp;a[c], iv, interp_mode[i]);<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 oid =3D off + i * 4 + c;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 pc-&gt;p-&gt;cfg.fp.map[mid / 4] |=3D oid &lt;&lt; (8 * (mid % 4));<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 mid++;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} else {<br=
>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0pc-&gt;p-&gt;cfg.vp.attr[aid/32] |=3D<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; (aid % 32));<br>
@@ -1722,18 +1839,16 @@ nv50_program_tx_prep(struct nv50_pc *pc)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0pc-&gt;attr[i*4+c].index =3D i;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pc-&gt;p-&gt;type !=3D PI=
PE_SHADER_FRAGMENT)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pc-&gt;p-&gt;type =3D=3D PIPE_SHADER_FRAG=
MENT) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pc-&gt;p-&gt;cfg.fp.high_map =
=3D (mid / 4) + ((mid % 4) ? 1 : 0);<br>
<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_interp(pc, &amp;a[0], &a=
mp;a[0], iv);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_interp(pc, &amp;a[1], &a=
mp;a[1], iv);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_interp(pc, &amp;a[2], &a=
mp;a[2], iv);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_interp(pc, &amp;a[3], &a=
mp;a[3], iv);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (iv_p &amp;&amp; iv_p-&gt;=
index =3D=3D -1)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 free_temp(pc,=
 iv_p);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (iv_c)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 free_temp(pc,=
 iv_c);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
-<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (iv)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 free_temp(pc, iv);<br>
 =A0 =A0 =A0 =A0}<br>
<br>
 =A0 =A0 =A0 =A0if (pc-&gt;result_nr) {<br>
@@ -1748,9 +1863,15 @@ nv50_program_tx_prep(struct nv50_pc *pc)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (pc-&gt;=
p-&gt;type =3D=3D PIPE_SHADER_FRAGMENT) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0pc-&gt;result[i*4+c].type =3D P_TEMP;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0pc-&gt;result[i*4+c].hw =3D -1;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 if (i =3D=3D depr) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 pc-&gt;result[i*4+c].rhw =3D ((c =3D=3D 2) ?<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (pc-&gt;result_nr - 1) * 4 : -1);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 } else<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 pc-&gt;result[i*4+c].rhw =3D rid++;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} else {<br=
>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0pc-&gt;result[i*4+c].type =3D P_RESULT;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0pc-&gt;result[i*4+c].hw =3D rid++;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 pc-&gt;result[i*4+c].rhw =3D -1;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pc-&gt;resu=
lt[i*4+c].index =3D i;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
@@ -1805,6 +1926,7 @@ nv50_program_tx(struct nv50_program *p)<br>
=A0{<br>
 =A0 =A0 =A0 =A0struct tgsi_parse_context parse;<br>
 =A0 =A0 =A0 =A0struct nv50_pc *pc;<br>
+ =A0 =A0 =A0 unsigned i, k;<br>
 =A0 =A0 =A0 =A0boolean ret;<br>
<br>
 =A0 =A0 =A0 =A0pc =3D CALLOC_STRUCT(nv50_pc);<br>
@@ -1843,10 +1965,42 @@ nv50_program_tx(struct nv50_program *p)<br>
<br>
 =A0 =A0 =A0 =A0if (p-&gt;type =3D=3D PIPE_SHADER_FRAGMENT) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct nv50_reg out;<br>
-<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0out.type =3D P_TEMP;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (out.hw =3D 0; out.hw &lt; pc-&gt;result_=
nr * 4; out.hw++)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_mov(pc, &amp;out, &amp;p=
c-&gt;result[out.hw]);<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 0; i &lt; pc-&gt;result_nr * 4; i+=
+) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pc-&gt;result[i].rhw =3D=
=3D -1)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pc-&gt;result[i].hw !=3D =
pc-&gt;result[i].rhw) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 out.hw =3D pc=
-&gt;result[i].rhw;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_mov(pc, =
&amp;out, &amp;pc-&gt;result[i]);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pc-&gt;p-&gt;cfg.high_res=
ult &lt; pc-&gt;result[i].rhw + 1)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pc-&gt;p-&gt;=
cfg.high_result =3D pc-&gt;result[i].rhw + 1;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 /* look for single half instructions and make them long */<br=
>
+ =A0 =A0 =A0 struct nv50_program_exec *e, *e_prev;<br>
+<br>
+ =A0 =A0 =A0 for (k =3D 0, e =3D pc-&gt;p-&gt;exec_head, e_prev =3D NULL; =
e; e =3D e-&gt;next) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!is_long(e))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 k++;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!e-&gt;next || is_long(e-&gt;next)) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (k &amp; 1)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 convert_to_lo=
ng(pc, e);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 k =3D 0;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (e-&gt;next)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 e_prev =3D e;<br>
+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 if (!is_long(pc-&gt;p-&gt;exec_tail)) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* this may occur if moving FP results */<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 assert(e_prev &amp;&amp; !is_long(e_prev));<b=
r>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 convert_to_long(pc, e_prev);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 convert_to_long(pc, pc-&gt;p-&gt;exec_tail);<=
br>
 =A0 =A0 =A0 =A0}<br>
<br>
 =A0 =A0 =A0 =A0assert(is_long(pc-&gt;p-&gt;exec_tail) &amp;&amp; !is_immd(=
pc-&gt;p-&gt;exec_head));<br>
@@ -1973,7 +2127,7 @@ nv50_program_validate_code(struct nv50_context *nv50,=
 struct nv50_program *p)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (is_long(e))<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NOUVEAU_ERR(&quot;0x%08x\n&=
quot;, e-&gt;inst[1]);<br>
 =A0 =A0 =A0 =A0}<br>
-<br>
+ =A0 =A0 =A0 FREE(up);<br>
=A0#endif<br>
<br>
 =A0 =A0 =A0 =A0up =3D ptr =3D MALLOC(p-&gt;exec_size * 4);<br>
@@ -2058,6 +2212,7 @@ nv50_fragprog_validate(struct nv50_context *nv50)<br>
 =A0 =A0 =A0 =A0struct nouveau_grobj *tesla =3D nv50-&gt;screen-&gt;tesla;<=
br>
 =A0 =A0 =A0 =A0struct nv50_program *p =3D nv50-&gt;fragprog;<br>
 =A0 =A0 =A0 =A0struct nouveau_stateobj *so;<br>
+ =A0 =A0 =A0 unsigned i;<br>
<br>
 =A0 =A0 =A0 =A0if (!p-&gt;translated) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv50_program_validate(nv50, p);<br>
@@ -2068,24 +2223,30 @@ nv50_fragprog_validate(struct nv50_context *nv50)<b=
r>
 =A0 =A0 =A0 =A0nv50_program_validate_data(nv50, p);<br>
 =A0 =A0 =A0 =A0nv50_program_validate_code(nv50, p);<br>
<br>
- =A0 =A0 =A0 so =3D so_new(64, 2);<br>
+ =A0 =A0 =A0 so =3D so_new(32, 2);<br>
 =A0 =A0 =A0 =A0so_method(so, tesla, NV50TCL_FP_ADDRESS_HIGH, 2);<br>
 =A0 =A0 =A0 =A0so_reloc (so, p-&gt;buffer, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO=
_RD |<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NOUVEAU_BO_HIGH, 0, 0);<br>
 =A0 =A0 =A0 =A0so_reloc (so, p-&gt;buffer, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO=
_RD |<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NOUVEAU_BO_LOW, 0, 0);<br>
 =A0 =A0 =A0 =A0so_method(so, tesla, 0x1904, 4);<br>
- =A0 =A0 =A0 so_data =A0(so, 0x00040404); /* p: 0x01000404 */<br>
+ =A0 =A0 =A0 so_data =A0(so, p-&gt;cfg.fp.regs[0]); /* 0x01000404 / 0x0004=
0404 etc. */<br>
 =A0 =A0 =A0 =A0so_data =A0(so, 0x00000004);<br>
 =A0 =A0 =A0 =A0so_data =A0(so, 0x00000000);<br>
 =A0 =A0 =A0 =A0so_data =A0(so, 0x00000000);<br>
- =A0 =A0 =A0 so_method(so, tesla, 0x16bc, 3); /*XXX: fixme */<br>
+ =A0 =A0 =A0 so_method(so, tesla, 0x16bc, 1 + p-&gt;cfg.fp.high_map);<br>
 =A0 =A0 =A0 =A0so_data =A0(so, 0x03020100);<br>
- =A0 =A0 =A0 so_data =A0(so, 0x07060504);<br>
- =A0 =A0 =A0 so_data =A0(so, 0x0b0a0908);<br>
+ =A0 =A0 =A0 for (i =3D 0; i &lt; p-&gt;cfg.fp.high_map; i++)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 so_data(so, p-&gt;cfg.fp.map[i]);<br>
 =A0 =A0 =A0 =A0so_method(so, tesla, 0x1988, 2);<br>
- =A0 =A0 =A0 so_data =A0(so, 0x08080408); //0x08040404); /* p: 0x0f000401 =
*/<br>
+ =A0 =A0 =A0 so_data =A0(so, p-&gt;cfg.fp.regs[1]); /* 0x08040404 / 0x0f00=
0401 etc. */<br>
 =A0 =A0 =A0 =A0so_data =A0(so, p-&gt;cfg.high_temp);<br>
+ =A0 =A0 =A0 so_method(so, tesla, 0x1298, 1);<br>
+ =A0 =A0 =A0 so_data =A0(so, p-&gt;cfg.high_result);<br>
+ =A0 =A0 =A0 so_method(so, tesla, 0x19a8, 1);<br>
+ =A0 =A0 =A0 so_data =A0(so, p-&gt;cfg.fp.regs[2]);<br>
+ =A0 =A0 =A0 so_method(so, tesla, 0x196c, 1);<br>
+ =A0 =A0 =A0 so_data =A0(so, p-&gt;cfg.fp.regs[3]);<br>
 =A0 =A0 =A0 =A0so_method(so, tesla, 0x1414, 1);<br>
 =A0 =A0 =A0 =A0so_data =A0(so, 0); /* program start offset */<br>
 =A0 =A0 =A0 =A0so_ref(so, &amp;nv50-&gt;state.fragprog);<br>
<br>commit dacf2f879d63b5bf756da62eee901379336e7335<br>
Author: chr &lt;chr@LAPTOP.(none)&gt;<br>
Date: =A0 Tue May 5 20:57:15 2009 +0200<br>
<br>
 =A0 =A0- avoid overwriting sources before they&#39;re used in cases where =
dst =3D=3D src<br>
 =A0 =A0- add magical adjustment for register 1988 (I should find out how t=
hat<br>
 =A0 =A0 =A0really works)<br>
<br>
diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/=
nv50/nv50_program.c<br>
index 9acf882..e4fc261 100644<br>
--- a/src/gallium/drivers/nv50/nv50_program.c<br>
+++ b/src/gallium/drivers/nv50/nv50_program.c<br>
@@ -1162,12 +1162,40 @@ tgsi_src(struct nv50_pc *pc, int chan, const struct=
 tgsi_full_src_register *src)<br>
 =A0 =A0 =A0 =A0return r;<br>
=A0}<br>
<br>
+/* returns TRUE if instruction can overwrite sources before they&#39;re re=
ad */<br>
+static boolean<br>
+direct2dest_op(const struct tgsi_full_instruction *insn)<br>
+{<br>
+ =A0 =A0 =A0 if (insn-&gt;Instruction.Saturate)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return FALSE;<br>
+<br>
+ =A0 =A0 =A0 switch (insn-&gt;Instruction.Opcode) {<br>
+ =A0 =A0 =A0 case TGSI_OPCODE_COS:<br>
+ =A0 =A0 =A0 case TGSI_OPCODE_DP3:<br>
+ =A0 =A0 =A0 case TGSI_OPCODE_DP4:<br>
+ =A0 =A0 =A0 case TGSI_OPCODE_DPH:<br>
+ =A0 =A0 =A0 case TGSI_OPCODE_KIL:<br>
+ =A0 =A0 =A0 case TGSI_OPCODE_LIT:<br>
+ =A0 =A0 =A0 case TGSI_OPCODE_POW:<br>
+ =A0 =A0 =A0 case TGSI_OPCODE_RCP:<br>
+ =A0 =A0 =A0 case TGSI_OPCODE_RSQ:<br>
+ =A0 =A0 =A0 case TGSI_OPCODE_SCS:<br>
+ =A0 =A0 =A0 case TGSI_OPCODE_SIN:<br>
+ =A0 =A0 =A0 case TGSI_OPCODE_TEX:<br>
+ =A0 =A0 =A0 case TGSI_OPCODE_TXP:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return FALSE;<br>
+ =A0 =A0 =A0 default:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return TRUE;<br>
+ =A0 =A0 =A0 }<br>
+}<br>
+<br>
=A0static boolean<br>
=A0nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *to=
k)<br>
=A0{<br>
 =A0 =A0 =A0 =A0const struct tgsi_full_instruction *inst =3D &amp;tok-&gt;F=
ullInstruction;<br>
 =A0 =A0 =A0 =A0struct nv50_reg *rdst[4], *dst[4], *src[3][4], *temp =3D NU=
LL;<br>
 =A0 =A0 =A0 =A0unsigned mask, sat, unit;<br>
+ =A0 =A0 =A0 boolean assimilate =3D FALSE;<br>
 =A0 =A0 =A0 =A0int i, c;<br>
<br>
 =A0 =A0 =A0 =A0mask =3D inst-&gt;FullDstRegisters[0].DstRegister.WriteMask=
;<br>
@@ -1178,6 +1206,12 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union=
 tgsi_full_token *tok)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dst[c] =3D tgsi_dst(pc, c, =
&amp;inst-&gt;FullDstRegisters[0]);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dst[c] =3D NULL;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 rdst[c] =3D NULL;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 src[0][c] =3D NULL;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 src[1][c] =3D NULL;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 src[2][c] =3D NULL;<br>
 =A0 =A0 =A0 =A0}<br>
<br>
 =A0 =A0 =A0 =A0for (i =3D 0; i &lt; inst-&gt;Instruction.NumSrcRegs; i++) =
{<br>
@@ -1195,8 +1229,35 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union=
 tgsi_full_token *tok)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rdst[c] =3D dst[c];<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dst[c] =3D temp_temp(pc);<b=
r>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
+ =A0 =A0 =A0 } else if (direct2dest_op(inst)) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (c =3D 0; c &lt; 4; c++) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!dst[c] || dst[c]-&gt;typ=
e !=3D P_TEMP)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D c + 1; i &lt; 4; i=
++) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (dst[c] =
=3D=3D src[0][i] ||<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 dst[c] =3D=3D src[1][i] ||<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 dst[c] =3D=3D src[2][i])<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 break;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (i =3D=3D 4)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 assimilate =3D TRUE;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rdst[c] =3D dst[c];<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dst[c] =3D alloc_preferred_te=
mp(pc, rdst[c]-&gt;rhw);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 } else if (inst-&gt;Instruction.Opcode =3D=3D TGSI_OPCODE_LIT=
) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* XXX: shouldn&#39;t give LIT an extra case =
here */<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (src[0][1] =3D=3D dst[1] ||<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 src[0][3] =3D=3D dst[1]) {<br=
>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 assimilate =3D TRUE;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rdst[1] =3D dst[1];<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dst[1] =3D alloc_temp(pc, NUL=
L);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
 =A0 =A0 =A0 =A0}<br>
<br>
+ =A0 =A0 =A0 i =3D -1;<br>
 =A0 =A0 =A0 =A0switch (inst-&gt;Instruction.Opcode) {<br>
 =A0 =A0 =A0 =A0case TGSI_OPCODE_ABS:<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (c =3D 0; c &lt; 4; c++) {<br>
@@ -1373,14 +1434,22 @@ nv50_program_tx_insn(struct nv50_pc *pc, const unio=
n tgsi_full_token *tok)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (c =3D 0; c &lt; 4; c++) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!(mask &amp; (1 &lt;&lt=
; c)))<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;<b=
r>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_flop(pc, 0, dst[c], src[=
0][0]);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (i =3D=3D -1) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_flop(pc,=
 0, dst[c], src[0][0]);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i =3D c;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_mov(pc, =
dst[c], dst[i]);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
 =A0 =A0 =A0 =A0case TGSI_OPCODE_RSQ:<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (c =3D 0; c &lt; 4; c++) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!(mask &amp; (1 &lt;&lt=
; c)))<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;<b=
r>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_flop(pc, 2, dst[c], src[=
0][0]);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (i =3D=3D -1) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_flop(pc,=
 2, dst[c], src[0][0]);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i =3D c;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 emit_mov(pc, =
dst[c], dst[i]);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
 =A0 =A0 =A0 =A0case TGSI_OPCODE_SCS:<br>
@@ -1491,6 +1560,10 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union=
 tgsi_full_token *tok)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0set_src_0(pc, dst[c], e);<b=
r>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0emit(pc, e);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
+ =A0 =A0 =A0 } else if (assimilate) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (c =3D 0; c &lt; 4; c++)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (rdst[c])<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 assimilate_te=
mp(pc, rdst[c], dst[c]);<br>
 =A0 =A0 =A0 =A0}<br>
<br>
 =A0 =A0 =A0 =A0for (i =3D 0; i &lt; inst-&gt;Instruction.NumSrcRegs; i++) =
{<br>
@@ -1499,10 +1572,9 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union=
 tgsi_full_token *tok)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;<b=
r>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (src[i][c]-&gt;index =3D=
=3D -1 &amp;&amp; src[i][c]-&gt;type =3D=3D P_IMMD)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0FREE(src[i]=
[c]);<br>
-<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Might also release tempora=
ries not used anymore in this loop,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* therefore no temp_immd a=
nd temp_immd_nr like for temp_temp.<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (src[i][c]-&gt;acc =3D=3D =
pc-&gt;insn_cur)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 release_hw(pc=
, src[i][c]);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
 =A0 =A0 =A0 =A0}<br>
<br>
@@ -1996,6 +2068,18 @@ nv50_program_tx(struct nv50_program *p)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0e_prev =3D e;<br>
 =A0 =A0 =A0 =A0}<br>
<br>
+ =A0 =A0 =A0 /* adjust register 1988 &#39;heuristically&#39; */<br>
+ =A0 =A0 =A0 /* XXX: make this go away */<br>
+ =A0 =A0 =A0 for (i =3D 0, k =3D 0; k &lt; 4; ++k)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pc-&gt;p-&gt;cfg.fp.regs[1] &amp; (1 &lt;=
&lt; (24 + k)))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i++;<br>
+ =A0 =A0 =A0 if (i &gt; 3 || i &lt; ((pc-&gt;p-&gt;cfg.fp.regs[1] &gt;&gt;=
 16) &amp; 0xFF) + 3) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 pc-&gt;p-&gt;cfg.fp.regs[1] &amp;=3D 0xFFFFFF=
00;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 pc-&gt;p-&gt;cfg.fp.regs[1] |=3D ((pc-&gt;p-&=
gt;cfg.fp.regs[1] &gt;&gt; 16) &amp; 0xFF);<br>
+ =A0 =A0 =A0 } else {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 pc-&gt;p-&gt;cfg.fp.regs[1] |=3D (3 - i);<br>
+ =A0 =A0 =A0 }<br>
+<br>
 =A0 =A0 =A0 =A0if (!is_long(pc-&gt;p-&gt;exec_tail)) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* this may occur if moving FP results */<b=
r>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0assert(e_prev &amp;&amp; !is_long(e_prev));=
<br>
<br>commit 4411b1e3b3c11c69ec11148783327759a94165e2<br>
Author: chr &lt;chr@LAPTOP.(none)&gt;<br>
Date: =A0 Wed May 6 11:46:17 2009 +0200<br>
<br>
 =A0 =A0Enable half insns and immediates for MOV and ADD.<br>
<br>
diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/=
nv50/nv50_program.c<br>
index e4fc261..2ab7b57 100644<br>
--- a/src/gallium/drivers/nv50/nv50_program.c<br>
+++ b/src/gallium/drivers/nv50/nv50_program.c<br>
@@ -426,7 +426,7 @@ set_dst(struct nv50_pc *pc, struct nv50_reg *dst, struc=
t nv50_program_exec *e)<br>
=A0static INLINE void<br>
=A0set_immd(struct nv50_pc *pc, struct nv50_reg *imm, struct nv50_program_e=
xec *e)<br>
=A0{<br>
- =A0 =A0 =A0 unsigned val =3D fui(pc-&gt;immd_buf[imm-&gt;hw]); /* XXX */<=
br>
+ =A0 =A0 =A0 unsigned val =3D fui(pc-&gt;immd_buf[imm-&gt;hw - pc-&gt;para=
m_nr * 4]);<br>
<br>
 =A0 =A0 =A0 =A0set_long(pc, e);<br>
 =A0 =A0 =A0 =A0/*XXX: can&#39;t be predicated - bits overlap.. catch cases=
 where both<br>
@@ -505,12 +505,11 @@ emit_mov(struct nv50_pc *pc, struct nv50_reg *dst, st=
ruct nv50_reg *src)<br>
<br>
 =A0 =A0 =A0 =A0set_dst(pc, dst, e);<br>
<br>
- =A0 =A0 =A0 if (0 &amp;&amp; dst-&gt;type !=3D P_RESULT &amp;&amp; src-&g=
t;type =3D=3D P_IMMD) {<br>
+ =A0 =A0 =A0 if (pc-&gt;allow32 &amp;&amp; dst-&gt;type !=3D P_RESULT &amp=
;&amp; src-&gt;type =3D=3D P_IMMD) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0set_immd(pc, src, e);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*XXX: 32-bit, but steals part of &quot;hal=
f&quot; reg space - need to<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * =A0 =A0 catch and handle this case if/wh=
en we do half-regs<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 e-&gt;inst[0] |=3D 0x00008000;<br>
 =A0 =A0 =A0 =A0} else<br>
 =A0 =A0 =A0 =A0if (src-&gt;type =3D=3D P_IMMD || src-&gt;type =3D=3D P_CON=
ST) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0set_long(pc, e);<br>
@@ -526,13 +525,15 @@ emit_mov(struct nv50_pc *pc, struct nv50_reg *dst, st=
ruct nv50_reg *src)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0e-&gt;inst[0] |=3D (src-&gt;hw &lt;&lt; 9);=
<br>
 =A0 =A0 =A0 =A0}<br>
<br>
- =A0 =A0 =A0 /* We really should support &quot;half&quot; instructions her=
e at some point,<br>
- =A0 =A0 =A0 =A0* but I don&#39;t feel confident enough about them yet.<br=
>
- =A0 =A0 =A0 =A0*/<br>
- =A0 =A0 =A0 set_long(pc, e);<br>
- =A0 =A0 =A0 if (is_long(e) &amp;&amp; !is_immd(e)) {<br>
+ =A0 =A0 =A0 if (!is_long(e) || is_immd(e))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 e-&gt;inst[0] |=3D 0x00008000;<br>
+ =A0 =A0 =A0 else {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0e-&gt;inst[1] |=3D 0x04000000; /* 32-bit */=
<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 e-&gt;inst[1] |=3D 0x0003c000; /* &quot;subsu=
bop&quot; 0xf =3D=3D mov */<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* XXX: look into this 0x3 or 0xf again */<br=
>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 e-&gt;inst[1] |=3D 0x0000c000; /* &quot;subsu=
bop&quot; 0x3 */<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!(e-&gt;inst[1] &amp; 0x20000000))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 e-&gt;inst[1] |=3D 0x00030000=
; /* &quot;subsubop&quot; 0xf */<br>
 =A0 =A0 =A0 =A0}<br>
<br>
 =A0 =A0 =A0 =A0emit(pc, e);<br>
@@ -606,6 +607,7 @@ set_src_1(struct nv50_pc *pc, struct nv50_reg *src, str=
uct nv50_program_exec *e)<br>
 =A0 =A0 =A0 =A0e-&gt;inst[0] |=3D (src-&gt;hw &lt;&lt; 16);<br>
=A0}<br>
<br>
+/* XXX: can source 2 really be a constant ? */<br>
=A0static void<br>
=A0set_src_2(struct nv50_pc *pc, struct nv50_reg *src, struct nv50_program_=
exec *e)<br>
=A0{<br>
@@ -670,7 +672,10 @@ emit_add(struct nv50_pc *pc, struct nv50_reg *dst,<br>
 =A0 =A0 =A0 =A0check_swap_src_0_1(pc, &amp;src0, &amp;src1);<br>
 =A0 =A0 =A0 =A0set_dst(pc, dst, e);<br>
 =A0 =A0 =A0 =A0set_src_0(pc, src0, e);<br>
- =A0 =A0 =A0 if (is_long(e))<br>
+ =A0 =A0 =A0 if (!is_long(e) &amp;&amp; src1-&gt;type =3D=3D P_IMMD &amp;&=
amp; pc-&gt;allow32)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 set_immd(pc, src1, e);<br>
+ =A0 =A0 =A0 else<br>
+ =A0 =A0 =A0 if (requires_long(e, src1))<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0set_src_2(pc, src1, e);<br>
 =A0 =A0 =A0 =A0else<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0set_src_1(pc, src1, e);<br>
@@ -902,6 +907,7 @@ emit_lit(struct nv50_pc *pc, struct nv50_reg **dst, uns=
igned mask,<br>
 =A0 =A0 =A0 =A0struct nv50_reg *neg128 =3D alloc_immd(pc, -127.999999);<br=
>
 =A0 =A0 =A0 =A0struct nv50_reg *pos128 =3D alloc_immd(pc, =A0127.999999);<=
br>
 =A0 =A0 =A0 =A0struct nv50_reg *tmp[4];<br>
+ =A0 =A0 =A0 boolean allow32 =3D pc-&gt;allow32;<br>
<br>
 =A0 =A0 =A0 =A0if (mask &amp; (3 &lt;&lt; 1)) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (mask &amp; (1 &lt;&lt; 1))<br>
@@ -911,6 +917,8 @@ emit_lit(struct nv50_pc *pc, struct nv50_reg **dst, uns=
igned mask,<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0emit_minmax(pc, 4, tmp[0], src[0], zero);<b=
r>
 =A0 =A0 =A0 =A0}<br>
<br>
+ =A0 =A0 =A0 pc-&gt;allow32 =3D FALSE;<br>
+<br>
 =A0 =A0 =A0 =A0if (mask &amp; (1 &lt;&lt; 2)) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0set_pred_wr(pc, 1, 0, pc-&gt;p-&gt;exec_tai=
l);<br>
<br>
@@ -926,6 +934,8 @@ emit_lit(struct nv50_pc *pc, struct nv50_reg **dst, uns=
igned mask,<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0set_pred(pc, 3, 0, pc-&gt;p-&gt;exec_tail);=
<br>
 =A0 =A0 =A0 =A0}<br>
<br>
+ =A0 =A0 =A0 pc-&gt;allow32 =3D allow32;<br>
+<br>
 =A0 =A0 =A0 =A0/* do this last, in case src[i,j] =3D=3D dst[0,3] */<br>
 =A0 =A0 =A0 =A0if (mask &amp; (1 &lt;&lt; 0))<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0emit_mov(pc, dst[0], one);<br>
<br>commit 88dbc993e651da91d66c4ca471d11ee5aa2b5085<br>
Author: chr &lt;chr@LAPTOP.(none)&gt;<br>
Date: =A0 Wed May 6 11:50:17 2009 +0200<br>
<br>
 =A0 =A0Use multiple (3 for now: PVP, PFP, PMISC) constant buffers.<br>
<br>
diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/=
nv50/nv50_program.c<br>
index 2ab7b57..6e279bd 100644<br>
--- a/src/gallium/drivers/nv50/nv50_program.c<br>
+++ b/src/gallium/drivers/nv50/nv50_program.c<br>
@@ -426,7 +426,7 @@ set_dst(struct nv50_pc *pc, struct nv50_reg *dst, struc=
t nv50_program_exec *e)<br>
=A0static INLINE void<br>
=A0set_immd(struct nv50_pc *pc, struct nv50_reg *imm, struct nv50_program_e=
xec *e)<br>
=A0{<br>
- =A0 =A0 =A0 unsigned val =3D fui(pc-&gt;immd_buf[imm-&gt;hw - pc-&gt;para=
m_nr * 4]);<br>
+ =A0 =A0 =A0 unsigned val =3D fui(pc-&gt;immd_buf[imm-&gt;hw]);<br>
<br>
 =A0 =A0 =A0 =A0set_long(pc, e);<br>
 =A0 =A0 =A0 =A0/*XXX: can&#39;t be predicated - bits overlap.. catch cases=
 where both<br>
@@ -478,22 +478,14 @@ set_data(struct nv50_pc *pc, struct nv50_reg *src, un=
signed m, unsigned s,<br>
 =A0 =A0 =A0 =A0 struct nv50_program_exec *e)<br>
=A0{<br>
 =A0 =A0 =A0 =A0set_long(pc, e);<br>
-#if 1<br>
- =A0 =A0 =A0 e-&gt;inst[1] |=3D (1 &lt;&lt; 22);<br>
-#else<br>
- =A0 =A0 =A0 if (src-&gt;type =3D=3D P_IMMD) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 e-&gt;inst[1] |=3D (NV50_CB_PMISC &lt;&lt; 22=
);<br>
- =A0 =A0 =A0 } else {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pc-&gt;p-&gt;type =3D=3D PIPE_SHADER_VERT=
EX)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 e-&gt;inst[1] |=3D (NV50_CB_P=
VP &lt;&lt; 22);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 else<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 e-&gt;inst[1] |=3D (NV50_CB_P=
FP &lt;&lt; 22);<br>
- =A0 =A0 =A0 }<br>
-#endif<br>
<br>
+ =A0 =A0 =A0 /* XXX: <a href=3D"http://param.bs" target=3D"_blank">param.b=
s</a> can be extracted from inst[1] */<br>
+ =A0 =A0 =A0 e-&gt;<a href=3D"http://param.bs" target=3D"_blank">param.bs<=
/a> =3D (src-&gt;type =3D=3D P_IMMD) ? 0 : 1;<br>
 =A0 =A0 =A0 =A0e-&gt;param.index =3D src-&gt;hw;<br>
 =A0 =A0 =A0 =A0e-&gt;param.shift =3D s;<br>
 =A0 =A0 =A0 =A0e-&gt;param.mask =3D m &lt;&lt; (s % 32);<br>
+<br>
+ =A0 =A0 =A0 e-&gt;inst[1] |=3D (e-&gt;<a href=3D"http://param.bs" target=
=3D"_blank">param.bs</a> &lt;&lt; 22);<br>
=A0}<br>
<br>
=A0static void<br>
@@ -1502,7 +1494,7 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union =
tgsi_full_token *tok)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;<br>
 =A0 =A0 =A0 =A0case TGSI_OPCODE_TEX:<br>
- =A0 =A0 =A0 case TGSI_OPCODE_TXP:<br>
+ =A0 =A0 =A0 case TGSI_OPCODE_TXP: /* XXX: TXP should use w-component as i=
v on interp */<br>
 =A0 =A0 =A0 =A0{<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct nv50_reg *t[4];<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct nv50_program_exec *e;<br>
@@ -1977,7 +1969,7 @@ nv50_program_tx_prep(struct nv50_pc *pc)<br>
 =A0 =A0 =A0 =A0}<br>
<br>
 =A0 =A0 =A0 =A0if (pc-&gt;immd_nr) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 int rid =3D pc-&gt;param_nr * 4;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 int rid =3D 0;<br>
<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pc-&gt;immd =3D CALLOC(pc-&gt;immd_nr * 4, =
sizeof(struct nv50_reg));<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!pc-&gt;immd)<br>
@@ -2121,7 +2113,7 @@ nv50_program_validate(struct nv50_context *nv50, stru=
ct nv50_program *p)<br>
<br>
=A0static void<br>
=A0nv50_program_upload_data(struct nv50_context *nv50, float *map,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned start, unsigned c=
ount)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned start, unsigned coun=
t, unsigned cbuf)<br>
=A0{<br>
 =A0 =A0 =A0 =A0struct nouveau_channel *chan =3D nv50-&gt;screen-&gt;nvws-&=
gt;channel;<br>
 =A0 =A0 =A0 =A0struct nouveau_grobj *tesla =3D nv50-&gt;screen-&gt;tesla;<=
br>
@@ -2130,7 +2122,7 @@ nv50_program_upload_data(struct nv50_context *nv50, f=
loat *map,<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned nr =3D count &gt; 2047 ? 2047 : co=
unt;<br>
<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0BEGIN_RING(chan, tesla, 0x00000f00, 1);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING =A0(chan, (NV50_CB_PMISC &lt;&lt; 0)=
 | (start &lt;&lt; 8));<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING =A0(chan, (cbuf &lt;&lt; 0) | (start=
 &lt;&lt; 8));<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0BEGIN_RING(chan, tesla, 0x40000f04, nr);<br=
>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0OUT_RINGp (chan, map, nr);<br>
<br>
@@ -2145,35 +2137,48 @@ nv50_program_validate_data(struct nv50_context *nv5=
0, struct nv50_program *p)<br>
=A0{<br>
 =A0 =A0 =A0 =A0struct nouveau_winsys *nvws =3D nv50-&gt;screen-&gt;nvws;<b=
r>
 =A0 =A0 =A0 =A0struct pipe_winsys *ws =3D nv50-&gt;pipe.winsys;<br>
- =A0 =A0 =A0 unsigned nr =3D p-&gt;param_nr + p-&gt;immd_nr;<br>
<br>
- =A0 =A0 =A0 if (!p-&gt;data &amp;&amp; nr) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nouveau_resource *heap =3D nv50-&gt;sc=
reen-&gt;vp_data_heap;<br>
+ =A0 =A0 =A0 if (!p-&gt;data[0] &amp;&amp; p-&gt;immd_nr) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nouveau_resource *heap =3D nv50-&gt;sc=
reen-&gt;immd_heap[0];<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (nvws-&gt;res_alloc(heap, p-&gt;immd_nr, p=
, &amp;p-&gt;data[0])) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (heap-&gt;next &amp;&am=
p; heap-&gt;size &lt; p-&gt;immd_nr) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nv50_p=
rogram *evict =3D heap-&gt;next-&gt;priv;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvws-&gt;res_=
free(&amp;evict-&gt;data[0]);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (nvws-&gt;res_alloc(heap, =
p-&gt;immd_nr, p, &amp;p-&gt;data[0]))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 assert(0);<br=
>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* immediates only need to be uploaded again =
when freed */<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv50_program_upload_data(nv50, p-&gt;immd, p-=
&gt;data[0]-&gt;start,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0p-&gt;immd_nr, NV50_=
CB_PMISC);<br>
+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 if (!p-&gt;data[1] &amp;&amp; p-&gt;param_nr) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nouveau_resource *heap =3D nv50-&gt;sc=
reen-&gt;parm_heap[p-&gt;type];<br>
<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (nvws-&gt;res_alloc(heap, nr, p, &amp;p-&g=
t;data)) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (heap-&gt;next &amp;&am=
p; heap-&gt;size &lt; nr) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (nvws-&gt;res_alloc(heap, p-&gt;param_nr, =
p, &amp;p-&gt;data[1])) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (heap-&gt;next &amp;&am=
p; heap-&gt;size &lt; p-&gt;param_nr) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct nv50=
_program *evict =3D heap-&gt;next-&gt;priv;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvws-&gt;res_=
free(&amp;evict-&gt;data);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvws-&gt;res_=
free(&amp;evict-&gt;data[1]);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (nvws-&gt;res_alloc(heap, =
nr, p, &amp;p-&gt;data))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (nvws-&gt;res_alloc(heap, =
p-&gt;param_nr, p, &amp;p-&gt;data[1]))<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0assert(0);<=
br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
 =A0 =A0 =A0 =A0}<br>
<br>
 =A0 =A0 =A0 =A0if (p-&gt;param_nr) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned cbuf;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0float *map =3D ws-&gt;buffer_map(ws, nv50-&=
gt;constbuf[p-&gt;type],<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0PIPE_BUFFER_USAGE_CPU_READ);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv50_program_upload_data(nv50, map, p-&gt;dat=
a-&gt;start,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0p-&gt;param_nr);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 cbuf =3D (p-&gt;type =3D=3D PIPE_SHADER_VERTE=
X) ? NV50_CB_PVP : NV50_CB_PFP;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv50_program_upload_data(nv50, map, p-&gt;dat=
a[1]-&gt;start,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0p-&gt;param_nr, cbuf=
);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ws-&gt;buffer_unmap(ws, nv50-&gt;constbuf[p=
-&gt;type]);<br>
 =A0 =A0 =A0 =A0}<br>
-<br>
- =A0 =A0 =A0 if (p-&gt;immd_nr) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv50_program_upload_data(nv50, p-&gt;immd,<br=
>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0p-&gt;data-&gt;start + p-&gt;param_nr,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0p-&gt;immd_nr);<br>
- =A0 =A0 =A0 }<br>
=A0}<br>
<br>
=A0static void<br>
@@ -2193,20 +2198,26 @@ nv50_program_validate_code(struct nv50_context *nv5=
0, struct nv50_program *p)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0upload =3D TRUE;<br>
 =A0 =A0 =A0 =A0}<br>
<br>
- =A0 =A0 =A0 if (p-&gt;data &amp;&amp; p-&gt;data-&gt;start !=3D p-&gt;dat=
a_start) {<br>
+ =A0 =A0 =A0 if ((p-&gt;data[0] &amp;&amp; p-&gt;data[0]-&gt;start !=3D p-=
&gt;data_start[0]) ||<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 (p-&gt;data[1] &amp;&amp; p-&gt;data[1]-&gt;s=
tart !=3D p-&gt;data_start[1]))<br>
+ =A0 =A0 =A0 {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (e =3D p-&gt;exec_head; e; e =3D e-&gt;=
next) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned ei, ci;<br>
<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (e-&gt;param.index &lt; =
0)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;<b=
r>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ei =3D e-&gt;param.shift &g=
t;&gt; 5;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ci =3D e-&gt;param.index + p-=
&gt;data-&gt;start;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ci =3D e-&gt;param.index + p-=
&gt;data[e-&gt;<a href=3D"http://param.bs" target=3D"_blank">param.bs</a>]-=
&gt;start;<br>
<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0e-&gt;inst[ei] &amp;=3D ~e-=
&gt;param.mask;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0e-&gt;inst[ei] |=3D (ci &lt=
;&lt; e-&gt;param.shift);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 p-&gt;data_start =3D p-&gt;data-&gt;start;<br=
>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (p-&gt;data[0])<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p-&gt;data_start[0] =3D p-&gt=
;data[0]-&gt;start;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (p-&gt;data[1])<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p-&gt;data_start[1] =3D p-&gt=
;data[1]-&gt;start;<br>
+<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0upload =3D TRUE;<br>
 =A0 =A0 =A0 =A0}<br>
<br>
@@ -2364,7 +2375,8 @@ nv50_program_destroy(struct nv50_context *nv50, struc=
t nv50_program *p)<br>
 =A0 =A0 =A0 =A0if (p-&gt;buffer)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pipe_buffer_reference(&amp;p-&gt;buffer, NU=
LL);<br>
<br>
- =A0 =A0 =A0 nv50-&gt;screen-&gt;nvws-&gt;res_free(&amp;p-&gt;data);<br>
+ =A0 =A0 =A0 nv50-&gt;screen-&gt;nvws-&gt;res_free(&amp;p-&gt;data[0]);<br=
>
+ =A0 =A0 =A0 nv50-&gt;screen-&gt;nvws-&gt;res_free(&amp;p-&gt;data[1]);<br=
>
<br>
 =A0 =A0 =A0 =A0p-&gt;translated =3D 0;<br>
=A0}<br>
diff --git a/src/gallium/drivers/nv50/nv50_program.h b/src/gallium/drivers/=
nv50/nv50_program.h<br>
index 3b3b6bb..9dd0f37 100644<br>
--- a/src/gallium/drivers/nv50/nv50_program.h<br>
+++ b/src/gallium/drivers/nv50/nv50_program.h<br>
@@ -10,6 +10,7 @@ struct nv50_program_exec {<br>
 =A0 =A0 =A0 =A0unsigned inst[2];<br>
 =A0 =A0 =A0 =A0struct {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int index;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 int bs; /* buffer selector */<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned mask;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned shift;<br>
 =A0 =A0 =A0 =A0} param;<br>
@@ -24,8 +25,8 @@ struct nv50_program {<br>
 =A0 =A0 =A0 =A0struct nv50_program_exec *exec_head;<br>
 =A0 =A0 =A0 =A0struct nv50_program_exec *exec_tail;<br>
 =A0 =A0 =A0 =A0unsigned exec_size;<br>
- =A0 =A0 =A0 struct nouveau_resource *data;<br>
- =A0 =A0 =A0 unsigned data_start;<br>
+ =A0 =A0 =A0 struct nouveau_resource *data[2];<br>
+ =A0 =A0 =A0 unsigned data_start[2];<br>
<br>
 =A0 =A0 =A0 =A0struct pipe_buffer *buffer;<br>
<br>
diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/n=
v50/nv50_screen.c<br>
index 2980564..268eeeb 100644<br>
--- a/src/gallium/drivers/nv50/nv50_screen.c<br>
+++ b/src/gallium/drivers/nv50/nv50_screen.c<br>
@@ -290,20 +290,61 @@ nv50_screen_create(struct pipe_winsys *ws, struct nou=
veau_winsys *nvws)<br>
 =A0 =A0 =A0 =A0so_method(so, screen-&gt;tesla, 0x16b8, 1);<br>
 =A0 =A0 =A0 =A0so_data =A0(so, 8);<br>
<br>
- =A0 =A0 =A0 /* Shared constant buffer */<br>
- =A0 =A0 =A0 screen-&gt;constbuf =3D screen-&gt;pipe.buffer_create(&amp;sc=
reen-&gt;pipe, 0, 0, 128 * 4 * 4);<br>
- =A0 =A0 =A0 if (nvws-&gt;res_init(&amp;screen-&gt;vp_data_heap, 0, 128)) =
{<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 NOUVEAU_ERR(&quot;Error initialising constant=
 buffer\n&quot;);<br>
+ =A0 =A0 =A0 /* constant buffers for immediates and VP/FP parameters */<br=
>
+ =A0 =A0 =A0 screen-&gt;constbuf_misc[0] =3D<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 screen-&gt;pipe.buffer_create(&amp;screen-&gt=
;pipe, 0, 0, 128 * 4 * 4);<br>
+<br>
+ =A0 =A0 =A0 screen-&gt;constbuf_parm[0] =3D<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 screen-&gt;pipe.buffer_create(&amp;screen-&gt=
;pipe, 0, 0, 128 * 4 * 4);<br>
+<br>
+ =A0 =A0 =A0 screen-&gt;constbuf_parm[1] =3D<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 screen-&gt;pipe.buffer_create(&amp;screen-&gt=
;pipe, 0, 0, 128 * 4 * 4);<br>
+<br>
+ =A0 =A0 =A0 if (nvws-&gt;res_init(&amp;screen-&gt;immd_heap[0], 0, 128) |=
|<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvws-&gt;res_init(&amp;screen-&gt;parm_heap[0=
], 0, 128) ||<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvws-&gt;res_init(&amp;screen-&gt;parm_heap[1=
], 0, 128))<br>
+ =A0 =A0 =A0 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 NOUVEAU_ERR(&quot;Error initialising constant=
 buffers.\n&quot;);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv50_screen_destroy(&amp;screen-&gt;pipe);<=
br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return NULL;<br>
 =A0 =A0 =A0 =A0}<br>
<br>
 =A0 =A0 =A0 =A0so_method(so, screen-&gt;tesla, 0x1280, 3);<br>
- =A0 =A0 =A0 so_reloc (so, screen-&gt;constbuf, 0, NOUVEAU_BO_VRAM |<br>
+ =A0 =A0 =A0 so_reloc (so, screen-&gt;constbuf_misc[0], 0, NOUVEAU_BO_VRAM=
 |<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);=
<br>
- =A0 =A0 =A0 so_reloc (so, screen-&gt;constbuf, 0, NOUVEAU_BO_VRAM |<br>
+ =A0 =A0 =A0 so_reloc (so, screen-&gt;constbuf_misc[0], 0, NOUVEAU_BO_VRAM=
 |<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);<=
br>
- =A0 =A0 =A0 so_data =A0(so, (NV50_CB_PMISC &lt;&lt; 16) | 0x00001000);<br=
>
+ =A0 =A0 =A0 so_data =A0(so, (NV50_CB_PMISC &lt;&lt; 16) | 0x00000800);<br=
>
+ =A0 =A0 =A0 so_method(so, screen-&gt;tesla, 0x1694, 1);<br>
+ =A0 =A0 =A0 so_data =A0(so, 0x00000001 | (NV50_CB_PMISC &lt;&lt; 12));<br=
>
+ =A0 =A0 =A0 so_method(so, screen-&gt;tesla, 0x1694, 1);<br>
+ =A0 =A0 =A0 so_data =A0(so, 0x00000031 | (NV50_CB_PMISC &lt;&lt; 12));<br=
>
+<br>
+ =A0 =A0 =A0 so_method(so, screen-&gt;tesla, 0x1280, 3);<br>
+ =A0 =A0 =A0 so_reloc (so, screen-&gt;constbuf_parm[0], 0, NOUVEAU_BO_VRAM=
 |<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);<b=
r>
+ =A0 =A0 =A0 so_reloc (so, screen-&gt;constbuf_parm[0], 0, NOUVEAU_BO_VRAM=
 |<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);<br=
>
+ =A0 =A0 =A0 so_data =A0(so, (NV50_CB_PVP &lt;&lt; 16) | 0x00000800);<br>
+ =A0 =A0 =A0 so_method(so, screen-&gt;tesla, 0x1694, 1);<br>
+ =A0 =A0 =A0 so_data =A0(so, 0x00000101 | (NV50_CB_PVP &lt;&lt; 12));<br>
+<br>
+ =A0 =A0 =A0 so_method(so, screen-&gt;tesla, 0x1280, 3);<br>
+ =A0 =A0 =A0 so_reloc (so, screen-&gt;constbuf_parm[1], 0, NOUVEAU_BO_VRAM=
 |<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);<b=
r>
+ =A0 =A0 =A0 so_reloc (so, screen-&gt;constbuf_parm[1], 0, NOUVEAU_BO_VRAM=
 |<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);<br=
>
+ =A0 =A0 =A0 so_data =A0(so, (NV50_CB_PMISC &lt;&lt; 16) | 0x00000800);<br=
>
+ =A0 =A0 =A0 so_method(so, screen-&gt;tesla, 0x1694, 1);<br>
+ =A0 =A0 =A0 so_data =A0(so, 0x00000131 | (NV50_CB_PFP &lt;&lt; 12));<br>
+<br>
+ =A0 =A0 =A0 /*<br>
+ =A0 =A0 =A0 // map VP and FP CB index 0 to CB_PMISC<br>
+ =A0 =A0 =A0 so_method(so, screen-&gt;tesla, 0x1694, 1);<br>
+ =A0 =A0 =A0 so_data =A0(so, 0x000BBNP1 =3D 0x00000001);<br>
+ =A0 =A0 =A0 so_method(so, screen-&gt;tesla, 0x1694, 1);<br>
+ =A0 =A0 =A0 so_data =A0(so, 0x000BBNP1 =3D 0x00000031);<br>
+ =A0 =A0 =A0 */<br>
<br>
 =A0 =A0 =A0 =A0/* Texture sampler/image unit setup - we abuse the constant=
 buffer<br>
 =A0 =A0 =A0 =A0 * upload mechanism for the moment to upload data to the te=
x config<br>
diff --git a/src/gallium/drivers/nv50/nv50_screen.h b/src/gallium/drivers/n=
v50/nv50_screen.h<br>
index db567aa..31b8ef2 100644<br>
--- a/src/gallium/drivers/nv50/nv50_screen.h<br>
+++ b/src/gallium/drivers/nv50/nv50_screen.h<br>
@@ -15,8 +15,11 @@ struct nv50_screen {<br>
 =A0 =A0 =A0 =A0struct nouveau_grobj *m2mf;<br>
 =A0 =A0 =A0 =A0struct nouveau_notifier *sync;<br>
<br>
- =A0 =A0 =A0 struct pipe_buffer *constbuf;<br>
- =A0 =A0 =A0 struct nouveau_resource *vp_data_heap;<br>
+ =A0 =A0 =A0 struct pipe_buffer *constbuf_misc[1];<br>
+ =A0 =A0 =A0 struct pipe_buffer *constbuf_parm[2];<br>
+<br>
+ =A0 =A0 =A0 struct nouveau_resource *immd_heap[1];<br>
+ =A0 =A0 =A0 struct nouveau_resource *parm_heap[2];<br>
<br>
 =A0 =A0 =A0 =A0struct pipe_buffer *tic;<br>
 =A0 =A0 =A0 =A0struct pipe_buffer *tsc;<br>
<br>_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank">Nouveau@=
lists.freedesktop.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" target=3D=
"_blank">http://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
<br></blockquote></div><br>

--0021cc0223827fdb63046a024a0e--

--===============1463278385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1463278385==--
