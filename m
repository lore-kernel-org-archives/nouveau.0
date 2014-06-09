From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79823] [NV30/gallium] Mozilla apps freeze on startup
 with nouveau-dri-10.2.1 libs on dual-screen
Date: Mon, 09 Jun 2014 16:01:17 +0000
Message-ID: <bug-79823-8800-ss0W6ah9Tr@http.bugs.freedesktop.org/>
References: <bug-79823-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1449364881=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79823-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1449364881==
Content-Type: multipart/alternative; boundary="1402329677.Fc0FFb4B1.6522"; charset="us-ascii"


--1402329677.Fc0FFb4B1.6522
Date: Mon, 9 Jun 2014 16:01:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D79823

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #2)
> (In reply to comment #1)
> > There haven't been too many changes between 10.1 and 10.2 to the nv30
> > driver. Mind doing a bisect? It seems reasonable to restrict it to
> > src/gallium/drivers/nouveau/nv30.
> I've never done a bisect before, but I have an strace log from mozilla st=
art
> =E2=80=93 with and without freeze. The freeze log is so big (9MB), but if=
 it helps,
> I will post it tomorrow.

strace log is not that useful. It's probably sitting around waiting for
something to happen, which never happens. Bisecting is fairly easy... there=
 are
a bunch of guides online. I'd recommend installing into some scratch locati=
on
and using LD_LIBRARY_PATH to pick up your new lib, so that you don't mess up
your system install.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1402329677.Fc0FFb4B1.6522
Date: Mon, 9 Jun 2014 16:01:17 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NV30/gallium] Mozilla apps freeze on startup with no=
uveau-dri-10.2.1 libs on dual-screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D79823#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NV30/gallium] Mozilla apps freeze on startup with no=
uveau-dri-10.2.1 libs on dual-screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D79823">bug 79823<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href=3D"show_bug.cgi?id=3D79823#c2">comment #2=
</a>)
<span class=3D"quote">&gt; (In reply to <a href=3D"show_bug.cgi?id=3D79823#=
c1">comment #1</a>)
&gt; &gt; There haven't been too many changes between 10.1 and 10.2 to the =
nv30
&gt; &gt; driver. Mind doing a bisect? It seems reasonable to restrict it to
&gt; &gt; src/gallium/drivers/nouveau/nv30.
&gt; I've never done a bisect before, but I have an strace log from mozilla=
 start
&gt; =E2=80=93 with and without freeze. The freeze log is so big (9MB), but=
 if it helps,
&gt; I will post it tomorrow.</span >

strace log is not that useful. It's probably sitting around waiting for
something to happen, which never happens. Bisecting is fairly easy... there=
 are
a bunch of guides online. I'd recommend installing into some scratch locati=
on
and using LD_LIBRARY_PATH to pick up your new lib, so that you don't mess up
your system install.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402329677.Fc0FFb4B1.6522--

--===============1449364881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1449364881==--
