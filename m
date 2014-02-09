From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20341] [NV31] lockup when using AGP. agpmode=0 fixes
	it.
Date: Sun, 09 Feb 2014 00:23:34 +0000
Message-ID: <bug-20341-8800-yFYye8NExu@http.bugs.freedesktop.org/>
References: <bug-20341-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1859855403=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20341-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1859855403==
Content-Type: multipart/alternative; boundary="1391905414.21c67DA71.8107"; charset="us-ascii"


--1391905414.21c67DA71.8107
Date: Sun, 9 Feb 2014 00:23:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=20341

Jason Detring <detringj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |VERIFIED

--- Comment #28 from Jason Detring <detringj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
This was tested for 24+ hours against a vanilla 3.13.1.  No problems found, so
setting VERIFIED.  I'm happy to see this bug being put to rest.

Thank you for taking care of this issue for me!

Jason


[   18.213336] [drm] Initialized drm 1.1.0 20060810
[   18.463592] wmi: Mapper loaded
[   18.669773] ACPI: PCI Interrupt Link [LNKA] enabled at IRQ 3
[   18.669891] PCI: setting IRQ 3 as level-triggered
[   18.670951] [drm] hdmi device  not found 1 0 1
[   18.671233] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x031100a1
[   18.671326] nouveau  [  DEVICE][0000:01:00.0] Chipset: NV31 (NV31)
[   18.671416] nouveau  [  DEVICE][0000:01:00.0] Family : NV30
[   18.673632] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[   18.714842] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[   18.714936] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[   18.715029] nouveau  [   VBIOS][0000:01:00.0] BMP version 5.27
[   18.715527] nouveau  [   VBIOS][0000:01:00.0] version 04.31.20.52.00
[   18.716448] nouveau W[  PTIMER][0000:01:00.0] unknown input clock freq
[   18.716555] nouveau  [     PFB][0000:01:00.0] RAM type: DDR1
[   18.716645] nouveau  [     PFB][0000:01:00.0] RAM size: 128 MiB
[   18.716794] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 262144 tags
[   18.724684] nouveau  [     CLK][0000:01:00.0] --:   
[   18.724853] nouveau  [  DEVICE][0000:01:00.0] Forcing agp mode to 2X. Use
agpmode to override.
[   18.724994] agpgart-via 0000:00:00.0: AGP 2.0 bridge
[   18.725106] agpgart-via 0000:00:00.0: putting AGP V2 device into 2x mode
[   18.725243] nouveau 0000:01:00.0: putting AGP V2 device into 2x mode
[   18.725559] [TTM] Zone  kernel: Available graphics memory: 444174 kiB
[   18.725650] [TTM] Zone highmem: Available graphics memory: 513810 kiB
[   18.725739] [TTM] Initializing pool allocator
[   18.725836] [TTM] Initializing DMA pool allocator
[   18.725962] nouveau  [     DRM] VRAM: 127 MiB
[   18.726048] nouveau  [     DRM] GART: 64 MiB
[   18.726138] nouveau  [     DRM] BMP version 5.39
[   18.726228] nouveau  [     DRM] DCB version 2.2
[   18.726318] nouveau  [     DRM] DCB outp 00: 01000300 00009c40
[   18.726409] nouveau  [     DRM] DCB outp 01: 02010310 00009c40
[   18.726498] nouveau  [     DRM] DCB outp 02: 01010312 00000000
[   18.726588] nouveau  [     DRM] DCB outp 03: 02020321 00000003
[   18.727035] nouveau  [     DRM] Loading NV17 power sequencing microcode
[   18.728729] nouveau  [     DRM] Saving VGA fonts
[   18.773146] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   18.773253] [drm] No driver support for vblank timestamp query.
[   18.773517] nouveau  [     DRM] 0xE176: Parsing digital output script table
[   18.778990] nouveau  [     DRM] MM: using M2MF for buffer copies
[   18.779120] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 3)
[   18.864770] nouveau  [     DRM] allocated 1920x1200 fb: 0x9000, bo f5ae2e00
[   18.865359] fbcon: nouveaufb (fb0) is primary device
[   18.891030] Console: switching to colour frame buffer device 240x75
[   18.893942] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   18.893967] nouveau 0000:01:00.0: registered panic notifier
[   18.894004] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391905414.21c67DA71.8107
Date: Sun, 9 Feb 2014 00:23:34 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:detringj&#64;gmail.com" title="Jason Detring &lt;detringj&#64;gmail.com&gt;"> <span class="fn">Jason Detring</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_VERIFIED  bz_closed"
   title="VERIFIED FIXED - [NV31] lockup when using AGP. agpmode=0 fixes it."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=20341">bug 20341</a>
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
           <td>VERIFIED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_VERIFIED  bz_closed"
   title="VERIFIED FIXED - [NV31] lockup when using AGP. agpmode=0 fixes it."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=20341#c28">Comment # 28</a>
              on <a class="bz_bug_link 
          bz_status_VERIFIED  bz_closed"
   title="VERIFIED FIXED - [NV31] lockup when using AGP. agpmode=0 fixes it."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=20341">bug 20341</a>
              from <span class="vcard"><a class="email" href="mailto:detringj&#64;gmail.com" title="Jason Detring &lt;detringj&#64;gmail.com&gt;"> <span class="fn">Jason Detring</span></a>
</span></b>
        <pre>This was tested for 24+ hours against a vanilla 3.13.1.  No problems found, so
setting VERIFIED.  I'm happy to see this bug being put to rest.

Thank you for taking care of this issue for me!

Jason


[   18.213336] [drm] Initialized drm 1.1.0 20060810
[   18.463592] wmi: Mapper loaded
[   18.669773] ACPI: PCI Interrupt Link [LNKA] enabled at IRQ 3
[   18.669891] PCI: setting IRQ 3 as level-triggered
[   18.670951] [drm] hdmi device  not found 1 0 1
[   18.671233] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x031100a1
[   18.671326] nouveau  [  DEVICE][0000:01:00.0] Chipset: NV31 (NV31)
[   18.671416] nouveau  [  DEVICE][0000:01:00.0] Family : NV30
[   18.673632] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[   18.714842] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[   18.714936] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[   18.715029] nouveau  [   VBIOS][0000:01:00.0] BMP version 5.27
[   18.715527] nouveau  [   VBIOS][0000:01:00.0] version 04.31.20.52.00
[   18.716448] nouveau W[  PTIMER][0000:01:00.0] unknown input clock freq
[   18.716555] nouveau  [     PFB][0000:01:00.0] RAM type: DDR1
[   18.716645] nouveau  [     PFB][0000:01:00.0] RAM size: 128 MiB
[   18.716794] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 262144 tags
[   18.724684] nouveau  [     CLK][0000:01:00.0] --:   
[   18.724853] nouveau  [  DEVICE][0000:01:00.0] Forcing agp mode to 2X. Use
agpmode to override.
[   18.724994] agpgart-via 0000:00:00.0: AGP 2.0 bridge
[   18.725106] agpgart-via 0000:00:00.0: putting AGP V2 device into 2x mode
[   18.725243] nouveau 0000:01:00.0: putting AGP V2 device into 2x mode
[   18.725559] [TTM] Zone  kernel: Available graphics memory: 444174 kiB
[   18.725650] [TTM] Zone highmem: Available graphics memory: 513810 kiB
[   18.725739] [TTM] Initializing pool allocator
[   18.725836] [TTM] Initializing DMA pool allocator
[   18.725962] nouveau  [     DRM] VRAM: 127 MiB
[   18.726048] nouveau  [     DRM] GART: 64 MiB
[   18.726138] nouveau  [     DRM] BMP version 5.39
[   18.726228] nouveau  [     DRM] DCB version 2.2
[   18.726318] nouveau  [     DRM] DCB outp 00: 01000300 00009c40
[   18.726409] nouveau  [     DRM] DCB outp 01: 02010310 00009c40
[   18.726498] nouveau  [     DRM] DCB outp 02: 01010312 00000000
[   18.726588] nouveau  [     DRM] DCB outp 03: 02020321 00000003
[   18.727035] nouveau  [     DRM] Loading NV17 power sequencing microcode
[   18.728729] nouveau  [     DRM] Saving VGA fonts
[   18.773146] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   18.773253] [drm] No driver support for vblank timestamp query.
[   18.773517] nouveau  [     DRM] 0xE176: Parsing digital output script table
[   18.778990] nouveau  [     DRM] MM: using M2MF for buffer copies
[   18.779120] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 3)
[   18.864770] nouveau  [     DRM] allocated 1920x1200 fb: 0x9000, bo f5ae2e00
[   18.865359] fbcon: nouveaufb (fb0) is primary device
[   18.891030] Console: switching to colour frame buffer device 240x75
[   18.893942] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   18.893967] nouveau 0000:01:00.0: registered panic notifier
[   18.894004] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
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

--1391905414.21c67DA71.8107--

--===============1859855403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1859855403==--
