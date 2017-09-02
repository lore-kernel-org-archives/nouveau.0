From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93629] [NVE6] complete system freeze,
 PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]
Date: Sat, 02 Sep 2017 06:16:06 +0000
Message-ID: <bug-93629-8800-xRo60QI0oO@http.bugs.freedesktop.org/>
References: <bug-93629-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1015252411=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93629-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1015252411==
Content-Type: multipart/alternative; boundary="15043329661.B5FF.22263";
 charset="UTF-8"


--15043329661.B5FF.22263
Date: Sat, 2 Sep 2017 06:16:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D93629

--- Comment #38 from Robb Ebright <robbt-UEAdIY/G9B/YtjvyW6yDsg@public.gmane.org> ---
I ran into a similar bug with a recent Debian install. It occurs only when I
plugged in a monitor into the DVI port. It works fine with the HDMI port as=
 I'm
using it to type. But it freezes with the following error.

I'm installing the proprietary drivers so but I wanted to provide this
confirmation/documentation in case it is helpful to anyone trying to solve
this. In an ideal world I would use the free software drivers as well but t=
here
is evidently some issue with the software that is causing it to crash.


1 23:07:09 dragonpunk /usr/lib/gdm3/gdm-x-session[787]: (II) systemd-logind:
got pause for 226:0
Sep  1 23:07:09 dragonpunk /usr/lib/gdm3/gdm-x-session[787]: (II)
systemd-logind: got pause for 13:67
Sep  1 23:07:09 dragonpunk /usr/lib/gdm3/gdm-x-session[787]: (II)
systemd-logind: got pause for 13:66
Sep  1 23:07:09 dragonpunk /usr/lib/gdm3/gdm-x-session[787]: (II)
systemd-logind: got pause for 13:64
Sep  1 23:07:09 dragonpunk /usr/lib/gdm3/gdm-x-session[787]: (II)
systemd-logind: got pause for 13:65
Sep  1 23:07:09 dragonpunk /usr/lib/gdm3/gdm-x-session[787]: (II)
systemd-logind: got pause for 13:68
Sep  1 23:07:09 dragonpunk kernel: [74586.320157] nouveau 0000:01:00.0: fif=
o:
write fault at 000031d000 engine 05 [BAR3] client 08 [BAR_WRITE] reason 02
[PAGE_NOT_PRESENT] on channel -1 [003ff35000 unknown]
Sep  1 23:07:09 dragonpunk kernel: [74586.320169] nouveau 0000:01:00.0: fif=
o:
INTR 08000000
Sep  1 23:07:09 dragonpunk kernel: [74586.825813] nouveau 0000:01:00.0: gr:
TRAP ch 2 [003fd30000 systemd-logind[448]]
Sep  1 23:07:09 dragonpunk kernel: [74586.825826] nouveau 0000:01:00.0: gr:
GPC0/TPC0/TEX: 80000041
Sep  1 23:07:09 dragonpunk kernel: [74586.825834] nouveau 0000:01:00.0: gr:
GPC0/TPC1/TEX: 80000041
Sep  1 23:07:09 dragonpunk kernel: [74586.825846] nouveau 0000:01:00.0: gr:
GPC1/TPC0/TEX: 80000041
Sep  1 23:07:09 dragonpunk kernel: [74586.825854] nouveau 0000:01:00.0: gr:
GPC1/TPC2/TEX: 80000041
Sep  1 23:07:09 dragonpunk kernel: [74586.825866] nouveau 0000:01:00.0: fif=
o:
read fault at 0002f61000 engine 00 [PGRAPH] client 01 [GPC1/TEX] reason 02
[PAGE_NOT_PRESENT] on channel 2 [003fd30000 systemd-logind[448]]
Sep  1 23:07:09 dragonpunk kernel: [74586.825868] nouveau 0000:01:00.0: fif=
o:
gr engine fault on channel 2, recovering...
Sep  1 23:07:09 dragonpunk kernel: [74586.881742] nouveau 0000:01:00.0: fif=
o:
write fault at 0000278000 engine 00 [PGRAPH] client 0f [GPC0/PROP] reason 02
[PAGE_NOT_PRESENT] on channel 3 [003fc83000 Xwayland[602]]
Sep  1 23:07:09 dragonpunk kernel: [74586.881746] nouveau 0000:01:00.0: fif=
o:
gr engine fault on channel 3, recovering...
Sep  1 23:07:48 dragonpunk gnome-shell[566]: Failed to apply DRM plane
transform 0: Invalid argument
Sep  1 23:08:06 dragonpunk gnome-shell[566]: Failed to apply DRM plane
transform 0: Invalid argument
Sep  1 23:08:06 dragonpunk gnome-shell[566]: Failed to apply DRM plane
transform 0: Invalid argument
Sep  1 23:08:19 dragonpunk gnome-shell[566]: Failed to apply DRM plane
transform 0: Invalid argument

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15043329661.B5FF.22263
Date: Sat, 2 Sep 2017 06:16:06 +0000
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
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93629#c38">Commen=
t # 38</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93629">bug 93629<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
robbt&#64;azone.org" title=3D"Robb Ebright &lt;robbt&#64;azone.org&gt;"> <s=
pan class=3D"fn">Robb Ebright</span></a>
</span></b>
        <pre>I ran into a similar bug with a recent Debian install. It occu=
rs only when I
plugged in a monitor into the DVI port. It works fine with the HDMI port as=
 I'm
using it to type. But it freezes with the following error.

I'm installing the proprietary drivers so but I wanted to provide this
confirmation/documentation in case it is helpful to anyone trying to solve
this. In an ideal world I would use the free software drivers as well but t=
here
is evidently some issue with the software that is causing it to crash.


1 23:07:09 dragonpunk /usr/lib/gdm3/gdm-x-session[787]: (II) systemd-logind:
got pause for 226:0
Sep  1 23:07:09 dragonpunk /usr/lib/gdm3/gdm-x-session[787]: (II)
systemd-logind: got pause for 13:67
Sep  1 23:07:09 dragonpunk /usr/lib/gdm3/gdm-x-session[787]: (II)
systemd-logind: got pause for 13:66
Sep  1 23:07:09 dragonpunk /usr/lib/gdm3/gdm-x-session[787]: (II)
systemd-logind: got pause for 13:64
Sep  1 23:07:09 dragonpunk /usr/lib/gdm3/gdm-x-session[787]: (II)
systemd-logind: got pause for 13:65
Sep  1 23:07:09 dragonpunk /usr/lib/gdm3/gdm-x-session[787]: (II)
systemd-logind: got pause for 13:68
Sep  1 23:07:09 dragonpunk kernel: [74586.320157] nouveau 0000:01:00.0: fif=
o:
write fault at 000031d000 engine 05 [BAR3] client 08 [BAR_WRITE] reason 02
[PAGE_NOT_PRESENT] on channel -1 [003ff35000 unknown]
Sep  1 23:07:09 dragonpunk kernel: [74586.320169] nouveau 0000:01:00.0: fif=
o:
INTR 08000000
Sep  1 23:07:09 dragonpunk kernel: [74586.825813] nouveau 0000:01:00.0: gr:
TRAP ch 2 [003fd30000 systemd-logind[448]]
Sep  1 23:07:09 dragonpunk kernel: [74586.825826] nouveau 0000:01:00.0: gr:
GPC0/TPC0/TEX: 80000041
Sep  1 23:07:09 dragonpunk kernel: [74586.825834] nouveau 0000:01:00.0: gr:
GPC0/TPC1/TEX: 80000041
Sep  1 23:07:09 dragonpunk kernel: [74586.825846] nouveau 0000:01:00.0: gr:
GPC1/TPC0/TEX: 80000041
Sep  1 23:07:09 dragonpunk kernel: [74586.825854] nouveau 0000:01:00.0: gr:
GPC1/TPC2/TEX: 80000041
Sep  1 23:07:09 dragonpunk kernel: [74586.825866] nouveau 0000:01:00.0: fif=
o:
read fault at 0002f61000 engine 00 [PGRAPH] client 01 [GPC1/TEX] reason 02
[PAGE_NOT_PRESENT] on channel 2 [003fd30000 systemd-logind[448]]
Sep  1 23:07:09 dragonpunk kernel: [74586.825868] nouveau 0000:01:00.0: fif=
o:
gr engine fault on channel 2, recovering...
Sep  1 23:07:09 dragonpunk kernel: [74586.881742] nouveau 0000:01:00.0: fif=
o:
write fault at 0000278000 engine 00 [PGRAPH] client 0f [GPC0/PROP] reason 02
[PAGE_NOT_PRESENT] on channel 3 [003fc83000 Xwayland[602]]
Sep  1 23:07:09 dragonpunk kernel: [74586.881746] nouveau 0000:01:00.0: fif=
o:
gr engine fault on channel 3, recovering...
Sep  1 23:07:48 dragonpunk gnome-shell[566]: Failed to apply DRM plane
transform 0: Invalid argument
Sep  1 23:08:06 dragonpunk gnome-shell[566]: Failed to apply DRM plane
transform 0: Invalid argument
Sep  1 23:08:06 dragonpunk gnome-shell[566]: Failed to apply DRM plane
transform 0: Invalid argument
Sep  1 23:08:19 dragonpunk gnome-shell[566]: Failed to apply DRM plane
transform 0: Invalid argument</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15043329661.B5FF.22263--

--===============1015252411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1015252411==--
