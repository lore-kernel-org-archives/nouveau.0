From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93828] Xorg hangs randomly with nouveau driver
Date: Sat, 12 Nov 2016 11:54:22 +0000
Message-ID: <bug-93828-8800-IwVN0dBEjv@http.bugs.freedesktop.org/>
References: <bug-93828-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0376035678=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93828-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0376035678==
Content-Type: multipart/alternative; boundary="14789516610.Ca8fa.22999";
 charset="UTF-8"


--14789516610.Ca8fa.22999
Date: Sat, 12 Nov 2016 11:54:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D93828

--- Comment #13 from Marek Gre=C5=A1ko <mgresko8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I attached a kernel trace which may be related. I got this when:

1. Upgraded Fedora 24 to Fedora 25.

2. Disabled wayland for gdm.

3. Created script with export QSG_RENDER_LOOP=3Dbasic in profile.d.

4. Logged in as a first user to the kde session.

5. Pressed Ctrl+Alt+F1 to get gdm login screen.

6. Logged in as a second user to the kde session.

7. Both kde sessions were stuck, but as opposed to previous behaviour I was
able to Ctrl+Alt+Backspace both sessions (maybe because of previous steps I=
 did
not use before).

8. After turning down second session got previously attached kernel trace.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14789516610.Ca8fa.22999
Date: Sat, 12 Nov 2016 11:54:21 +0000
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
   title=3D"NEW - Xorg hangs randomly with nouveau driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93828#c13">Commen=
t # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Xorg hangs randomly with nouveau driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93828">bug 93828<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mgresko8&#64;gmail.com" title=3D"Marek Gre=C5=A1ko &lt;mgresko8&#64;gmail.c=
om&gt;"> <span class=3D"fn">Marek Gre=C5=A1ko</span></a>
</span></b>
        <pre>I attached a kernel trace which may be related. I got this whe=
n:

1. Upgraded Fedora 24 to Fedora 25.

2. Disabled wayland for gdm.

3. Created script with export QSG_RENDER_LOOP=3Dbasic in profile.d.

4. Logged in as a first user to the kde session.

5. Pressed Ctrl+Alt+F1 to get gdm login screen.

6. Logged in as a second user to the kde session.

7. Both kde sessions were stuck, but as opposed to previous behaviour I was
able to Ctrl+Alt+Backspace both sessions (maybe because of previous steps I=
 did
not use before).

8. After turning down second session got previously attached kernel trace.<=
/pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14789516610.Ca8fa.22999--

--===============0376035678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0376035678==--
