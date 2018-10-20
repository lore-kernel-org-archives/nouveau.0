From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108500] Crash when creating a depth buffer on
 GeForce 320M
Date: Sat, 20 Oct 2018 16:28:42 +0000
Message-ID: <bug-108500-8800-FFVq9KNYfT@http.bugs.freedesktop.org/>
References: <bug-108500-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1297908019=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108500-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1297908019==
Content-Type: multipart/alternative; boundary="15400529220.EAeb.10630"
Content-Transfer-Encoding: 7bit


--15400529220.EAeb.10630
Date: Sat, 20 Oct 2018 16:28:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108500

--- Comment #4 from Timo Wiren <timo.wiren-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #3)
> Hrmph. Well, nothing in there. So ... what's different about your
> environment?
>=20
> I'm on Xorg 1.19, windowmaker, no compositor of any sort. glxgears works
> fine.
>=20
> Tell me about your setup.

Nothing custom, just the freshly installed Lubuntu 18.10 64-bit, English
localization, laptop's internal display, no encrypted disks, no compositor
AFAIK.

But I just found a workaround! I downloaded mesa 18.2.3, edited nv50_miptre=
e.c
and disabled compression in nv50_mt_choose_storage_type() for
PIPE_FORMAT_Z24_X8_UNORM. That is, I put "compressed =3D false;" after tile=
_flags
=3D 0x128 + ms;, compiled mesa and ran glxgears with my compiled version an=
d it
didn't crash. I don't know if it's a proper workaround. The issue seems to =
be
with depth compression, I guess.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15400529220.EAeb.10630
Date: Sat, 20 Oct 2018 16:28:42 +0000
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
   title=3D"NEW - Crash when creating a depth buffer on GeForce 320M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108500#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crash when creating a depth buffer on GeForce 320M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108500">bug 10850=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
timo.wiren&#64;gmail.com" title=3D"Timo Wiren &lt;timo.wiren&#64;gmail.com&=
gt;"> <span class=3D"fn">Timo Wiren</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D108=
500#c3">comment #3</a>)
<span class=3D"quote">&gt; Hrmph. Well, nothing in there. So ... what's dif=
ferent about your
&gt; environment?
&gt;=20
&gt; I'm on Xorg 1.19, windowmaker, no compositor of any sort. glxgears wor=
ks
&gt; fine.
&gt;=20
&gt; Tell me about your setup.</span >

Nothing custom, just the freshly installed Lubuntu 18.10 64-bit, English
localization, laptop's internal display, no encrypted disks, no compositor
AFAIK.

But I just found a workaround! I downloaded mesa 18.2.3, edited nv50_miptre=
e.c
and disabled compression in nv50_mt_choose_storage_type() for
PIPE_FORMAT_Z24_X8_UNORM. That is, I put &quot;compressed =3D false;&quot; =
after tile_flags
=3D 0x128 + ms;, compiled mesa and ran glxgears with my compiled version an=
d it
didn't crash. I don't know if it's a proper workaround. The issue seems to =
be
with depth compression, I guess.</pre>
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

--15400529220.EAeb.10630--

--===============1297908019==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1297908019==--
