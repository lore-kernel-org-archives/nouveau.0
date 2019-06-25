From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110996] swaywm (wayland) crashes when turning off
 monitors through dpms
Date: Tue, 25 Jun 2019 15:15:17 +0000
Message-ID: <bug-110996-8800-Sw3fh02YTu@http.bugs.freedesktop.org/>
References: <bug-110996-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1496641404=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110996-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1496641404==
Content-Type: multipart/alternative; boundary="15614757171.adD2.1298"
Content-Transfer-Encoding: 7bit


--15614757171.adD2.1298
Date: Tue, 25 Jun 2019 15:15:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110996

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
What was the first group of errors before the first "core notifier timeout"?
That should help inform why there was a gpu hang. Actually, can you reprodu=
ce
when booted with

drm.debug=3D0x14 nouveau.debug=3Ddisp=3Dtrace

and then reproducing this issue. Only the first few sets of errors are
interesting (really the first, usually), everything after that is just
follow-on fail.

Looks like there are two bugs here, BTW:

1. We hang the EVO engine somehow
2. We have some kind of page map fail with evo_wait (hence the BUG at the e=
nd)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15614757171.adD2.1298
Date: Tue, 25 Jun 2019 15:15:17 +0000
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
   title=3D"NEW - swaywm (wayland) crashes when turning off monitors throug=
h dpms"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110996#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - swaywm (wayland) crashes when turning off monitors throug=
h dpms"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110996">bug 11099=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>What was the first group of errors before the first &quot;core=
 notifier timeout&quot;?
That should help inform why there was a gpu hang. Actually, can you reprodu=
ce
when booted with

drm.debug=3D0x14 nouveau.debug=3Ddisp=3Dtrace

and then reproducing this issue. Only the first few sets of errors are
interesting (really the first, usually), everything after that is just
follow-on fail.

Looks like there are two bugs here, BTW:

1. We hang the EVO engine somehow
2. We have some kind of page map fail with evo_wait (hence the BUG at the e=
nd)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15614757171.adD2.1298--

--===============1496641404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1496641404==--
