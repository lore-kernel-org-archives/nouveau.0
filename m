From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109330] GL_ALPHA_BITS set to non-zero with
 EGL_PLATFORM_GBM_MESA
Date: Sun, 13 Jan 2019 16:17:12 +0000
Message-ID: <bug-109330-8800-9uqNCJi33M@http.bugs.freedesktop.org/>
References: <bug-109330-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0610846268=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-109330-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0610846268==
Content-Type: multipart/alternative; boundary="15473962320.4a9a.1725"
Content-Transfer-Encoding: 7bit


--15473962320.4a9a.1725
Date: Sun, 13 Jan 2019 16:17:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109330

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, so the 3 GPUs listed by emersion are all nv50, while the GP107 would be
covered by the nvc0 driver backend. Unfortunately I have a nv42 plugged in =
ATM,
but I'll have a look when I'm back on something a bit more modern.

If someone with C/C++ development experience and the requisite hardware is
interested, feel free to join in #nouveau on irc.freenode.net and I can pro=
vide
advice for things to investigate.

Lastly, if someone can provide an apitrace of the application doing
glReadPixels and getting unexpected results, that would avoid the need to h=
ave
to reproduce the software setup. I believe it's possible to look at
glReadPixels results in qapitrace ... would have to double-check though.

One guess is that we're copying from a RGBX surface to a RGBA surface, and =
not
whacking alpha to 1. However that should generally work, so one would have =
to
identify the precise code-path followed whereby that does not work.

Another guess is that the result of the rendering really does produce an al=
pha
of 0, either due to an earlier bug (unrelated to glReadPixels) happening, or
due to something specific to the drm formats exposed by nouveau and/or orde=
r of
gl configs, which causes something funny to happen..

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15473962320.4a9a.1725
Date: Sun, 13 Jan 2019 16:17:12 +0000
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
   title=3D"NEW - GL_ALPHA_BITS set to non-zero with EGL_PLATFORM_GBM_MESA"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109330#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GL_ALPHA_BITS set to non-zero with EGL_PLATFORM_GBM_MESA"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109330">bug 10933=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, so the 3 GPUs listed by emersion are all nv50, while the G=
P107 would be
covered by the nvc0 driver backend. Unfortunately I have a nv42 plugged in =
ATM,
but I'll have a look when I'm back on something a bit more modern.

If someone with C/C++ development experience and the requisite hardware is
interested, feel free to join in #nouveau on irc.freenode.net and I can pro=
vide
advice for things to investigate.

Lastly, if someone can provide an apitrace of the application doing
glReadPixels and getting unexpected results, that would avoid the need to h=
ave
to reproduce the software setup. I believe it's possible to look at
glReadPixels results in qapitrace ... would have to double-check though.

One guess is that we're copying from a RGBX surface to a RGBA surface, and =
not
whacking alpha to 1. However that should generally work, so one would have =
to
identify the precise code-path followed whereby that does not work.

Another guess is that the result of the rendering really does produce an al=
pha
of 0, either due to an earlier bug (unrelated to glReadPixels) happening, or
due to something specific to the drm formats exposed by nouveau and/or orde=
r of
gl configs, which causes something funny to happen..</pre>
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

--15473962320.4a9a.1725--

--===============0610846268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0610846268==--
