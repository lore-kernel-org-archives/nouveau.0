From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86503] Discrete card seems to be powered on even if
 reported as Off
Date: Wed, 25 Jul 2018 19:15:31 +0000
Message-ID: <bug-86503-8800-nfErPiQm11@http.bugs.freedesktop.org/>
References: <bug-86503-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1674815460=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86503-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1674815460==
Content-Type: multipart/alternative; boundary="15325461311.1E8c8.11263"
Content-Transfer-Encoding: 7bit


--15325461311.1E8c8.11263
Date: Wed, 25 Jul 2018 19:15:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D86503

--- Comment #1 from fredgib-GANU6spQydw@public.gmane.org ---
I have the same problem but found a workaround that may give a hint to
developers.

My system is an up-to-date Kali Linux (kernel 4.16, nouveau package:
'xserver-xorg-video-nouveau/kali-rolling,now 1:1.0.15-2 amd64'). I don't ha=
ve
bumblebee or prime installed.

If I don't blacklist nouveau in /etc/modprobe.d/, there are 2 possibilities:
- either I disable runtime management in the kernel options of
/etc/default/grub, then the discrete card will be on (vgaswitcheroo would s=
ay
'Pwr') and I can turn it off by writing in vgaswitcheroo/switch.
- or I don't disable runtime management, then vgaswitcheroo indicates "DynP=
wr"
and whatever I do, I cannot change that state.

In both cases, the power consumption remains the same, typical of when the
discrete card is on.

Now my preferred scenario, explaining the workaround:

If I blacklist nouveau in /etc/modprobe.d/ and reboot, I still have a high
consumption, typical of when the discrete card is on. I have only one provi=
der
indicated by xrandr (the integrated i915 in modesetting) and
/sys/kernel/debug/vgaswitcheroo/switch does not exist. THEN I launch nouveau
("sudo modprobe nouveau") and that's it: my consumption is 5 Watts less
(typical of what I had with bumblebee and bbswitch before), vgaswitcheroo
indicates "DynOff".

There is however a limitation: if I connect an HDMI screen (knowing the HDMI
port of my laptop is fostered by the discrete card) and use it with 'xrandr
--setprovideroutputsource 1 0', nouveau will automatically turn on the disc=
rete
card (and switcheroo will indicate "DynPwr"), but there is no return; the
discrete card will remain ON, whatever I do (I even tried to 'sudo modprobe
bbswitch' at that point and write "OFF" in /proc/acpi/bbswitch).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15325461311.1E8c8.11263
Date: Wed, 25 Jul 2018 19:15:31 +0000
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
   title=3D"NEW - Discrete card seems to be powered on even if reported as =
Off"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D86503#c1">Comment=
 # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Discrete card seems to be powered on even if reported as =
Off"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D86503">bug 86503<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fredgib&#64;free.fr" title=3D"fredgib&#64;free.fr">fredgib&#64;free.fr</a>
</span></b>
        <pre>I have the same problem but found a workaround that may give a=
 hint to
developers.

My system is an up-to-date Kali Linux (kernel 4.16, nouveau package:
'xserver-xorg-video-nouveau/kali-rolling,now 1:1.0.15-2 amd64'). I don't ha=
ve
bumblebee or prime installed.

If I don't blacklist nouveau in /etc/modprobe.d/, there are 2 possibilities:
- either I disable runtime management in the kernel options of
/etc/default/grub, then the discrete card will be on (vgaswitcheroo would s=
ay
'Pwr') and I can turn it off by writing in vgaswitcheroo/switch.
- or I don't disable runtime management, then vgaswitcheroo indicates &quot=
;DynPwr&quot;
and whatever I do, I cannot change that state.

In both cases, the power consumption remains the same, typical of when the
discrete card is on.

Now my preferred scenario, explaining the workaround:

If I blacklist nouveau in /etc/modprobe.d/ and reboot, I still have a high
consumption, typical of when the discrete card is on. I have only one provi=
der
indicated by xrandr (the integrated i915 in modesetting) and
/sys/kernel/debug/vgaswitcheroo/switch does not exist. THEN I launch nouveau
(&quot;sudo modprobe nouveau&quot;) and that's it: my consumption is 5 Watt=
s less
(typical of what I had with bumblebee and bbswitch before), vgaswitcheroo
indicates &quot;DynOff&quot;.

There is however a limitation: if I connect an HDMI screen (knowing the HDMI
port of my laptop is fostered by the discrete card) and use it with 'xrandr
--setprovideroutputsource 1 0', nouveau will automatically turn on the disc=
rete
card (and switcheroo will indicate &quot;DynPwr&quot;), but there is no ret=
urn; the
discrete card will remain ON, whatever I do (I even tried to 'sudo modprobe
bbswitch' at that point and write &quot;OFF&quot; in /proc/acpi/bbswitch).<=
/pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15325461311.1E8c8.11263--

--===============1674815460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1674815460==--
