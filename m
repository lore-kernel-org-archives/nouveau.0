From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99400] [nouveau] garbled rendering with glamor on G71
Date: Fri, 13 Jan 2017 15:50:08 +0000
Message-ID: <bug-99400-8800-2QCzneyZGm@http.bugs.freedesktop.org/>
References: <bug-99400-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1866754139=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99400-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1866754139==
Content-Type: multipart/alternative; boundary="14843226081.7e8fAccB.7315";
 charset="UTF-8"


--14843226081.7e8fAccB.7315
Date: Fri, 13 Jan 2017 15:50:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99400

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Olivier Fourdan from comment #3)
> (In reply to Ilia Mirkin from comment #2)
> > Not that it's of much consolation, but the nv30 GL driver sucks. There =
are a
> > number of unhandled situations, and I wouldn't be overly surprised if g=
lamor
> > were to hit one or several of them.
>=20
> Could be a regression, I don't remember seeing those /before/ and the
> downstream bugs about black icons are recent as well.
>=20
> And there've been some glamor changes in the xserver as well, so it oculd=
 be
> /something/ in glamor has changed and doesn't play well with the driver.

This may come as some surprise, but nv30 is not a hotbed of development
activity. If you can figure out a change in mesa that broke it, that'd be v=
ery
helpful.

Separately, check dmesg - NVIDIA cards tend to yell loudly when we do somet=
hing
wrong.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14843226081.7e8fAccB.7315
Date: Fri, 13 Jan 2017 15:50:08 +0000
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
   title=3D"NEW - [nouveau] garbled rendering with glamor on G71"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99400#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nouveau] garbled rendering with glamor on G71"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99400">bug 99400<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Olivier Fourdan from <a href=3D"show_bug.cgi?id=
=3D99400#c3">comment #3</a>)
<span class=3D"quote">&gt; (In reply to Ilia Mirkin from <a href=3D"show_bu=
g.cgi?id=3D99400#c2">comment #2</a>)
&gt; &gt; Not that it's of much consolation, but the nv30 GL driver sucks. =
There are a
&gt; &gt; number of unhandled situations, and I wouldn't be overly surprise=
d if glamor
&gt; &gt; were to hit one or several of them.
&gt;=20
&gt; Could be a regression, I don't remember seeing those /before/ and the
&gt; downstream bugs about black icons are recent as well.
&gt;=20
&gt; And there've been some glamor changes in the xserver as well, so it oc=
uld be
&gt; /something/ in glamor has changed and doesn't play well with the drive=
r.</span >

This may come as some surprise, but nv30 is not a hotbed of development
activity. If you can figure out a change in mesa that broke it, that'd be v=
ery
helpful.

Separately, check dmesg - NVIDIA cards tend to yell loudly when we do somet=
hing
wrong.</pre>
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

--14843226081.7e8fAccB.7315--

--===============1866754139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1866754139==--
