From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78161] [NV96] Artifacts in output of fragment
 program containing not unrolled loops with conditional break
Date: Fri, 02 May 2014 02:01:04 +0000
Message-ID: <bug-78161-8800-C8OLpWmIKj@http.bugs.freedesktop.org/>
References: <bug-78161-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0859140216=="
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


--===============0859140216==
Content-Type: multipart/alternative; boundary="1398996063.AE5d11.30777"; charset="us-ascii"


--1398996063.AE5d11.30777
Date: Fri, 2 May 2014 02:01:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78161

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Fail. Their compiler is a lot smarter than ours. (Note that I'm pretty sure
their code starts at 0x100, which is why the branch destinations are all off.)

00000000: 10008005 03f80003     mov b32 $r1 0x3f800000
00000008: 8000000c              interp $r3 v[0x0]
0000000c: 1000fe10              mov b32 $r4 $r63
00000010: 10008208              mov b32 $r2 $r1
00000014: 10008200              mov b32 $r0 $r1
00000018: 90000615 00000780     rcp f32 $r5 $r3
00000020: b08009fd 604107c8     set $c0 # g f32 $r4 c1[0x0]
00000028: 10039003 00000680     (lgu $c0) bra 0x1c8
00000030: b000080d 04204003     add f32 $r3 $r4 0x42040000
00000038: 82010a18              interp $r6 v[0x4] $r5
0000003c: 82020a1c              interp $r7 v[0x8] $r5
00000040: c0060621 00000780     mul rn f32 $r8 $r3 $r6
00000048: c02e0e0d 0486563f     mul f32 $r3 $r7 0x486563ee
00000050: b00d0819 03f8cccf     add f32 $r6 $r4 0x3f8ccccd
00000058: e000100d 04367003     add f32 $r3 (mul $r8 0x43670000) $r3
00000060: c0030c0d 00000780     mul rn f32 $r3 $r6 $r3
00000068: b000060d c0000780     presin f32 $r3 $r3
00000070: 9000060d a0000780     cos f32 $r3 $r3
00000078: b08107fd 60c107c8     set $c0 # g f32 $r3 c3[0x4]
00000080: c0830809 00c00680     (lgu $c0) mul rn f32 $r2 $r4 c3[0xc]
00000088: 10007e05 0403c680     (lgu $c0) mov b32 $r1 $r63
00000090: 10007e01 0403c680     (lgu $c0) mov b32 $r0 $r63
00000098: 10039003 00000680     (lgu $c0) bra 0x1c8
000000a0: b0000811 03f80003     add f32 $r4 $r4 0x3f800000
000000a8: b082080d 60c04780     set $r3 l f32 $r4 c3[0x8]
000000b0: a000060d 04114780     cvt abs u32 $r3 s32 $r3
000000b8: 303f07fd 640087c8     set $c0 # e u32 $r3 $r63
000000c0: 10024003 00000700     (geu $c0) bra 0x120
000000c8: b00d0001 03dccccf     add f32 $r0 $r0 0x3dcccccd
000000d0: 1000080d 24c0c781     exit ld $r3 b32 c3[0x10]

So... I guess the next move is to write a horrendously twisted glsl program
that even their compiler can't avoid breaks on, and see what happens.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398996063.AE5d11.30777
Date: Fri, 2 May 2014 02:01:03 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78161#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] Artifacts in output of fragment program containing not unrolled loops with conditional break"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78161">bug 78161</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Fail. Their compiler is a lot smarter than ours. (Note that I'm pretty sure
their code starts at 0x100, which is why the branch destinations are all off.)

00000000: 10008005 03f80003     mov b32 $r1 0x3f800000
00000008: 8000000c              interp $r3 v[0x0]
0000000c: 1000fe10              mov b32 $r4 $r63
00000010: 10008208              mov b32 $r2 $r1
00000014: 10008200              mov b32 $r0 $r1
00000018: 90000615 00000780     rcp f32 $r5 $r3
00000020: b08009fd 604107c8     set $c0 # g f32 $r4 c1[0x0]
00000028: 10039003 00000680     (lgu $c0) bra 0x1c8
00000030: b000080d 04204003     add f32 $r3 $r4 0x42040000
00000038: 82010a18              interp $r6 v[0x4] $r5
0000003c: 82020a1c              interp $r7 v[0x8] $r5
00000040: c0060621 00000780     mul rn f32 $r8 $r3 $r6
00000048: c02e0e0d 0486563f     mul f32 $r3 $r7 0x486563ee
00000050: b00d0819 03f8cccf     add f32 $r6 $r4 0x3f8ccccd
00000058: e000100d 04367003     add f32 $r3 (mul $r8 0x43670000) $r3
00000060: c0030c0d 00000780     mul rn f32 $r3 $r6 $r3
00000068: b000060d c0000780     presin f32 $r3 $r3
00000070: 9000060d a0000780     cos f32 $r3 $r3
00000078: b08107fd 60c107c8     set $c0 # g f32 $r3 c3[0x4]
00000080: c0830809 00c00680     (lgu $c0) mul rn f32 $r2 $r4 c3[0xc]
00000088: 10007e05 0403c680     (lgu $c0) mov b32 $r1 $r63
00000090: 10007e01 0403c680     (lgu $c0) mov b32 $r0 $r63
00000098: 10039003 00000680     (lgu $c0) bra 0x1c8
000000a0: b0000811 03f80003     add f32 $r4 $r4 0x3f800000
000000a8: b082080d 60c04780     set $r3 l f32 $r4 c3[0x8]
000000b0: a000060d 04114780     cvt abs u32 $r3 s32 $r3
000000b8: 303f07fd 640087c8     set $c0 # e u32 $r3 $r63
000000c0: 10024003 00000700     (geu $c0) bra 0x120
000000c8: b00d0001 03dccccf     add f32 $r0 $r0 0x3dcccccd
000000d0: 1000080d 24c0c781     exit ld $r3 b32 c3[0x10]

So... I guess the next move is to write a horrendously twisted glsl program
that even their compiler can't avoid breaks on, and see what happens.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398996063.AE5d11.30777--

--===============0859140216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0859140216==--
