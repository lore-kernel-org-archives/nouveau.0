From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99799] Civilization VI makes nouveau crash on
 register allocation
Date: Thu, 16 Feb 2017 06:16:08 +0000
Message-ID: <bug-99799-8800-2lSXZPwtnM@http.bugs.freedesktop.org/>
References: <bug-99799-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0167739817=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99799-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0167739817==
Content-Type: multipart/alternative; boundary="14872257670.a97f.15762";
 charset="UTF-8"


--14872257670.a97f.15762
Date: Thu, 16 Feb 2017 06:16:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99799

--- Comment #4 from Gediminas Jakutis <gediminas-1NU85dn7e2ownf/OCUKchA@public.gmane.org> ---
It now consistently segfaults in another point instead.
Backtrace and whatnot: https://seriouss.am/etc/civ-gdb-2017-02-16

I should note that NV50_PROG_OPTIMIZE=3D0 prevents a segfault, same as with=
out
the patch.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14872257670.a97f.15762
Date: Thu, 16 Feb 2017 06:16:07 +0000
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
   title=3D"NEW - Civilization VI makes nouveau crash on register allocatio=
n"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99799#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Civilization VI makes nouveau crash on register allocatio=
n"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99799">bug 99799<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gediminas&#64;varciai.lt" title=3D"Gediminas Jakutis &lt;gediminas&#64;varc=
iai.lt&gt;"> <span class=3D"fn">Gediminas Jakutis</span></a>
</span></b>
        <pre>It now consistently segfaults in another point instead.
Backtrace and whatnot: <a href=3D"https://seriouss.am/etc/civ-gdb-2017-02-1=
6">https://seriouss.am/etc/civ-gdb-2017-02-16</a>

I should note that NV50_PROG_OPTIMIZE=3D0 prevents a segfault, same as with=
out
the patch.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14872257670.a97f.15762--

--===============0167739817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0167739817==--
