From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110830] [nouveau] GeForce GTX 1660 Ti (mobile) not
 supported (NV168/TU116)
Date: Fri, 14 Jun 2019 15:32:56 +0000
Message-ID: <bug-110830-8800-IHkxEZ91VD@http.bugs.freedesktop.org/>
References: <bug-110830-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2062005793=="
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


--===============2062005793==
Content-Type: multipart/alternative; boundary="15605263760.5a7bC9.10985"
Content-Transfer-Encoding: 7bit


--15605263760.5a7bC9.10985
Date: Fri, 14 Jun 2019 15:32:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110830

--- Comment #10 from Marcin Zajaczkowski <mszpak-5tc4TXWwyLM@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #9)
> (In reply to Marcin Zajaczkowski from comment #7)
> > > Providers: number : 2
> > > Provider 0: id: 0x6b cap: 0xf, Source Output, Sink Output, Source Off=
load, Sink Offload crtcs: 3 outputs: 3 associated providers: 1 name:modeset=
ting
> > > Provider 1: id: 0x45 cap: 0x2, Sink Output crtcs: 4 outputs: 2 associ=
ated providers: 1 name:modesetting
> >=20
> > Hmm, why there are 3 and 4 outputs associated to them? Is it possible t=
hat
> > DP output is accessible with the Intel card only (I don't have a connec=
tor
> > right here to test it organoleptically)?
>=20
> "crtcs: 4; outputs: 2". All modern NVIDIA GPU's have 4 CRTC's. You can see
> the full list of outputs with that grep command you ran.
>=20
> You can now slave the nvidia GPU's outputs to the primary (intel) GPU:
>=20
> xrandr --setprovideroutputsource 1 0
>=20
> which should allow you to drive on your NVIDIA GPU's outputs by configuri=
ng
> them in xrandr.

In lxqt (with Openbox) after that command and "xrandr --output HDMI-1-2 --a=
uto
--right-of eDP-1" the external monitor is turned on and I see a mouse cursor
there, but no window is rendered.

In Gnome 3 (with xorg) the external monitor is detected automatically, but =
the
effect is the same - black screen with a mouse cursor.

Can it be related to the fact that NVidia providers reports only "Sink Outp=
ut",
but not offloading?

> This should also be possible with a Wayland compositor, however the
> specifics will vary by compositor. Xwayland has no ability to control scr=
een
> setup.

In Wayland the external monitor works out-of-box in Gnome 3. However, I have
problem with bringing it to live with Xorg server (some tools I use don't l=
ike
Wayland). Is it possible to force LXQT or Gnome 3 (on xorg) to render also =
on
the external screen?

I've read about some issues with Windows Manager and "offloading", but thou=
gh
it only applies to OpenGL-based output with PRIME=3D1.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15605263760.5a7bC9.10985
Date: Fri, 14 Jun 2019 15:32:56 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110830#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nouveau] GeForce GTX 1660 Ti (mobile) not supported (NV1=
68/TU116)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110830">bug 11083=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mszpak&#64;wp.pl" title=3D"Marcin Zajaczkowski &lt;mszpak&#64;wp.pl&gt;"> <=
span class=3D"fn">Marcin Zajaczkowski</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D110=
830#c9">comment #9</a>)
<span class=3D"quote">&gt; (In reply to Marcin Zajaczkowski from <a href=3D=
"show_bug.cgi?id=3D110830#c7">comment #7</a>)
&gt; &gt; &gt; Providers: number : 2
&gt; &gt; &gt; Provider 0: id: 0x6b cap: 0xf, Source Output, Sink Output, S=
ource Offload, Sink Offload crtcs: 3 outputs: 3 associated providers: 1 nam=
e:modesetting
&gt; &gt; &gt; Provider 1: id: 0x45 cap: 0x2, Sink Output crtcs: 4 outputs:=
 2 associated providers: 1 name:modesetting
&gt; &gt;=20
&gt; &gt; Hmm, why there are 3 and 4 outputs associated to them? Is it poss=
ible that
&gt; &gt; DP output is accessible with the Intel card only (I don't have a =
connector
&gt; &gt; right here to test it organoleptically)?
&gt;=20
&gt; &quot;crtcs: 4; outputs: 2&quot;. All modern NVIDIA GPU's have 4 CRTC'=
s. You can see
&gt; the full list of outputs with that grep command you ran.
&gt;=20
&gt; You can now slave the nvidia GPU's outputs to the primary (intel) GPU:
&gt;=20
&gt; xrandr --setprovideroutputsource 1 0
&gt;=20
&gt; which should allow you to drive on your NVIDIA GPU's outputs by config=
uring
&gt; them in xrandr.</span >

In lxqt (with Openbox) after that command and &quot;xrandr --output HDMI-1-=
2 --auto
--right-of eDP-1&quot; the external monitor is turned on and I see a mouse =
cursor
there, but no window is rendered.

In Gnome 3 (with xorg) the external monitor is detected automatically, but =
the
effect is the same - black screen with a mouse cursor.

Can it be related to the fact that NVidia providers reports only &quot;Sink=
 Output&quot;,
but not offloading?

<span class=3D"quote">&gt; This should also be possible with a Wayland comp=
ositor, however the
&gt; specifics will vary by compositor. Xwayland has no ability to control =
screen
&gt; setup.</span >

In Wayland the external monitor works out-of-box in Gnome 3. However, I have
problem with bringing it to live with Xorg server (some tools I use don't l=
ike
Wayland). Is it possible to force LXQT or Gnome 3 (on xorg) to render also =
on
the external screen?

I've read about some issues with Windows Manager and &quot;offloading&quot;=
, but though
it only applies to OpenGL-based output with PRIME=3D1.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15605263760.5a7bC9.10985--

--===============2062005793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============2062005793==--
