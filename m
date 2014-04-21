From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33297] X hangs with nouveau and linux kernel
	2.6.38-rc1
Date: Mon, 21 Apr 2014 08:31:48 +0000
Message-ID: <bug-33297-8800-PVFn7Ccaul@http.bugs.freedesktop.org/>
References: <bug-33297-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1860305538=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-33297-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1860305538==
Content-Type: multipart/alternative; boundary="1398069108.8a30Af42.20526"; charset="us-ascii"


--1398069108.8a30Af42.20526
Date: Mon, 21 Apr 2014 08:31:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=33297

Graham <freedesktop-JuZPlYae4xGtmTQ+vhA3Yw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|INVALID                     |---

--- Comment #5 from Graham <freedesktop-JuZPlYae4xGtmTQ+vhA3Yw@public.gmane.org> ---
Unfortunately, this is alive and well in Saucy

root@workshop-workstation:~# lspci
 . . .
00:08.0 VGA compatible controller: NVIDIA Corporation NV34 [GeForce FX 5200]
(rev a1)

root@workshop-workstation:~# uname -a
Linux workshop-workstation 3.11.0-19-generic #33-Ubuntu SMP Tue Mar 11 18:48:34
UTC 2014 x86_64 x86_64 x86_64 GNU/Linux

root@workshop-workstation:~# gimp --version
GNU Image Manipulation Program version 2.8.6

root@workshop-workstation:~# cat /etc/*release*
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=13.10
DISTRIB_CODENAME=saucy
DISTRIB_DESCRIPTION="Ubuntu 13.10"
NAME="Ubuntu"
VERSION="13.10, Saucy Salamander"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 13.10"
VERSION_ID="13.10"
HOME_URL="http://www.ubuntu.com/"
SUPPORT_URL="http://help.ubuntu.com/"
BUG_REPORT_URL="http://bugs.launchpad.net/ubuntu/"

root@workshop-workstation:~# grep -i '(ee)' /var/log/Xorg.0.log
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[    28.201] (EE) Failed to load module "nvidia" (module does not exist, 0)
[    28.508] (EE) Failed to load module "nvidia" (module does not exist, 0)

root@workshop-workstation:~# grep -i '(ww)' /var/log/Xorg.0.log
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[    26.686] (WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
[    26.686] (WW) The directory "/usr/share/fonts/X11/100dpi/" does not exist.
[    26.686] (WW) The directory "/usr/share/fonts/X11/75dpi/" does not exist.
[    26.687] (WW) The directory "/usr/share/fonts/X11/100dpi" does not exist.
[    26.687] (WW) The directory "/usr/share/fonts/X11/75dpi" does not exist.
[    26.696] (WW) "xmir" is not to be loaded by default. Skipping.
[    28.201] (WW) Warning, couldn't open module nvidia
[    28.508] (WW) Warning, couldn't open module nvidia
[    28.575] (WW) Falling back to old probe method for vesa
[    28.575] (WW) Falling back to old probe method for modesetting
[    28.575] (WW) Falling back to old probe method for fbdev

root@workshop-workstation:~# dmesg |grep nouveau
[   10.538024] nouveau  [  DEVICE][0000:00:08.0] BOOT0  : 0x034200b1
[   10.538030] nouveau  [  DEVICE][0000:00:08.0] Chipset: NV34 (NV34)
[   10.538032] nouveau  [  DEVICE][0000:00:08.0] Family : NV30
[   10.538573] nouveau  [   VBIOS][0000:00:08.0] checking PRAMIN for image...
[   10.591549] nouveau  [   VBIOS][0000:00:08.0] ... appears to be valid
[   10.591551] nouveau  [   VBIOS][0000:00:08.0] using image from PRAMIN
[   10.591555] nouveau  [   VBIOS][0000:00:08.0] BMP version 5.29
[   10.591757] nouveau  [   VBIOS][0000:00:08.0] version 04.34.20.87.00
[   10.592262] nouveau W[  PTIMER][0000:00:08.0] unknown input clock freq
[   10.592271] nouveau  [     PFB][0000:00:08.0] RAM type: DDR1
[   10.592273] nouveau  [     PFB][0000:00:08.0] RAM size: 256 MiB
[   10.592275] nouveau  [     PFB][0000:00:08.0]    ZCOMP: 0 tags
[   10.599517] nouveau  [     DRM] VRAM: 255 MiB
[   10.599519] nouveau  [     DRM] GART: 128 MiB
[   10.599522] nouveau  [     DRM] BMP version 5.41
[   10.599525] nouveau  [     DRM] DCB version 2.2
[   10.599529] nouveau  [     DRM] DCB outp 00: 01000300 000088b8
[   10.599531] nouveau  [     DRM] DCB outp 01: 02010310 000088b8
[   10.599534] nouveau  [     DRM] DCB outp 02: 01010312 00000000
[   10.599536] nouveau  [     DRM] DCB outp 03: 02020321 00000003
[   10.599668] nouveau  [     DRM] Loading NV17 power sequencing microcode
[   10.599906] nouveau  [     DRM] Saving VGA fonts
[   10.660860] nouveau  [     DRM] 0xE0FB: Parsing digital output script table
[   10.715863] nouveau  [     DRM] 0 available performance level(s)
[   10.715870] nouveau  [     DRM] c: core 249MHz memory 405MHz
[   10.716533] nouveau  [     DRM] MM: using M2MF for buffer copies
[   10.716543] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 3)
[   10.808309] nouveau  [     DRM] allocated 1280x1024 fb: 0x9000, bo
ffff88007bae1400
[   10.808386] fbcon: nouveaufb (fb0) is primary device
[   10.851426] nouveau  [     DRM] 0xE0FB: Parsing digital output script table
[   10.910614] nouveau 0000:00:08.0: fb0: nouveaufb frame buffer device
[   10.910617] nouveau 0000:00:08.0: registered panic notifier
[   10.910622] [drm] Initialized nouveau 1.1.1 20120801 for 0000:00:08.0 on
minor 0
[10911.742652] nouveau E[Xorg[1267]] cal_space: -16
[27488.218862] nouveau E[Xorg[1267]] cal_space: -16

-----------------------------------------------

A workaround is to use Ctrl-T to hide selection which frees the CPU as the
marching ants are not displayed.

This obviously means the selection is also hidden so making some operations
difficult.

It may be the nvidia hardware version which has the problem.

The graphics card is an old PCI one, which I'm using dual screen.

I can reproduce it at will, but an unsure what would help you.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398069108.8a30Af42.20526
Date: Mon, 21 Apr 2014 08:31:48 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:freedesktop&#64;netlinux.org.uk" title="Graham &lt;freedesktop&#64;netlinux.org.uk&gt;"> <span class="fn">Graham</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - X hangs with nouveau and linux kernel 2.6.38-rc1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=33297">bug 33297</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>INVALID
           </td>
           <td>---
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - X hangs with nouveau and linux kernel 2.6.38-rc1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=33297#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - X hangs with nouveau and linux kernel 2.6.38-rc1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=33297">bug 33297</a>
              from <span class="vcard"><a class="email" href="mailto:freedesktop&#64;netlinux.org.uk" title="Graham &lt;freedesktop&#64;netlinux.org.uk&gt;"> <span class="fn">Graham</span></a>
</span></b>
        <pre>Unfortunately, this is alive and well in Saucy

root&#64;workshop-workstation:~# lspci
 . . .
00:08.0 VGA compatible controller: NVIDIA Corporation NV34 [GeForce FX 5200]
(rev a1)

root&#64;workshop-workstation:~# uname -a
Linux workshop-workstation 3.11.0-19-generic #33-Ubuntu SMP Tue Mar 11 18:48:34
UTC 2014 x86_64 x86_64 x86_64 GNU/Linux

root&#64;workshop-workstation:~# gimp --version
GNU Image Manipulation Program version 2.8.6

root&#64;workshop-workstation:~# cat /etc/*release*
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=13.10
DISTRIB_CODENAME=saucy
DISTRIB_DESCRIPTION=&quot;Ubuntu 13.10&quot;
NAME=&quot;Ubuntu&quot;
VERSION=&quot;13.10, Saucy Salamander&quot;
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME=&quot;Ubuntu 13.10&quot;
VERSION_ID=&quot;13.10&quot;
HOME_URL=&quot;<a href="http://www.ubuntu.com/">http://www.ubuntu.com/</a>&quot;
SUPPORT_URL=&quot;<a href="http://help.ubuntu.com/">http://help.ubuntu.com/</a>&quot;
BUG_REPORT_URL=&quot;<a href="http://bugs.launchpad.net/ubuntu/">http://bugs.launchpad.net/ubuntu/</a>&quot;

root&#64;workshop-workstation:~# grep -i '(ee)' /var/log/Xorg.0.log
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[    28.201] (EE) Failed to load module &quot;nvidia&quot; (module does not exist, 0)
[    28.508] (EE) Failed to load module &quot;nvidia&quot; (module does not exist, 0)

root&#64;workshop-workstation:~# grep -i '(ww)' /var/log/Xorg.0.log
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[    26.686] (WW) The directory &quot;/usr/share/fonts/X11/cyrillic&quot; does not exist.
[    26.686] (WW) The directory &quot;/usr/share/fonts/X11/100dpi/&quot; does not exist.
[    26.686] (WW) The directory &quot;/usr/share/fonts/X11/75dpi/&quot; does not exist.
[    26.687] (WW) The directory &quot;/usr/share/fonts/X11/100dpi&quot; does not exist.
[    26.687] (WW) The directory &quot;/usr/share/fonts/X11/75dpi&quot; does not exist.
[    26.696] (WW) &quot;xmir&quot; is not to be loaded by default. Skipping.
[    28.201] (WW) Warning, couldn't open module nvidia
[    28.508] (WW) Warning, couldn't open module nvidia
[    28.575] (WW) Falling back to old probe method for vesa
[    28.575] (WW) Falling back to old probe method for modesetting
[    28.575] (WW) Falling back to old probe method for fbdev

root&#64;workshop-workstation:~# dmesg |grep nouveau
[   10.538024] nouveau  [  DEVICE][0000:00:08.0] BOOT0  : 0x034200b1
[   10.538030] nouveau  [  DEVICE][0000:00:08.0] Chipset: NV34 (NV34)
[   10.538032] nouveau  [  DEVICE][0000:00:08.0] Family : NV30
[   10.538573] nouveau  [   VBIOS][0000:00:08.0] checking PRAMIN for image...
[   10.591549] nouveau  [   VBIOS][0000:00:08.0] ... appears to be valid
[   10.591551] nouveau  [   VBIOS][0000:00:08.0] using image from PRAMIN
[   10.591555] nouveau  [   VBIOS][0000:00:08.0] BMP version 5.29
[   10.591757] nouveau  [   VBIOS][0000:00:08.0] version 04.34.20.87.00
[   10.592262] nouveau W[  PTIMER][0000:00:08.0] unknown input clock freq
[   10.592271] nouveau  [     PFB][0000:00:08.0] RAM type: DDR1
[   10.592273] nouveau  [     PFB][0000:00:08.0] RAM size: 256 MiB
[   10.592275] nouveau  [     PFB][0000:00:08.0]    ZCOMP: 0 tags
[   10.599517] nouveau  [     DRM] VRAM: 255 MiB
[   10.599519] nouveau  [     DRM] GART: 128 MiB
[   10.599522] nouveau  [     DRM] BMP version 5.41
[   10.599525] nouveau  [     DRM] DCB version 2.2
[   10.599529] nouveau  [     DRM] DCB outp 00: 01000300 000088b8
[   10.599531] nouveau  [     DRM] DCB outp 01: 02010310 000088b8
[   10.599534] nouveau  [     DRM] DCB outp 02: 01010312 00000000
[   10.599536] nouveau  [     DRM] DCB outp 03: 02020321 00000003
[   10.599668] nouveau  [     DRM] Loading NV17 power sequencing microcode
[   10.599906] nouveau  [     DRM] Saving VGA fonts
[   10.660860] nouveau  [     DRM] 0xE0FB: Parsing digital output script table
[   10.715863] nouveau  [     DRM] 0 available performance level(s)
[   10.715870] nouveau  [     DRM] c: core 249MHz memory 405MHz
[   10.716533] nouveau  [     DRM] MM: using M2MF for buffer copies
[   10.716543] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 3)
[   10.808309] nouveau  [     DRM] allocated 1280x1024 fb: 0x9000, bo
ffff88007bae1400
[   10.808386] fbcon: nouveaufb (fb0) is primary device
[   10.851426] nouveau  [     DRM] 0xE0FB: Parsing digital output script table
[   10.910614] nouveau 0000:00:08.0: fb0: nouveaufb frame buffer device
[   10.910617] nouveau 0000:00:08.0: registered panic notifier
[   10.910622] [drm] Initialized nouveau 1.1.1 20120801 for 0000:00:08.0 on
minor 0
[10911.742652] nouveau E[Xorg[1267]] cal_space: -16
[27488.218862] nouveau E[Xorg[1267]] cal_space: -16

-----------------------------------------------

A workaround is to use Ctrl-T to hide selection which frees the CPU as the
marching ants are not displayed.

This obviously means the selection is also hidden so making some operations
difficult.

It may be the nvidia hardware version which has the problem.

The graphics card is an old PCI one, which I'm using dual screen.

I can reproduce it at will, but an unsure what would help you.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398069108.8a30Af42.20526--

--===============1860305538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1860305538==--
