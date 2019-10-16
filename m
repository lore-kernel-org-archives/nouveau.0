From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111853] nouveau kernel module won't load (not
 available) on Sony laptop with NVIDIA G86M [GeForce 8400M GT] ID: 10de:0426
Date: Wed, 16 Oct 2019 16:44:39 +0000
Message-ID: <bug-111853-8800-M9L3CthFWg@http.bugs.freedesktop.org/>
References: <bug-111853-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1178350175=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-111853-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1178350175==
Content-Type: multipart/alternative; boundary="15712442790.0BAB1.20010"
Content-Transfer-Encoding: 7bit


--15712442790.0BAB1.20010
Date: Wed, 16 Oct 2019 16:44:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111853

--- Comment #11 from Felix Miata <mrmazda-ihVZJaRskl1bRRN4PJnoQQ@public.gmane.org> ---
Created attachment 145758
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145758&action=3Dedit
Xorg.0.log from live Knoppix 7.6.1

# lsmod | sort | grep veau
drm_kms_helper         70712  1 nouveau
mxm_wmi                 1635  1 nouveau
nouveau              1033769  0
ttm                    60685  1 nouveau
wmi                     7363  2 mxm_wmi,nouveau
# inxi -c0 -GxxSM
System:    Host: Microknoppix Kernel: 4.2.6-64 x86_64 (64 bit gcc: 5.2.1)
           Console: tty 3 dm: kdm Distro: Debian GNU/Linux stretch/sid
Machine:   System: Sony (portable) product: VGN-AR730E v: C3LR1E11 serial:
28272434-3101919
           Mobo: Sony model: VAIO Bios: Phoenix v: R2090J8 date: 02/26/2008
           Chassis: type: 10
Graphics:  Card: NVIDIA G86M [GeForce 8400M GT]
           bus-ID: 01:00.0 chip-ID: 10de:0426
           Display Server: X.org 1.17.3 drivers: vesa,nouveau (unloaded: fb=
dev)
           tty size: 80x25 Advanced Data: N/A for root out of X
# dmesg | grep ailed
[    0.770863] acpi PNP0A08:00: _OSC failed (AE_SUPPORT); disabling ASPM
[    0.849357] pci 0000:01:00.0: BAR 6: failed to assign [mem size 0x000200=
00
pref]
[    1.607734] ACPI Error: Method parse/execution failed
[\_SB_.PCI0.SATA.PRT0._SDD] (Node ffff8800bf08f338), AE_NOT_FOUND
(20150619/psparse-536)
[    1.609103] ACPI Error: Method parse/execution failed
[\_SB_.PCI0.SATA.PRT0._SDD] (Node ffff8800bf08f338), AE_NOT_FOUND
(20150619/psparse-536)
[   37.465961] systemd-udevd[2004]: Process '/usr/sbin/alsactl -E
HOME=3D/var/run/alsa restore 0' failed with exit code 99.
[   38.226541] systemd-udevd[2008]: Process '/sbin/crda' failed with exit c=
ode
249.
[   38.229603] systemd-udevd[2008]: Process '/sbin/crda' failed with exit c=
ode
249.
[   42.469065] systemd-udevd[2086]: Process '/usr/sbin/alsactl -E
HOME=3D/var/run/alsa restore 0' failed with exit code 99.
[   69.564168] systemd-logind[2229]: Failed to start user service, ignoring:
Unknown unit: user-HmGangybm7RTDjBF/Jpztg@public.gmane.org
[  100.435441] uvcvideo: Failed to query (129) UVC probe control : -32 (exp.
26).
[  100.435443] uvcvideo: Failed to initialize the device (-5).

Again, nouveau loads, but X video is scrambled VESA, again with no
/dev/dri/card0 or /dev/fb0.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15712442790.0BAB1.20010
Date: Wed, 16 Oct 2019 16:44:39 +0000
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
   title=3D"NEW - nouveau kernel module won't load (not available) on Sony =
laptop with NVIDIA G86M [GeForce 8400M GT] ID: 10de:0426"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111853#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau kernel module won't load (not available) on Sony =
laptop with NVIDIA G86M [GeForce 8400M GT] ID: 10de:0426"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111853">bug 11185=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mrmazda&#64;earthlink.net" title=3D"Felix Miata &lt;mrmazda&#64;earthlink.n=
et&gt;"> <span class=3D"fn">Felix Miata</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145758=
" name=3D"attach_145758" title=3D"Xorg.0.log from live Knoppix 7.6.1">attac=
hment 145758</a> <a href=3D"attachment.cgi?id=3D145758&amp;action=3Dedit" t=
itle=3D"Xorg.0.log from live Knoppix 7.6.1">[details]</a></span>
Xorg.0.log from live Knoppix 7.6.1

# lsmod | sort | grep veau
drm_kms_helper         70712  1 nouveau
mxm_wmi                 1635  1 nouveau
nouveau              1033769  0
ttm                    60685  1 nouveau
wmi                     7363  2 mxm_wmi,nouveau
# inxi -c0 -GxxSM
System:    Host: Microknoppix Kernel: 4.2.6-64 x86_64 (64 bit gcc: 5.2.1)
           Console: tty 3 dm: kdm Distro: Debian GNU/Linux stretch/sid
Machine:   System: Sony (portable) product: VGN-AR730E v: C3LR1E11 serial:
28272434-3101919
           Mobo: Sony model: VAIO Bios: Phoenix v: R2090J8 date: 02/26/2008
           Chassis: type: 10
Graphics:  Card: NVIDIA G86M [GeForce 8400M GT]
           bus-ID: 01:00.0 chip-ID: 10de:0426
           Display Server: X.org 1.17.3 drivers: vesa,nouveau (unloaded: fb=
dev)
           tty size: 80x25 Advanced Data: N/A for root out of X
# dmesg | grep ailed
[    0.770863] acpi PNP0A08:00: _OSC failed (AE_SUPPORT); disabling ASPM
[    0.849357] pci 0000:01:00.0: BAR 6: failed to assign [mem size 0x000200=
00
pref]
[    1.607734] ACPI Error: Method parse/execution failed
[\_SB_.PCI0.SATA.PRT0._SDD] (Node ffff8800bf08f338), AE_NOT_FOUND
(20150619/psparse-536)
[    1.609103] ACPI Error: Method parse/execution failed
[\_SB_.PCI0.SATA.PRT0._SDD] (Node ffff8800bf08f338), AE_NOT_FOUND
(20150619/psparse-536)
[   37.465961] systemd-udevd[2004]: Process '/usr/sbin/alsactl -E
HOME=3D/var/run/alsa restore 0' failed with exit code 99.
[   38.226541] systemd-udevd[2008]: Process '/sbin/crda' failed with exit c=
ode
249.
[   38.229603] systemd-udevd[2008]: Process '/sbin/crda' failed with exit c=
ode
249.
[   42.469065] systemd-udevd[2086]: Process '/usr/sbin/alsactl -E
HOME=3D/var/run/alsa restore 0' failed with exit code 99.
[   69.564168] systemd-logind[2229]: Failed to start user service, ignoring:
Unknown unit: <a href=3D"mailto:user&#64;1000.service">user&#64;1000.servic=
e</a>
[  100.435441] uvcvideo: Failed to query (129) UVC probe control : -32 (exp.
26).
[  100.435443] uvcvideo: Failed to initialize the device (-5).

Again, nouveau loads, but X video is scrambled VESA, again with no
/dev/dri/card0 or /dev/fb0.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15712442790.0BAB1.20010--

--===============1178350175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1178350175==--
