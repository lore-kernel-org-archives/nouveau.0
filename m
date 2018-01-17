From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104672] [NVAC] Compiz segfaults on login on Ubuntu
 17.10 with Unity 7 (kernel DRM bug?)
Date: Wed, 17 Jan 2018 10:21:09 +0000
Message-ID: <bug-104672-8800-6birIFQBRT@http.bugs.freedesktop.org/>
References: <bug-104672-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1826350349=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104672-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1826350349==
Content-Type: multipart/alternative; boundary="15161844690.2FaD9C.27764"
Content-Transfer-Encoding: 7bit


--15161844690.2FaD9C.27764
Date: Wed, 17 Jan 2018 10:21:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104672

--- Comment #2 from Rui Salvaterra <rsalvaterra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Pierre Moreau from comment #1)
> Could you please provide the output of dmesg after the segfault, as well =
as
> the X logs (/var/log/Xorg.0.log, or wherever it is on your computer)?

Sure, later today (as of now I only have ssh access to the machine).=20

> If you could bisect the kernel between 4.14.13 and 4.15-rc8, that would be
> awesome (for example, running `git bisect start --term-good=3Dv4.14
> --term-bad=3Dv4.15-rc8 -- drivers/gpu/drm/nouveau`, see ). I=E2=80=99ll t=
ry to give
> 4.15-rc8 a spin on my laptop tonight.

I've never done a git bisection before (and I don't have the toolchain
installed, this is - was, now that all hell broke loose with Meltdown and
friends - a computer with very limited use), but I wager it's going to be
painful to do kernel compiles on an Atom 330=E2=80=A6 I may try to do so on=
 the
weekend, but no promises. :(
Actually, I just reported this now because I was expecting this error to be
found by someone else, being so obvious. :P It's happening since 4.15-rc1 (=
the
first release I tested after the merge window).

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15161844690.2FaD9C.27764
Date: Wed, 17 Jan 2018 10:21:09 +0000
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
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - [NVAC] Compiz segfaults on login on Ubuntu 17.10 wit=
h Unity 7 (kernel DRM bug?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104672#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - [NVAC] Compiz segfaults on login on Ubuntu 17.10 wit=
h Unity 7 (kernel DRM bug?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104672">bug 10467=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rsalvaterra&#64;gmail.com" title=3D"Rui Salvaterra &lt;rsalvaterra&#64;gmai=
l.com&gt;"> <span class=3D"fn">Rui Salvaterra</span></a>
</span></b>
        <pre>(In reply to Pierre Moreau from <a href=3D"show_bug.cgi?id=3D1=
04672#c1">comment #1</a>)
<span class=3D"quote">&gt; Could you please provide the output of dmesg aft=
er the segfault, as well as
&gt; the X logs (/var/log/Xorg.0.log, or wherever it is on your computer)?<=
/span >

Sure, later today (as of now I only have ssh access to the machine).=20

<span class=3D"quote">&gt; If you could bisect the kernel between 4.14.13 a=
nd 4.15-rc8, that would be
&gt; awesome (for example, running `git bisect start --term-good=3Dv4.14
&gt; --term-bad=3Dv4.15-rc8 -- drivers/gpu/drm/nouveau`, see ). I=E2=80=99l=
l try to give
&gt; 4.15-rc8 a spin on my laptop tonight.</span >

I've never done a git bisection before (and I don't have the toolchain
installed, this is - was, now that all hell broke loose with Meltdown and
friends - a computer with very limited use), but I wager it's going to be
painful to do kernel compiles on an Atom 330=E2=80=A6 I may try to do so on=
 the
weekend, but no promises. :(
Actually, I just reported this now because I was expecting this error to be
found by someone else, being so obvious. :P It's happening since 4.15-rc1 (=
the
first release I tested after the merge window).</pre>
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

--15161844690.2FaD9C.27764--

--===============1826350349==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1826350349==--
