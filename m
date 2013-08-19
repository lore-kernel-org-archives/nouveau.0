From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26534] nouveau does not fetch edid from connected
 monitor on nforce1 (nv1a)
Date: Mon, 19 Aug 2013 18:03:31 +0000
Message-ID: <bug-26534-8800-kiOhztcEWp@http.bugs.freedesktop.org/>
References: <bug-26534-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1870805206=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26534-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1870805206==
Content-Type: multipart/alternative; boundary="1376935411.1D5F01.17270"; charset="us-ascii"


--1376935411.1D5F01.17270
Date: Mon, 19 Aug 2013 18:03:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=26534

Bruno <bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|INVALID                     |---

--- Comment #18 from Bruno <bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org> ---
This still applies to 3.10.7 and monitor thinks "no signal".

ls /sys/class/drm/
card0/  card0-DVI-I-1/  controlD64/  ttm/  version
grep . /sys/class/drm/card0-DVI-I-1/*
/sys/class/drm/card0-DVI-I-1/dpms:On
/sys/class/drm/card0-DVI-I-1/enabled:enabled
/sys/class/drm/card0-DVI-I-1/modes:1024x768
/sys/class/drm/card0-DVI-I-1/modes:800x600
/sys/class/drm/card0-DVI-I-1/modes:800x600
/sys/class/drm/card0-DVI-I-1/modes:848x480
/sys/class/drm/card0-DVI-I-1/modes:640x480
/sys/class/drm/card0-DVI-I-1/status:connected
/sys/class/drm/card0-DVI-I-1/subconnector:DVI-A


[  225.735801] wmi: Mapper loaded
[  226.511634] ACPI: PCI Interrupt Link [LNK5] enabled at IRQ 16
[  226.520816] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x01a000b1
[  226.526999] nouveau  [  DEVICE][0000:02:00.0] Chipset: nForce (NV1A)
[  226.533419] nouveau  [  DEVICE][0000:02:00.0] Family : NV10
[  226.540887] nouveau  [   VBIOS][0000:02:00.0] checking PRAMIN for image...
[  226.582453] nouveau  [   VBIOS][0000:02:00.0] ... checksum invalid
[  226.588679] nouveau  [   VBIOS][0000:02:00.0] checking PROM for image...
[  226.595440] nouveau  [   VBIOS][0000:02:00.0] ... signature not found
[  226.601929] nouveau  [   VBIOS][0000:02:00.0] checking ACPI for image...
[  226.608708] nouveau  [   VBIOS][0000:02:00.0] ... signature not found
[  226.615196] nouveau  [   VBIOS][0000:02:00.0] checking PCIROM for image...
[  226.622955] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
[  226.629467] nouveau  [   VBIOS][0000:02:00.0] using image from PCIROM
[  226.635980] nouveau  [   VBIOS][0000:02:00.0] BMP version 5.14
[  226.642147] nouveau  [   VBIOS][0000:02:00.0] version 03.1a.01.03.00
[  226.648572] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  226.656527] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  226.664297] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  226.671167] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  226.678127] nouveau W[  PTIMER][0000:02:00.0] unknown input clock freq
[  226.684735] nouveau  [     PFB][0000:02:00.0] RAM type: stolen system memory
[  226.691834] nouveau  [     PFB][0000:02:00.0] RAM size: 32 MiB
[  226.697701] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 0 tags
[  226.708701] agpgart-nvidia 0000:00:00.0: AGP 2.0 bridge
[  226.713990] agpgart-nvidia 0000:00:00.0: putting AGP V2 device into 4x mode
[  226.721050] nouveau 0000:02:00.0: putting AGP V2 device into 4x mode
[  226.727609] [TTM] Zone  kernel: Available graphics memory: 239574 kiB
[  226.734095] [TTM] Initializing pool allocator
[  226.738689] nouveau  [     DRM] VRAM: 31 MiB
[  226.743102] nouveau  [     DRM] GART: 64 MiB
[  226.747442] nouveau  [     DRM] BMP version 5.20
[  226.752115] nouveau W[     DRM] No useful DCB data in VBIOS
[  226.760337] nouveau  [     DRM] Saving VGA fonts
[  226.810644] nouveau W[     DRM] No useful DCB data in VBIOS
[  226.819047] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[  226.825768] [drm] No driver support for vblank timestamp query.
[  226.831876] nouveau  [     DRM] 0xAFD8: Parsing digital output script table
[  226.839109] nouveau  [     DRM] 0 available performance level(s)
[  226.845181] nouveau  [     DRM] c: core 305MHz memory 0MHz
[  226.852613] nouveau  [     DRM] MM: using M2MF for buffer copies
[  227.049415] nouveau  [     DRM] allocated 1024x768 fb: 0x5000, bo dba934a0
[  227.058378] fbcon: nouveaufb (fb0) is primary device
[  227.072731] Console: switching to colour frame buffer device 128x48
[  227.084818] nouveau 0000:02:00.0: fb0: nouveaufb frame buffer device
[  227.084821] nouveau 0000:02:00.0: registered panic notifier
[  227.097334] [drm] Initialized nouveau 1.1.1 20120801 for 0000:02:00.0 on
minor 0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376935411.1D5F01.17270
Date: Mon, 19 Aug 2013 18:03:31 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:bonbons67&#64;internet.lu" title="Bruno &lt;bonbons67&#64;internet.lu&gt;"> <span class="fn">Bruno</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - nouveau does not fetch edid from connected monitor on nforce1 (nv1a)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=26534">bug 26534</a>
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
   title="REOPENED --- - nouveau does not fetch edid from connected monitor on nforce1 (nv1a)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=26534#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - nouveau does not fetch edid from connected monitor on nforce1 (nv1a)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=26534">bug 26534</a>
              from <span class="vcard"><a class="email" href="mailto:bonbons67&#64;internet.lu" title="Bruno &lt;bonbons67&#64;internet.lu&gt;"> <span class="fn">Bruno</span></a>
</span></b>
        <pre>This still applies to 3.10.7 and monitor thinks &quot;no signal&quot;.

ls /sys/class/drm/
card0/  card0-DVI-I-1/  controlD64/  ttm/  version
grep . /sys/class/drm/card0-DVI-I-1/*
/sys/class/drm/card0-DVI-I-1/dpms:On
/sys/class/drm/card0-DVI-I-1/enabled:enabled
/sys/class/drm/card0-DVI-I-1/modes:1024x768
/sys/class/drm/card0-DVI-I-1/modes:800x600
/sys/class/drm/card0-DVI-I-1/modes:800x600
/sys/class/drm/card0-DVI-I-1/modes:848x480
/sys/class/drm/card0-DVI-I-1/modes:640x480
/sys/class/drm/card0-DVI-I-1/status:connected
/sys/class/drm/card0-DVI-I-1/subconnector:DVI-A


[  225.735801] wmi: Mapper loaded
[  226.511634] ACPI: PCI Interrupt Link [LNK5] enabled at IRQ 16
[  226.520816] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x01a000b1
[  226.526999] nouveau  [  DEVICE][0000:02:00.0] Chipset: nForce (NV1A)
[  226.533419] nouveau  [  DEVICE][0000:02:00.0] Family : NV10
[  226.540887] nouveau  [   VBIOS][0000:02:00.0] checking PRAMIN for image...
[  226.582453] nouveau  [   VBIOS][0000:02:00.0] ... checksum invalid
[  226.588679] nouveau  [   VBIOS][0000:02:00.0] checking PROM for image...
[  226.595440] nouveau  [   VBIOS][0000:02:00.0] ... signature not found
[  226.601929] nouveau  [   VBIOS][0000:02:00.0] checking ACPI for image...
[  226.608708] nouveau  [   VBIOS][0000:02:00.0] ... signature not found
[  226.615196] nouveau  [   VBIOS][0000:02:00.0] checking PCIROM for image...
[  226.622955] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
[  226.629467] nouveau  [   VBIOS][0000:02:00.0] using image from PCIROM
[  226.635980] nouveau  [   VBIOS][0000:02:00.0] BMP version 5.14
[  226.642147] nouveau  [   VBIOS][0000:02:00.0] version 03.1a.01.03.00
[  226.648572] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  226.656527] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  226.664297] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  226.671167] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  226.678127] nouveau W[  PTIMER][0000:02:00.0] unknown input clock freq
[  226.684735] nouveau  [     PFB][0000:02:00.0] RAM type: stolen system memory
[  226.691834] nouveau  [     PFB][0000:02:00.0] RAM size: 32 MiB
[  226.697701] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 0 tags
[  226.708701] agpgart-nvidia 0000:00:00.0: AGP 2.0 bridge
[  226.713990] agpgart-nvidia 0000:00:00.0: putting AGP V2 device into 4x mode
[  226.721050] nouveau 0000:02:00.0: putting AGP V2 device into 4x mode
[  226.727609] [TTM] Zone  kernel: Available graphics memory: 239574 kiB
[  226.734095] [TTM] Initializing pool allocator
[  226.738689] nouveau  [     DRM] VRAM: 31 MiB
[  226.743102] nouveau  [     DRM] GART: 64 MiB
[  226.747442] nouveau  [     DRM] BMP version 5.20
[  226.752115] nouveau W[     DRM] No useful DCB data in VBIOS
[  226.760337] nouveau  [     DRM] Saving VGA fonts
[  226.810644] nouveau W[     DRM] No useful DCB data in VBIOS
[  226.819047] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[  226.825768] [drm] No driver support for vblank timestamp query.
[  226.831876] nouveau  [     DRM] 0xAFD8: Parsing digital output script table
[  226.839109] nouveau  [     DRM] 0 available performance level(s)
[  226.845181] nouveau  [     DRM] c: core 305MHz memory 0MHz
[  226.852613] nouveau  [     DRM] MM: using M2MF for buffer copies
[  227.049415] nouveau  [     DRM] allocated 1024x768 fb: 0x5000, bo dba934a0
[  227.058378] fbcon: nouveaufb (fb0) is primary device
[  227.072731] Console: switching to colour frame buffer device 128x48
[  227.084818] nouveau 0000:02:00.0: fb0: nouveaufb frame buffer device
[  227.084821] nouveau 0000:02:00.0: registered panic notifier
[  227.097334] [drm] Initialized nouveau 1.1.1 20120801 for 0000:02:00.0 on
minor 0</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376935411.1D5F01.17270--

--===============1870805206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1870805206==--
