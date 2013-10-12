From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70390] [NV84] Repeated system crashes under graphics
 load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]
Date: Sat, 12 Oct 2013 08:07:56 +0000
Message-ID: <bug-70390-8800-gKBqucVjoT@http.bugs.freedesktop.org/>
References: <bug-70390-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1986074575=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70390-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1986074575==
Content-Type: multipart/alternative; boundary="1381565276.A4F4AfB1.23115"; charset="us-ascii"


--1381565276.A4F4AfB1.23115
Date: Sat, 12 Oct 2013 08:07:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D70390

--- Comment #9 from Martin von Gagern <Martin.vGagern-hi6Y0CQ0nG0@public.gmane.org> ---
(In reply to comment #8)
> Right you are! Method =3D 0x40.

Glad my comment was not completely useless=E2=80=A6 :)

> So... the mystery is where does this 0x40 method come from.

Can we add a bit of debug code somewhere, to detect that specific value whe=
n it
enters the ring, and emit useful information like a kernel stack trace? I d=
on't
mind recompiling my kernel to test stuff, and it seems chances of reproduci=
ng
this are surprisingly high, but I haven't written any kernel code myself so
far.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1381565276.A4F4AfB1.23115
Date: Sat, 12 Oct 2013 08:07:56 +0000
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
   title=3D"NEW --- - [NV84] Repeated system crashes under graphics load, E=
[PFIFO] DMA_PUSHER and lots of E[PGRAPH]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70390#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NV84] Repeated system crashes under graphics load, E=
[PFIFO] DMA_PUSHER and lots of E[PGRAPH]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70390">bug 70390<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Martin.vGagern&#64;gmx.net" title=3D"Martin von Gagern &lt;Martin.vGagern&#=
64;gmx.net&gt;"> <span class=3D"fn">Martin von Gagern</span></a>
</span></b>
        <pre>(In reply to <a href=3D"show_bug.cgi?id=3D70390#c8">comment #8=
</a>)
<span class=3D"quote">&gt; Right you are! Method =3D 0x40.</span >

Glad my comment was not completely useless=E2=80=A6 :)

<span class=3D"quote">&gt; So... the mystery is where does this 0x40 method=
 come from.</span >

Can we add a bit of debug code somewhere, to detect that specific value whe=
n it
enters the ring, and emit useful information like a kernel stack trace? I d=
on't
mind recompiling my kernel to test stuff, and it seems chances of reproduci=
ng
this are surprisingly high, but I haven't written any kernel code myself so
far.</pre>
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

--1381565276.A4F4AfB1.23115--

--===============1986074575==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1986074575==--
