From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 43939] [NV96] DVI monitor connected via HDMI is
 blank / standby (NV96 / 9500GS)
Date: Sat, 24 Aug 2013 23:40:40 +0000
Message-ID: <bug-43939-8800-8jAgMZ3nAJ@http.bugs.freedesktop.org/>
References: <bug-43939-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1428223189=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-43939-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1428223189==
Content-Type: multipart/alternative; boundary="1377387640.E04B2.12507"; charset="us-ascii"


--1377387640.E04B2.12507
Date: Sat, 24 Aug 2013 23:40:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=43939

--- Comment #6 from Anthony Foiani <anthony.foiani+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #5)
> Can you confirm whether this is still an issue with a more recent kernel
> (e.g. 3.10)? All the output stuff has gotten quite a bit of rework in the
> past 2 years.

Sorry it took me a few days, but I can confirm that the problem is still
occurring on a fully up-to-date Fedora 18 system.  GRUB is visible, but X never
comes up.  Nothing obvious in the Xorg log.

Testing might be slightly complicated by the fact that the only DVI monitor I
have available for testing is now a 2560x1440, so the single-link constraint
might confusing things -- but the behavior seems to be exactly the same as
before, and xorg / nouveau certainly seem to think they found the workable max
resolution of 1920x1200.  As before, grub still works (displays graphics
correctly), so the physical connection seems functional if not optimal.

$ uname -a
Linux hum.int.foiani.com 3.10.9-100.fc18.x86_64 #1 SMP Wed Aug 21 18:25:04 UTC
2013 x86_64 x86_64 x86_64 GNU/Linux

]$ rpm -qa | egrep -i '(xorg|nouveau)'
xorg-x11-drv-vesa-2.3.2-2.fc18.x86_64
xorg-x11-xinit-1.3.2-7.fc18.x86_64
xorg-x11-proto-devel-7.6-24.fc18.noarch
xorg-x11-drv-ati-7.1.0-5.20130408git6e74aacc5.fc18.x86_64
xorg-x11-drv-vmmouse-13.0.0-1.fc18.x86_64
xorg-x11-server-utils-7.5-16.fc18.x86_64
xorg-x11-server-common-1.13.3-3.fc18.x86_64
xorg-x11-fonts-Type1-7.5-6.fc18.noarch
xorg-x11-drv-mga-1.6.2-6.fc18.x86_64
xorg-x11-drv-qxl-0.1.0-2.fc18.x86_64
xorg-x11-xkb-utils-7.7-5.fc18.x86_64
xorg-x11-fonts-ISO8859-1-75dpi-7.5-6.fc18.noarch
xorg-x11-drv-intel-2.21.12-1.fc18.x86_64
xorg-x11-drv-modesetting-0.6.0-1.fc18.x86_64
xorg-x11-font-utils-7.5-11.fc18.x86_64
xorg-x11-glamor-0.5.0-5.20130401git81aadb8.fc18.x86_64
xorg-x11-xauth-1.0.7-2.fc18.x86_64
xorg-x11-drv-vmware-12.0.2-3.20120718gite5ac80d8f.fc18.x86_64
xorg-x11-server-Xorg-1.13.3-3.fc18.x86_64
xorg-x11-drv-fbdev-0.4.3-3.fc18.x86_64
abrt-addon-xorg-2.1.6-3.fc18.x86_64
xorg-x11-utils-7.5-7.fc18.x86_64
xorg-x11-drv-evdev-2.7.3-5.fc18.x86_64
xorg-x11-drv-wacom-0.16.1-2.fc18.x86_64
xorg-x11-fonts-ISO8859-1-100dpi-7.5-6.fc18.noarch
xorg-x11-drv-openchrome-0.3.3-1.fc18.x86_64
xorg-x11-drv-synaptics-1.6.4-2.fc18.x86_64
xorg-x11-drv-nouveau-1.0.7-1.fc18.x86_64

$ dmesg | grep -i nouveau
[    1.693009] fb: conflicting fb hw usage nouveaufb vs EFI VGA - removing
generic driver
[    1.693418] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x096200a1
[    1.693420] nouveau  [  DEVICE][0000:01:00.0] Chipset: G96 (NV96)
[    1.693422] nouveau  [  DEVICE][0000:01:00.0] Family : NV50
[    1.695771] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    1.739080] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    1.739082] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    1.739162] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    1.739164] nouveau  [   VBIOS][0000:01:00.0] version 62.94.6c.00.36
[    1.759335] nouveau  [     PFB][0000:01:00.0] RAM type: DDR2
[    1.759338] nouveau  [     PFB][0000:01:00.0] RAM size: 512 MiB
[    1.759340] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 2048 tags
[    1.783396] nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
[    1.783401] nouveau  [  PTHERM][0000:01:00.0] fan management: disabled
[    1.783403] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    1.783511] nouveau  [     DRM] VRAM: 512 MiB
[    1.783512] nouveau  [     DRM] GART: 512 MiB
[    1.783515] nouveau  [     DRM] TMDS table version 2.0
[    1.783516] nouveau  [     DRM] DCB version 4.0
[    1.783517] nouveau  [     DRM] DCB outp 00: 02000300 00000028
[    1.783518] nouveau  [     DRM] DCB outp 01: 01000302 00000030
[    1.783519] nouveau  [     DRM] DCB outp 02: 04011310 00000028
[    1.783520] nouveau  [     DRM] DCB outp 03: 02022332 00020010
[    1.783521] nouveau  [     DRM] DCB conn 00: 00001030
[    1.783522] nouveau  [     DRM] DCB conn 01: 00000100
[    1.783523] nouveau  [     DRM] DCB conn 02: 00002261
[    1.794622] nouveau  [     DRM] vid bit 0 has no gpio tag
[    1.794674] nouveau  [     DRM] 1 available performance level(s)
[    1.794676] nouveau  [     DRM] 3: core 550MHz shader 1400MHz memory 504MHz
fanspeed 100%
[    1.794678] nouveau  [     DRM] c: core 400MHz shader 800MHz memory 504MHz
fanspeed 74%
[    2.057446] nouveau  [     DRM] MM: using CRYPT for buffer copies
[    2.107519] nouveau  [     DRM] native mode from largest: 1920x1200@60
[    2.113734] nouveau  [     DRM] allocated 1920x1200 fb: 0x70000, bo
ffff880418695400
[    2.113844] fbcon: nouveaufb (fb0) is primary device
[    2.172776] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    2.172777] nouveau 0000:01:00.0: registered panic notifier
[    2.172779] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 0
[    2.257660] nouveau  [     DRM] native mode from largest: 1920x1200@60
[    9.173797] nouveau  [     DRM] native mode from largest: 1920x1200@60
[    9.246641] nouveau  [     DRM] native mode from largest: 1920x1200@60
[    9.526051] nouveau  [     DRM] native mode from largest: 1920x1200@60
[    9.934743] nouveau  [     DRM] native mode from largest: 1920x1200@60
[    9.963585] nouveau  [     DRM] native mode from largest: 1920x1200@60

# DISPLAY=:0.0 XAUTHORITY=/var/run/gdm/auth-for-gdm-ytYnCs/database xrandr
--props
Screen 0: minimum 320 x 200, current 1600 x 1200, maximum 8192 x 8192
DVI-I-1 disconnected (normal left inverted right x axis y axis)
        dithering depth: auto
                supported: auto6 bpc8 bpc
        dithering mode: auto
                supported: autooffstatic 2x2dynamic 2x2
        scaling mode: Full
                supported: NoneFullCenterFull aspect
        color vibrance: 150
                range: (0, 200)
        vibrant hue: 90
                range: (0, 180)
        underscan vborder: 0
                range: (0, 128)
        underscan hborder: 0
                range: (0, 128)
        underscan: off
                supported: autooffon
        subconnector: Unknown
                supported: UnknownDVI-DDVI-A
VGA-1 disconnected (normal left inverted right x axis y axis)
        scaling mode: None
                supported: NoneFullCenterFull aspect
        color vibrance: 150
                range: (0, 200)
        vibrant hue: 90
                range: (0, 180)
HDMI-1 connected 1600x1200+0+0 (normal left inverted right x axis y axis) 597mm
x 336mm
        EDID:
                00ffffffffffff0010ac7e404c363331
                2a160103803c2278ea4bb5a7564ba325
                0a5054a54b008100b300d100714fa940
                8180d1c00101565e00a0a0a029503020
                350055502100001a000000ff00474b30
                4b443241493133364c0a000000fc0044
                454c4c205532373133484d0a000000fd
                0031561d711c000a20202020202000ce
        dithering depth: auto
                supported: auto6 bpc8 bpc
        dithering mode: auto
                supported: autooffstatic 2x2dynamic 2x2
        scaling mode: Full
                supported: NoneFullCenterFull aspect
        color vibrance: 150
                range: (0, 200)
        vibrant hue: 90
                range: (0, 180)
        underscan vborder: 0
                range: (0, 128)
        underscan hborder: 0
                range: (0, 128)
        underscan: off
                supported: autooffon
   1920x1200      60.0
   1600x1200      60.0*
   1680x1050      59.9
   1280x1024      75.0     60.0
   1280x800       59.9
   1152x864       75.0
   1024x768       75.1     60.0
   800x600        75.0     60.3
   640x480        75.0     60.0
   720x400        70.1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377387640.E04B2.12507
Date: Sat, 24 Aug 2013 23:40:40 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] DVI monitor connected via HDMI is blank / standby (NV96 / 9500GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=43939#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] DVI monitor connected via HDMI is blank / standby (NV96 / 9500GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=43939">bug 43939</a>
              from <span class="vcard"><a class="email" href="mailto:anthony.foiani+freedesktop&#64;gmail.com" title="Anthony Foiani &lt;anthony.foiani+freedesktop&#64;gmail.com&gt;"> <span class="fn">Anthony Foiani</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=43939#c5">comment #5</a>)
<span class="quote">&gt; Can you confirm whether this is still an issue with a more recent kernel
&gt; (e.g. 3.10)? All the output stuff has gotten quite a bit of rework in the
&gt; past 2 years.</span >

Sorry it took me a few days, but I can confirm that the problem is still
occurring on a fully up-to-date Fedora 18 system.  GRUB is visible, but X never
comes up.  Nothing obvious in the Xorg log.

Testing might be slightly complicated by the fact that the only DVI monitor I
have available for testing is now a 2560x1440, so the single-link constraint
might confusing things -- but the behavior seems to be exactly the same as
before, and xorg / nouveau certainly seem to think they found the workable max
resolution of 1920x1200.  As before, grub still works (displays graphics
correctly), so the physical connection seems functional if not optimal.

$ uname -a
Linux hum.int.foiani.com 3.10.9-100.fc18.x86_64 #1 SMP Wed Aug 21 18:25:04 UTC
2013 x86_64 x86_64 x86_64 GNU/Linux

]$ rpm -qa | egrep -i '(xorg|nouveau)'
xorg-x11-drv-vesa-2.3.2-2.fc18.x86_64
xorg-x11-xinit-1.3.2-7.fc18.x86_64
xorg-x11-proto-devel-7.6-24.fc18.noarch
xorg-x11-drv-ati-7.1.0-5.20130408git6e74aacc5.fc18.x86_64
xorg-x11-drv-vmmouse-13.0.0-1.fc18.x86_64
xorg-x11-server-utils-7.5-16.fc18.x86_64
xorg-x11-server-common-1.13.3-3.fc18.x86_64
xorg-x11-fonts-Type1-7.5-6.fc18.noarch
xorg-x11-drv-mga-1.6.2-6.fc18.x86_64
xorg-x11-drv-qxl-0.1.0-2.fc18.x86_64
xorg-x11-xkb-utils-7.7-5.fc18.x86_64
xorg-x11-fonts-ISO8859-1-75dpi-7.5-6.fc18.noarch
xorg-x11-drv-intel-2.21.12-1.fc18.x86_64
xorg-x11-drv-modesetting-0.6.0-1.fc18.x86_64
xorg-x11-font-utils-7.5-11.fc18.x86_64
xorg-x11-glamor-0.5.0-5.20130401git81aadb8.fc18.x86_64
xorg-x11-xauth-1.0.7-2.fc18.x86_64
xorg-x11-drv-vmware-12.0.2-3.20120718gite5ac80d8f.fc18.x86_64
xorg-x11-server-Xorg-1.13.3-3.fc18.x86_64
xorg-x11-drv-fbdev-0.4.3-3.fc18.x86_64
abrt-addon-xorg-2.1.6-3.fc18.x86_64
xorg-x11-utils-7.5-7.fc18.x86_64
xorg-x11-drv-evdev-2.7.3-5.fc18.x86_64
xorg-x11-drv-wacom-0.16.1-2.fc18.x86_64
xorg-x11-fonts-ISO8859-1-100dpi-7.5-6.fc18.noarch
xorg-x11-drv-openchrome-0.3.3-1.fc18.x86_64
xorg-x11-drv-synaptics-1.6.4-2.fc18.x86_64
xorg-x11-drv-nouveau-1.0.7-1.fc18.x86_64

$ dmesg | grep -i nouveau
[    1.693009] fb: conflicting fb hw usage nouveaufb vs EFI VGA - removing
generic driver
[    1.693418] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x096200a1
[    1.693420] nouveau  [  DEVICE][0000:01:00.0] Chipset: G96 (NV96)
[    1.693422] nouveau  [  DEVICE][0000:01:00.0] Family : NV50
[    1.695771] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    1.739080] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    1.739082] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    1.739162] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    1.739164] nouveau  [   VBIOS][0000:01:00.0] version 62.94.6c.00.36
[    1.759335] nouveau  [     PFB][0000:01:00.0] RAM type: DDR2
[    1.759338] nouveau  [     PFB][0000:01:00.0] RAM size: 512 MiB
[    1.759340] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 2048 tags
[    1.783396] nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
[    1.783401] nouveau  [  PTHERM][0000:01:00.0] fan management: disabled
[    1.783403] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    1.783511] nouveau  [     DRM] VRAM: 512 MiB
[    1.783512] nouveau  [     DRM] GART: 512 MiB
[    1.783515] nouveau  [     DRM] TMDS table version 2.0
[    1.783516] nouveau  [     DRM] DCB version 4.0
[    1.783517] nouveau  [     DRM] DCB outp 00: 02000300 00000028
[    1.783518] nouveau  [     DRM] DCB outp 01: 01000302 00000030
[    1.783519] nouveau  [     DRM] DCB outp 02: 04011310 00000028
[    1.783520] nouveau  [     DRM] DCB outp 03: 02022332 00020010
[    1.783521] nouveau  [     DRM] DCB conn 00: 00001030
[    1.783522] nouveau  [     DRM] DCB conn 01: 00000100
[    1.783523] nouveau  [     DRM] DCB conn 02: 00002261
[    1.794622] nouveau  [     DRM] vid bit 0 has no gpio tag
[    1.794674] nouveau  [     DRM] 1 available performance level(s)
[    1.794676] nouveau  [     DRM] 3: core 550MHz shader 1400MHz memory 504MHz
fanspeed 100%
[    1.794678] nouveau  [     DRM] c: core 400MHz shader 800MHz memory 504MHz
fanspeed 74%
[    2.057446] nouveau  [     DRM] MM: using CRYPT for buffer copies
[    2.107519] nouveau  [     DRM] native mode from largest: 1920x1200&#64;60
[    2.113734] nouveau  [     DRM] allocated 1920x1200 fb: 0x70000, bo
ffff880418695400
[    2.113844] fbcon: nouveaufb (fb0) is primary device
[    2.172776] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    2.172777] nouveau 0000:01:00.0: registered panic notifier
[    2.172779] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 0
[    2.257660] nouveau  [     DRM] native mode from largest: 1920x1200&#64;60
[    9.173797] nouveau  [     DRM] native mode from largest: 1920x1200&#64;60
[    9.246641] nouveau  [     DRM] native mode from largest: 1920x1200&#64;60
[    9.526051] nouveau  [     DRM] native mode from largest: 1920x1200&#64;60
[    9.934743] nouveau  [     DRM] native mode from largest: 1920x1200&#64;60
[    9.963585] nouveau  [     DRM] native mode from largest: 1920x1200&#64;60

# DISPLAY=:0.0 XAUTHORITY=/var/run/gdm/auth-for-gdm-ytYnCs/database xrandr
--props
Screen 0: minimum 320 x 200, current 1600 x 1200, maximum 8192 x 8192
DVI-I-1 disconnected (normal left inverted right x axis y axis)
        dithering depth: auto
                supported: auto6 bpc8 bpc
        dithering mode: auto
                supported: autooffstatic 2x2dynamic 2x2
        scaling mode: Full
                supported: NoneFullCenterFull aspect
        color vibrance: 150
                range: (0, 200)
        vibrant hue: 90
                range: (0, 180)
        underscan vborder: 0
                range: (0, 128)
        underscan hborder: 0
                range: (0, 128)
        underscan: off
                supported: autooffon
        subconnector: Unknown
                supported: UnknownDVI-DDVI-A
VGA-1 disconnected (normal left inverted right x axis y axis)
        scaling mode: None
                supported: NoneFullCenterFull aspect
        color vibrance: 150
                range: (0, 200)
        vibrant hue: 90
                range: (0, 180)
HDMI-1 connected 1600x1200+0+0 (normal left inverted right x axis y axis) 597mm
x 336mm
        EDID:
                00ffffffffffff0010ac7e404c363331
                2a160103803c2278ea4bb5a7564ba325
                0a5054a54b008100b300d100714fa940
                8180d1c00101565e00a0a0a029503020
                350055502100001a000000ff00474b30
                4b443241493133364c0a000000fc0044
                454c4c205532373133484d0a000000fd
                0031561d711c000a20202020202000ce
        dithering depth: auto
                supported: auto6 bpc8 bpc
        dithering mode: auto
                supported: autooffstatic 2x2dynamic 2x2
        scaling mode: Full
                supported: NoneFullCenterFull aspect
        color vibrance: 150
                range: (0, 200)
        vibrant hue: 90
                range: (0, 180)
        underscan vborder: 0
                range: (0, 128)
        underscan hborder: 0
                range: (0, 128)
        underscan: off
                supported: autooffon
   1920x1200      60.0
   1600x1200      60.0*
   1680x1050      59.9
   1280x1024      75.0     60.0
   1280x800       59.9
   1152x864       75.0
   1024x768       75.1     60.0
   800x600        75.0     60.3
   640x480        75.0     60.0
   720x400        70.1</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377387640.E04B2.12507--

--===============1428223189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1428223189==--
