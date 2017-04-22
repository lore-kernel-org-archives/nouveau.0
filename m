From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100758] Kernel Oops when starting X nv50_dma_push
Date: Sat, 22 Apr 2017 15:45:33 +0000
Message-ID: <bug-100758-8800-HHKgjkuFXK@http.bugs.freedesktop.org/>
References: <bug-100758-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2087141708=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100758-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2087141708==
Content-Type: multipart/alternative; boundary="14928759330.FCC9f.11645";
 charset="UTF-8"


--14928759330.FCC9f.11645
Date: Sat, 22 Apr 2017 15:45:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100758

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Kevin Winchester from comment #5)
> After this crash, I rebooted and I'm currently running sway on wayland and
> things seem to work well, but I've been having trouble with X for weeks n=
ow.
>=20
> I first noticed issues when the following messages started appearing in my
> boot logs:
>=20
> nouveau 0000:01:00.0: bios: OOB 1 015f1901 015f1901
> nouveau 0000:01:00.0: bios: OOB 1 b90900b8 b90900b8
> nouveau 0000:01:00.0: bios: OOB 1 b90900b8 b90900b8
> nouveau 0000:01:00.0: bios: OOB 1 b90900b8 b90900b8

Those are "normal". By which I mean harmless. Should go away in some updated
kernel.

>=20
> I have a dual monitor setup and I was always running with no specific
> xorg.config files, just the following in my .xinitrc file:
>=20
> xrandr --output LVDS-1 --preferred
> xrandr --output HDMI-1 --preferred --primary --left-of LVDS-1
>=20
> But suddenly after some updates, that was resulting in the same content
> being displayed on both screens, but I can still move my mouse cursor over
> onto the second screen.
>=20
> I put in the xorg.conf file that I used to use (already pasted in) and it
> seemed to improve the situation, but there were still issues. The same
> content would still appear on both screens, but once I let the xfce power
> management shut off the monitors and then woke the computer back up, the
> screens would work correctly again.
>=20
> Then this I installed a new kernel and nouveau driver, and after starting=
 X
> everything froze and I found the Oops in my logs.

Looks like your crash happened with 4.10.11. 4.10.12 includes a backport of=
 a
very important fix,
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/com=
mit/?id=3D2efa4bd3b644f115befbd225f45fce936e19cf2c
, which I believe accounts for the crash that you saw.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14928759330.FCC9f.11645
Date: Sat, 22 Apr 2017 15:45:33 +0000
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
   title=3D"NEW - Kernel Oops when starting X nv50_dma_push"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100758#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel Oops when starting X nv50_dma_push"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100758">bug 10075=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Kevin Winchester from <a href=3D"show_bug.cgi?id=
=3D100758#c5">comment #5</a>)
<span class=3D"quote">&gt; After this crash, I rebooted and I'm currently r=
unning sway on wayland and
&gt; things seem to work well, but I've been having trouble with X for week=
s now.
&gt;=20
&gt; I first noticed issues when the following messages started appearing i=
n my
&gt; boot logs:
&gt;=20
&gt; nouveau 0000:01:00.0: bios: OOB 1 015f1901 015f1901
&gt; nouveau 0000:01:00.0: bios: OOB 1 b90900b8 b90900b8
&gt; nouveau 0000:01:00.0: bios: OOB 1 b90900b8 b90900b8
&gt; nouveau 0000:01:00.0: bios: OOB 1 b90900b8 b90900b8</span >

Those are &quot;normal&quot;. By which I mean harmless. Should go away in s=
ome updated
kernel.

<span class=3D"quote">&gt;=20
&gt; I have a dual monitor setup and I was always running with no specific
&gt; xorg.config files, just the following in my .xinitrc file:
&gt;=20
&gt; xrandr --output LVDS-1 --preferred
&gt; xrandr --output HDMI-1 --preferred --primary --left-of LVDS-1
&gt;=20
&gt; But suddenly after some updates, that was resulting in the same content
&gt; being displayed on both screens, but I can still move my mouse cursor =
over
&gt; onto the second screen.
&gt;=20
&gt; I put in the xorg.conf file that I used to use (already pasted in) and=
 it
&gt; seemed to improve the situation, but there were still issues. The same
&gt; content would still appear on both screens, but once I let the xfce po=
wer
&gt; management shut off the monitors and then woke the computer back up, t=
he
&gt; screens would work correctly again.
&gt;=20
&gt; Then this I installed a new kernel and nouveau driver, and after start=
ing X
&gt; everything froze and I found the Oops in my logs.</span >

Looks like your crash happened with 4.10.11. 4.10.12 includes a backport of=
 a
very important fix,
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-sta=
ble.git/commit/?id=3D2efa4bd3b644f115befbd225f45fce936e19cf2c">https://git.=
kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=3D2e=
fa4bd3b644f115befbd225f45fce936e19cf2c</a>
, which I believe accounts for the crash that you saw.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14928759330.FCC9f.11645--

--===============2087141708==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2087141708==--
