From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110830] [nouveau] GeForce GTX 1660 Ti (mobile) not
 supported (NV168/TU116)
Date: Fri, 07 Jun 2019 21:20:35 +0000
Message-ID: <bug-110830-8800-aDcvKLz52a@http.bugs.freedesktop.org/>
References: <bug-110830-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0770429747=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110830-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0770429747==
Content-Type: multipart/alternative; boundary="15599424354.5dBB.11307"
Content-Transfer-Encoding: 7bit


--15599424354.5dBB.11307
Date: Fri, 7 Jun 2019 21:20:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110830

--- Comment #9 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Marcin Zajaczkowski from comment #7)
> > Providers: number : 2
> > Provider 0: id: 0x6b cap: 0xf, Source Output, Sink Output, Source Offlo=
ad, Sink Offload crtcs: 3 outputs: 3 associated providers: 1 name:modesetti=
ng
> > Provider 1: id: 0x45 cap: 0x2, Sink Output crtcs: 4 outputs: 2 associat=
ed providers: 1 name:modesetting
>=20
> Hmm, why there are 3 and 4 outputs associated to them? Is it possible that
> DP output is accessible with the Intel card only (I don't have a connector
> right here to test it organoleptically)?

"crtcs: 4; outputs: 2". All modern NVIDIA GPU's have 4 CRTC's. You can see =
the
full list of outputs with that grep command you ran.

You can now slave the nvidia GPU's outputs to the primary (intel) GPU:

xrandr --setprovideroutputsource 1 0

which should allow you to drive on your NVIDIA GPU's outputs by configuring
them in xrandr.

This should also be possible with a Wayland compositor, however the specifi=
cs
will vary by compositor. Xwayland has no ability to control screen setup.

(In reply to Marcin Zajaczkowski from comment #8)
> I know about a lack of acceleration, but I wanted to test offloading with
> NVidia GPU. I doesn't seem to work:

Lack of acceleration =3D no opengl, or anything else which requires the GPU=
 to
execute things in the "graphics" engine.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15599424354.5dBB.11307
Date: Fri, 7 Jun 2019 21:20:35 +0000
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
   title=3D"NEW - [nouveau] GeForce GTX 1660 Ti (mobile) not supported (NV1=
68/TU116)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110830#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nouveau] GeForce GTX 1660 Ti (mobile) not supported (NV1=
68/TU116)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110830">bug 11083=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Marcin Zajaczkowski from <a href=3D"show_bug.cgi?=
id=3D110830#c7">comment #7</a>)
<span class=3D"quote">&gt; &gt; Providers: number : 2
&gt; &gt; Provider 0: id: 0x6b cap: 0xf, Source Output, Sink Output, Source=
 Offload, Sink Offload crtcs: 3 outputs: 3 associated providers: 1 name:mod=
esetting
&gt; &gt; Provider 1: id: 0x45 cap: 0x2, Sink Output crtcs: 4 outputs: 2 as=
sociated providers: 1 name:modesetting
&gt;=20
&gt; Hmm, why there are 3 and 4 outputs associated to them? Is it possible =
that
&gt; DP output is accessible with the Intel card only (I don't have a conne=
ctor
&gt; right here to test it organoleptically)?</span >

&quot;crtcs: 4; outputs: 2&quot;. All modern NVIDIA GPU's have 4 CRTC's. Yo=
u can see the
full list of outputs with that grep command you ran.

You can now slave the nvidia GPU's outputs to the primary (intel) GPU:

xrandr --setprovideroutputsource 1 0

which should allow you to drive on your NVIDIA GPU's outputs by configuring
them in xrandr.

This should also be possible with a Wayland compositor, however the specifi=
cs
will vary by compositor. Xwayland has no ability to control screen setup.

(In reply to Marcin Zajaczkowski from <a href=3D"show_bug.cgi?id=3D110830#c=
8">comment #8</a>)
<span class=3D"quote">&gt; I know about a lack of acceleration, but I wante=
d to test offloading with
&gt; NVidia GPU. I doesn't seem to work:</span >

Lack of acceleration =3D no opengl, or anything else which requires the GPU=
 to
execute things in the &quot;graphics&quot; engine.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15599424354.5dBB.11307--

--===============0770429747==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0770429747==--
