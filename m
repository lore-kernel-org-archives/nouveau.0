From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78161] [NV96] Artifacts in output of fragment
 program containing not unrolled loops with conditional break
Date: Fri, 02 May 2014 01:27:48 +0000
Message-ID: <bug-78161-8800-3dpeZ1ayqC@http.bugs.freedesktop.org/>
References: <bug-78161-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1374902722=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78161-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1374902722==
Content-Type: multipart/alternative; boundary="1398994068.BA5fa1.25217"; charset="us-ascii"


--1398994068.BA5fa1.25217
Date: Fri, 2 May 2014 01:27:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78161

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
The relevant TGSI shader:

FRAG
PROPERTY FS_COLOR0_WRITES_ALL_CBUFS 1
DCL IN[0], GENERIC[20], PERSPECTIVE
DCL OUT[0], COLOR
DCL CONST[0]
DCL TEMP[0..13], LOCAL
IMM[0] FLT32 {    1.0000,     0.0000,   200.0000, 234895.7188}
IMM[1] FLT32 {  231.0000,    33.0000,     1.1000,     0.9800}
IMM[2] FLT32 {    0.0050,     0.1000,     0.0000,     0.0000}
  0: MOV TEMP[0], IMM[0].xxxx
  1: MOV TEMP[1].xy, IN[0].xyxx
  2: MOV TEMP[2].x, IMM[0].yyyy
  3: BGNLOOP :0
  4:   FSGE TEMP[3].x, TEMP[2].xxxx, IMM[0].zzzz
  5:   UIF TEMP[3].xxxx :0
  6:     BRK
  7:   ENDIF
  8:   FSLT TEMP[4].x, CONST[0].xxxx, TEMP[2].xxxx
  9:   UIF TEMP[4].xxxx :0
 10:     BRK
 11:   ENDIF
 12:   MUL TEMP[5].x, TEMP[1].xxxx, IMM[1].xxxx
 13:   ADD TEMP[6].x, TEMP[2].xxxx, IMM[1].yyyy
 14:   MUL TEMP[7].x, TEMP[5].xxxx, TEMP[6].xxxx
 15:   MAD TEMP[8].x, TEMP[1].yyyy, IMM[0].wwww, TEMP[7].xxxx
 16:   ADD TEMP[9].x, TEMP[2].xxxx, IMM[1].zzzz
 17:   MUL TEMP[10].x, TEMP[8].xxxx, TEMP[9].xxxx
 18:   COS TEMP[11].x, TEMP[10].xxxx
 19:   FSLT TEMP[12].x, IMM[1].wwww, TEMP[11].xxxx
 20:   UIF TEMP[12].xxxx :0
 21:     MOV TEMP[0].xyw, IMM[0].yyyx
 22:     MUL TEMP[13].x, TEMP[2].xxxx, IMM[2].xxxx
 23:     MOV TEMP[0].z, TEMP[13].xxxx
 24:     BRK
 25:   ENDIF
 26:   ADD TEMP[2].x, TEMP[2].xxxx, IMM[0].xxxx
 27: ENDLOOP :0
 28: ADD TEMP[0].x, TEMP[0].xxxx, IMM[2].yyyy
 29: MOV OUT[0], TEMP[0]
 30: END

and the envydis output of the generated shader (on my G96, with ~mesa-git):

00000000: 80000000              interp $r0 v[0x0]
00000004: 90000000              rcp f32 $r0 $r0
00000008: 1000800d 03f80003     mov b32 $r3 0x3f800000
00000010: 82010004              interp $r1 v[0x4] $r0
00000014: 82020000              interp $r0 v[0x8] $r0
00000018: 10008009 00000003     mov b32 $r2 0x0
00000020: 40024003 00000000     breakaddr 0x120
00000028: 10008011 04348003   B mov b32 $r4 0x43480000
00000030: b00405fd 600187c8     set $c0 # ge f32 $r2 $r4
00000038: 10000601 0403c280     (lg $c0) mov b32 $r0 $r3
00000040: 10000605 0403c280     (lg $c0) mov b32 $r1 $r3
00000048: 10000609 0403c280     (lg $c0) mov b32 $r2 $r3
00000050: 50000003 00000280     (lg $c0) break
00000058: 10000011 2400c780     ld $r4 b32 c0[0x0]
00000060: b00405fd 600107c8     set $c0 # g f32 $r2 $r4
00000068: 10000601 0403c280     (lg $c0) mov b32 $r0 $r3
00000070: 10000605 0403c280     (lg $c0) mov b32 $r1 $r3
00000078: 10000609 0403c280     (lg $c0) mov b32 $r2 $r3
00000080: 50000003 00000280     (lg $c0) break
00000088: c0000211 04367003     mul f32 $r4 $r1 0x43670000
00000090: b0000415 04204003     add f32 $r5 $r2 0x42040000
00000098: c0050811 00000780     mul rn f32 $r4 $r4 $r5
000000a0: 102e8015 0486563f     mov b32 $r5 0x486563ee
000000a8: e0050011 00010780     add f32 $r4 (mul $r0 $r5) $r4
000000b0: b00d0415 03f8cccf     add f32 $r5 $r2 0x3f8ccccd
000000b8: c0050811 00000780     mul rn f32 $r4 $r4 $r5
000000c0: b0000811 c0000780     presin f32 $r4 $r4
000000c8: 90000811 a0000780     cos f32 $r4 $r4
000000d0: 10088015 03f7ae17     mov b32 $r5 0x3f7ae148
000000d8: b00509fd 600107c8     set $c0 # g f32 $r4 $r5
000000e0: 10022003 00000100     (e $c0) bra 0x110
000000e8: 10008005 00000003     mov b32 $r1 0x0
000000f0: 1000800d 03f80003     mov b32 $r3 0x3f800000
000000f8: c00a0409 03ba3d73     mul f32 $r2 $r2 0x3ba3d70a
00000100: 10000201 0403c780     mov b32 $r0 $r1
00000108: 50000003 00000780     break
00000110: b0000409 03f80003   B add f32 $r2 $r2 0x3f800000
00000118: 10005003 00000780     bra 0x28
00000120: b00d0001 03dccccf   B add f32 $r0 $r0 0x3dcccccd
00000128: f0000001 e0000001     exit (never) nop

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398994068.BA5fa1.25217
Date: Fri, 2 May 2014 01:27:48 +0000
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
   title="NEW --- - [NV96] Artifacts in output of fragment program containing not unrolled loops with conditional break"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78161#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] Artifacts in output of fragment program containing not unrolled loops with conditional break"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78161">bug 78161</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>The relevant TGSI shader:

FRAG
PROPERTY FS_COLOR0_WRITES_ALL_CBUFS 1
DCL IN[0], GENERIC[20], PERSPECTIVE
DCL OUT[0], COLOR
DCL CONST[0]
DCL TEMP[0..13], LOCAL
IMM[0] FLT32 {    1.0000,     0.0000,   200.0000, 234895.7188}
IMM[1] FLT32 {  231.0000,    33.0000,     1.1000,     0.9800}
IMM[2] FLT32 {    0.0050,     0.1000,     0.0000,     0.0000}
  0: MOV TEMP[0], IMM[0].xxxx
  1: MOV TEMP[1].xy, IN[0].xyxx
  2: MOV TEMP[2].x, IMM[0].yyyy
  3: BGNLOOP :0
  4:   FSGE TEMP[3].x, TEMP[2].xxxx, IMM[0].zzzz
  5:   UIF TEMP[3].xxxx :0
  6:     BRK
  7:   ENDIF
  8:   FSLT TEMP[4].x, CONST[0].xxxx, TEMP[2].xxxx
  9:   UIF TEMP[4].xxxx :0
 10:     BRK
 11:   ENDIF
 12:   MUL TEMP[5].x, TEMP[1].xxxx, IMM[1].xxxx
 13:   ADD TEMP[6].x, TEMP[2].xxxx, IMM[1].yyyy
 14:   MUL TEMP[7].x, TEMP[5].xxxx, TEMP[6].xxxx
 15:   MAD TEMP[8].x, TEMP[1].yyyy, IMM[0].wwww, TEMP[7].xxxx
 16:   ADD TEMP[9].x, TEMP[2].xxxx, IMM[1].zzzz
 17:   MUL TEMP[10].x, TEMP[8].xxxx, TEMP[9].xxxx
 18:   COS TEMP[11].x, TEMP[10].xxxx
 19:   FSLT TEMP[12].x, IMM[1].wwww, TEMP[11].xxxx
 20:   UIF TEMP[12].xxxx :0
 21:     MOV TEMP[0].xyw, IMM[0].yyyx
 22:     MUL TEMP[13].x, TEMP[2].xxxx, IMM[2].xxxx
 23:     MOV TEMP[0].z, TEMP[13].xxxx
 24:     BRK
 25:   ENDIF
 26:   ADD TEMP[2].x, TEMP[2].xxxx, IMM[0].xxxx
 27: ENDLOOP :0
 28: ADD TEMP[0].x, TEMP[0].xxxx, IMM[2].yyyy
 29: MOV OUT[0], TEMP[0]
 30: END

and the envydis output of the generated shader (on my G96, with ~mesa-git):

00000000: 80000000              interp $r0 v[0x0]
00000004: 90000000              rcp f32 $r0 $r0
00000008: 1000800d 03f80003     mov b32 $r3 0x3f800000
00000010: 82010004              interp $r1 v[0x4] $r0
00000014: 82020000              interp $r0 v[0x8] $r0
00000018: 10008009 00000003     mov b32 $r2 0x0
00000020: 40024003 00000000     breakaddr 0x120
00000028: 10008011 04348003   B mov b32 $r4 0x43480000
00000030: b00405fd 600187c8     set $c0 # ge f32 $r2 $r4
00000038: 10000601 0403c280     (lg $c0) mov b32 $r0 $r3
00000040: 10000605 0403c280     (lg $c0) mov b32 $r1 $r3
00000048: 10000609 0403c280     (lg $c0) mov b32 $r2 $r3
00000050: 50000003 00000280     (lg $c0) break
00000058: 10000011 2400c780     ld $r4 b32 c0[0x0]
00000060: b00405fd 600107c8     set $c0 # g f32 $r2 $r4
00000068: 10000601 0403c280     (lg $c0) mov b32 $r0 $r3
00000070: 10000605 0403c280     (lg $c0) mov b32 $r1 $r3
00000078: 10000609 0403c280     (lg $c0) mov b32 $r2 $r3
00000080: 50000003 00000280     (lg $c0) break
00000088: c0000211 04367003     mul f32 $r4 $r1 0x43670000
00000090: b0000415 04204003     add f32 $r5 $r2 0x42040000
00000098: c0050811 00000780     mul rn f32 $r4 $r4 $r5
000000a0: 102e8015 0486563f     mov b32 $r5 0x486563ee
000000a8: e0050011 00010780     add f32 $r4 (mul $r0 $r5) $r4
000000b0: b00d0415 03f8cccf     add f32 $r5 $r2 0x3f8ccccd
000000b8: c0050811 00000780     mul rn f32 $r4 $r4 $r5
000000c0: b0000811 c0000780     presin f32 $r4 $r4
000000c8: 90000811 a0000780     cos f32 $r4 $r4
000000d0: 10088015 03f7ae17     mov b32 $r5 0x3f7ae148
000000d8: b00509fd 600107c8     set $c0 # g f32 $r4 $r5
000000e0: 10022003 00000100     (e $c0) bra 0x110
000000e8: 10008005 00000003     mov b32 $r1 0x0
000000f0: 1000800d 03f80003     mov b32 $r3 0x3f800000
000000f8: c00a0409 03ba3d73     mul f32 $r2 $r2 0x3ba3d70a
00000100: 10000201 0403c780     mov b32 $r0 $r1
00000108: 50000003 00000780     break
00000110: b0000409 03f80003   B add f32 $r2 $r2 0x3f800000
00000118: 10005003 00000780     bra 0x28
00000120: b00d0001 03dccccf   B add f32 $r0 $r0 0x3dcccccd
00000128: f0000001 e0000001     exit (never) nop</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398994068.BA5fa1.25217--

--===============1374902722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1374902722==--
