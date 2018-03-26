From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105626] [GT218][Regression] BUG: unable to handle
 kernel NULL pointer dereference at 0000000000000040
Date: Mon, 26 Mar 2018 11:08:58 +0000
Message-ID: <bug-105626-8800-WuhqXvnoWN@http.bugs.freedesktop.org/>
References: <bug-105626-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0087017771=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105626-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0087017771==
Content-Type: multipart/alternative; boundary="15220625381.d2f99.733"
Content-Transfer-Encoding: 7bit


--15220625381.d2f99.733
Date: Mon, 26 Mar 2018 11:08:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105626

--- Comment #7 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
I don=E2=80=99t have a GT218 to try on, and my tests on a GT200 were not co=
nclusive as
I was unable to reproduce the bug; I tried opening a bunch of windows, resi=
ze
and maximize them, open some png files and run OpenGL games.
I=E2=80=99ll try to look at the patches that were merged in 4.15, see if I =
can spot an
error there, but I won=E2=80=99t be able to help much more than that. If yo=
u could
bisect the kernel to identify the faulty commit, that would be really helpf=
ul.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15220625381.d2f99.733
Date: Mon, 26 Mar 2018 11:08:58 +0000
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
   title=3D"NEW - [GT218][Regression] BUG: unable to handle kernel NULL poi=
nter dereference at 0000000000000040"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105626#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GT218][Regression] BUG: unable to handle kernel NULL poi=
nter dereference at 0000000000000040"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105626">bug 10562=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>I don=E2=80=99t have a GT218 to try on, and my tests on a GT20=
0 were not conclusive as
I was unable to reproduce the bug; I tried opening a bunch of windows, resi=
ze
and maximize them, open some png files and run OpenGL games.
I=E2=80=99ll try to look at the patches that were merged in 4.15, see if I =
can spot an
error there, but I won=E2=80=99t be able to help much more than that. If yo=
u could
bisect the kernel to identify the faulty commit, that would be really helpf=
ul.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15220625381.d2f99.733--

--===============0087017771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0087017771==--
