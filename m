From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102106] xorg crashes when running gscan2pdf
 (libgtk2-perl) test case
Date: Sun, 13 Aug 2017 16:41:19 +0000
Message-ID: <bug-102106-8800-FVFebYQ6ND@http.bugs.freedesktop.org/>
References: <bug-102106-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1716343508=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-102106-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1716343508==
Content-Type: multipart/alternative; boundary="15026424792.4C44.2379";
 charset="UTF-8"


--15026424792.4C44.2379
Date: Sun, 13 Aug 2017 16:41:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102106

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I was unable to reproduce with GK208 as well. I'm not particularly inclined=
 to
believe that this is a nouveau issue, but ... you never know.

I'd recommend killing X, ssh'ing in from another machine, running X (and *o=
nly*
X), e.g. "Xorg :0", and then, from another shell, running the affected
application (setting DISPLAY=3D:0). If that triggers the crash, you can try=
 that
same setup with gdb and/or valgrind.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15026424792.4C44.2379
Date: Sun, 13 Aug 2017 16:41:19 +0000
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
   title=3D"NEW - xorg crashes when running gscan2pdf (libgtk2-perl) test c=
ase"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102106#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - xorg crashes when running gscan2pdf (libgtk2-perl) test c=
ase"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102106">bug 10210=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I was unable to reproduce with GK208 as well. I'm not particul=
arly inclined to
believe that this is a nouveau issue, but ... you never know.

I'd recommend killing X, ssh'ing in from another machine, running X (and *o=
nly*
X), e.g. &quot;Xorg :0&quot;, and then, from another shell, running the aff=
ected
application (setting DISPLAY=3D:0). If that triggers the crash, you can try=
 that
same setup with gdb and/or valgrind.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15026424792.4C44.2379--

--===============1716343508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1716343508==--
