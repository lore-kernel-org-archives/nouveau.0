From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104222] GNOME/Wayland desktop freezes when resizing
 Firefox window
Date: Fri, 05 Jan 2018 06:02:16 +0000
Message-ID: <bug-104222-8800-USMC9Tpeh3@http.bugs.freedesktop.org/>
References: <bug-104222-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0626475958=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104222-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0626475958==
Content-Type: multipart/alternative; boundary="15151321352.4db830aDC.26345";
 charset="UTF-8"


--15151321352.4db830aDC.26345
Date: Fri, 5 Jan 2018 06:02:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104222

--- Comment #7 from Rylan <mail-UDJx58VhFVbMJ+Z5TDUkmQ@public.gmane.org> ---
(In reply to Rylan from comment #6)
> Hello, another me-too here. Arch Linux with Gnome+Wayland

Some more information regarding this:=20

1. The issue is reproducible fairly consistently on my system, but sometime=
s I
have to resize the firefox window upto 5 times (manually dragging window co=
rner
by about 20%) to reproduce the freeze. So far, I have only observed the fre=
eze
occurring when window is being expanded, it does not seem to occur when the
windows is being decreased in size.

2. The freeze happens with both Firefox Nightly and stable Firefox, so
client-side decorations (or some other Nightly-only feature) do not seem to=
 be
responsible.

3. I cannot reproduce this issue in any other application except Firefox...=
even
Thunderbird (also by Mozilla) does not seem to be affected.

4. It does not seem to matter what page is being rendered by Firefox. The
freeze occurs even when firefox is showing a blank page with no internet
connection.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15151321352.4db830aDC.26345
Date: Fri, 5 Jan 2018 06:02:15 +0000
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
   title=3D"NEW - GNOME/Wayland desktop freezes when resizing Firefox windo=
w"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104222#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GNOME/Wayland desktop freezes when resizing Firefox windo=
w"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104222">bug 10422=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mail&#64;rylan.coffee" title=3D"Rylan &lt;mail&#64;rylan.coffee&gt;"> <span=
 class=3D"fn">Rylan</span></a>
</span></b>
        <pre>(In reply to Rylan from <a href=3D"show_bug.cgi?id=3D104222#c6=
">comment #6</a>)
<span class=3D"quote">&gt; Hello, another me-too here. Arch Linux with Gnom=
e+Wayland</span >

Some more information regarding this:=20

1. The issue is reproducible fairly consistently on my system, but sometime=
s I
have to resize the firefox window upto 5 times (manually dragging window co=
rner
by about 20%) to reproduce the freeze. So far, I have only observed the fre=
eze
occurring when window is being expanded, it does not seem to occur when the
windows is being decreased in size.

2. The freeze happens with both Firefox Nightly and stable Firefox, so
client-side decorations (or some other Nightly-only feature) do not seem to=
 be
responsible.

3. I cannot reproduce this issue in any other application except Firefox...=
even
Thunderbird (also by Mozilla) does not seem to be affected.

4. It does not seem to matter what page is being rendered by Firefox. The
freeze occurs even when firefox is showing a blank page with no internet
connection.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15151321352.4db830aDC.26345--

--===============0626475958==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0626475958==--
