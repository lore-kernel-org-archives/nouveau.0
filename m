From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97462] Graphics deadlock "ILLEGAL_MTHD" in nouveau
 with mesa version 11.2.2 when visiting Google Maps with firefox 49.0b5
Date: Wed, 24 Aug 2016 14:30:59 +0000
Message-ID: <bug-97462-8800-peBpOqm6BZ@http.bugs.freedesktop.org/>
References: <bug-97462-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0053112156=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97462-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0053112156==
Content-Type: multipart/alternative; boundary="14720490590.B0bd1DbEE.12161";
 charset="UTF-8"


--14720490590.B0bd1DbEE.12161
Date: Wed, 24 Aug 2016 14:30:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97462

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
This reads like a desync of some sort. The most common cause of this is the
fact that nouveau + threading =3D fail. I have some preliminary patches whi=
ch
kinda-sorta work but not quite done that you can try -
https://github.com/imirkin/mesa/commits/locking

Chances are you can ssh in from another computer and kill the offending pro=
cess
and then things should come back. Not always though.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14720490590.B0bd1DbEE.12161
Date: Wed, 24 Aug 2016 14:30:59 +0000
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
   title=3D"NEW - Graphics deadlock &quot;ILLEGAL_MTHD&quot; in nouveau wit=
h mesa version 11.2.2 when visiting Google Maps with firefox 49.0b5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97462#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Graphics deadlock &quot;ILLEGAL_MTHD&quot; in nouveau wit=
h mesa version 11.2.2 when visiting Google Maps with firefox 49.0b5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97462">bug 97462<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>This reads like a desync of some sort. The most common cause o=
f this is the
fact that nouveau + threading =3D fail. I have some preliminary patches whi=
ch
kinda-sorta work but not quite done that you can try -
<a href=3D"https://github.com/imirkin/mesa/commits/locking">https://github.=
com/imirkin/mesa/commits/locking</a>

Chances are you can ssh in from another computer and kill the offending pro=
cess
and then things should come back. Not always though.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14720490590.B0bd1DbEE.12161--

--===============0053112156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0053112156==--
