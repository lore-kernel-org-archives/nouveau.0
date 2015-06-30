From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91056] The Bard's Tale (2005,
	native)  has rendering issues
Date: Tue, 30 Jun 2015 06:11:47 +0000
Message-ID: <bug-91056-8800-mfdU9XpNRS@http.bugs.freedesktop.org/>
References: <bug-91056-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1525027245=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91056-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1525027245==
Content-Type: multipart/alternative; boundary="1435644707.caBCC8C1.21282"; charset="UTF-8"


--1435644707.caBCC8C1.21282
Date: Tue, 30 Jun 2015 06:11:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91056

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
So we try to do:

  4: ld u32 $r2 c0[$a1+0x0] (8)
  5: sub f32 $r2 $r2 c0[$a0+0x0] (8)
  6: mad f32 $r2 a[0x18] $r2 c0[$a0+0x0] (8)
  7: ld u32 $r3 c0[$a1+0x4] (8)
  8: sub f32 $r3 $r3 c0[$a0+0x4] (8)
  9: mad f32 $r3 a[0x18] $r3 c0[$a0+0x4] (8)

but it comes out as

00000020: 18000009 2400c780     ld $r2 b32 c0[$a2]
00000028: b5000409 08000780     add rn f32 $r2 $r2 neg c0[$a1]
00000030: e1020c09 00200780     add f32 $r2 (mul a[0x18] $r2) c0[0x0]
00000038: 1800020d 2400c780     ld $r3 b32 c0[$a2+0x4]
00000040: b500060d 08004780     add rn f32 $r3 $r3 neg c0[$a1+0x4]
00000048: e1030c0d 00204780     add f32 $r3 (mul a[0x18] $r3) c0[0x4]

oops. Either we can't propagate into the mad, or there's an indirect bit
somewhere in there.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1435644707.caBCC8C1.21282
Date: Tue, 30 Jun 2015 06:11:47 +0000
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
   title="NEW - The Bard's Tale (2005, native) has rendering issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91056#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - The Bard's Tale (2005, native) has rendering issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91056">bug 91056</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>So we try to do:

  4: ld u32 $r2 c0[$a1+0x0] (8)
  5: sub f32 $r2 $r2 c0[$a0+0x0] (8)
  6: mad f32 $r2 a[0x18] $r2 c0[$a0+0x0] (8)
  7: ld u32 $r3 c0[$a1+0x4] (8)
  8: sub f32 $r3 $r3 c0[$a0+0x4] (8)
  9: mad f32 $r3 a[0x18] $r3 c0[$a0+0x4] (8)

but it comes out as

00000020: 18000009 2400c780     ld $r2 b32 c0[$a2]
00000028: b5000409 08000780     add rn f32 $r2 $r2 neg c0[$a1]
00000030: e1020c09 00200780     add f32 $r2 (mul a[0x18] $r2) c0[0x0]
00000038: 1800020d 2400c780     ld $r3 b32 c0[$a2+0x4]
00000040: b500060d 08004780     add rn f32 $r3 $r3 neg c0[$a1+0x4]
00000048: e1030c0d 00204780     add f32 $r3 (mul a[0x18] $r3) c0[0x4]

oops. Either we can't propagate into the mad, or there's an indirect bit
somewhere in there.</pre>
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

--1435644707.caBCC8C1.21282--

--===============1525027245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1525027245==--
