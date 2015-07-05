From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91232] Torchlight 1&2 (in Wine): glitchy models when
 hardware skinning enabled
Date: Sun, 05 Jul 2015 20:22:20 +0000
Message-ID: <bug-91232-8800-sv0b4WslZP@http.bugs.freedesktop.org/>
References: <bug-91232-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1743618193=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91232-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1743618193==
Content-Type: multipart/alternative; boundary="1436127740.6AA4DC561.5512"; charset="UTF-8"


--1436127740.6AA4DC561.5512
Date: Sun, 5 Jul 2015 20:22:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D91232

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to B=C3=A9la Gyebr=C3=B3szki from comment #6)
> Traces from games where the problem is fixed with your patch:
>=20
> Evil Genius (character model corrupted after loading a saved game):
> https://drive.google.com/open?id=3D0B-tTbLKBl-tOMWtxWXdGVm13LXc
>=20
> Ankh 2 (menu screen heavily corrupted):
> https://drive.google.com/open?id=3D0B-tTbLKBl-tOQ0kydGFFM2xsbXM

i965 on hsw also has issues with these. And on the original trace in commen=
t 1.
Looking at least at the Ankh 2 trace, it appears to also be the
gl_SecondaryColor issue -- I assume they're using slightly diff versions of=
 the
same engine. All the var names are the same, but the frag shader structure =
is a
tad different.

>=20
> =3D=3D=3D
> Maybe unrelated, here are the traces from 2 games where the problem isn't
> fixed by the patch:
>=20
> Bloodrayne 2 (objects like the tables in front of the model have those
> flickering boxes):
> https://drive.google.com/open?id=3D0B-tTbLKBl-tOWGZEZ1dPYUVwUzA
> With your patch applied those objects become invisible.

i965 also has funkiness rendering on the table.

This genius shader actually only sets gl_FrontSecondaryColor and then uses
gl_Color.w (in addition to gl_SecondaryColor). I bet that has to be 1.0 and=
 not
0.0, hence the transparency fail. I guess it's all from the same engine. An=
d it
expects the colors to be (0, 0, 0, 1) when not explicitly set.

>=20
> Tomb Raider:Underworld (character model corrupted):
> https://drive.google.com/open?id=3D0B-tTbLKBl-tOOWhES3ZJaGlHeXc
> The problem remains with the patch.

i965 seems fine with this one. Probably an unrelated bug.

Well, I don't feel so bad. Intel has a QA team (not to mention a dev team).=
 You
have probably done 10x more QA on nouveau than the sum of what had ever been
done prior.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1436127740.6AA4DC561.5512
Date: Sun, 5 Jul 2015 20:22:20 +0000
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
   title=3D"NEW - Torchlight 1&amp;2 (in Wine): glitchy models when hardwar=
e skinning enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91232#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Torchlight 1&amp;2 (in Wine): glitchy models when hardwar=
e skinning enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91232">bug 91232<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to B=C3=A9la Gyebr=C3=B3szki from <a href=3D"show_bu=
g.cgi?id=3D91232#c6">comment #6</a>)
<span class=3D"quote">&gt; Traces from games where the problem is fixed wit=
h your patch:
&gt;=20
&gt; Evil Genius (character model corrupted after loading a saved game):
&gt; <a href=3D"https://drive.google.com/open?id=3D0B-tTbLKBl-tOMWtxWXdGVm1=
3LXc">https://drive.google.com/open?id=3D0B-tTbLKBl-tOMWtxWXdGVm13LXc</a>
&gt;=20
&gt; Ankh 2 (menu screen heavily corrupted):
&gt; <a href=3D"https://drive.google.com/open?id=3D0B-tTbLKBl-tOQ0kydGFFM2x=
sbXM">https://drive.google.com/open?id=3D0B-tTbLKBl-tOQ0kydGFFM2xsbXM</a></=
span >

i965 on hsw also has issues with these. And on the original trace in <a hre=
f=3D"show_bug.cgi?id=3D91232#c1">comment 1</a>.
Looking at least at the Ankh 2 trace, it appears to also be the
gl_SecondaryColor issue -- I assume they're using slightly diff versions of=
 the
same engine. All the var names are the same, but the frag shader structure =
is a
tad different.

<span class=3D"quote">&gt;=20
&gt; =3D=3D=3D
&gt; Maybe unrelated, here are the traces from 2 games where the problem is=
n't
&gt; fixed by the patch:
&gt;=20
&gt; Bloodrayne 2 (objects like the tables in front of the model have those
&gt; flickering boxes):
&gt; <a href=3D"https://drive.google.com/open?id=3D0B-tTbLKBl-tOWGZEZ1dPYUV=
wUzA">https://drive.google.com/open?id=3D0B-tTbLKBl-tOWGZEZ1dPYUVwUzA</a>
&gt; With your patch applied those objects become invisible.</span >

i965 also has funkiness rendering on the table.

This genius shader actually only sets gl_FrontSecondaryColor and then uses
gl_Color.w (in addition to gl_SecondaryColor). I bet that has to be 1.0 and=
 not
0.0, hence the transparency fail. I guess it's all from the same engine. An=
d it
expects the colors to be (0, 0, 0, 1) when not explicitly set.

<span class=3D"quote">&gt;=20
&gt; Tomb Raider:Underworld (character model corrupted):
&gt; <a href=3D"https://drive.google.com/open?id=3D0B-tTbLKBl-tOOWhES3ZJaGl=
HeXc">https://drive.google.com/open?id=3D0B-tTbLKBl-tOOWhES3ZJaGlHeXc</a>
&gt; The problem remains with the patch.</span >

i965 seems fine with this one. Probably an unrelated bug.

Well, I don't feel so bad. Intel has a QA team (not to mention a dev team).=
 You
have probably done 10x more QA on nouveau than the sum of what had ever been
done prior.</pre>
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

--1436127740.6AA4DC561.5512--

--===============1743618193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1743618193==--
