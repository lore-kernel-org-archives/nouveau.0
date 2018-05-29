From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106577] broken rendering with nine and nouveau
 (GM107)
Date: Tue, 29 May 2018 16:19:00 +0000
Message-ID: <bug-106577-8800-htXcKHeM3l@http.bugs.freedesktop.org/>
References: <bug-106577-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1877487917=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-106577-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1877487917==
Content-Type: multipart/alternative; boundary="15276107391.Ac45541.10233"
Content-Transfer-Encoding: 7bit


--15276107391.Ac45541.10233
Date: Tue, 29 May 2018 16:18:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106577

--- Comment #5 from iive-/E1597aS9LQAvxtiuMwx3w@public.gmane.org ---
(In reply to Ilia Mirkin from comment #4)
> (In reply to iive from comment #3)
> > I must also say I am very disappointed by Nouveau developers
> [...]
> > Nouveau is the only buggy driver, at this moment.
>=20
> Patches welcome.

Can't help with that, no working NVidia hardware around.
Not going to buy one either.

> Apparently thus far no one has the time/concentration necessary to rewrite
> all the texture/sampler handling in the driver, and, more importantly,
> ensure that everything still works.

Three months is plenty of time for this kind of bug. Also "rewrite" is too
dramatic word for what has to be done, it's more of "refactoring"; and yes
indeed it could be tricky.
There is also the possibility of placing a single dirty hack in nouveau dri=
ver
that is similar to the workaround in the issue tracker.

I think that keeping things private only made things worse. People trusted =
you
that you would fix this, and you let them down.

What is even worse, the tone you are using here, kind of implies that you do
not intend to work on a fix.

I hope that you will prove me wrong.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15276107391.Ac45541.10233
Date: Tue, 29 May 2018 16:18:59 +0000
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
   title=3D"NEW - broken rendering with nine and nouveau (GM107)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106577#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - broken rendering with nine and nouveau (GM107)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106577">bug 10657=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
iive&#64;yahoo.com" title=3D"iive&#64;yahoo.com">iive&#64;yahoo.com</a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D106=
577#c4">comment #4</a>)
<span class=3D"quote">&gt; (In reply to iive from <a href=3D"show_bug.cgi?i=
d=3D106577#c3">comment #3</a>)
&gt; &gt; I must also say I am very disappointed by Nouveau developers
&gt; [...]
&gt; &gt; Nouveau is the only buggy driver, at this moment.
&gt;=20
&gt; Patches welcome.</span >

Can't help with that, no working NVidia hardware around.
Not going to buy one either.

<span class=3D"quote">&gt; Apparently thus far no one has the time/concentr=
ation necessary to rewrite
&gt; all the texture/sampler handling in the driver, and, more importantly,
&gt; ensure that everything still works.</span >

Three months is plenty of time for this kind of bug. Also &quot;rewrite&quo=
t; is too
dramatic word for what has to be done, it's more of &quot;refactoring&quot;=
; and yes
indeed it could be tricky.
There is also the possibility of placing a single dirty hack in nouveau dri=
ver
that is similar to the workaround in the issue tracker.

I think that keeping things private only made things worse. People trusted =
you
that you would fix this, and you let them down.

What is even worse, the tone you are using here, kind of implies that you do
not intend to work on a fix.

I hope that you will prove me wrong.</pre>
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

--15276107391.Ac45541.10233--

--===============1877487917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1877487917==--
