From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66176] New: nouveau.perflvl kernel parameter doesn't
	work
Date: Tue, 25 Jun 2013 22:17:34 +0000
Message-ID: <bug-66176-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1467670094=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1467670094==
Content-Type: multipart/alternative; boundary="1372198654.EFC60b411.7546"; charset="us-ascii"


--1372198654.EFC60b411.7546
Date: Tue, 25 Jun 2013 22:17:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66176

          Priority: medium
            Bug ID: 66176
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: nouveau.perflvl kernel parameter doesn't work
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

When I specify the following kernel parameter - "nouveau.perflvl=0,0" (that is
in addition to "nouveau.perflvl_wr=7777"), I get the following error during
boot up (and afterwards, when I try to make this change manually):

kernel: [drm] Initialized drm 1.1.0 20060810
kernel: nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x049200a2
kernel: nouveau  [  DEVICE][0000:01:00.0] Chipset: G71 (NV49)
kernel: nouveau  [  DEVICE][0000:01:00.0] Family : NV40
kernel: nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
kernel: nouveau  [   VBIOS][0000:01:00.0] ... checksum invalid
kernel: nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
kernel: nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
kernel: nouveau  [   VBIOS][0000:01:00.0] using image from PROM
kernel: nouveau  [   VBIOS][0000:01:00.0] BIT signature found
kernel: nouveau  [   VBIOS][0000:01:00.0] version 05.71.22.21.0a
kernel: nouveau  [     PFB][0000:01:00.0] RAM type: GDDR3
kernel: nouveau  [     PFB][0000:01:00.0] RAM size: 256 MiB
kernel: nouveau  [     PFB][0000:01:00.0]    ZCOMP: 294912 tags
kernel: nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
kernel: nouveau  [  PTHERM][0000:01:00.0] fan management: disabled
kernel: nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
kernel: nouveau  [  PTHERM][0000:01:00.0] programmed thresholds [ 90(3), 95(3),
115(2), 135(5) ]
kernel: agpgart-via 0000:00:00.0: AGP 3.5 bridge
kernel: agpgart: modprobe tried to set rate=x12. Setting to AGP3 x8 mode.
kernel: agpgart-via 0000:00:00.0: putting AGP V3 device into 8x mode
kernel: nouveau 0000:01:00.0: putting AGP V3 device into 8x mode
kernel: [TTM] Zone  kernel: Available graphics memory: 1026356 kiB
kernel: [TTM] Initializing pool allocator
kernel: [TTM] Initializing DMA pool allocator
kernel: nouveau  [     DRM] VRAM: 251 MiB
kernel: nouveau  [     DRM] GART: 256 MiB
kernel: nouveau  [     DRM] TMDS table version 1.1
kernel: nouveau W[     DRM] TMDS table script pointers not stubbed
kernel: nouveau  [     DRM] DCB version 3.0
kernel: nouveau  [     DRM] DCB outp 00: 04011310 00000028
kernel: nouveau  [     DRM] DCB outp 01: 0c011312 00000000
kernel: nouveau  [     DRM] DCB outp 02: 01000300 00000028
kernel: nouveau  [     DRM] DCB outp 03: 020223f1 00c0c083
kernel: nouveau  [     DRM] DCB conn 00: 0000
kernel: nouveau  [     DRM] DCB conn 01: 2130
kernel: nouveau  [     DRM] DCB conn 02: 0210
kernel: nouveau  [     DRM] DCB conn 03: 0211
kernel: nouveau  [     DRM] DCB conn 04: 0213
kernel: nouveau  [     DRM] Saving VGA fonts
kernel: [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
kernel: [drm] No driver support for vblank timestamp query.
kernel: nouveau  [     DRM] 0xD3FB: Parsing digital output script table
kernel: nouveau  [     DRM] 4 available performance level(s)
kernel: nouveau  [     DRM] 0: core 275MHz shader 275MHz memory 600MHz voltage
1050mV fanspeed 40%
kernel: nouveau  [     DRM] 1: core 400MHz shader 400MHz memory 625MHz voltage
1100mV fanspeed 70%
kernel: nouveau  [     DRM] 2: core 440MHz shader 440MHz memory 650MHz voltage
1100mV fanspeed 79%
kernel: nouveau  [     DRM] 3: core 487MHz shader 487MHz memory 695MHz voltage
1200mV fanspeed 100%
kernel: nouveau  [     DRM] c: core 275MHz shader 275MHz memory 600MHz voltage
1050mV fanspeed 100%
kernel: nouveau  [     DRM] setting performance level: 0
kernel: nouveau E[     DRM] fanspeed set failed: -22
kernel: nouveau  [     DRM] > reclocking failed: -34
kernel: 
kernel: nouveau  [     DRM] > reclocking took 83072ns
kernel: 
kernel: nouveau  [     DRM] MM: using M2MF for buffer copies
kernel: nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 3)
kernel: nouveau  [     DRM] allocated 1600x1200 fb: 0x9000, bo ffff8800375e6800
kernel: fbcon: nouveaufb (fb0) is primary device
kernel: nouveau  [     DRM] 0xD3FB: Parsing digital output script table
kernel: Console: switching to colour frame buffer device 200x75
kernel: nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
kernel: nouveau 0000:01:00.0: registered panic notifier
kernel: [drm] Initialized nouveau 1.1.0 20120801 for 0000:01:00.0 on minor 0

When I try to do this from the command line with "echo 0,0 >
/sys/class/hwmon/hwmon0/device/performance_level" I get the exact same error:

kernel: nouveau  [     DRM] setting performance level: 0
kernel: nouveau E[     DRM] fanspeed set failed: -22
kernel: nouveau  [     DRM] > reclocking failed: -34
kernel: 
kernel: nouveau  [     DRM] > reclocking took 25088ns
kernel: 

The kernel in use is 3.9.6 with the stock-supplied nouveau driver.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372198654.EFC60b411.7546
Date: Tue, 25 Jun 2013 22:17:34 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau.perflvl kernel parameter doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66176">66176</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau.perflvl kernel parameter doesn't work
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>mr.dash.four&#64;googlemail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When I specify the following kernel parameter - &quot;nouveau.perflvl=0,0&quot; (that is
in addition to &quot;nouveau.perflvl_wr=7777&quot;), I get the following error during
boot up (and afterwards, when I try to make this change manually):

kernel: [drm] Initialized drm 1.1.0 20060810
kernel: nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x049200a2
kernel: nouveau  [  DEVICE][0000:01:00.0] Chipset: G71 (NV49)
kernel: nouveau  [  DEVICE][0000:01:00.0] Family : NV40
kernel: nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
kernel: nouveau  [   VBIOS][0000:01:00.0] ... checksum invalid
kernel: nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
kernel: nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
kernel: nouveau  [   VBIOS][0000:01:00.0] using image from PROM
kernel: nouveau  [   VBIOS][0000:01:00.0] BIT signature found
kernel: nouveau  [   VBIOS][0000:01:00.0] version 05.71.22.21.0a
kernel: nouveau  [     PFB][0000:01:00.0] RAM type: GDDR3
kernel: nouveau  [     PFB][0000:01:00.0] RAM size: 256 MiB
kernel: nouveau  [     PFB][0000:01:00.0]    ZCOMP: 294912 tags
kernel: nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
kernel: nouveau  [  PTHERM][0000:01:00.0] fan management: disabled
kernel: nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
kernel: nouveau  [  PTHERM][0000:01:00.0] programmed thresholds [ 90(3), 95(3),
115(2), 135(5) ]
kernel: agpgart-via 0000:00:00.0: AGP 3.5 bridge
kernel: agpgart: modprobe tried to set rate=x12. Setting to AGP3 x8 mode.
kernel: agpgart-via 0000:00:00.0: putting AGP V3 device into 8x mode
kernel: nouveau 0000:01:00.0: putting AGP V3 device into 8x mode
kernel: [TTM] Zone  kernel: Available graphics memory: 1026356 kiB
kernel: [TTM] Initializing pool allocator
kernel: [TTM] Initializing DMA pool allocator
kernel: nouveau  [     DRM] VRAM: 251 MiB
kernel: nouveau  [     DRM] GART: 256 MiB
kernel: nouveau  [     DRM] TMDS table version 1.1
kernel: nouveau W[     DRM] TMDS table script pointers not stubbed
kernel: nouveau  [     DRM] DCB version 3.0
kernel: nouveau  [     DRM] DCB outp 00: 04011310 00000028
kernel: nouveau  [     DRM] DCB outp 01: 0c011312 00000000
kernel: nouveau  [     DRM] DCB outp 02: 01000300 00000028
kernel: nouveau  [     DRM] DCB outp 03: 020223f1 00c0c083
kernel: nouveau  [     DRM] DCB conn 00: 0000
kernel: nouveau  [     DRM] DCB conn 01: 2130
kernel: nouveau  [     DRM] DCB conn 02: 0210
kernel: nouveau  [     DRM] DCB conn 03: 0211
kernel: nouveau  [     DRM] DCB conn 04: 0213
kernel: nouveau  [     DRM] Saving VGA fonts
kernel: [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
kernel: [drm] No driver support for vblank timestamp query.
kernel: nouveau  [     DRM] 0xD3FB: Parsing digital output script table
kernel: nouveau  [     DRM] 4 available performance level(s)
kernel: nouveau  [     DRM] 0: core 275MHz shader 275MHz memory 600MHz voltage
1050mV fanspeed 40%
kernel: nouveau  [     DRM] 1: core 400MHz shader 400MHz memory 625MHz voltage
1100mV fanspeed 70%
kernel: nouveau  [     DRM] 2: core 440MHz shader 440MHz memory 650MHz voltage
1100mV fanspeed 79%
kernel: nouveau  [     DRM] 3: core 487MHz shader 487MHz memory 695MHz voltage
1200mV fanspeed 100%
kernel: nouveau  [     DRM] c: core 275MHz shader 275MHz memory 600MHz voltage
1050mV fanspeed 100%
kernel: nouveau  [     DRM] setting performance level: 0
kernel: nouveau E[     DRM] fanspeed set failed: -22
kernel: nouveau  [     DRM] &gt; reclocking failed: -34
kernel: 
kernel: nouveau  [     DRM] &gt; reclocking took 83072ns
kernel: 
kernel: nouveau  [     DRM] MM: using M2MF for buffer copies
kernel: nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 3)
kernel: nouveau  [     DRM] allocated 1600x1200 fb: 0x9000, bo ffff8800375e6800
kernel: fbcon: nouveaufb (fb0) is primary device
kernel: nouveau  [     DRM] 0xD3FB: Parsing digital output script table
kernel: Console: switching to colour frame buffer device 200x75
kernel: nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
kernel: nouveau 0000:01:00.0: registered panic notifier
kernel: [drm] Initialized nouveau 1.1.0 20120801 for 0000:01:00.0 on minor 0

When I try to do this from the command line with &quot;echo 0,0 &gt;
/sys/class/hwmon/hwmon0/device/performance_level&quot; I get the exact same error:

kernel: nouveau  [     DRM] setting performance level: 0
kernel: nouveau E[     DRM] fanspeed set failed: -22
kernel: nouveau  [     DRM] &gt; reclocking failed: -34
kernel: 
kernel: nouveau  [     DRM] &gt; reclocking took 25088ns
kernel: 

The kernel in use is 3.9.6 with the stock-supplied nouveau driver.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1372198654.EFC60b411.7546--

--===============1467670094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1467670094==--
