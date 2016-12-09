From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98852] Nvidia graphics card fan not running or to
 slow, danger of overheating
Date: Fri, 09 Dec 2016 10:26:12 +0000
Message-ID: <bug-98852-8800-yVJWEE6c6o@http.bugs.freedesktop.org/>
References: <bug-98852-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1425191236=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98852-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1425191236==
Content-Type: multipart/alternative; boundary="14812791721.16A34.14977";
 charset="UTF-8"


--14812791721.16A34.14977
Date: Fri, 9 Dec 2016 10:26:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98852

--- Comment #24 from Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> ---
(In reply to Martin Peres from comment #23)
> Thanks for being super helpful and responsive! We compute the clock tree
> correctly so now, the problem is that we do not detect which PWM controll=
er
> we need to write to.
>=20
> So, let's have a look at nouveau's code now and see what could go wrong :)

Nothing obvious comes to mind. Especially not something related to the fan.=
 If
it is a regression between 4.6 and 4.7, is it too much to ask for a bisect?=
 :s

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14812791721.16A34.14977
Date: Fri, 9 Dec 2016 10:26:12 +0000
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
   title=3D"NEW - Nvidia graphics card fan not running or to slow, danger o=
f overheating"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98852#c24">Commen=
t # 24</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nvidia graphics card fan not running or to slow, danger o=
f overheating"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98852">bug 98852<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
martin.peres&#64;free.fr" title=3D"Martin Peres &lt;martin.peres&#64;free.f=
r&gt;"> <span class=3D"fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to Martin Peres from <a href=3D"show_bug.cgi?id=3D98=
852#c23">comment #23</a>)
<span class=3D"quote">&gt; Thanks for being super helpful and responsive! W=
e compute the clock tree
&gt; correctly so now, the problem is that we do not detect which PWM contr=
oller
&gt; we need to write to.
&gt;=20
&gt; So, let's have a look at nouveau's code now and see what could go wron=
g :)</span >

Nothing obvious comes to mind. Especially not something related to the fan.=
 If
it is a regression between 4.6 and 4.7, is it too much to ask for a bisect?=
 :s</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14812791721.16A34.14977--

--===============1425191236==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1425191236==--
