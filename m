From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98386] [NVE7] bus: MMIO write of FAULT at [ IBUS ],
 Pointer to {TDMS, flat panel} table invalid
Date: Tue, 28 Mar 2017 21:28:21 +0000
Message-ID: <bug-98386-8800-6TAkXJXgmu@http.bugs.freedesktop.org/>
References: <bug-98386-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2046982201=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98386-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2046982201==
Content-Type: multipart/alternative; boundary="14907365012.8F7e3c.29221";
 charset="UTF-8"


--14907365012.8F7e3c.29221
Date: Tue, 28 Mar 2017 21:28:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98386

--- Comment #17 from Bruno Pagani <bruno.n.pagani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Bob Bugzilla from comment #16)
> I used glxgears as a relative benchmark (not absolute). Previously had
> 12,000 FPS.  Now get 1,000 FPS.
>=20
> This is new and the timing correlates with the arrival of the nouveau fau=
lts
> in dmesg, and both correlate with applying the latest updates via Fedora =
25.

So what is happening is that you got a bunch of updates, and now are linking
uncorrelated things together, because the only correlation I see here is th=
at
both problems are related to this update, but I don=E2=80=99t think they ha=
ve any other
sort of links between them. A being correlated to B and C being also correl=
ated
to B doesn=E2=80=99t imply that A and C are correlated together. It would b=
e like
saying =E2=80=9CHey my new car cannot drive as fast as my previous one, thi=
s must has
something to do with the fact I can get the music volume to the same level =
as
in my previous one=E2=80=9D. This are two unrelated things that both link t=
o the fact
you=E2=80=99ve changed your car, but there is no any kind of connection tha=
t could be
made between those two things otherwise.

> I did try the "options nouveau config=3DWar00C800_0=3D1" modprobe.d patch=
 from
> bug 70354, but no change.

Yes, and you had no reason to try that, don=E2=80=99t know what you expecte=
d=E2=80=A6 If you
had read the bug report, you would have seen that the main issue has been f=
ixed
for everyone quite some time ago, and that the bug report we are currently
discussing over is for this MMIO error that has in fact been present even
before 70354 was solved
(https://bugzilla.freedesktop.org/show_bug.cgi?id=3D70354#c53,
https://bugzilla.freedesktop.org/show_bug.cgi?id=3D87942), and is still pre=
sent
today.

> Looking for things to try, but don't know where to look.  Ideas?

So let me recap that again. You=E2=80=99ve updated your system, and because=
 of that
your glxgears perfs decreased. If you want to do something about it, then y=
ou
should report a regression bug against the component that is responsible for
that, which require you to rollover your system to its previous state, veri=
fy
whether things are OK and not, and then as much as possible upgrade packages
one by one and verify whether perfs change, and when they do you=E2=80=99ll=
 have found
what package is responsible for this. But please stop reporting this to this
thread, this is unrelated.

Now, regarding the issue in this thread, are you sure you never had this is=
sue
before? Do you have kernel log from prior to the update? Maybe through
journalctl -k?

I find it unlikely that this issue started occurring at some point and wasn=
=E2=80=99t
present from the start (since it has been for me), but I=E2=80=99m no kerne=
l dev so I
might very well be wrong on this. Or maybe your previous kernel was so old =
that
the card wasn=E2=80=99t initialized at all and thus you didn=E2=80=99t see =
any issue.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14907365012.8F7e3c.29221
Date: Tue, 28 Mar 2017 21:28:21 +0000
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
   title=3D"NEW - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer to {=
TDMS,flat panel} table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386#c17">Commen=
t # 17</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer to {=
TDMS,flat panel} table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386">bug 98386<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bruno.n.pagani&#64;gmail.com" title=3D"Bruno Pagani &lt;bruno.n.pagani&#64;=
gmail.com&gt;"> <span class=3D"fn">Bruno Pagani</span></a>
</span></b>
        <pre>(In reply to Bob Bugzilla from <a href=3D"show_bug.cgi?id=3D98=
386#c16">comment #16</a>)
<span class=3D"quote">&gt; I used glxgears as a relative benchmark (not abs=
olute). Previously had
&gt; 12,000 FPS.  Now get 1,000 FPS.
&gt;=20
&gt; This is new and the timing correlates with the arrival of the nouveau =
faults
&gt; in dmesg, and both correlate with applying the latest updates via Fedo=
ra 25.</span >

So what is happening is that you got a bunch of updates, and now are linking
uncorrelated things together, because the only correlation I see here is th=
at
both problems are related to this update, but I don=E2=80=99t think they ha=
ve any other
sort of links between them. A being correlated to B and C being also correl=
ated
to B doesn=E2=80=99t imply that A and C are correlated together. It would b=
e like
saying =E2=80=9CHey my new car cannot drive as fast as my previous one, thi=
s must has
something to do with the fact I can get the music volume to the same level =
as
in my previous one=E2=80=9D. This are two unrelated things that both link t=
o the fact
you=E2=80=99ve changed your car, but there is no any kind of connection tha=
t could be
made between those two things otherwise.

<span class=3D"quote">&gt; I did try the &quot;options nouveau config=3DWar=
00C800_0=3D1&quot; modprobe.d patch from
&gt; <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [NVE6,NVE7] HUB_INIT timeout on graph init, bl=
ob fw doesn't help"
   href=3D"show_bug.cgi?id=3D70354">bug 70354</a>, but no change.</span >

Yes, and you had no reason to try that, don=E2=80=99t know what you expecte=
d=E2=80=A6 If you
had read the bug report, you would have seen that the main issue has been f=
ixed
for everyone quite some time ago, and that the bug report we are currently
discussing over is for this MMIO error that has in fact been present even
before 70354 was solved
(<a href=3D"https://bugzilla.freedesktop.org/show_bug.cgi?id=3D70354#c53">h=
ttps://bugzilla.freedesktop.org/show_bug.cgi?id=3D70354#c53</a>,
<a href=3D"https://bugzilla.freedesktop.org/show_bug.cgi?id=3D87942">https:=
//bugzilla.freedesktop.org/show_bug.cgi?id=3D87942</a>), and is still prese=
nt
today.

<span class=3D"quote">&gt; Looking for things to try, but don't know where =
to look.  Ideas?</span >

So let me recap that again. You=E2=80=99ve updated your system, and because=
 of that
your glxgears perfs decreased. If you want to do something about it, then y=
ou
should report a regression bug against the component that is responsible for
that, which require you to rollover your system to its previous state, veri=
fy
whether things are OK and not, and then as much as possible upgrade packages
one by one and verify whether perfs change, and when they do you=E2=80=99ll=
 have found
what package is responsible for this. But please stop reporting this to this
thread, this is unrelated.

Now, regarding the issue in this thread, are you sure you never had this is=
sue
before? Do you have kernel log from prior to the update? Maybe through
journalctl -k?

I find it unlikely that this issue started occurring at some point and wasn=
=E2=80=99t
present from the start (since it has been for me), but I=E2=80=99m no kerne=
l dev so I
might very well be wrong on this. Or maybe your previous kernel was so old =
that
the card wasn=E2=80=99t initialized at all and thus you didn=E2=80=99t see =
any issue.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14907365012.8F7e3c.29221--

--===============2046982201==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2046982201==--
