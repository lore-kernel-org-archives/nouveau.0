From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100139] [DRI2][PRIME] nouveau driver cannot find any
 connected connector
Date: Fri, 10 Mar 2017 16:11:33 +0000
Message-ID: <bug-100139-8800-jxHZVzBcOZ@http.bugs.freedesktop.org/>
References: <bug-100139-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1426972611=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100139-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1426972611==
Content-Type: multipart/alternative; boundary="14891622930.56c1D29d.22757";
 charset="UTF-8"


--14891622930.56c1D29d.22757
Date: Fri, 10 Mar 2017 16:11:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100139

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Anthoine Bourgeois from comment #4)
> (In reply to Ilia Mirkin from comment #3)
> > No clue. I don't use xfwm and don't want to lie about what it does. Most
> > wm's (window managers) are not compositors at all.
>=20
> It works with mutter/grome3, so it was a xfwm problem.

The composition probably just needs to come from a different application. L=
ike
xcompmgr or something. Or perhaps xfwm has an option to enable composition.

If you update your stack and switch to DRI3, you won't need to use a
compositor. I'd recommend Xorg 1.18 + Mesa 17.0. With the latter you'll get=
 a
lot more out of both your iGPU and dGPUs.

If you update to kernel 4.10 you should be able to manually reclock your dG=
PU
in order to make full use of its performance.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14891622930.56c1D29d.22757
Date: Fri, 10 Mar 2017 16:11:33 +0000
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
   title=3D"RESOLVED WORKSFORME - [DRI2][PRIME] nouveau driver cannot find =
any connected connector"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100139#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - [DRI2][PRIME] nouveau driver cannot find =
any connected connector"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100139">bug 10013=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Anthoine Bourgeois from <a href=3D"show_bug.cgi?i=
d=3D100139#c4">comment #4</a>)
<span class=3D"quote">&gt; (In reply to Ilia Mirkin from <a href=3D"show_bu=
g.cgi?id=3D100139#c3">comment #3</a>)
&gt; &gt; No clue. I don't use xfwm and don't want to lie about what it doe=
s. Most
&gt; &gt; wm's (window managers) are not compositors at all.
&gt;=20
&gt; It works with mutter/grome3, so it was a xfwm problem.</span >

The composition probably just needs to come from a different application. L=
ike
xcompmgr or something. Or perhaps xfwm has an option to enable composition.

If you update your stack and switch to DRI3, you won't need to use a
compositor. I'd recommend Xorg 1.18 + Mesa 17.0. With the latter you'll get=
 a
lot more out of both your iGPU and dGPUs.

If you update to kernel 4.10 you should be able to manually reclock your dG=
PU
in order to make full use of its performance.</pre>
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

--14891622930.56c1D29d.22757--

--===============1426972611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1426972611==--
