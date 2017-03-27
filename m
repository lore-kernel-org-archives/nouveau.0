From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99400] [nouveau] garbled rendering with glamor on G71
Date: Mon, 27 Mar 2017 13:26:43 +0000
Message-ID: <bug-99400-8800-3F6IlteHhR@http.bugs.freedesktop.org/>
References: <bug-99400-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1093751079=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99400-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1093751079==
Content-Type: multipart/alternative; boundary="14906212030.7cBF111d.18533";
 charset="UTF-8"


--14906212030.7cBF111d.18533
Date: Mon, 27 Mar 2017 13:26:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99400

--- Comment #29 from Olivier Fourdan <fourdan-eaOCjQ5FDoY@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #28)
> OK, this weston stuff is a no-go. No way to run it against a specific dri
> card without intensive udev work (which I have no interest in learning), =
and
> apparently won't even let me start without some env vars (XDG_RUNTIME_DIR,
> perhaps others) after I tried starting it under X.

You need Xwayland, and therefore a Wayland compositor to connect to. But
Xwayland can run standalone (within a Wayland compositor) so once/if you can
get a Wayland compositor to run, you could run Xwayland from there and
(hopefully) reproduce, e.g.:

    Xwayland :30 &
    DISPLAY=3D:30 gtk-demo

But the requirement is to have a Wayland compositor so that Xwayland can ru=
n.

Weston is not the only Wayland compositor, apart from GNOME, there are other
smaller Wayland compositors such as sway (http://swaywm.org/) which can run
nested as well (so you can test from an existing X11 session), but I haven't
played much with those.

> So... I can't repro with the given instructions (because I can't follow t=
he
> instructions successfully). Perhaps there are other instructions that
> reproduce the issue? Does Xephyr -glamor reproduce the issue? Something e=
lse
> that I can run?

Unfortunately no, "Xephyr -glamor" does not reproduce the issue, which makes
things even more confusing, admittedly.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14906212030.7cBF111d.18533
Date: Mon, 27 Mar 2017 13:26:43 +0000
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
   title=3D"NEW - [nouveau] garbled rendering with glamor on G71"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99400#c29">Commen=
t # 29</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nouveau] garbled rendering with glamor on G71"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99400">bug 99400<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fourdan&#64;xfce.org" title=3D"Olivier Fourdan &lt;fourdan&#64;xfce.org&gt;=
"> <span class=3D"fn">Olivier Fourdan</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D994=
00#c28">comment #28</a>)
<span class=3D"quote">&gt; OK, this weston stuff is a no-go. No way to run =
it against a specific dri
&gt; card without intensive udev work (which I have no interest in learning=
), and
&gt; apparently won't even let me start without some env vars (XDG_RUNTIME_=
DIR,
&gt; perhaps others) after I tried starting it under X.</span >

You need Xwayland, and therefore a Wayland compositor to connect to. But
Xwayland can run standalone (within a Wayland compositor) so once/if you can
get a Wayland compositor to run, you could run Xwayland from there and
(hopefully) reproduce, e.g.:

    Xwayland :30 &amp;
    DISPLAY=3D:30 gtk-demo

But the requirement is to have a Wayland compositor so that Xwayland can ru=
n.

Weston is not the only Wayland compositor, apart from GNOME, there are other
smaller Wayland compositors such as sway (<a href=3D"http://swaywm.org/">ht=
tp://swaywm.org/</a>) which can run
nested as well (so you can test from an existing X11 session), but I haven't
played much with those.

<span class=3D"quote">&gt; So... I can't repro with the given instructions =
(because I can't follow the
&gt; instructions successfully). Perhaps there are other instructions that
&gt; reproduce the issue? Does Xephyr -glamor reproduce the issue? Somethin=
g else
&gt; that I can run?</span >

Unfortunately no, &quot;Xephyr -glamor&quot; does not reproduce the issue, =
which makes
things even more confusing, admittedly.</pre>
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

--14906212030.7cBF111d.18533--

--===============1093751079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1093751079==--
