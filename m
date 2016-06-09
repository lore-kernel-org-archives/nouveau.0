From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96460] NV43 [GeForce 6600 GT] shows many artifacts
	on a screen
Date: Thu, 09 Jun 2016 21:20:48 +0000
Message-ID: <bug-96460-8800-ubpKUnYjI1@http.bugs.freedesktop.org/>
References: <bug-96460-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0849993986=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-96460-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0849993986==
Content-Type: multipart/alternative; boundary="14655072481.81cba.1444";
 charset="UTF-8"


--14655072481.81cba.1444
Date: Thu, 9 Jun 2016 21:20:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96460

--- Comment #10 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Eugene from comment #9)
> >Please try to disable use of GL for composition if you have a compositor=
 enabled.
>
> Actually the situation is slightly somewhat different. It is not possible=
 to
> work with compositor enabled because of too many artefacts appears all the
> time. So this is the only way - to disable compositing - to be able to wo=
rk.

Can you clarify whether you're seeing the artifacts without any compositor =
at
all, or if your compositor is using Xrender, or if it's using GL?

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14655072481.81cba.1444
Date: Thu, 9 Jun 2016 21:20:48 +0000
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
   title=3D"NEW - NV43 [GeForce 6600 GT] shows many artifacts on a screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96460#c10">Commen=
t # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - NV43 [GeForce 6600 GT] shows many artifacts on a screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96460">bug 96460<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Eugene from <a href=3D"show_bug.cgi?id=3D96460#c9=
">comment #9</a>)
<span class=3D"quote">&gt; &gt;Please try to disable use of GL for composit=
ion if you have a compositor enabled.</span >
&gt;
<span class=3D"quote">&gt; Actually the situation is slightly somewhat diff=
erent. It is not possible to
&gt; work with compositor enabled because of too many artefacts appears all=
 the
&gt; time. So this is the only way - to disable compositing - to be able to=
 work.</span >

Can you clarify whether you're seeing the artifacts without any compositor =
at
all, or if your compositor is using Xrender, or if it's using GL?</pre>
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

--14655072481.81cba.1444--

--===============0849993986==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0849993986==--
