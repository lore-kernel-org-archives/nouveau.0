From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104291] Virgl broken on current mesa (17.4+),
 with nouveau/nv50 as host
Date: Tue, 19 Dec 2017 22:37:43 +0000
Message-ID: <bug-104291-8800-Edpiehwkpd@http.bugs.freedesktop.org/>
References: <bug-104291-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0386066346=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104291-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0386066346==
Content-Type: multipart/alternative; boundary="15137230630.dcA8E2281.32377";
 charset="UTF-8"


--15137230630.dcA8E2281.32377
Date: Tue, 19 Dec 2017 22:37:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104291

--- Comment #11 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org> ---
I tried few older mesa releases (17.1.10 - without llvm, 17.2.7 and 17.3.0 -
with llvm 5.0.0), and they all segfaults :/

This is kinda strange, because according to this bugreport it was working in
17.1-dev era:

https://bugzilla.redhat.com/show_bug.cgi?id=3D1426549

I tried disabling PageFlipping (not sure if it makes any sense for VM), and
switching dri mode to dri3. Nothing helped :/

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15137230630.dcA8E2281.32377
Date: Tue, 19 Dec 2017 22:37:43 +0000
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
   title=3D"NEW - Virgl broken on current mesa (17.4+), with nouveau/nv50 a=
s host"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104291#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Virgl broken on current mesa (17.4+), with nouveau/nv50 a=
s host"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104291">bug 10429=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
randrik&#64;mail.ru" title=3D"Andrew Randrianasulu &lt;randrik&#64;mail.ru&=
gt;"> <span class=3D"fn">Andrew Randrianasulu</span></a>
</span></b>
        <pre>I tried few older mesa releases (17.1.10 - without llvm, 17.2.=
7 and 17.3.0 -
with llvm 5.0.0), and they all segfaults :/

This is kinda strange, because according to this bugreport it was working in
17.1-dev era:

<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1426549">https://b=
ugzilla.redhat.com/show_bug.cgi?id=3D1426549</a>

I tried disabling PageFlipping (not sure if it makes any sense for VM), and
switching dri mode to dri3. Nothing helped :/</pre>
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

--15137230630.dcA8E2281.32377--

--===============0386066346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0386066346==--
