From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70390] [NV84] Repeated system crashes under graphics
 load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]
Date: Fri, 11 Oct 2013 22:07:19 +0000
Message-ID: <bug-70390-8800-eqNQaAubYb@http.bugs.freedesktop.org/>
References: <bug-70390-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0927808663=="
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


--===============0927808663==
Content-Type: multipart/alternative; boundary="1381529239.Ae1e1f2E1.19804"; charset="us-ascii"


--1381529239.Ae1e1f2E1.19804
Date: Fri, 11 Oct 2013 22:07:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D70390

--- Comment #7 from Martin von Gagern <Martin.vGagern-hi6Y0CQ0nG0@public.gmane.org> ---
Not sure whether this will be of any use, but I'm trying to think of ways w=
hich
might cause this, in my own pretty naive way of thinking about hardware dri=
vers
and graphics cards. Simply ignore dumb ideas. I don't need answers to these
questions, as long as you know that the answers exists and don't help us he=
re.

(In reply to comment #6)
> But 0x00406040 is a perfectly valid command, ever since the Riva TNT chip=
s.

Could it be that the command is invalid AT THAT TIME? Perhaps due to a race
condition? Could it be that the semaphore is already high?

> happens a fair bit for CPU vs GPU syncs.

Therefore the command likely won't fail all the time. The load pattern must=
 be
part of the issue.

Do things like stack overflows occur in GPU memory? Could excessive allocat=
ion
of e.g. texture memory somehow clobber memory needed by GPU firmware for
methods such like this?

What other resources might become exhausted by concurrent access from
graphics-intensive applications? Would that exhaustion be reported in some =
way?

Of course, actual hardware breakage is always an option. But the thing does=
n't
seem random enough to suggest a simple hardware defect as the main cause, i=
mho.
Of course it would be nice if I had another card with the same kind of chip=
s to
plug into my system, just to rule out that alternative=E2=80=A6

I must confess, I cannot follow how you decode 0x00406040 to method =3D 0x1=
0. The
way I read BEGIN_NV04, I can find your subc =3D 0, and size =3D 0x10, but I=
'd read
mthd =3D 0x40 directly from the least significant bits. Did I miss somethin=
g?

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1381529239.Ae1e1f2E1.19804
Date: Fri, 11 Oct 2013 22:07:19 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70390#c7">Comment=
 # 7</a>
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
        <pre>Not sure whether this will be of any use, but I'm trying to th=
ink of ways which
might cause this, in my own pretty naive way of thinking about hardware dri=
vers
and graphics cards. Simply ignore dumb ideas. I don't need answers to these
questions, as long as you know that the answers exists and don't help us he=
re.

(In reply to <a href=3D"show_bug.cgi?id=3D70390#c6">comment #6</a>)
<span class=3D"quote">&gt; But 0x00406040 is a perfectly valid command, eve=
r since the Riva TNT chips.</span >

Could it be that the command is invalid AT THAT TIME? Perhaps due to a race
condition? Could it be that the semaphore is already high?

<span class=3D"quote">&gt; happens a fair bit for CPU vs GPU syncs.</span >

Therefore the command likely won't fail all the time. The load pattern must=
 be
part of the issue.

Do things like stack overflows occur in GPU memory? Could excessive allocat=
ion
of e.g. texture memory somehow clobber memory needed by GPU firmware for
methods such like this?

What other resources might become exhausted by concurrent access from
graphics-intensive applications? Would that exhaustion be reported in some =
way?

Of course, actual hardware breakage is always an option. But the thing does=
n't
seem random enough to suggest a simple hardware defect as the main cause, i=
mho.
Of course it would be nice if I had another card with the same kind of chip=
s to
plug into my system, just to rule out that alternative=E2=80=A6

I must confess, I cannot follow how you decode 0x00406040 to method =3D 0x1=
0. The
way I read BEGIN_NV04, I can find your subc =3D 0, and size =3D 0x10, but I=
'd read
mthd =3D 0x40 directly from the least significant bits. Did I miss somethin=
g?</pre>
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

--1381529239.Ae1e1f2E1.19804--

--===============0927808663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0927808663==--
