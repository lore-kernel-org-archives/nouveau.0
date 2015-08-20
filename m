From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90887] PhiMovesPass in register allocator broken
Date: Thu, 20 Aug 2015 23:34:59 +0000
Message-ID: <bug-90887-8800-SbTQD1gRnf@http.bugs.freedesktop.org/>
References: <bug-90887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1906625436=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90887-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1906625436==
Content-Type: multipart/alternative; boundary="1440113699.Ca1B12.23999"; charset="UTF-8"


--1440113699.Ca1B12.23999
Date: Thu, 20 Aug 2015 23:34:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90887

--- Comment #28 from jr <j-r-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #27)
> If you're still having trouble, try building for a fermi or kepler target
> using nouveau_compiler, i.e.
> 
> src/gallium/drivers/nouveau/nouveau_compiler -a c0 -
> <paste the tgsi shader, ^D>
> 
> and enjoy. [It also can take it from a file.]

Nice, thanks for the hint. But it produces different code to your log (without
any ld u64) and BB4 doesn't vanish. It seems to trigger edge splitting once on
the 2 to 4 edge:

Compiling for NVC0
translating program of type 4
FRAG
PROPERTY FS_COLOR0_WRITES_ALL_CBUFS 1
DCL OUT[0], COLOR
DCL CONST[0..2]
DCL TEMP[0..1], LOCAL
IMM[0] INT32 {1, 2, 0, 0}
  0: MOV TEMP[0], CONST[1]
  1: USNE TEMP[1].x, CONST[0].xxxx, IMM[0].xxxx
  2: UIF TEMP[1].xxxx :0
  3:   USEQ TEMP[1].x, CONST[0].xxxx, IMM[0].yyyy
  4:   UIF TEMP[1].xxxx :0
  5:     MOV TEMP[0].xy, CONST[2].xyxx
  6:   ENDIF
  7: ELSE :0
  8:   MOV TEMP[0], CONST[2]
  9: ENDIF
 10: MOV OUT[0], TEMP[0]
 11: END

MAIN:-1 ()
---
BB:0 (15 instructions) - df = { }
 -> BB:5 (tree)
 -> BB:2 (tree)
  0: rdsv f32 %r0 sv[POSITION:3] (0)
  1: rcp f32 %r0 %r0 (0)
  2: ld u32 %r5 c0[0x10] (0)
  3: mov f32 %r1 %r5 (0)
  4: ld u32 %r6 c0[0x14] (0)
  5: mov f32 %r2 %r6 (0)
  6: ld u32 %r7 c0[0x18] (0)
  7: mov f32 %r3 %r7 (0)
  8: ld u32 %r8 c0[0x1c] (0)
  9: mov f32 %r4 %r8 (0)
 10: ld u32 %r10 c0[0x0] (0)
 11: mov u32 %r11 0x00000001 (0)
 12: set u32 %r9 ne %r10 %r11 (0)
 13: joinat BB:6 (0)
 14: eq %r9 bra BB:5 (0)
---
 <- BB:0 (tree)
BB:2 (5 instructions) - df = { }
 -> BB:4 (forward)
 -> BB:3 (tree)
 15: ld u32 %r12 c0[0x0] (0)
 16: mov u32 %r13 0x00000002 (0)
 17: set u32 %r9 eq %r12 %r13 (0)
 18: joinat BB:4 (0)
 19: eq %r9 bra BB:4 (0)
---
 <- BB:2 (tree)
BB:3 (5 instructions) - df = { }
 -> BB:4 (forward)
 20: ld u32 %r14 c0[0x20] (0)
 21: mov f32 %r1 %r14 (0)
 22: ld u32 %r15 c0[0x24] (0)
 23: mov f32 %r2 %r15 (0)
 24: bra BB:4 (0)
---
 <- BB:2 (forward)
 <- BB:3 (forward)
BB:4 (2 instructions) - df = { }
 -> BB:6 (forward)
 25: join (0)
 26: bra BB:6 (0)
---
 <- BB:0 (tree)
BB:5 (9 instructions) - df = { }
 -> BB:6 (forward)
 27: ld u32 %r16 c0[0x20] (0)
 28: mov f32 %r1 %r16 (0)
 29: ld u32 %r17 c0[0x24] (0)
 30: mov f32 %r2 %r17 (0)
 31: ld u32 %r18 c0[0x28] (0)
 32: mov f32 %r3 %r18 (0)
 33: ld u32 %r19 c0[0x2c] (0)
 34: mov f32 %r4 %r19 (0)
 35: bra BB:6 (0)
---
 <- BB:4 (forward)
 <- BB:5 (forward)
BB:6 (5 instructions) - df = { }
 -> BB:1 (tree)
 36: join (0)
 37: mov f32 %r20 %r1 (0)
 38: mov f32 %r21 %r2 (0)
 39: mov f32 %r22 %r3 (0)
 40: mov f32 %r23 %r4 (0)
---
 <- BB:6 (tree)
BB:1 (5 instructions) - df = { }
 41: export f32 # o[0x0] %r20 (0)
 42: export f32 # o[0x4] %r21 (0)
 43: export f32 # o[0x8] %r22 (0)
 44: export f32 # o[0xc] %r23 (0)
 45: exit - # (0)

MAIN:-1 ()
---
BB:0 (16 instructions) - df = { }
 -> BB:5 (tree)
 -> BB:2 (tree)
  0: linterp pass f32 %r30 a[0x7c] (0)
  1: rcp f32 %r31 %r30 (0)
  2: ld u32 %r32 c0[0x10] (0)
  3: mov f32 %r33 %r32 (0)
  4: ld u32 %r34 c0[0x14] (0)
  5: mov f32 %r35 %r34 (0)
  6: ld u32 %r36 c0[0x18] (0)
  7: mov f32 %r37 %r36 (0)
  8: ld u32 %r38 c0[0x1c] (0)
  9: mov f32 %r39 %r38 (0)
 10: ld u32 %r40 c0[0x0] (0)
 11: mov u32 %r41 0x00000001 (0)
 12: set u32 %r42 ne %r40 %r41 (0)
 13: joinat BB:6 (0)
 14: set u8 %p43 neu u32 0x00000000 %r42 (0)
 15: not %p43 bra BB:5 (0)
---
 <- BB:0 (tree)
BB:2 (6 instructions) - idom = BB:0, df = { BB:6 }
 -> BB:4 (forward)
 -> BB:3 (tree)
 16: ld u32 %r44 c0[0x0] (0)
 17: mov u32 %r45 0x00000002 (0)
 18: set u32 %r46 eq %r44 %r45 (0)
 19: joinat BB:4 (0)
 20: set u8 %p47 neu u32 0x00000000 %r46 (0)
 21: not %p47 bra BB:4 (0)
---
 <- BB:2 (tree)
BB:3 (5 instructions) - idom = BB:2, df = { BB:4 }
 -> BB:4 (forward)
 22: ld u32 %r48 c0[0x20] (0)
 23: mov f32 %r49 %r48 (0)
 24: ld u32 %r50 c0[0x24] (0)
 25: mov f32 %r51 %r50 (0)
 26: bra BB:4 (0)
---
 <- BB:2 (forward)
 <- BB:3 (forward)
BB:4 (4 instructions) - idom = BB:2, df = { BB:6 }
 -> BB:6 (forward)
 27: phi u32 %r52 %r33 %r49 (0)
 28: phi u32 %r53 %r35 %r51 (0)
 29: join (0)
 30: bra BB:6 (0)
---
 <- BB:0 (tree)
BB:5 (9 instructions) - idom = BB:0, df = { BB:6 }
 -> BB:6 (forward)
 31: ld u32 %r66 c0[0x20] (0)
 32: mov f32 %r67 %r66 (0)
 33: ld u32 %r68 c0[0x24] (0)
 34: mov f32 %r69 %r68 (0)
 35: ld u32 %r70 c0[0x28] (0)
 36: mov f32 %r71 %r70 (0)
 37: ld u32 %r72 c0[0x2c] (0)
 38: mov f32 %r73 %r72 (0)
 39: bra BB:6 (0)
---
 <- BB:4 (forward)
 <- BB:5 (forward)
BB:6 (9 instructions) - idom = BB:0, df = { }
 -> BB:1 (tree)
 40: phi u32 %r54 %r52 %r67 (0)
 41: phi u32 %r55 %r53 %r69 (0)
 42: phi u32 %r56 %r37 %r71 (0)
 43: phi u32 %r57 %r39 %r73 (0)
 44: join (0)
 45: mov f32 %r58 %r54 (0)
 46: mov f32 %r59 %r55 (0)
 47: mov f32 %r60 %r56 (0)
 48: mov f32 %r61 %r57 (0)
---
 <- BB:6 (tree)
BB:1 (5 instructions) - idom = BB:6, df = { }
 49: mov (SUBOP:1) f32 $r0 %r58 (0)
 50: mov (SUBOP:1) f32 $r1 %r59 (0)
 51: mov (SUBOP:1) f32 $r2 %r60 (0)
 52: mov (SUBOP:1) f32 $r3 %r61 (0)
 53: exit - # (0)
PEEPHOLE: DeadCodeElim

MAIN:-1 ()
---
BB:0 (14 instructions) - df = { }
 -> BB:5 (tree)
 -> BB:2 (tree)
  0: ld u32 %r32 c0[0x10] (0)
  1: mov f32 %r33 %r32 (0)
  2: ld u32 %r34 c0[0x14] (0)
  3: mov f32 %r35 %r34 (0)
  4: ld u32 %r36 c0[0x18] (0)
  5: mov f32 %r37 %r36 (0)
  6: ld u32 %r38 c0[0x1c] (0)
  7: mov f32 %r39 %r38 (0)
  8: ld u32 %r40 c0[0x0] (0)
  9: mov u32 %r41 0x00000001 (0)
 10: set u32 %r42 ne %r40 %r41 (0)
 11: joinat BB:6 (0)
 12: set u8 %p43 neu u32 0x00000000 %r42 (0)
 13: not %p43 bra BB:5 (0)
---
 <- BB:0 (tree)
BB:2 (6 instructions) - idom = BB:0, df = { BB:6 }
 -> BB:4 (forward)
 -> BB:3 (tree)
 14: ld u32 %r44 c0[0x0] (0)
 15: mov u32 %r45 0x00000002 (0)
 16: set u32 %r46 eq %r44 %r45 (0)
 17: joinat BB:4 (0)
 18: set u8 %p47 neu u32 0x00000000 %r46 (0)
 19: not %p47 bra BB:4 (0)
---
 <- BB:2 (tree)
BB:3 (5 instructions) - idom = BB:2, df = { BB:4 }
 -> BB:4 (forward)
 20: ld u32 %r48 c0[0x20] (0)
 21: mov f32 %r49 %r48 (0)
 22: ld u32 %r50 c0[0x24] (0)
 23: mov f32 %r51 %r50 (0)
 24: bra BB:4 (0)
---
 <- BB:2 (forward)
 <- BB:3 (forward)
BB:4 (4 instructions) - idom = BB:2, df = { BB:6 }
 -> BB:6 (forward)
 25: phi u32 %r52 %r33 %r49 (0)
 26: phi u32 %r53 %r35 %r51 (0)
 27: join (0)
 28: bra BB:6 (0)
---
 <- BB:0 (tree)
BB:5 (9 instructions) - idom = BB:0, df = { BB:6 }
 -> BB:6 (forward)
 29: ld u32 %r66 c0[0x20] (0)
 30: mov f32 %r67 %r66 (0)
 31: ld u32 %r68 c0[0x24] (0)
 32: mov f32 %r69 %r68 (0)
 33: ld u32 %r70 c0[0x28] (0)
 34: mov f32 %r71 %r70 (0)
 35: ld u32 %r72 c0[0x2c] (0)
 36: mov f32 %r73 %r72 (0)
 37: bra BB:6 (0)
---
 <- BB:4 (forward)
 <- BB:5 (forward)
BB:6 (9 instructions) - idom = BB:0, df = { }
 -> BB:1 (tree)
 38: phi u32 %r54 %r52 %r67 (0)
 39: phi u32 %r55 %r53 %r69 (0)
 40: phi u32 %r56 %r37 %r71 (0)
 41: phi u32 %r57 %r39 %r73 (0)
 42: join (0)
 43: mov f32 %r58 %r54 (0)
 44: mov f32 %r59 %r55 (0)
 45: mov f32 %r60 %r56 (0)
 46: mov f32 %r61 %r57 (0)
---
 <- BB:6 (tree)
BB:1 (5 instructions) - idom = BB:6, df = { }
 47: mov (SUBOP:1) f32 $r0 %r58 (0)
 48: mov (SUBOP:1) f32 $r1 %r59 (0)
 49: mov (SUBOP:1) f32 $r2 %r60 (0)
 50: mov (SUBOP:1) f32 $r3 %r61 (0)
 51: exit - # (0)
registerAllocation

MAIN:-1 ()
---
BB:0 (10 instructions) - df = { }
 -> BB:5 (tree)
 -> BB:2 (tree)
  0: ld u32 $r0 c0[0x10] (8)
  1: ld u32 $r1 c0[0x14] (8)
  2: ld u32 $r2 c0[0x18] (8)
  3: ld u32 $r3 c0[0x1c] (8)
  4: ld u32 $r4 c0[0x0] (8)
  5: mov u32 $r5 0x00000001 (8)
  6: set u32 $r4 ne $r4 $r5 (8)
  7: joinat BB:6 (8)
  8: set u8 $p0 neu u32 $r63 $r4 (8)
  9: not $p0 bra BB:5 (8)
---
 <- BB:0 (tree)
BB:2 (6 instructions) - idom = BB:0, df = { BB:6 }
 -> BB:7 (tree)
 -> BB:3 (tree)
 10: ld u32 $r4 c0[0x0] (8)
 11: mov u32 $r5 0x00000002 (8)
 12: set u32 $r4 eq $r4 $r5 (8)
 13: joinat BB:4 (8)
 14: set u8 $p0 neu u32 $r63 $r4 (8)
 15: not $p0 bra BB:7 (8)
---
 <- BB:2 (tree)
BB:3 (3 instructions) - idom = BB:2, df = { BB:4 }
 -> BB:4 (forward)
 16: ld u32 $r0 c0[0x20] (8)
 17: ld u32 $r1 c0[0x24] (8)
 18: join BB:4 (8)
---
 <- BB:2 (tree)
BB:7 (1 instructions) - df = { }
 -> BB:4 (forward)
 19: join BB:4 (8)
---
 <- BB:7 (forward)
 <- BB:3 (forward)
BB:4 (1 instructions) - idom = BB:2, df = { BB:6 }
 -> BB:6 (forward)
 20: join BB:6 (8)
---
 <- BB:0 (tree)
BB:5 (5 instructions) - idom = BB:0, df = { BB:6 }
 -> BB:6 (forward)
 21: ld u32 $r0 c0[0x20] (8)
 22: ld u32 $r1 c0[0x24] (8)
 23: ld u32 $r2 c0[0x28] (8)
 24: ld u32 $r3 c0[0x2c] (8)
 25: join BB:6 (8)
---
 <- BB:4 (forward)
 <- BB:5 (forward)
BB:6 (0 instructions) - idom = BB:0, df = { }
 -> BB:1 (tree)
---
 <- BB:6 (tree)
BB:1 (1 instructions) - idom = BB:6, df = { }
 26: exit - # (8)
nv50_ir_generate_code: ret = 0
program binary (216 bytes)
40001de4 28004000 50005de4 28004000 60009de4 28004000 7000dde4 28004000 
00011de4 28004000 04015de2 18000000 14411c03 128e0000 40000007 60000002 
13f1dc03 1e8e0000 600021e7 40000001 00011de4 28004000 08015de2 18000000 
14411c03 110e0000 c0000007 60000000 13f1dc03 1e8e0000 600021e7 40000000 
80001de4 28004000 90005de4 28004000 00001df4 40000000 00001df4 40000000 
00001df4 40000000 80001de4 28004000 90005de4 28004000 a0009de4 28004000 
b000dde4 28004000 00001df4 40000000 00001de7 80000000 


Unfortunately I have to go now. Am available tomorrow at the around the same
time.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1440113699.Ca1B12.23999
Date: Thu, 20 Aug 2015 23:34:59 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887#c28">Comment # 28</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887">bug 90887</a>
              from <span class="vcard"><a class="email" href="mailto:j-r&#64;online.de" title="jr &lt;j-r&#64;online.de&gt;"> <span class="fn">jr</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=90887#c27">comment #27</a>)
<span class="quote">&gt; If you're still having trouble, try building for a fermi or kepler target
&gt; using nouveau_compiler, i.e.
&gt; 
&gt; src/gallium/drivers/nouveau/nouveau_compiler -a c0 -
&gt; &lt;paste the tgsi shader, ^D&gt;
&gt; 
&gt; and enjoy. [It also can take it from a file.]</span >

Nice, thanks for the hint. But it produces different code to your log (without
any ld u64) and BB4 doesn't vanish. It seems to trigger edge splitting once on
the 2 to 4 edge:

Compiling for NVC0
translating program of type 4
FRAG
PROPERTY FS_COLOR0_WRITES_ALL_CBUFS 1
DCL OUT[0], COLOR
DCL CONST[0..2]
DCL TEMP[0..1], LOCAL
IMM[0] INT32 {1, 2, 0, 0}
  0: MOV TEMP[0], CONST[1]
  1: USNE TEMP[1].x, CONST[0].xxxx, IMM[0].xxxx
  2: UIF TEMP[1].xxxx :0
  3:   USEQ TEMP[1].x, CONST[0].xxxx, IMM[0].yyyy
  4:   UIF TEMP[1].xxxx :0
  5:     MOV TEMP[0].xy, CONST[2].xyxx
  6:   ENDIF
  7: ELSE :0
  8:   MOV TEMP[0], CONST[2]
  9: ENDIF
 10: MOV OUT[0], TEMP[0]
 11: END

MAIN:-1 ()
---
BB:0 (15 instructions) - df = { }
 -&gt; BB:5 (tree)
 -&gt; BB:2 (tree)
  0: rdsv f32 %r0 sv[POSITION:3] (0)
  1: rcp f32 %r0 %r0 (0)
  2: ld u32 %r5 c0[0x10] (0)
  3: mov f32 %r1 %r5 (0)
  4: ld u32 %r6 c0[0x14] (0)
  5: mov f32 %r2 %r6 (0)
  6: ld u32 %r7 c0[0x18] (0)
  7: mov f32 %r3 %r7 (0)
  8: ld u32 %r8 c0[0x1c] (0)
  9: mov f32 %r4 %r8 (0)
 10: ld u32 %r10 c0[0x0] (0)
 11: mov u32 %r11 0x00000001 (0)
 12: set u32 %r9 ne %r10 %r11 (0)
 13: joinat BB:6 (0)
 14: eq %r9 bra BB:5 (0)
---
 &lt;- BB:0 (tree)
BB:2 (5 instructions) - df = { }
 -&gt; BB:4 (forward)
 -&gt; BB:3 (tree)
 15: ld u32 %r12 c0[0x0] (0)
 16: mov u32 %r13 0x00000002 (0)
 17: set u32 %r9 eq %r12 %r13 (0)
 18: joinat BB:4 (0)
 19: eq %r9 bra BB:4 (0)
---
 &lt;- BB:2 (tree)
BB:3 (5 instructions) - df = { }
 -&gt; BB:4 (forward)
 20: ld u32 %r14 c0[0x20] (0)
 21: mov f32 %r1 %r14 (0)
 22: ld u32 %r15 c0[0x24] (0)
 23: mov f32 %r2 %r15 (0)
 24: bra BB:4 (0)
---
 &lt;- BB:2 (forward)
 &lt;- BB:3 (forward)
BB:4 (2 instructions) - df = { }
 -&gt; BB:6 (forward)
 25: join (0)
 26: bra BB:6 (0)
---
 &lt;- BB:0 (tree)
BB:5 (9 instructions) - df = { }
 -&gt; BB:6 (forward)
 27: ld u32 %r16 c0[0x20] (0)
 28: mov f32 %r1 %r16 (0)
 29: ld u32 %r17 c0[0x24] (0)
 30: mov f32 %r2 %r17 (0)
 31: ld u32 %r18 c0[0x28] (0)
 32: mov f32 %r3 %r18 (0)
 33: ld u32 %r19 c0[0x2c] (0)
 34: mov f32 %r4 %r19 (0)
 35: bra BB:6 (0)
---
 &lt;- BB:4 (forward)
 &lt;- BB:5 (forward)
BB:6 (5 instructions) - df = { }
 -&gt; BB:1 (tree)
 36: join (0)
 37: mov f32 %r20 %r1 (0)
 38: mov f32 %r21 %r2 (0)
 39: mov f32 %r22 %r3 (0)
 40: mov f32 %r23 %r4 (0)
---
 &lt;- BB:6 (tree)
BB:1 (5 instructions) - df = { }
 41: export f32 # o[0x0] %r20 (0)
 42: export f32 # o[0x4] %r21 (0)
 43: export f32 # o[0x8] %r22 (0)
 44: export f32 # o[0xc] %r23 (0)
 45: exit - # (0)

MAIN:-1 ()
---
BB:0 (16 instructions) - df = { }
 -&gt; BB:5 (tree)
 -&gt; BB:2 (tree)
  0: linterp pass f32 %r30 a[0x7c] (0)
  1: rcp f32 %r31 %r30 (0)
  2: ld u32 %r32 c0[0x10] (0)
  3: mov f32 %r33 %r32 (0)
  4: ld u32 %r34 c0[0x14] (0)
  5: mov f32 %r35 %r34 (0)
  6: ld u32 %r36 c0[0x18] (0)
  7: mov f32 %r37 %r36 (0)
  8: ld u32 %r38 c0[0x1c] (0)
  9: mov f32 %r39 %r38 (0)
 10: ld u32 %r40 c0[0x0] (0)
 11: mov u32 %r41 0x00000001 (0)
 12: set u32 %r42 ne %r40 %r41 (0)
 13: joinat BB:6 (0)
 14: set u8 %p43 neu u32 0x00000000 %r42 (0)
 15: not %p43 bra BB:5 (0)
---
 &lt;- BB:0 (tree)
BB:2 (6 instructions) - idom = BB:0, df = { BB:6 }
 -&gt; BB:4 (forward)
 -&gt; BB:3 (tree)
 16: ld u32 %r44 c0[0x0] (0)
 17: mov u32 %r45 0x00000002 (0)
 18: set u32 %r46 eq %r44 %r45 (0)
 19: joinat BB:4 (0)
 20: set u8 %p47 neu u32 0x00000000 %r46 (0)
 21: not %p47 bra BB:4 (0)
---
 &lt;- BB:2 (tree)
BB:3 (5 instructions) - idom = BB:2, df = { BB:4 }
 -&gt; BB:4 (forward)
 22: ld u32 %r48 c0[0x20] (0)
 23: mov f32 %r49 %r48 (0)
 24: ld u32 %r50 c0[0x24] (0)
 25: mov f32 %r51 %r50 (0)
 26: bra BB:4 (0)
---
 &lt;- BB:2 (forward)
 &lt;- BB:3 (forward)
BB:4 (4 instructions) - idom = BB:2, df = { BB:6 }
 -&gt; BB:6 (forward)
 27: phi u32 %r52 %r33 %r49 (0)
 28: phi u32 %r53 %r35 %r51 (0)
 29: join (0)
 30: bra BB:6 (0)
---
 &lt;- BB:0 (tree)
BB:5 (9 instructions) - idom = BB:0, df = { BB:6 }
 -&gt; BB:6 (forward)
 31: ld u32 %r66 c0[0x20] (0)
 32: mov f32 %r67 %r66 (0)
 33: ld u32 %r68 c0[0x24] (0)
 34: mov f32 %r69 %r68 (0)
 35: ld u32 %r70 c0[0x28] (0)
 36: mov f32 %r71 %r70 (0)
 37: ld u32 %r72 c0[0x2c] (0)
 38: mov f32 %r73 %r72 (0)
 39: bra BB:6 (0)
---
 &lt;- BB:4 (forward)
 &lt;- BB:5 (forward)
BB:6 (9 instructions) - idom = BB:0, df = { }
 -&gt; BB:1 (tree)
 40: phi u32 %r54 %r52 %r67 (0)
 41: phi u32 %r55 %r53 %r69 (0)
 42: phi u32 %r56 %r37 %r71 (0)
 43: phi u32 %r57 %r39 %r73 (0)
 44: join (0)
 45: mov f32 %r58 %r54 (0)
 46: mov f32 %r59 %r55 (0)
 47: mov f32 %r60 %r56 (0)
 48: mov f32 %r61 %r57 (0)
---
 &lt;- BB:6 (tree)
BB:1 (5 instructions) - idom = BB:6, df = { }
 49: mov (SUBOP:1) f32 $r0 %r58 (0)
 50: mov (SUBOP:1) f32 $r1 %r59 (0)
 51: mov (SUBOP:1) f32 $r2 %r60 (0)
 52: mov (SUBOP:1) f32 $r3 %r61 (0)
 53: exit - # (0)
PEEPHOLE: DeadCodeElim

MAIN:-1 ()
---
BB:0 (14 instructions) - df = { }
 -&gt; BB:5 (tree)
 -&gt; BB:2 (tree)
  0: ld u32 %r32 c0[0x10] (0)
  1: mov f32 %r33 %r32 (0)
  2: ld u32 %r34 c0[0x14] (0)
  3: mov f32 %r35 %r34 (0)
  4: ld u32 %r36 c0[0x18] (0)
  5: mov f32 %r37 %r36 (0)
  6: ld u32 %r38 c0[0x1c] (0)
  7: mov f32 %r39 %r38 (0)
  8: ld u32 %r40 c0[0x0] (0)
  9: mov u32 %r41 0x00000001 (0)
 10: set u32 %r42 ne %r40 %r41 (0)
 11: joinat BB:6 (0)
 12: set u8 %p43 neu u32 0x00000000 %r42 (0)
 13: not %p43 bra BB:5 (0)
---
 &lt;- BB:0 (tree)
BB:2 (6 instructions) - idom = BB:0, df = { BB:6 }
 -&gt; BB:4 (forward)
 -&gt; BB:3 (tree)
 14: ld u32 %r44 c0[0x0] (0)
 15: mov u32 %r45 0x00000002 (0)
 16: set u32 %r46 eq %r44 %r45 (0)
 17: joinat BB:4 (0)
 18: set u8 %p47 neu u32 0x00000000 %r46 (0)
 19: not %p47 bra BB:4 (0)
---
 &lt;- BB:2 (tree)
BB:3 (5 instructions) - idom = BB:2, df = { BB:4 }
 -&gt; BB:4 (forward)
 20: ld u32 %r48 c0[0x20] (0)
 21: mov f32 %r49 %r48 (0)
 22: ld u32 %r50 c0[0x24] (0)
 23: mov f32 %r51 %r50 (0)
 24: bra BB:4 (0)
---
 &lt;- BB:2 (forward)
 &lt;- BB:3 (forward)
BB:4 (4 instructions) - idom = BB:2, df = { BB:6 }
 -&gt; BB:6 (forward)
 25: phi u32 %r52 %r33 %r49 (0)
 26: phi u32 %r53 %r35 %r51 (0)
 27: join (0)
 28: bra BB:6 (0)
---
 &lt;- BB:0 (tree)
BB:5 (9 instructions) - idom = BB:0, df = { BB:6 }
 -&gt; BB:6 (forward)
 29: ld u32 %r66 c0[0x20] (0)
 30: mov f32 %r67 %r66 (0)
 31: ld u32 %r68 c0[0x24] (0)
 32: mov f32 %r69 %r68 (0)
 33: ld u32 %r70 c0[0x28] (0)
 34: mov f32 %r71 %r70 (0)
 35: ld u32 %r72 c0[0x2c] (0)
 36: mov f32 %r73 %r72 (0)
 37: bra BB:6 (0)
---
 &lt;- BB:4 (forward)
 &lt;- BB:5 (forward)
BB:6 (9 instructions) - idom = BB:0, df = { }
 -&gt; BB:1 (tree)
 38: phi u32 %r54 %r52 %r67 (0)
 39: phi u32 %r55 %r53 %r69 (0)
 40: phi u32 %r56 %r37 %r71 (0)
 41: phi u32 %r57 %r39 %r73 (0)
 42: join (0)
 43: mov f32 %r58 %r54 (0)
 44: mov f32 %r59 %r55 (0)
 45: mov f32 %r60 %r56 (0)
 46: mov f32 %r61 %r57 (0)
---
 &lt;- BB:6 (tree)
BB:1 (5 instructions) - idom = BB:6, df = { }
 47: mov (SUBOP:1) f32 $r0 %r58 (0)
 48: mov (SUBOP:1) f32 $r1 %r59 (0)
 49: mov (SUBOP:1) f32 $r2 %r60 (0)
 50: mov (SUBOP:1) f32 $r3 %r61 (0)
 51: exit - # (0)
registerAllocation

MAIN:-1 ()
---
BB:0 (10 instructions) - df = { }
 -&gt; BB:5 (tree)
 -&gt; BB:2 (tree)
  0: ld u32 $r0 c0[0x10] (8)
  1: ld u32 $r1 c0[0x14] (8)
  2: ld u32 $r2 c0[0x18] (8)
  3: ld u32 $r3 c0[0x1c] (8)
  4: ld u32 $r4 c0[0x0] (8)
  5: mov u32 $r5 0x00000001 (8)
  6: set u32 $r4 ne $r4 $r5 (8)
  7: joinat BB:6 (8)
  8: set u8 $p0 neu u32 $r63 $r4 (8)
  9: not $p0 bra BB:5 (8)
---
 &lt;- BB:0 (tree)
BB:2 (6 instructions) - idom = BB:0, df = { BB:6 }
 -&gt; BB:7 (tree)
 -&gt; BB:3 (tree)
 10: ld u32 $r4 c0[0x0] (8)
 11: mov u32 $r5 0x00000002 (8)
 12: set u32 $r4 eq $r4 $r5 (8)
 13: joinat BB:4 (8)
 14: set u8 $p0 neu u32 $r63 $r4 (8)
 15: not $p0 bra BB:7 (8)
---
 &lt;- BB:2 (tree)
BB:3 (3 instructions) - idom = BB:2, df = { BB:4 }
 -&gt; BB:4 (forward)
 16: ld u32 $r0 c0[0x20] (8)
 17: ld u32 $r1 c0[0x24] (8)
 18: join BB:4 (8)
---
 &lt;- BB:2 (tree)
BB:7 (1 instructions) - df = { }
 -&gt; BB:4 (forward)
 19: join BB:4 (8)
---
 &lt;- BB:7 (forward)
 &lt;- BB:3 (forward)
BB:4 (1 instructions) - idom = BB:2, df = { BB:6 }
 -&gt; BB:6 (forward)
 20: join BB:6 (8)
---
 &lt;- BB:0 (tree)
BB:5 (5 instructions) - idom = BB:0, df = { BB:6 }
 -&gt; BB:6 (forward)
 21: ld u32 $r0 c0[0x20] (8)
 22: ld u32 $r1 c0[0x24] (8)
 23: ld u32 $r2 c0[0x28] (8)
 24: ld u32 $r3 c0[0x2c] (8)
 25: join BB:6 (8)
---
 &lt;- BB:4 (forward)
 &lt;- BB:5 (forward)
BB:6 (0 instructions) - idom = BB:0, df = { }
 -&gt; BB:1 (tree)
---
 &lt;- BB:6 (tree)
BB:1 (1 instructions) - idom = BB:6, df = { }
 26: exit - # (8)
nv50_ir_generate_code: ret = 0
program binary (216 bytes)
40001de4 28004000 50005de4 28004000 60009de4 28004000 7000dde4 28004000 
00011de4 28004000 04015de2 18000000 14411c03 128e0000 40000007 60000002 
13f1dc03 1e8e0000 600021e7 40000001 00011de4 28004000 08015de2 18000000 
14411c03 110e0000 c0000007 60000000 13f1dc03 1e8e0000 600021e7 40000000 
80001de4 28004000 90005de4 28004000 00001df4 40000000 00001df4 40000000 
00001df4 40000000 80001de4 28004000 90005de4 28004000 a0009de4 28004000 
b000dde4 28004000 00001df4 40000000 00001de7 80000000 


Unfortunately I have to go now. Am available tomorrow at the around the same
time.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1440113699.Ca1B12.23999--

--===============1906625436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1906625436==--
