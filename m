From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91992] [NV4C] computer hangs after few minutes of use
Date: Tue, 15 Sep 2015 19:47:50 +0000
Message-ID: <bug-91992-8800-ztfSSF8GAD@http.bugs.freedesktop.org/>
References: <bug-91992-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1838743104=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91992-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1838743104==
Content-Type: multipart/alternative; boundary="1442346469.A8AbBc0.28742"; charset="UTF-8"


--1442346469.A8AbBc0.28742
Date: Tue, 15 Sep 2015 19:47:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D91992

--- Comment #6 from Laurent Riffard <laurent.riffard+freedesktop-GANU6spQydw@public.gmane.org> -=
--
Hi,

(In reply to Hans de Goede from comment #5)
[...]
> > As you suggested, I increased the amount of RAM assigned to the video c=
ard,
> > from 32 Gb to 64 Gb, and I didn=E2=80=99t encounter any new problem.
>=20
> I assume you mean MB not GB ? Yes 32MB is a very low setting, so this
> explains the original problem quite nicely.

Yes, I mean Mb...


> > Shouldn=E2=80=99t this short-memory condition be nicely handled by the =
driver ?
>=20
> In an ideal world it would at least be handled better then crashing, but =
our
> oom handling currently is rather poor (as you've noticed) . Fixing this
> unfortunately is quite difficult and currently no one is working on this.
>=20
> Since changing the setting in the BIOS fixes things, I'm closing this bug.

Ok, thanks for your help

Regards,
Laurent

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1442346469.A8AbBc0.28742
Date: Tue, 15 Sep 2015 19:47:49 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [NV4C] computer hangs after few minutes of use"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91992#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [NV4C] computer hangs after few minutes of use"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91992">bug 91992<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
laurent.riffard+freedesktop&#64;free.fr" title=3D"Laurent Riffard &lt;laure=
nt.riffard+freedesktop&#64;free.fr&gt;"> <span class=3D"fn">Laurent Riffard=
</span></a>
</span></b>
        <pre>Hi,

(In reply to Hans de Goede from <a href=3D"show_bug.cgi?id=3D91992#c5">comm=
ent #5</a>)
[...]
<span class=3D"quote">&gt; &gt; As you suggested, I increased the amount of=
 RAM assigned to the video card,
&gt; &gt; from 32 Gb to 64 Gb, and I didn=E2=80=99t encounter any new probl=
em.
&gt;=20
&gt; I assume you mean MB not GB ? Yes 32MB is a very low setting, so this
&gt; explains the original problem quite nicely.</span >

Yes, I mean Mb...


<span class=3D"quote">&gt; &gt; Shouldn=E2=80=99t this short-memory conditi=
on be nicely handled by the driver ?
&gt;=20
&gt; In an ideal world it would at least be handled better then crashing, b=
ut our
&gt; oom handling currently is rather poor (as you've noticed) . Fixing this
&gt; unfortunately is quite difficult and currently no one is working on th=
is.
&gt;=20
&gt; Since changing the setting in the BIOS fixes things, I'm closing this =
bug.</span >

Ok, thanks for your help

Regards,
Laurent</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1442346469.A8AbBc0.28742--

--===============1838743104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1838743104==--
