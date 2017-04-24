From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100769] Segfault in libgtk-3.so when starting
 gnome-session after upgrade
Date: Mon, 24 Apr 2017 10:39:37 +0000
Message-ID: <bug-100769-8800-n6HKZ1CsK6@http.bugs.freedesktop.org/>
References: <bug-100769-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1547156346=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100769-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1547156346==
Content-Type: multipart/alternative; boundary="14930303770.c3c8A41b.10031";
 charset="UTF-8"


--14930303770.c3c8A41b.10031
Date: Mon, 24 Apr 2017 10:39:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100769

--- Comment #2 from loopsysdev-osHb8hq8U8NBDgjK7y7TUQ@public.gmane.org ---
Thanks! I can confirm that updating to 1.0.14 fixes it.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14930303770.c3c8A41b.10031
Date: Mon, 24 Apr 2017 10:39:37 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Segfault in libgtk-3.so when starting gnome-se=
ssion after upgrade"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100769#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Segfault in libgtk-3.so when starting gnome-se=
ssion after upgrade"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100769">bug 10076=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
loopsysdev&#64;navetas.com" title=3D"loopsysdev&#64;navetas.com">loopsysdev=
&#64;navetas.com</a>
</span></b>
        <pre>Thanks! I can confirm that updating to 1.0.14 fixes it.</pre>
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

--14930303770.c3c8A41b.10031--

--===============1547156346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1547156346==--
