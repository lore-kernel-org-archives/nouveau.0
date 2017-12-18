From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88272] [NVAC] Flickering screen on 1920x1080 monitor
 with 9400M in MacbookPro 5, 5
Date: Mon, 18 Dec 2017 18:24:55 +0000
Message-ID: <bug-88272-8800-kXkoRBGnww@http.bugs.freedesktop.org/>
References: <bug-88272-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1382868646=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88272-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1382868646==
Content-Type: multipart/alternative; boundary="15136214941.eFEa2B4a.13877";
 charset="UTF-8"


--15136214941.eFEa2B4a.13877
Date: Mon, 18 Dec 2017 18:24:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D88272

mbazzinotti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mbazzinotti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #5 from mbazzinotti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Created attachment 136253
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D136253&action=3Dedit
Bazz dmesg

On similar hardware, I am experiencing this display flicker with nouveau.

Macbook Pro 5,4 15" mid-2009
Nvidia GeForce 9400m
mini DisplayPort -> "Gigaware" DVI/HDMI/Displayport adapter -> using DVI po=
rt
 on the monitor.

--------
Software|
--------
Gentoo Linux 4.9.49 and 4.12.12. I recall this issue dating back to my use =
of
 3.18.11.
x11-base/xorg-server-1.19.5
x11-drivers/xf86-video-nouveau-1.0.15
No compositor
I've tested under XFCE4 or i3, the problem is the same.

kernel command line: ro root=3DPARTUUID=3Dxxxxxxxx net.ifnames=3D0

-----------
Attachments|
-----------
bazz-dmesg.txt (dmesg command dump)
bazz-xrandr.txt (xrandr output)
bazz-vbios.rom

------
Issues|
------
1) intermittent flickering on the 2nd monitor.
2) If unplugging the mDP cable, the LVDS may flicker and the system appears
locked up (I cannot "blind" navigate to VT to reboot, like I usually do in
other circumstances). However, replugging the mDP cable will cease LVDS
flicker, although the system is still apparently rendered inoperable.

These problems do not occur when using the legacy nvidia-drivers (340.104).

Issue 1 is also experienced when booting to Virtual Terminal (VT) without
starting X. I have not experimented for Issue 2 on VT-only yet.

The DVI monitor is "usable" but experiences mild flicker and other times
frequent
flickering. It can appear stable for 30 seconds to a couple minutes at a ti=
me,
only to have flickering return.

--------------------------------
Commandline / Module Parameters |
--------------------------------
I played around with the following parameters.

drm_kms_helper.poll=3D0
noveau atomic, mst, runpm.

Playing with those settings have not made visible changes to the problem.

------
pstate|
------
`cat /sys/kernel/debug/dri/0/pstate`
03: core 125 MHz shader 250 MHz vdec 125 MHz
05: core 150 MHz shader 300 MHz vdec 150 MHz
0e: core 350 MHz shader 800 MHz vdec 350 MHz AC DC *
0f: core 450 MHz shader 1100 MHz vdec 450 MHz
AC: core 350 MHz shader 800 MHz vdec 350 MHz

pstate 03, 05 produce incredible constant flicker on the 2nd monitor.
pstate 0e, 0f produce intermittent flickering I've always been experiencing.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15136214941.eFEa2B4a.13877
Date: Mon, 18 Dec 2017 18:24:54 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:mbazzinot=
ti&#64;gmail.com" title=3D"mbazzinotti&#64;gmail.com">mbazzinotti&#64;gmail=
.com</a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [NVAC] Flickering screen on 1920x1080 monitor with 9=
400M in MacbookPro 5,5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D88272">bug 88272<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>mbazzinotti&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [NVAC] Flickering screen on 1920x1080 monitor with 9=
400M in MacbookPro 5,5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D88272#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [NVAC] Flickering screen on 1920x1080 monitor with 9=
400M in MacbookPro 5,5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D88272">bug 88272<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mbazzinotti&#64;gmail.com" title=3D"mbazzinotti&#64;gmail.com">mbazzinotti&=
#64;gmail.com</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D136253=
" name=3D"attach_136253" title=3D"Bazz dmesg">attachment 136253</a> <a href=
=3D"attachment.cgi?id=3D136253&amp;action=3Dedit" title=3D"Bazz dmesg">[det=
ails]</a></span>
Bazz dmesg

On similar hardware, I am experiencing this display flicker with nouveau.

Macbook Pro 5,4 15&quot; mid-2009
Nvidia GeForce 9400m
mini DisplayPort -&gt; &quot;Gigaware&quot; DVI/HDMI/Displayport adapter -&=
gt; using DVI port
 on the monitor.

--------
Software|
--------
Gentoo Linux 4.9.49 and 4.12.12. I recall this issue dating back to my use =
of
 3.18.11.
x11-base/xorg-server-1.19.5
x11-drivers/xf86-video-nouveau-1.0.15
No compositor
I've tested under XFCE4 or i3, the problem is the same.

kernel command line: ro root=3DPARTUUID=3Dxxxxxxxx net.ifnames=3D0

-----------
Attachments|
-----------
bazz-dmesg.txt (dmesg command dump)
bazz-xrandr.txt (xrandr output)
bazz-vbios.rom

------
Issues|
------
1) intermittent flickering on the 2nd monitor.
2) If unplugging the mDP cable, the LVDS may flicker and the system appears
locked up (I cannot &quot;blind&quot; navigate to VT to reboot, like I usua=
lly do in
other circumstances). However, replugging the mDP cable will cease LVDS
flicker, although the system is still apparently rendered inoperable.

These problems do not occur when using the legacy nvidia-drivers (340.104).

Issue 1 is also experienced when booting to Virtual Terminal (VT) without
starting X. I have not experimented for Issue 2 on VT-only yet.

The DVI monitor is &quot;usable&quot; but experiences mild flicker and othe=
r times
frequent
flickering. It can appear stable for 30 seconds to a couple minutes at a ti=
me,
only to have flickering return.

--------------------------------
Commandline / Module Parameters |
--------------------------------
I played around with the following parameters.

drm_kms_helper.poll=3D0
noveau atomic, mst, runpm.

Playing with those settings have not made visible changes to the problem.

------
pstate|
------
`cat /sys/kernel/debug/dri/0/pstate`
03: core 125 MHz shader 250 MHz vdec 125 MHz
05: core 150 MHz shader 300 MHz vdec 150 MHz
0e: core 350 MHz shader 800 MHz vdec 350 MHz AC DC *
0f: core 450 MHz shader 1100 MHz vdec 450 MHz
AC: core 350 MHz shader 800 MHz vdec 350 MHz

pstate 03, 05 produce incredible constant flicker on the 2nd monitor.
pstate 0e, 0f produce intermittent flickering I've always been experiencing=
.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15136214941.eFEa2B4a.13877--

--===============1382868646==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1382868646==--
