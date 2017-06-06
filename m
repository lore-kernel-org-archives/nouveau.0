From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101323] [nv20] glx-swap-event hangs X server
Date: Tue, 06 Jun 2017 22:44:58 +0000
Message-ID: <bug-101323-8800-vcauXffQtn@http.bugs.freedesktop.org/>
References: <bug-101323-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1483648494=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101323-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1483648494==
Content-Type: multipart/alternative; boundary="14967890972.B505b635.7911";
 charset="UTF-8"


--14967890972.B505b635.7911
Date: Tue, 6 Jun 2017 22:44:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101323

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
A few things you may be interested in:

(a) The pid always comes back as Xorg, since that's who opens the FD, even =
in a
dri3 scenario. Only time that it's the real application is when you're using
DRI3 *and* running on a secondary GPU.

(b) Hangs in nouveau_bo_wait indicate that the GPU hung. Basically it's an
ioctl that stalls until a fence is hit (the command for writing the fence is
sent by the kernel on command submission). If it never returns, that means =
the
fence is never hit. [Or there's a bug in our fence logic... I wonder if the=
re's
some sort of 32-bit wraparound sadness in there which is helped by piglit.]

Since you have a reproducible hang, might want to check dmesg *before* runn=
ing
the test, and then seeing what happens.

FWIW I always run piglit with "-x glx" -- that stuff never ends well on any
generation with nouveau, and I've never had the desire to investigate it.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14967890972.B505b635.7911
Date: Tue, 6 Jun 2017 22:44:57 +0000
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
   title=3D"NEW - [nv20] glx-swap-event hangs X server"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101323#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nv20] glx-swap-event hangs X server"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101323">bug 10132=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>A few things you may be interested in:

(a) The pid always comes back as Xorg, since that's who opens the FD, even =
in a
dri3 scenario. Only time that it's the real application is when you're using
DRI3 *and* running on a secondary GPU.

(b) Hangs in nouveau_bo_wait indicate that the GPU hung. Basically it's an
ioctl that stalls until a fence is hit (the command for writing the fence is
sent by the kernel on command submission). If it never returns, that means =
the
fence is never hit. [Or there's a bug in our fence logic... I wonder if the=
re's
some sort of 32-bit wraparound sadness in there which is helped by piglit.]

Since you have a reproducible hang, might want to check dmesg *before* runn=
ing
the test, and then seeing what happens.

FWIW I always run piglit with &quot;-x glx&quot; -- that stuff never ends w=
ell on any
generation with nouveau, and I've never had the desire to investigate it.</=
pre>
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

--14967890972.B505b635.7911--

--===============1483648494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1483648494==--
