From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105344] Installation bug by video card modules
 conflict (nvidia GTX 950 M)
Date: Tue, 06 Mar 2018 13:02:13 +0000
Message-ID: <bug-105344-8800-zDOp0wmsEJ@http.bugs.freedesktop.org/>
References: <bug-105344-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0870810624=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105344-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0870810624==
Content-Type: multipart/alternative; boundary="15203413330.50b38DFc6.22683"
Content-Transfer-Encoding: 7bit


--15203413330.50b38DFc6.22683
Date: Tue, 6 Mar 2018 13:02:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105344

--- Comment #6 from Yuri Gelsleichter <yuriplanta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Dear all,

thanks for the points.

(In reply to Emil Velikov from comment #4)
> Considering that nouveau.modeset=3D0 helps, I'm flipping this to component
> nouveau. Feel free to revert.
>=20
Flipping fits good.

> > kernel is: 4.13.0-36-generic
> > mesa: OpenGL version string: 3.0 Mesa 17.2.8
> FWIW these two are EOL. You might want to try something newer.
>
I tried the very fresh through ArchLinux and Manjaro.

> > libdrm: could not find
> > xf86-video-nouveau: could not find.
> >=20
> Exact names might differ across distros - please search carefully.
>=20
> > ---------------------
> >=20
> > Follow the "kernel_log.txt" output:
> >=20
> Please make sure you _attach_ logs.
>=20
> > [    1.333868] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
> > 612004 [ IBUS ]
> > [    1.335248] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
> > 10ac08 [ IBUS ]
>=20
> These two look mildly interesting. Not sure how much it matters sunce the
> nvidia device is a 3D controller - there should be no outputs wired/plugg=
ed.
>

It is a laptop, so always plugged.
The point here is that Nvidia has no drivers in use. With nouveau, system
breaks (impossible to boot), with proprietary system get slow and freeze of=
ten
(I am aware that you do not deal with proprietary drivers).

If I boot with "quite splash", the system breaks before boot.
If I boot without any "modeset", the system only get to the terminal.

The only way to get "normal" use is booting with any "nomodeset" (without
proprietary driver for videocard).

I was wondering to understand why the distros (all of them) do not work out=
 of
the box in this machine. As they work great in general in any machine.

I would be glad if one day Linux working smooth out of the box on this
machines.

> Potential next steps include:
>  - using xserver or wayland - try the former
>  - [it using xserver] - flip between the modesetting and nouveau DDX
>  - attach the respective logs - xserver -> Xorg.*.log, wayland -> no idea
> where kwin puts it
>=20
> If the above are cryptic, do read through the wikis/googleit ;-)
>=20
> https://nouveau.freedesktop.org/wiki/
> https://nouveau.freedesktop.org/wiki/Optimus/
> https://wiki.archlinux.org/index.php/nouveau

Thanks for the path, I will go for it.
Thanks for all.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15203413330.50b38DFc6.22683
Date: Tue, 6 Mar 2018 13:02:13 +0000
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
   title=3D"NEW - Installation bug by video card modules conflict (nvidia G=
TX 950 M)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105344#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Installation bug by video card modules conflict (nvidia G=
TX 950 M)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105344">bug 10534=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
yuriplanta&#64;gmail.com" title=3D"Yuri Gelsleichter &lt;yuriplanta&#64;gma=
il.com&gt;"> <span class=3D"fn">Yuri Gelsleichter</span></a>
</span></b>
        <pre>Dear all,

thanks for the points.

(In reply to Emil Velikov from <a href=3D"show_bug.cgi?id=3D105344#c4">comm=
ent #4</a>)
<span class=3D"quote">&gt; Considering that nouveau.modeset=3D0 helps, I'm =
flipping this to component
&gt; nouveau. Feel free to revert.
&gt; </span >
Flipping fits good.

<span class=3D"quote">&gt; &gt; kernel is: 4.13.0-36-generic
&gt; &gt; mesa: OpenGL version string: 3.0 Mesa 17.2.8
&gt; FWIW these two are EOL. You might want to try something newer.</span >
&gt;
I tried the very fresh through ArchLinux and Manjaro.

<span class=3D"quote">&gt; &gt; libdrm: could not find
&gt; &gt; xf86-video-nouveau: could not find.
&gt; &gt;=20
&gt; Exact names might differ across distros - please search carefully.
&gt;=20
&gt; &gt; ---------------------
&gt; &gt;=20
&gt; &gt; Follow the &quot;kernel_log.txt&quot; output:
&gt; &gt;=20
&gt; Please make sure you _attach_ logs.
&gt;=20
&gt; &gt; [    1.333868] nouveau 0000:01:00.0: bus: MMIO read of 00000000 F=
AULT at
&gt; &gt; 612004 [ IBUS ]
&gt; &gt; [    1.335248] nouveau 0000:01:00.0: bus: MMIO read of 00000000 F=
AULT at
&gt; &gt; 10ac08 [ IBUS ]
&gt;=20
&gt; These two look mildly interesting. Not sure how much it matters sunce =
the
&gt; nvidia device is a 3D controller - there should be no outputs wired/pl=
ugged.</span >
&gt;

It is a laptop, so always plugged.
The point here is that Nvidia has no drivers in use. With nouveau, system
breaks (impossible to boot), with proprietary system get slow and freeze of=
ten
(I am aware that you do not deal with proprietary drivers).

If I boot with &quot;quite splash&quot;, the system breaks before boot.
If I boot without any &quot;modeset&quot;, the system only get to the termi=
nal.

The only way to get &quot;normal&quot; use is booting with any &quot;nomode=
set&quot; (without
proprietary driver for videocard).

I was wondering to understand why the distros (all of them) do not work out=
 of
the box in this machine. As they work great in general in any machine.

I would be glad if one day Linux working smooth out of the box on this
machines.

<span class=3D"quote">&gt; Potential next steps include:
&gt;  - using xserver or wayland - try the former
&gt;  - [it using xserver] - flip between the modesetting and nouveau DDX
&gt;  - attach the respective logs - xserver -&gt; Xorg.*.log, wayland -&gt=
; no idea
&gt; where kwin puts it
&gt;=20
&gt; If the above are cryptic, do read through the wikis/googleit ;-)
&gt;=20
&gt; <a href=3D"https://nouveau.freedesktop.org/wiki/">https://nouveau.free=
desktop.org/wiki/</a>
&gt; <a href=3D"https://nouveau.freedesktop.org/wiki/Optimus/">https://nouv=
eau.freedesktop.org/wiki/Optimus/</a>
&gt; <a href=3D"https://wiki.archlinux.org/index.php/nouveau">https://wiki.=
archlinux.org/index.php/nouveau</a></span >

Thanks for the path, I will go for it.
Thanks for all.</pre>
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

--15203413330.50b38DFc6.22683--

--===============0870810624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0870810624==--
