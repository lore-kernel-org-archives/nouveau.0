From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91232] Torchlight 1&2 (in Wine): glitchy models when
 hardware skinning enabled
Date: Sun, 05 Jul 2015 18:47:11 +0000
Message-ID: <bug-91232-8800-lVOmC5vxau@http.bugs.freedesktop.org/>
References: <bug-91232-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1060172310=="
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


--===============1060172310==
Content-Type: multipart/alternative; boundary="1436122030.ebd5461b0.13538"; charset="UTF-8"


--1436122030.ebd5461b0.13538
Date: Sun, 5 Jul 2015 18:47:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D91232

--- Comment #5 from B=C3=A9la Gyebr=C3=B3szki <gyebro69-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #4)
> Created attachment 116960 [details] [review]
> init unknown values to 0
>=20
> As I suspected, getting nouveau to init these to 0 fixes the issue. But I=
MO
> the glsl compiler is the one doing something dodgy here...

The patch works and it fixes the issue not just in Torchlight but also in s=
ome
other titles like Silent Hunter III, Evil Genius or the Ankh series.
Some games with similar looking problem still have the the problem, but that
might be a different issue.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1436122030.ebd5461b0.13538
Date: Sun, 5 Jul 2015 18:47:10 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91232#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Torchlight 1&amp;2 (in Wine): glitchy models when hardwar=
e skinning enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91232">bug 91232<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gyebro69&#64;gmail.com" title=3D"B=C3=A9la Gyebr=C3=B3szki &lt;gyebro69&#64=
;gmail.com&gt;"> <span class=3D"fn">B=C3=A9la Gyebr=C3=B3szki</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D912=
32#c4">comment #4</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D116960" name=3D"attach_116960" title=3D"init unknown values to 0">a=
ttachment 116960</a> <a href=3D"attachment.cgi?id=3D116960&amp;action=3Dedi=
t" title=3D"init unknown values to 0">[details]</a></span> <a href=3D'page.=
cgi?id=3Dsplinter.html&amp;bug=3D91232&amp;attachment=3D116960'>[review]</a=
> [review]
&gt; init unknown values to 0
&gt;=20
&gt; As I suspected, getting nouveau to init these to 0 fixes the issue. Bu=
t IMO
&gt; the glsl compiler is the one doing something dodgy here...</span >

The patch works and it fixes the issue not just in Torchlight but also in s=
ome
other titles like Silent Hunter III, Evil Genius or the Ankh series.
Some games with similar looking problem still have the the problem, but that
might be a different issue.</pre>
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

--1436122030.ebd5461b0.13538--

--===============1060172310==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1060172310==--
