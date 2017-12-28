From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104222] GNOME/Wayland desktop freezes when resizing
 Firefox window
Date: Thu, 28 Dec 2017 19:29:39 +0000
Message-ID: <bug-104222-8800-ZeTTsbLrap@http.bugs.freedesktop.org/>
References: <bug-104222-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0809940780=="
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


--===============0809940780==
Content-Type: multipart/alternative; boundary="15144893792.ACa1.6712";
 charset="UTF-8"


--15144893792.ACa1.6712
Date: Thu, 28 Dec 2017 19:29:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104222

--- Comment #4 from Felix Na <felix.na70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I can confirm that GNOME/Wayland/Nvidia crashes when resizing windows. Not =
only
in Firefox but also in other apps.

It's happening with Nouveau and Nvidia proprietary driver (my hardware is an
Nvidia GeForce GTX 750 Ti)

As a workaround, I switched back to Gnome/X11 and the desktop freezes are g=
one.

Gnome/Wayland with Intel-CPU driver works fine.

I guess Nvidia hardware and Wayland is not the best combination, hopefully =
it
will become more stable soon.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15144893792.ACa1.6712
Date: Thu, 28 Dec 2017 19:29:39 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104222#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GNOME/Wayland desktop freezes when resizing Firefox windo=
w"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104222">bug 10422=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
felix.na70&#64;gmail.com" title=3D"Felix Na &lt;felix.na70&#64;gmail.com&gt=
;"> <span class=3D"fn">Felix Na</span></a>
</span></b>
        <pre>I can confirm that GNOME/Wayland/Nvidia crashes when resizing =
windows. Not only
in Firefox but also in other apps.

It's happening with Nouveau and Nvidia proprietary driver (my hardware is an
Nvidia GeForce GTX 750 Ti)

As a workaround, I switched back to Gnome/X11 and the desktop freezes are g=
one.

Gnome/Wayland with Intel-CPU driver works fine.

I guess Nvidia hardware and Wayland is not the best combination, hopefully =
it
will become more stable soon.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15144893792.ACa1.6712--

--===============0809940780==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0809940780==--
