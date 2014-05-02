From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78161] [NV96] Artifacts in output of fragment
 program containing not unrolled loops with conditional break
Date: Fri, 02 May 2014 01:44:32 +0000
Message-ID: <bug-78161-8800-d52INEvs3N@http.bugs.freedesktop.org/>
References: <bug-78161-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1675906964=="
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


--===============1675906964==
Content-Type: multipart/alternative; boundary="1398995072.bdC2Bf1.28612"; charset="us-ascii"


--1398995072.bdC2Bf1.28612
Date: Fri, 2 May 2014 01:44:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78161

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Forcing break to not have prefixes doesn't fix things, btw, but _does_ improve
fps by like 10%+. Weird. Perhaps the prefixes aren't such a great win beyond a
certain number of instructions. Visually, the results are at least very
similar, if not identical.

This is the shader if OP_BREAK is added to the noPredList:

00000000: 80000000              interp $r0 v[0x0]
00000004: 90000000              rcp f32 $r0 $r0
00000008: 1000800d 03f80003     mov b32 $r3 0x3f800000
00000010: 82010004              interp $r1 v[0x4] $r0
00000014: 82020000              interp $r0 v[0x8] $r0
00000018: 10008009 00000003     mov b32 $r2 0x0
00000020: 40024003 00000000     breakaddr 0x120
00000028: 10008011 04348003   B mov b32 $r4 0x43480000
00000030: b00405fd 600187c8     set $c0 # ge f32 $r2 $r4
00000038: 1000b003 00000100     (e $c0) bra 0x58
00000040: 10008600              mov b32 $r0 $r3
00000044: 10008604              mov b32 $r1 $r3
00000048: 10000609 0403c780     mov b32 $r2 $r3
00000050: 50000003 00000780     break
00000058: 10000011 2400c780   B ld $r4 b32 c0[0x0]
00000060: b00405fd 600107c8     set $c0 # g f32 $r2 $r4
00000068: 10011003 00000100     (e $c0) bra 0x88
00000070: 10008600              mov b32 $r0 $r3
00000074: 10008604              mov b32 $r1 $r3
00000078: 10000609 0403c780     mov b32 $r2 $r3
00000080: 50000003 00000780     break
00000088: c0000211 04367003   B mul f32 $r4 $r1 0x43670000
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

Next step is to see what the blob compiler does with this.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398995072.bdC2Bf1.28612
Date: Fri, 2 May 2014 01:44:32 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78161#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] Artifacts in output of fragment program containing not unrolled loops with conditional break"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78161">bug 78161</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Forcing break to not have prefixes doesn't fix things, btw, but _does_ improve
fps by like 10%+. Weird. Perhaps the prefixes aren't such a great win beyond a
certain number of instructions. Visually, the results are at least very
similar, if not identical.

This is the shader if OP_BREAK is added to the noPredList:

00000000: 80000000              interp $r0 v[0x0]
00000004: 90000000              rcp f32 $r0 $r0
00000008: 1000800d 03f80003     mov b32 $r3 0x3f800000
00000010: 82010004              interp $r1 v[0x4] $r0
00000014: 82020000              interp $r0 v[0x8] $r0
00000018: 10008009 00000003     mov b32 $r2 0x0
00000020: 40024003 00000000     breakaddr 0x120
00000028: 10008011 04348003   B mov b32 $r4 0x43480000
00000030: b00405fd 600187c8     set $c0 # ge f32 $r2 $r4
00000038: 1000b003 00000100     (e $c0) bra 0x58
00000040: 10008600              mov b32 $r0 $r3
00000044: 10008604              mov b32 $r1 $r3
00000048: 10000609 0403c780     mov b32 $r2 $r3
00000050: 50000003 00000780     break
00000058: 10000011 2400c780   B ld $r4 b32 c0[0x0]
00000060: b00405fd 600107c8     set $c0 # g f32 $r2 $r4
00000068: 10011003 00000100     (e $c0) bra 0x88
00000070: 10008600              mov b32 $r0 $r3
00000074: 10008604              mov b32 $r1 $r3
00000078: 10000609 0403c780     mov b32 $r2 $r3
00000080: 50000003 00000780     break
00000088: c0000211 04367003   B mul f32 $r4 $r1 0x43670000
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

Next step is to see what the blob compiler does with this.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398995072.bdC2Bf1.28612--

--===============1675906964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1675906964==--
