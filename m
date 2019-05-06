From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100567] Nouveau system freeze fifo: SCHED_ERROR 0a
 [CTXSW_TIMEOUT]
Date: Mon, 06 May 2019 16:51:39 +0000
Message-ID: <bug-100567-8800-GPuuSp6FXo@http.bugs.freedesktop.org/>
References: <bug-100567-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0339306775=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100567-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0339306775==
Content-Type: multipart/alternative; boundary="15571614992.ecfCE4cFa.27637"
Content-Transfer-Encoding: 7bit


--15571614992.ecfCE4cFa.27637
Date: Mon, 6 May 2019 16:51:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100567

--- Comment #29 from Marc Burkhardt <libreoffice.org-5+OZ0iQkl5WoYr4blSSd5g@public.gmane.org> ---
(In reply to Roy from comment #28)
> Somewhat surprised that this particular report hasn't received any attent=
ion
> from a core dev. Sadly, I'm afraid my response will not be hugely satisfy=
ing
> eiter.
>=20
> The message "fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]" is not the result of *a
> bug* and does not point in the direction of one. Rather it is a symptom o=
f a
> wide variety of potential problems with nouveau, (all of) which result in=
 a
> hang of the rendering part of the GPU. On itself it doesn't give meaningf=
ul
> information to any developer as to what may be the culprit. It's like
> measuring a fever, it could be the result of many conditions.
>=20
> Developers would be helped if there was a reliably reproducible situation=
 in
> which this event can be triggered. If there is a list of steps that can be
> followed that would result in this message and a hang, that somehow doesn=
't
> involve words like "random" or "wait for possibly a few hours", and that =
can
> be traced with tools such as APITrace, we could get a step further in
> analysing what goes wrong. However, it seems unlikely this is the case,
> especially since we are also aware of multithreading-related issues that
> make isolating such problems extremely difficult. Unfortunately, post-mor=
tem
> syslogs and dmesgs are unlikely to add any useful information to this or
> similar bug reports.

Hi Roy,

first of all thank you very much for your time taken to answer this thread.
Also thank you for the insights you gave.

As there are "tons" of threads out there, from Ubuntu to Fedora bug tracker=
s,
as well as several threads here on freedesktop and the Linux bug tracker, t=
hat
are open created even 2 years ago, I guess it's time to get hands on to get=
 rid
of this bug. You cannot imagine how annoying it is if you work on a machine
that could easily just completely "stall" when you open the wrong menu item=
 or
scroll a Twitter page just at the wrong time.

Anyways, I'm still offering $100 for fixing this, so me and a good bunch of
people around get this fixed upstream, so that it won't show up regardless =
of
distro or whatever kernel they run. This definitely needs a good amount of
backporting though, as it bugs us for a long time. Maybe the one or other is
willing two throw another $5 at it, so this would actually not benefit the =
user
only, but also the developer. If someone is familiar with a crowd-funding or
something -> I am not.

I'm willing to participate in testing patches or whatever I can do as a
non-graphics-driver developer. I'm surely familiar with the processes testi=
ng
patches, however.

I don't know what to suggest as a start to get this thing done. I have nouv=
eau
"debug" logs on my machine for a long time, but actually never saw anything
relevant in it besides the "message of death". Just a blink of an eye after
this happens the machine is completely unusable - no chance to interact any=
how
besides SysRq+REISSSUB.

I would very much like to make a progress here.

Maybe we could start and gather the already opened bugs and the people who
participated in these. Just to have a couple of people really "hit" by the
problem, that are willing to help and, moreover, are able to gather info on
their machines.

I'm pretty happy to run my machines without the "BLOB" and would happily ke=
ep
it this way. But this is a showstopper. A showstopper that has not gotten t=
he
right attention for a long time now.

Thanks in advance - no matter what we will achieve.

Marc

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15571614992.ecfCE4cFa.27637
Date: Mon, 6 May 2019 16:51:39 +0000
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
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567#c29">Comme=
nt # 29</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567">bug 10056=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
libreoffice.org&#64;marc.ngoe.de" title=3D"Marc Burkhardt &lt;libreoffice.o=
rg&#64;marc.ngoe.de&gt;"> <span class=3D"fn">Marc Burkhardt</span></a>
</span></b>
        <pre>(In reply to Roy from <a href=3D"show_bug.cgi?id=3D100567#c28"=
>comment #28</a>)
<span class=3D"quote">&gt; Somewhat surprised that this particular report h=
asn't received any attention
&gt; from a core dev. Sadly, I'm afraid my response will not be hugely sati=
sfying
&gt; eiter.
&gt;=20
&gt; The message &quot;fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]&quot; is not th=
e result of *a
&gt; bug* and does not point in the direction of one. Rather it is a sympto=
m of a
&gt; wide variety of potential problems with nouveau, (all of) which result=
 in a
&gt; hang of the rendering part of the GPU. On itself it doesn't give meani=
ngful
&gt; information to any developer as to what may be the culprit. It's like
&gt; measuring a fever, it could be the result of many conditions.
&gt;=20
&gt; Developers would be helped if there was a reliably reproducible situat=
ion in
&gt; which this event can be triggered. If there is a list of steps that ca=
n be
&gt; followed that would result in this message and a hang, that somehow do=
esn't
&gt; involve words like &quot;random&quot; or &quot;wait for possibly a few=
 hours&quot;, and that can
&gt; be traced with tools such as APITrace, we could get a step further in
&gt; analysing what goes wrong. However, it seems unlikely this is the case,
&gt; especially since we are also aware of multithreading-related issues th=
at
&gt; make isolating such problems extremely difficult. Unfortunately, post-=
mortem
&gt; syslogs and dmesgs are unlikely to add any useful information to this =
or
&gt; similar bug reports.</span >

Hi Roy,

first of all thank you very much for your time taken to answer this thread.
Also thank you for the insights you gave.

As there are &quot;tons&quot; of threads out there, from Ubuntu to Fedora b=
ug trackers,
as well as several threads here on freedesktop and the Linux bug tracker, t=
hat
are open created even 2 years ago, I guess it's time to get hands on to get=
 rid
of this bug. You cannot imagine how annoying it is if you work on a machine
that could easily just completely &quot;stall&quot; when you open the wrong=
 menu item or
scroll a Twitter page just at the wrong time.

Anyways, I'm still offering $100 for fixing this, so me and a good bunch of
people around get this fixed upstream, so that it won't show up regardless =
of
distro or whatever kernel they run. This definitely needs a good amount of
backporting though, as it bugs us for a long time. Maybe the one or other is
willing two throw another $5 at it, so this would actually not benefit the =
user
only, but also the developer. If someone is familiar with a crowd-funding or
something -&gt; I am not.

I'm willing to participate in testing patches or whatever I can do as a
non-graphics-driver developer. I'm surely familiar with the processes testi=
ng
patches, however.

I don't know what to suggest as a start to get this thing done. I have nouv=
eau
&quot;debug&quot; logs on my machine for a long time, but actually never sa=
w anything
relevant in it besides the &quot;message of death&quot;. Just a blink of an=
 eye after
this happens the machine is completely unusable - no chance to interact any=
how
besides SysRq+REISSSUB.

I would very much like to make a progress here.

Maybe we could start and gather the already opened bugs and the people who
participated in these. Just to have a couple of people really &quot;hit&quo=
t; by the
problem, that are willing to help and, moreover, are able to gather info on
their machines.

I'm pretty happy to run my machines without the &quot;BLOB&quot; and would =
happily keep
it this way. But this is a showstopper. A showstopper that has not gotten t=
he
right attention for a long time now.

Thanks in advance - no matter what we will achieve.

Marc</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15571614992.ecfCE4cFa.27637--

--===============0339306775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0339306775==--
