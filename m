From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56461] NV11 black screen & kernel hang on loading
	nouveaufb
Date: Tue, 11 Dec 2012 19:59:06 +0000
Message-ID: <bug-56461-8800-nUqSi3FFcg@http.bugs.freedesktop.org/>
References: <bug-56461-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2050204342=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56461-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2050204342==
Content-Type: multipart/alternative; boundary="1355255946.bDa4d0eA1.9178"; charset="us-ascii"


--1355255946.bDa4d0eA1.9178
Date: Tue, 11 Dec 2012 19:59:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56461

--- Comment #13 from Chris Paulson-Ellis <chris-Tc38MJj1weLQT0dZR+AlfA@public.gmane.org> ---
With that modification, the PTIMER warning goes away, but unfortunately I still
have a hung machine with a black screen (serial console output below).

I did the bisect and got it down to one of 4 nouveau commits - 3 that NULL
deref, then 1 that hangs - see comment 8 above.

Chris.

# modprobe nouveau
[   94.851054] wmi: Mapper loaded
[   95.027154] [drm] Initialized drm 1.1.0 20060810
[   95.543293] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x011200b2
[   95.553280] nouveau  [  DEVICE][0000:01:00.0] Chipset: NV11 (NV11)
[   95.559722] nouveau  [  DEVICE][0000:01:00.0] Family : NV10
[   95.567178] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[   95.641819] nouveau  [   VBIOS][0000:01:00.0] ... checksum invalid
[   95.648038] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[   95.655178] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[   95.661697] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[   95.668473] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[   95.674986] nouveau  [   VBIOS][0000:01:00.0] checking PCIROM for image...
[   95.682106] nouveau  [   VBIOS][0000:01:00.0] ... checksum invalid
[   95.688415] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[   95.694932] nouveau  [   VBIOS][0000:01:00.0] BMP version 5.14
[   95.701085] nouveau  [   VBIOS][0000:01:00.0] version 03.11.01.44
[   95.708967] nouveau  [     PFB][0000:01:00.0] RAM type: DDR1
[   95.720366] nouveau  [     PFB][0000:01:00.0] RAM size: 16 MiB
[   95.726454] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[   95.737623] agpgart-intel 0000:00:00.0: AGP 2.0 bridge
[   95.742868] agpgart-intel 0000:00:00.0: putting AGP V2 device into 4x mode
[   95.749841] nouveau 0000:01:00.0: putting AGP V2 device into 4x mode
[   95.756394] [TTM] Zone  kernel: Available graphics memory: 386962 kiB
[   95.762940] [TTM] Initializing pool allocator
[   95.767609] nouveau  [     DRM] VRAM: 15 MiB
[   95.772083] nouveau  [     DRM] GART: 64 MiB
[   95.776432] nouveau  [     DRM] BMP version 5.20
[   95.781128] nouveau  [     DRM] DCB version 1.5
[   95.785740] nouveau  [     DRM] DCB outp 00: f0003f00 000088b8
[   95.791655] nouveau  [     DRM] DCB outp 01: f2045f14 0000ffff
[   95.797570] nouveau  [     DRM] DCB outp 02: f4204011 ffffffff
[   95.803705] nouveau  [     DRM] BIOS FP mode: 1600x1200 (162000kHz pixel
clock)
[   95.811877] nouveau  [     DRM] Saving VGA fonts
[   95.899625] nouveau  [     I2C][0000:01:00.0] detected TV encoder: ch7006
[   95.995616] ch7006 1-0075: Detected version ID: 50
[   96.039234] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[   96.045928] [drm] No driver support for vblank timestamp query.
[   96.077240] nouveau  [     DRM] 0 available performance level(s)
[   96.083444] nouveau  [     DRM] c: core 17MHz memory 332MHz
[   96.091238] nouveau  [     DRM] MM: using M2MF for buffer copies
[   96.172664] nouveau  [     DRM] allocated 1600x1200 fb: 0x8000, bo ede66400
[   96.179814] fbcon: nouveaufb (fb0) is primary device

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1355255946.bDa4d0eA1.9178
Date: Tue, 11 Dec 2012 19:59:06 +0000
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
   title="NEW --- - NV11 black screen &amp; kernel hang on loading nouveaufb"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56461#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - NV11 black screen &amp; kernel hang on loading nouveaufb"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56461">bug 56461</a>
              from <span class="vcard"><a class="email" href="mailto:chris&#64;edesix.com" title="Chris Paulson-Ellis &lt;chris&#64;edesix.com&gt;"> <span class="fn">Chris Paulson-Ellis</span></a>
</span></b>
        <pre>With that modification, the PTIMER warning goes away, but unfortunately I still
have a hung machine with a black screen (serial console output below).

I did the bisect and got it down to one of 4 nouveau commits - 3 that NULL
deref, then 1 that hangs - see <a href="show_bug.cgi?id=56461#c8">comment 8</a> above.

Chris.

# modprobe nouveau
[   94.851054] wmi: Mapper loaded
[   95.027154] [drm] Initialized drm 1.1.0 20060810
[   95.543293] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x011200b2
[   95.553280] nouveau  [  DEVICE][0000:01:00.0] Chipset: NV11 (NV11)
[   95.559722] nouveau  [  DEVICE][0000:01:00.0] Family : NV10
[   95.567178] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[   95.641819] nouveau  [   VBIOS][0000:01:00.0] ... checksum invalid
[   95.648038] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[   95.655178] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[   95.661697] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[   95.668473] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[   95.674986] nouveau  [   VBIOS][0000:01:00.0] checking PCIROM for image...
[   95.682106] nouveau  [   VBIOS][0000:01:00.0] ... checksum invalid
[   95.688415] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[   95.694932] nouveau  [   VBIOS][0000:01:00.0] BMP version 5.14
[   95.701085] nouveau  [   VBIOS][0000:01:00.0] version 03.11.01.44
[   95.708967] nouveau  [     PFB][0000:01:00.0] RAM type: DDR1
[   95.720366] nouveau  [     PFB][0000:01:00.0] RAM size: 16 MiB
[   95.726454] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[   95.737623] agpgart-intel 0000:00:00.0: AGP 2.0 bridge
[   95.742868] agpgart-intel 0000:00:00.0: putting AGP V2 device into 4x mode
[   95.749841] nouveau 0000:01:00.0: putting AGP V2 device into 4x mode
[   95.756394] [TTM] Zone  kernel: Available graphics memory: 386962 kiB
[   95.762940] [TTM] Initializing pool allocator
[   95.767609] nouveau  [     DRM] VRAM: 15 MiB
[   95.772083] nouveau  [     DRM] GART: 64 MiB
[   95.776432] nouveau  [     DRM] BMP version 5.20
[   95.781128] nouveau  [     DRM] DCB version 1.5
[   95.785740] nouveau  [     DRM] DCB outp 00: f0003f00 000088b8
[   95.791655] nouveau  [     DRM] DCB outp 01: f2045f14 0000ffff
[   95.797570] nouveau  [     DRM] DCB outp 02: f4204011 ffffffff
[   95.803705] nouveau  [     DRM] BIOS FP mode: 1600x1200 (162000kHz pixel
clock)
[   95.811877] nouveau  [     DRM] Saving VGA fonts
[   95.899625] nouveau  [     I2C][0000:01:00.0] detected TV encoder: ch7006
[   95.995616] ch7006 1-0075: Detected version ID: 50
[   96.039234] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[   96.045928] [drm] No driver support for vblank timestamp query.
[   96.077240] nouveau  [     DRM] 0 available performance level(s)
[   96.083444] nouveau  [     DRM] c: core 17MHz memory 332MHz
[   96.091238] nouveau  [     DRM] MM: using M2MF for buffer copies
[   96.172664] nouveau  [     DRM] allocated 1600x1200 fb: 0x8000, bo ede66400
[   96.179814] fbcon: nouveaufb (fb0) is primary device</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1355255946.bDa4d0eA1.9178--

--===============2050204342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2050204342==--
