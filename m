From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99913] [G96] Reclocking fails on voltage
Date: Sun, 05 Mar 2017 15:58:16 +0000
Message-ID: <bug-99913-8800-KIxZkiT8cF@http.bugs.freedesktop.org/>
References: <bug-99913-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2122413581=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99913-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2122413581==
Content-Type: multipart/alternative; boundary="14887294962.995eB4.6077";
 charset="UTF-8"


--14887294962.995eB4.6077
Date: Sun, 5 Mar 2017 15:58:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99913

--- Comment #10 from Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Pekka Paalanen from comment #9)
> (In reply to Karol Herbst from comment #8)
> > it would be quite unpleasant if nvidia would indeed use the highest clo=
ck
> > level here.
>=20
> Do you mean an noise or something else?
>=20

hacky code

> > Would you mind checking what nvidia clocks to on this system?
>=20
> Yeah, looks like I should be able to install the legacy drivers 340.x. I'=
ll
> put that on my todo to record a new mmiotrace with some OpenGL action or
> something else to get the clocks to max.

you can force the highest power state in nvidia-settings afaik, this way the
mmiotrace stays rather small

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14887294962.995eB4.6077
Date: Sun, 5 Mar 2017 15:58:16 +0000
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
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - [G96] Reclocking fails on voltage"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99913#c10">Commen=
t # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - [G96] Reclocking fails on voltage"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99913">bug 99913<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
karolherbst&#64;gmail.com" title=3D"Karol Herbst &lt;karolherbst&#64;gmail.=
com&gt;"> <span class=3D"fn">Karol Herbst</span></a>
</span></b>
        <pre>(In reply to Pekka Paalanen from <a href=3D"show_bug.cgi?id=3D=
99913#c9">comment #9</a>)
<span class=3D"quote">&gt; (In reply to Karol Herbst from <a href=3D"show_b=
ug.cgi?id=3D99913#c8">comment #8</a>)
&gt; &gt; it would be quite unpleasant if nvidia would indeed use the highe=
st clock
&gt; &gt; level here.
&gt;=20
&gt; Do you mean an noise or something else?
&gt; </span >

hacky code

<span class=3D"quote">&gt; &gt; Would you mind checking what nvidia clocks =
to on this system?
&gt;=20
&gt; Yeah, looks like I should be able to install the legacy drivers 340.x.=
 I'll
&gt; put that on my todo to record a new mmiotrace with some OpenGL action =
or
&gt; something else to get the clocks to max.</span >

you can force the highest power state in nvidia-settings afaik, this way the
mmiotrace stays rather small</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14887294962.995eB4.6077--

--===============2122413581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2122413581==--
