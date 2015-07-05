From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91232] Torchlight 1&2 (in Wine): glitchy models when
 hardware skinning enabled
Date: Sun, 05 Jul 2015 19:50:59 +0000
Message-ID: <bug-91232-8800-s6wZyjg6A3@http.bugs.freedesktop.org/>
References: <bug-91232-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1908246684=="
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


--===============1908246684==
Content-Type: multipart/alternative; boundary="1436125859.18Dd0.28682"; charset="UTF-8"


--1436125859.18Dd0.28682
Date: Sun, 5 Jul 2015 19:50:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D91232

--- Comment #6 from B=C3=A9la Gyebr=C3=B3szki <gyebro69-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Traces from games where the problem is fixed with your patch:

Evil Genius (character model corrupted after loading a saved game):
https://drive.google.com/open?id=3D0B-tTbLKBl-tOMWtxWXdGVm13LXc

Ankh 2 (menu screen heavily corrupted):
https://drive.google.com/open?id=3D0B-tTbLKBl-tOQ0kydGFFM2xsbXM

=3D=3D=3D
Maybe unrelated, here are the traces from 2 games where the problem isn't f=
ixed
by the patch:

Bloodrayne 2 (objects like the tables in front of the model have those
flickering boxes):
https://drive.google.com/open?id=3D0B-tTbLKBl-tOWGZEZ1dPYUVwUzA
With your patch applied those objects become invisible.

Tomb Raider:Underworld (character model corrupted):
https://drive.google.com/open?id=3D0B-tTbLKBl-tOOWhES3ZJaGlHeXc
The problem remains with the patch.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1436125859.18Dd0.28682
Date: Sun, 5 Jul 2015 19:50:59 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91232#c6">Comment=
 # 6</a>
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
        <pre>Traces from games where the problem is fixed with your patch:

Evil Genius (character model corrupted after loading a saved game):
<a href=3D"https://drive.google.com/open?id=3D0B-tTbLKBl-tOMWtxWXdGVm13LXc"=
>https://drive.google.com/open?id=3D0B-tTbLKBl-tOMWtxWXdGVm13LXc</a>

Ankh 2 (menu screen heavily corrupted):
<a href=3D"https://drive.google.com/open?id=3D0B-tTbLKBl-tOQ0kydGFFM2xsbXM"=
>https://drive.google.com/open?id=3D0B-tTbLKBl-tOQ0kydGFFM2xsbXM</a>

=3D=3D=3D
Maybe unrelated, here are the traces from 2 games where the problem isn't f=
ixed
by the patch:

Bloodrayne 2 (objects like the tables in front of the model have those
flickering boxes):
<a href=3D"https://drive.google.com/open?id=3D0B-tTbLKBl-tOWGZEZ1dPYUVwUzA"=
>https://drive.google.com/open?id=3D0B-tTbLKBl-tOWGZEZ1dPYUVwUzA</a>
With your patch applied those objects become invisible.

Tomb Raider:Underworld (character model corrupted):
<a href=3D"https://drive.google.com/open?id=3D0B-tTbLKBl-tOOWhES3ZJaGlHeXc"=
>https://drive.google.com/open?id=3D0B-tTbLKBl-tOOWhES3ZJaGlHeXc</a>
The problem remains with the patch.</pre>
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

--1436125859.18Dd0.28682--

--===============1908246684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1908246684==--
