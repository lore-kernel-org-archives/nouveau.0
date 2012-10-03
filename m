From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 46557] nouveau: NV4E acceleration corruption when
 DMA above 31-bit (2 Gig barrier)
Date: Wed, 03 Oct 2012 11:21:49 +0000
Message-ID: <bug-46557-8800-Iho4kR1FYc@http.bugs.freedesktop.org/>
References: <bug-46557-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1855606725=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-46557-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1855606725==
Content-Type: multipart/alternative; boundary="1349263309.18dd13.8041"; charset="us-ascii"


--1349263309.18dd13.8041
Date: Wed, 3 Oct 2012 11:21:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=46557

--- Comment #23 from baldur-htSm2yLGOjU@public.gmane.org ---
here is the output for nouveau from dmesg

[    1.098755] nouveau 0000:00:05.0: >setting latency timer to 64
[    1.099370] nouveau  [  DEVICE][0000:00:05.0] BOOT0  : 0x04e000a2
[    1.099374] nouveau  [  DEVICE][0000:00:05.0] Chipset: C51 (NV4E)
[    1.099377] nouveau  [  DEVICE][0000:00:05.0] Family : NV40
[    1.100226] nouveau  [   VBIOS][0000:00:05.0] checking PRAMIN for image...
[    1.136693] nouveau  [   VBIOS][0000:00:05.0] ... appears to be valid
[    1.136696] nouveau  [   VBIOS][0000:00:05.0] using image from PRAMIN
[    1.136922] nouveau  [   VBIOS][0000:00:05.0] BIT signature found
[    1.136925] nouveau  [   VBIOS][0000:00:05.0] version 05.51.22.33
[    1.137122] nouveau  [     PFB][0000:00:05.0] RAM type: stolen system memory
[    1.137125] nouveau  [     PFB][0000:00:05.0] RAM size: 32 MiB
[    1.789533] nouveau  [     DRM] VRAM: 29 MiB
[    1.789540] nouveau  [     DRM] GART: 512 MiB
[    1.789546] nouveau  [     DRM] BIT BIOS found
[    1.789550] nouveau  [     DRM] Bios version 05.51.22.33
[    1.789554] nouveau  [     DRM] TMDS table version 1.1
[    1.789557] nouveau  [     DRM] DCB version 3.0
[    1.789560] nouveau  [     DRM] DCB outp 00: 02000300 00000023
[    1.789563] nouveau  [     DRM] DCB outp 01: 03011312 00000000
[    1.789566] nouveau  [     DRM] DCB outp 02: 020023f1 0040c080
[    1.789569] nouveau  [     DRM] DCB conn 00: 0000
[    1.789572] nouveau  [     DRM] DCB conn 01: 0131
[    1.789575] nouveau  [     DRM] DCB conn 02: 0210
[    1.789577] nouveau  [     DRM] DCB conn 03: 0211
[    1.789580] nouveau  [     DRM] DCB conn 04: 0213
[    1.791153] nouveau  [     DRM] 0xD186: Parsing digital output script table
[    1.841924] nouveau  [     DRM] 1 available performance level(s)
[    1.841930] nouveau  [     DRM] 0: core 475MHz shader 475MHz fanspeed 100%
[    1.841932] nouveau  [     DRM] c:
[    1.843560] nouveau  [     DRM] MM: using M2MF for buffer copies
[    1.843567] nouveau  [     DRM] Setting dpms mode 3 on vga encoder (output
0)
[    1.843570] nouveau  [     DRM] Setting dpms mode 3 on tmds encoder (output
1)
[    1.843574] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 2)
[    1.878032] nouveau  [     DRM] Load detected on output B
[    1.892156] nouveau  [     DRM] allocated 1024x768 fb: 0x9000, bo
ffff880036fed400
[    1.892270] fbcon: nouveaufb (fb0) is primary device
[    1.902714] nouveau  [     DRM] Setting dpms mode 0 on vga encoder (output
0)
[    1.902716] nouveau  [     DRM] Output VGA-1 is running on CRTC 0 using
output B
[    1.903846] fb0: nouveaufb frame buffer device
[    1.903853] [drm] Initialized nouveau 1.1.0 20120801 for 0000:00:05.0 on
minor 0
[    1.980036] nouveau  [     DRM] Load detected on output B
[    2.081584] nouveau  [     DRM] Setting dpms mode 3 on vga encoder (output
0)
[    2.101978] nouveau  [     DRM] Setting dpms mode 0 on vga encoder (output
0)
[    2.101986] nouveau  [     DRM] Output VGA-1 is running on CRTC 0 using
output B
[   36.584586] nouveau  [     DRM] Setting dpms mode 3 on vga encoder (output
0)
[   36.604973] nouveau  [     DRM] Setting dpms mode 0 on vga encoder (output
0)
[   36.604978] nouveau  [     DRM] Output VGA-1 is running on CRTC 0 using
output B
[   37.232622] nouveau  [     DRM] Setting dpms mode 3 on vga encoder (output
0)
[   37.253031] nouveau  [     DRM] Setting dpms mode 0 on vga encoder (output
0)
[   37.253038] nouveau  [     DRM] Output VGA-1 is running on CRTC 0 using
output B
[   37.268629] nouveau  [     DRM] Setting dpms mode 3 on vga encoder (output
0)
[   37.289024] nouveau  [     DRM] Setting dpms mode 0 on vga encoder (output
0)
[   37.289028] nouveau  [     DRM] Output VGA-1 is running on CRTC 0 using
output B
[   37.381346] nouveau  [     DRM] Setting dpms mode 3 on vga encoder (output
0)
[   37.401716] nouveau  [     DRM] Setting dpms mode 0 on vga encoder (output
0)
[   37.401720] nouveau  [     DRM] Output VGA-1 is running on CRTC 0 using
output B
[   42.247520] nouveau  [     DRM] Setting dpms mode 3 on vga encoder (output
0)
[   42.267901] nouveau  [     DRM] Setting dpms mode 0 on vga encoder (output
0)
[   42.267906] nouveau  [     DRM] Output VGA-1 is running on CRTC 0 using
output B
[   55.168028] nouveau  [     DRM] Load detected on output B
[   55.185027] nouveau  [     DRM] Load detected on output B
[   58.741447] nouveau  [     DRM] Setting dpms mode 3 on vga encoder (output
0)
[   58.761829] nouveau  [     DRM] Setting dpms mode 0 on vga encoder (output
0)
[   58.761833] nouveau  [     DRM] Output VGA-1 is running on CRTC 0 using
output B
[   59.054034] nouveau  [     DRM] Load detected on output B
[   62.834059] nouveau  [     DRM] Load detected on output B
[   63.022824] nouveau  [     DRM] Load detected on output B
[   67.077190] nouveau E[     DRM] fail ttm_validate
[   67.077198] nouveau E[     DRM] validate vram_list
[   67.077208] nouveau E[     DRM] validate: -12
[   67.137161] nouveau E[     DRM] fail ttm_validate
[   67.137169] nouveau E[     DRM] validate vram_list
[   67.137175] nouveau E[     DRM] validate: -12
[   77.311034] nouveau  [     DRM] Load detected on output B
[   80.197045] nouveau  [     DRM] Load detected on output B
[   80.290070] nouveau  [     DRM] Load detected on output B
[   87.611597] nouveau E[     DRM] fail ttm_validate
[   87.611605] nouveau E[     DRM] validate vram_list
[   87.611611] nouveau E[     DRM] validate: -12
[   87.637939] nouveau E[     DRM] fail ttm_validate
[   87.637946] nouveau E[     DRM] validate vram_list
[   87.637950] nouveau E[     DRM] validate: -12
[  211.914453] nouveau  [     DRM] Setting dpms mode 3 on vga encoder (output
0)
[  211.934857] nouveau  [     DRM] Setting dpms mode 0 on vga encoder (output
0)
[  211.934862] nouveau  [     DRM] Output VGA-1 is running on CRTC 0 using
output B
[  256.428249] nouveau  [     DRM] Setting dpms mode 3 on vga encoder (output
0)
[  256.448634] nouveau  [     DRM] Setting dpms mode 0 on vga encoder (output
0)
[  256.448638] nouveau  [     DRM] Output VGA-1 is running on CRTC 0 using
output B
[  256.481072] nouveau  [     DRM] Load detected on output B

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1349263309.18dd13.8041
Date: Wed, 3 Oct 2012 11:21:49 +0000
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
   title="NEW --- - nouveau: NV4E acceleration corruption when DMA above 31-bit (2 Gig barrier)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=46557#c23">Comment # 23</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau: NV4E acceleration corruption when DMA above 31-bit (2 Gig barrier)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=46557">bug 46557</a>
              from <span class="vcard"><a class="email" href="mailto:baldur&#64;email.de" title="baldur&#64;email.de">baldur&#64;email.de</a>
</span></b>
        <pre>here is the output for nouveau from dmesg

[    1.098755] nouveau 0000:00:05.0: &gt;setting latency timer to 64
[    1.099370] nouveau  [  DEVICE][0000:00:05.0] BOOT0  : 0x04e000a2
[    1.099374] nouveau  [  DEVICE][0000:00:05.0] Chipset: C51 (NV4E)
[    1.099377] nouveau  [  DEVICE][0000:00:05.0] Family : NV40
[    1.100226] nouveau  [   VBIOS][0000:00:05.0] checking PRAMIN for image...
[    1.136693] nouveau  [   VBIOS][0000:00:05.0] ... appears to be valid
[    1.136696] nouveau  [   VBIOS][0000:00:05.0] using image from PRAMIN
[    1.136922] nouveau  [   VBIOS][0000:00:05.0] BIT signature found
[    1.136925] nouveau  [   VBIOS][0000:00:05.0] version 05.51.22.33
[    1.137122] nouveau  [     PFB][0000:00:05.0] RAM type: stolen system memory
[    1.137125] nouveau  [     PFB][0000:00:05.0] RAM size: 32 MiB
[    1.789533] nouveau  [     DRM] VRAM: 29 MiB
[    1.789540] nouveau  [     DRM] GART: 512 MiB
[    1.789546] nouveau  [     DRM] BIT BIOS found
[    1.789550] nouveau  [     DRM] Bios version 05.51.22.33
[    1.789554] nouveau  [     DRM] TMDS table version 1.1
[    1.789557] nouveau  [     DRM] DCB version 3.0
[    1.789560] nouveau  [     DRM] DCB outp 00: 02000300 00000023
[    1.789563] nouveau  [     DRM] DCB outp 01: 03011312 00000000
[    1.789566] nouveau  [     DRM] DCB outp 02: 020023f1 0040c080
[    1.789569] nouveau  [     DRM] DCB conn 00: 0000
[    1.789572] nouveau  [     DRM] DCB conn 01: 0131
[    1.789575] nouveau  [     DRM] DCB conn 02: 0210
[    1.789577] nouveau  [     DRM] DCB conn 03: 0211
[    1.789580] nouveau  [     DRM] DCB conn 04: 0213
[    1.791153] nouveau  [     DRM] 0xD186: Parsing digital output script table
[    1.841924] nouveau  [     DRM] 1 available performance level(s)
[    1.841930] nouveau  [     DRM] 0: core 475MHz shader 475MHz fanspeed 100%
[    1.841932] nouveau  [     DRM] c:
[    1.843560] nouveau  [     DRM] MM: using M2MF for buffer copies
[    1.843567] nouveau  [     DRM] Setting dpms mode 3 on vga encoder (output
0)
[    1.843570] nouveau  [     DRM] Setting dpms mode 3 on tmds encoder (output
1)
[    1.843574] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 2)
[    1.878032] nouveau  [     DRM] Load detected on output B
[    1.892156] nouveau  [     DRM] allocated 1024x768 fb: 0x9000, bo
ffff880036fed400
[    1.892270] fbcon: nouveaufb (fb0) is primary device
[    1.902714] nouveau  [     DRM] Setting dpms mode 0 on vga encoder (output
0)
[    1.902716] nouveau  [     DRM] Output VGA-1 is running on CRTC 0 using
output B
[    1.903846] fb0: nouveaufb frame buffer device
[    1.903853] [drm] Initialized nouveau 1.1.0 20120801 for 0000:00:05.0 on
minor 0
[    1.980036] nouveau  [     DRM] Load detected on output B
[    2.081584] nouveau  [     DRM] Setting dpms mode 3 on vga encoder (output
0)
[    2.101978] nouveau  [     DRM] Setting dpms mode 0 on vga encoder (output
0)
[    2.101986] nouveau  [     DRM] Output VGA-1 is running on CRTC 0 using
output B
[   36.584586] nouveau  [     DRM] Setting dpms mode 3 on vga encoder (output
0)
[   36.604973] nouveau  [     DRM] Setting dpms mode 0 on vga encoder (output
0)
[   36.604978] nouveau  [     DRM] Output VGA-1 is running on CRTC 0 using
output B
[   37.232622] nouveau  [     DRM] Setting dpms mode 3 on vga encoder (output
0)
[   37.253031] nouveau  [     DRM] Setting dpms mode 0 on vga encoder (output
0)
[   37.253038] nouveau  [     DRM] Output VGA-1 is running on CRTC 0 using
output B
[   37.268629] nouveau  [     DRM] Setting dpms mode 3 on vga encoder (output
0)
[   37.289024] nouveau  [     DRM] Setting dpms mode 0 on vga encoder (output
0)
[   37.289028] nouveau  [     DRM] Output VGA-1 is running on CRTC 0 using
output B
[   37.381346] nouveau  [     DRM] Setting dpms mode 3 on vga encoder (output
0)
[   37.401716] nouveau  [     DRM] Setting dpms mode 0 on vga encoder (output
0)
[   37.401720] nouveau  [     DRM] Output VGA-1 is running on CRTC 0 using
output B
[   42.247520] nouveau  [     DRM] Setting dpms mode 3 on vga encoder (output
0)
[   42.267901] nouveau  [     DRM] Setting dpms mode 0 on vga encoder (output
0)
[   42.267906] nouveau  [     DRM] Output VGA-1 is running on CRTC 0 using
output B
[   55.168028] nouveau  [     DRM] Load detected on output B
[   55.185027] nouveau  [     DRM] Load detected on output B
[   58.741447] nouveau  [     DRM] Setting dpms mode 3 on vga encoder (output
0)
[   58.761829] nouveau  [     DRM] Setting dpms mode 0 on vga encoder (output
0)
[   58.761833] nouveau  [     DRM] Output VGA-1 is running on CRTC 0 using
output B
[   59.054034] nouveau  [     DRM] Load detected on output B
[   62.834059] nouveau  [     DRM] Load detected on output B
[   63.022824] nouveau  [     DRM] Load detected on output B
[   67.077190] nouveau E[     DRM] fail ttm_validate
[   67.077198] nouveau E[     DRM] validate vram_list
[   67.077208] nouveau E[     DRM] validate: -12
[   67.137161] nouveau E[     DRM] fail ttm_validate
[   67.137169] nouveau E[     DRM] validate vram_list
[   67.137175] nouveau E[     DRM] validate: -12
[   77.311034] nouveau  [     DRM] Load detected on output B
[   80.197045] nouveau  [     DRM] Load detected on output B
[   80.290070] nouveau  [     DRM] Load detected on output B
[   87.611597] nouveau E[     DRM] fail ttm_validate
[   87.611605] nouveau E[     DRM] validate vram_list
[   87.611611] nouveau E[     DRM] validate: -12
[   87.637939] nouveau E[     DRM] fail ttm_validate
[   87.637946] nouveau E[     DRM] validate vram_list
[   87.637950] nouveau E[     DRM] validate: -12
[  211.914453] nouveau  [     DRM] Setting dpms mode 3 on vga encoder (output
0)
[  211.934857] nouveau  [     DRM] Setting dpms mode 0 on vga encoder (output
0)
[  211.934862] nouveau  [     DRM] Output VGA-1 is running on CRTC 0 using
output B
[  256.428249] nouveau  [     DRM] Setting dpms mode 3 on vga encoder (output
0)
[  256.448634] nouveau  [     DRM] Setting dpms mode 0 on vga encoder (output
0)
[  256.448638] nouveau  [     DRM] Output VGA-1 is running on CRTC 0 using
output B
[  256.481072] nouveau  [     DRM] Load detected on output B</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1349263309.18dd13.8041--

--===============1855606725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1855606725==--
