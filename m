From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91413] fan alarm timer/update called from interrupt
 in an infinite loop
Date: Sun, 29 May 2016 09:08:47 +0000
Message-ID: <bug-91413-8800-fQc7UQEiow@http.bugs.freedesktop.org/>
References: <bug-91413-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0550192581=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91413-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0550192581==
Content-Type: multipart/alternative; boundary="14645129273.0EaA.25881";
 charset="UTF-8"


--14645129273.0EaA.25881
Date: Sun, 29 May 2016 09:08:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D91413

--- Comment #13 from Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #12)
> (In reply to Jim Paris from comment #11)
> > FWIW, I've been running with the workaround patch in comment 6 for abou=
t 9
> > months now and haven't noticed any problems.  I hit the warning maybe 4
> > times a day.
>=20
> Thanks, patched that in, I now get the warnings too but it survives. Mart=
in,
> please have a look at this - we shouldn't be allowing the fan update to be
> called from interrupt context at all in the first place.

I agree that we should not. The issue here is that core/ is not allowed to
depend on work items. At least, it was not supported before. Having a look
right now!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14645129273.0EaA.25881
Date: Sun, 29 May 2016 09:08:47 +0000
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
   title=3D"NEW - fan alarm timer/update called from interrupt in an infini=
te loop"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91413#c13">Commen=
t # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - fan alarm timer/update called from interrupt in an infini=
te loop"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91413">bug 91413<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
martin.peres&#64;free.fr" title=3D"Martin Peres &lt;martin.peres&#64;free.f=
r&gt;"> <span class=3D"fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D914=
13#c12">comment #12</a>)
<span class=3D"quote">&gt; (In reply to Jim Paris from <a href=3D"show_bug.=
cgi?id=3D91413#c11">comment #11</a>)
&gt; &gt; FWIW, I've been running with the workaround patch in <a href=3D"s=
how_bug.cgi?id=3D91413#c6">comment 6</a> for about 9
&gt; &gt; months now and haven't noticed any problems.  I hit the warning m=
aybe 4
&gt; &gt; times a day.
&gt;=20
&gt; Thanks, patched that in, I now get the warnings too but it survives. M=
artin,
&gt; please have a look at this - we shouldn't be allowing the fan update t=
o be
&gt; called from interrupt context at all in the first place.</span >

I agree that we should not. The issue here is that core/ is not allowed to
depend on work items. At least, it was not supported before. Having a look
right now!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14645129273.0EaA.25881--

--===============0550192581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0550192581==--
