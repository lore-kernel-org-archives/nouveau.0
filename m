From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Regression caused by 2e9ee44797 ("nv50/ir/ra: some
	register spilling fixes")
Date: Fri, 14 Feb 2014 00:35:10 -0500
Message-ID: <CAKb7UvhzwTw3vNAZ6FasAeaD4DN3FiY+OBRnrmhyj1LyChfpQg@mail.gmail.com>
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
To: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi Christoph,

bin/shader_runner
tests/spec/glsl-1.40/uniform_buffer/fs-struct-copy-complicated.shader_test
-auto
bin/shader_runner
tests/spec/glsl-1.40/uniform_buffer/vs-struct-copy-complicated.shader_test
-auto
bin/shader_runner
tests/spec/glsl-1.50/uniform_buffer/gs-struct-copy-complicated.shader_test
-auto

Now all segfault. I reverted 2e9ee44797 ("nv50/ir/ra: some register
spilling fixes") on top of HEAD, and it's all fine again. This is on
NV96. I know that this commit fixed a bunch of stuff on NVC0+, so it'd
be nice to get everything working together all at once :)

Below is a backtrace... looks like slot == NULL. Let me know if you
need anything else from me.

Thanks,

  -ilia

Program received signal SIGSEGV, Segmentation fault.
0x00007ffff2756598 in nv50_ir::SpillCodeInserter::unspill (
    this=0x7fffffffd160, usei=0x76a9a0, lval=0xc08f30, slot=0x0)
    at codegen/nv50_ir_ra.cpp:1514
1514       if (slot->reg.file == FILE_MEMORY_LOCAL) {
(gdb) bt
#0  0x00007ffff2756598 in nv50_ir::SpillCodeInserter::unspill (
    this=0x7fffffffd160, usei=0x76a9a0, lval=0xc08f30, slot=0x0)
    at codegen/nv50_ir_ra.cpp:1514
#1  0x00007ffff2756919 in nv50_ir::SpillCodeInserter::run (
Python Exception <type 'exceptions.IndexError'> list index out of range:
    this=0x7fffffffd160, lst=std::list) at codegen/nv50_ir_ra.cpp:1566
#2  0x00007ffff27559dd in nv50_ir::GCRA::allocateRegisters (
    this=0x7fffffffd1c0, insns=...) at codegen/nv50_ir_ra.cpp:1373
#3  0x00007ffff275700a in nv50_ir::RegAlloc::execFunc (this=0x7fffffffd530)
    at codegen/nv50_ir_ra.cpp:1662
#4  0x00007ffff2756ba6 in nv50_ir::RegAlloc::exec (this=0x7fffffffd530)
    at codegen/nv50_ir_ra.cpp:1602
#5  0x00007ffff27573a8 in nv50_ir::Program::registerAllocation (this=0x748cc0)
    at codegen/nv50_ir_ra.cpp:1709
#6  0x00007ffff270a72d in nv50_ir_generate_code (info=0x7477c0)
    at codegen/nv50_ir.cpp:1204
#7  0x00007ffff2781233 in nv50_program_translate (prog=0x744400, chipset=150)
    at nv50/nv50_program.c:362
#8  0x00007ffff2782117 in nv50_program_validate (nv50=0x63d6d0, prog=0x744400)
    at nv50/nv50_shader_state.c:117
#9  0x00007ffff278243e in nv50_fragprog_validate (nv50=0x63d6d0)
    at nv50/nv50_shader_state.c:175
#10 0x00007ffff2773007 in nv50_state_validate (nv50=0x63d6d0, mask=4294967295,
    words=8) at nv50/nv50_state_validate.c:451
