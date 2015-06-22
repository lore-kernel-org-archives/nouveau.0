From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91056] The Bard's Tale (2005,
	native)  has rendering issues
Date: Mon, 22 Jun 2015 15:23:12 +0000
Message-ID: <bug-91056-8800-YeB457usKq@http.bugs.freedesktop.org/>
References: <bug-91056-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0981761240=="
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


--===============0981761240==
Content-Type: multipart/alternative; boundary="1434986591.C7051.31170"; charset="UTF-8"


--1434986591.C7051.31170
Date: Mon, 22 Jun 2015 15:23:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D91056

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to B=C3=A9la Gyebr=C3=B3szki from comment #2)
> The game shows the rendering issues with NV50_PROG_OPTIMIZE=3D1 as well.
>=20
> I found that it's sufficient to change either
> RUN_PASS(1, CopyPropagation, run);
>=20
> or
>=20
> RUN_PASS(1, LoadPropagation, run);
>=20
> to '2' and the game renders properly with NV50_PROG_OPTIMIZE=3D1 (those b=
lack
> bars remained whatever I changed though).

Interesting that it's *either*. I guess some instruction claims that it can
accept things (in the code) that it, in actuality, can't. I assume you don't
see any INVALID_OPCODE messages in dmesg?

The simplest next step is to find a draw call (using qapitrace) that renders
properly without the optimizations but improperly with. Once you've identif=
ied
the call number, the simplest thing would be to then run 'glretrace -D $cal=
l'
through valgrind-mmt both ways, which, via 'demmt', should allow you to eas=
ily
see what shaders were used in that last call.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1434986591.C7051.31170
Date: Mon, 22 Jun 2015 15:23:11 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - The Bard's Tale (2005, native) has rendering issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91056#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - The Bard's Tale (2005, native) has rendering issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91056">bug 91056<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to B=C3=A9la Gyebr=C3=B3szki from <a href=3D"show_bu=
g.cgi?id=3D91056#c2">comment #2</a>)
<span class=3D"quote">&gt; The game shows the rendering issues with NV50_PR=
OG_OPTIMIZE=3D1 as well.
&gt;=20
&gt; I found that it's sufficient to change either
&gt; RUN_PASS(1, CopyPropagation, run);
&gt;=20
&gt; or
&gt;=20
&gt; RUN_PASS(1, LoadPropagation, run);
&gt;=20
&gt; to '2' and the game renders properly with NV50_PROG_OPTIMIZE=3D1 (thos=
e black
&gt; bars remained whatever I changed though).</span >

Interesting that it's *either*. I guess some instruction claims that it can
accept things (in the code) that it, in actuality, can't. I assume you don't
see any INVALID_OPCODE messages in dmesg?

The simplest next step is to find a draw call (using qapitrace) that renders
properly without the optimizations but improperly with. Once you've identif=
ied
the call number, the simplest thing would be to then run 'glretrace -D $cal=
l'
through valgrind-mmt both ways, which, via 'demmt', should allow you to eas=
ily
see what shaders were used in that last call.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1434986591.C7051.31170--

--===============0981761240==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0981761240==--
