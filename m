From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96565] Clive Barker's Jericho displays strange,
 vivid colors when motion blur enabled
Date: Sat, 18 Jun 2016 18:35:05 +0000
Message-ID: <bug-96565-8800-0SrtJoKqjv@http.bugs.freedesktop.org/>
References: <bug-96565-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0467240494=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-96565-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0467240494==
Content-Type: multipart/alternative; boundary="14662749040.521E.2623";
 charset="UTF-8"


--14662749040.521E.2623
Date: Sat, 18 Jun 2016 18:35:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96565

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 124590
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D124590&action=3Dedit
failing tgsi shader

Somehow the attached shader manages to generate

BB:11 (4 instructions) - idom =3D BB:8, df =3D { BB:5 }
 -> BB:26 (tree)
 -> BB:12 (tree)
 45: mov u32 $r4 $r14 (8)
 46: mov u32 $r5 $r15 (8)
 47: tex 2D $r1 $s0 f32 $r4t $r4d (8)
 48: set ftz u8 $p0 neu f32 $r7 neg $r7 (8)
BB:12 (4 instructions) - idom =3D BB:11, df =3D { BB:13 }
 -> BB:13 (forward)
 49: $p0 add ftz f32 $r17 $r17 $r4 (8)
 50: $p0 add ftz f32 $r18 $r18 $r5 (8)
 51: $p0 add ftz f32 $r19 $r19 $r6 (8)
 52: $p0 add ftz f32 $r16 $r16 1.000000 (8)

Which is obviously missing a texbar. Investigating.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14662749040.521E.2623
Date: Sat, 18 Jun 2016 18:35:04 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Clive Barker's Jericho displays strange,vivid colors when=
 motion blur enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96565#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Clive Barker's Jericho displays strange,vivid colors when=
 motion blur enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96565">bug 96565<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D124590=
" name=3D"attach_124590" title=3D"failing tgsi shader">attachment 124590</a=
> <a href=3D"attachment.cgi?id=3D124590&amp;action=3Dedit" title=3D"failing=
 tgsi shader">[details]</a></span>
failing tgsi shader

Somehow the attached shader manages to generate

BB:11 (4 instructions) - idom =3D BB:8, df =3D { BB:5 }
 -&gt; BB:26 (tree)
 -&gt; BB:12 (tree)
 45: mov u32 $r4 $r14 (8)
 46: mov u32 $r5 $r15 (8)
 47: tex 2D $r1 $s0 f32 $r4t $r4d (8)
 48: set ftz u8 $p0 neu f32 $r7 neg $r7 (8)
BB:12 (4 instructions) - idom =3D BB:11, df =3D { BB:13 }
 -&gt; BB:13 (forward)
 49: $p0 add ftz f32 $r17 $r17 $r4 (8)
 50: $p0 add ftz f32 $r18 $r18 $r5 (8)
 51: $p0 add ftz f32 $r19 $r19 $r6 (8)
 52: $p0 add ftz f32 $r16 $r16 1.000000 (8)

Which is obviously missing a texbar. Investigating.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14662749040.521E.2623--

--===============0467240494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0467240494==--
