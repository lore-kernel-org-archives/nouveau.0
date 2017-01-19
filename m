From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99396] Crash in nouveau_dri.so when switching apps
 with alt-tab in Gnome
Date: Thu, 19 Jan 2017 03:10:01 +0000
Message-ID: <bug-99396-8800-48NFU6wSED@http.bugs.freedesktop.org/>
References: <bug-99396-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1220445887=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99396-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1220445887==
Content-Type: multipart/alternative; boundary="14847954010.E86D6cC90.28039";
 charset="UTF-8"


--14847954010.E86D6cC90.28039
Date: Thu, 19 Jan 2017 03:10:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99396

--- Comment #2 from afn2-HmMyXyqgL2CVc3sceRu5cw@public.gmane.org ---
FYI, I've managed to reproduce this bug with both mesa 13.0.3 as well as the
current HEAD of master (180653c357d19ca88f7895f59874a58fac99cc53). I've also
reproduced it with various versions of the kernel (most recently, 4.9.4 and
4.10-rc4).

This only happens with nouveau + mesa, not with the proprietary nvidia driv=
er,
which leads me to believe that the bug is most likely in mesa and not in gn=
ome.

I'm happy to dig deep into this but I'd appreciate some pointers on where to
look. Thanks!

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14847954010.E86D6cC90.28039
Date: Thu, 19 Jan 2017 03:10:01 +0000
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
   title=3D"NEW - Crash in nouveau_dri.so when switching apps with alt-tab =
in Gnome"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99396#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crash in nouveau_dri.so when switching apps with alt-tab =
in Gnome"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99396">bug 99396<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
afn2&#64;cornell.edu" title=3D"afn2&#64;cornell.edu">afn2&#64;cornell.edu</=
a>
</span></b>
        <pre>FYI, I've managed to reproduce this bug with both mesa 13.0.3 =
as well as the
current HEAD of master (180653c357d19ca88f7895f59874a58fac99cc53). I've also
reproduced it with various versions of the kernel (most recently, 4.9.4 and
4.10-rc4).

This only happens with nouveau + mesa, not with the proprietary nvidia driv=
er,
which leads me to believe that the bug is most likely in mesa and not in gn=
ome.

I'm happy to dig deep into this but I'd appreciate some pointers on where to
look. Thanks!</pre>
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

--14847954010.E86D6cC90.28039--

--===============1220445887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1220445887==--
