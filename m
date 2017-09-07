From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101220] [NV137/GP107] xorg-server-1.19.3 crashes
 when trying to enable HDMI output
Date: Thu, 07 Sep 2017 08:39:14 +0000
Message-ID: <bug-101220-8800-Cn1Nur2ter@http.bugs.freedesktop.org/>
References: <bug-101220-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1987651320=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101220-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1987651320==
Content-Type: multipart/alternative; boundary="15047735543.e2d6eD.25603";
 charset="UTF-8"


--15047735543.e2d6eD.25603
Date: Thu, 7 Sep 2017 08:39:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101220

--- Comment #17 from Pacho Ramos <pachoramos1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #12)
[...]
> #2: we should figure out what's going on with accel on your GP107 -- looks
> like stuff is just hanging (that's the "timeout" messages you see, we're
> waiting for some condition to become true, and it never does).
>=20
> I can help with the former, and hopefully Ben Skeggs can investigate the
> latter.

As a side note, I am still unable to run with "accel" enabled even with ker=
nel
4.13.0 :/

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15047735543.e2d6eD.25603
Date: Thu, 7 Sep 2017 08:39:14 +0000
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
   title=3D"NEW - [NV137/GP107] xorg-server-1.19.3 crashes when trying to e=
nable HDMI output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101220#c17">Comme=
nt # 17</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV137/GP107] xorg-server-1.19.3 crashes when trying to e=
nable HDMI output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101220">bug 10122=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pachoramos1&#64;gmail.com" title=3D"Pacho Ramos &lt;pachoramos1&#64;gmail.c=
om&gt;"> <span class=3D"fn">Pacho Ramos</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D101=
220#c12">comment #12</a>)
[...]
<span class=3D"quote">&gt; #2: we should figure out what's going on with ac=
cel on your GP107 -- looks
&gt; like stuff is just hanging (that's the &quot;timeout&quot; messages yo=
u see, we're
&gt; waiting for some condition to become true, and it never does).
&gt;=20
&gt; I can help with the former, and hopefully Ben Skeggs can investigate t=
he
&gt; latter.</span >

As a side note, I am still unable to run with &quot;accel&quot; enabled eve=
n with kernel
4.13.0 :/</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15047735543.e2d6eD.25603--

--===============1987651320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1987651320==--
