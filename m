From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70213] New: [git-v3.12-rc3 + nouveau HEAD] Vmalloc
 failure -> pci_pm_freeze(): nouveau_pmops_freeze+0x0/0x50 returns -12
Date: Mon, 07 Oct 2013 05:27:25 +0000
Message-ID: <bug-70213-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0103143516=="
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


--===============0103143516==
Content-Type: multipart/alternative; boundary="1381123645.DC221.5254"; charset="us-ascii"


--1381123645.DC221.5254
Date: Mon, 7 Oct 2013 05:27:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70213

          Priority: medium
            Bug ID: 70213
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [git-v3.12-rc3 + nouveau HEAD] Vmalloc failure ->
                    pci_pm_freeze(): nouveau_pmops_freeze+0x0/0x50 returns
                    -12
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 87219
  --> https://bugs.freedesktop.org/attachment.cgi?id=87219&action=edit
Dmesg containing failed s2disk output.

Tried to do s2disk under high memory pressure. I have attached a dmesg
excluding the noise from my firewall and wireless card. The log has wrapped due
to these messages so it's starting exactly at the point where I do 's2disk'.

This is the card:

[    0.355731] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0d90a0a1
[    0.355734] nouveau  [  DEVICE][0000:01:00.0] Chipset: GF119 (NVD9)
[    0.355737] nouveau  [  DEVICE][0000:01:00.0] Family : NVD0
[    0.356330] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    0.429669] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    0.429671] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    0.429874] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    0.429878] nouveau  [   VBIOS][0000:01:00.0] version 75.19.55.00.02
[    0.430371] nouveau 0000:01:00.0: irq 44 for MSI/MSI-X
[    0.430381] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    0.430413] nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
[    0.430416] nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB
[    0.430418] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    0.453371] nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
[    0.453393] nouveau  [  PTHERM][0000:01:00.0] fan management: disabled
[    0.453398] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    0.455773] [TTM] Zone  kernel: Available graphics memory: 1025304 kiB
[    0.455775] [TTM] Initializing pool allocator
[    0.455782] [TTM] Initializing DMA pool allocator
[    0.455794] nouveau  [     DRM] VRAM: 1024 MiB
[    0.455797] nouveau  [     DRM] GART: 1048576 MiB
[    0.455802] nouveau  [     DRM] TMDS table version 2.0
[    0.455804] nouveau  [     DRM] DCB version 4.0
[    0.455807] nouveau  [     DRM] DCB outp 00: 02000300 00000000
[    0.455810] nouveau  [     DRM] DCB outp 01: 01000302 00020030
[    0.455812] nouveau  [     DRM] DCB outp 02: 02011362 00020010
[    0.455815] nouveau  [     DRM] DCB outp 03: 04022310 00000000
[    0.455817] nouveau  [     DRM] DCB conn 00: 00001030
[    0.455820] nouveau  [     DRM] DCB conn 01: 00002161
[    0.455822] nouveau  [     DRM] DCB conn 02: 00000200
[    0.456951] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    0.456953] [drm] No driver support for vblank timestamp query.
[    0.457177] nouveau  [     DRM] 2 available performance level(s)
[    0.457181] nouveau  [     DRM] 1: core 270MHz shader 540MHz memory 405MHz
voltage 900mV
[    0.457185] nouveau  [     DRM] 3: core 810MHz shader 1620MHz memory 500MHz
voltage 1110mV
[    0.457189] nouveau  [     DRM] c: core 270MHz shader 540MHz memory 405MHz
voltage 900mV fanspeed 40%
[    0.461446] nouveau  [     DRM] MM: using COPY0 for buffer copies
[    0.537183] nouveau  [     DRM] allocated 1280x1024 fb: 0x60000, bo
ffff88007cc94000
[    0.537284] fbcon: nouveaufb (fb0) is primary device
[    0.605604] Console: switching to colour frame buffer device 160x64
[    0.607900] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    0.607902] nouveau 0000:01:00.0: registered panic notifier
[    0.607908] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381123645.DC221.5254
Date: Mon, 7 Oct 2013 05:27:25 +0000
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
   title="NEW --- - [git-v3.12-rc3 + nouveau HEAD] Vmalloc failure -&gt; pci_pm_freeze(): nouveau_pmops_freeze+0x0/0x50 returns -12"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70213">70213</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[git-v3.12-rc3 + nouveau HEAD] Vmalloc failure -&gt; pci_pm_freeze(): nouveau_pmops_freeze+0x0/0x50 returns -12
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
          <td>ronald645&#64;gmail.com
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
          <td>git
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
        <pre>Created <span class=""><a href="attachment.cgi?id=87219" name="attach_87219" title="Dmesg containing failed s2disk output.">attachment 87219</a> <a href="attachment.cgi?id=87219&amp;action=edit" title="Dmesg containing failed s2disk output.">[details]</a></span>
Dmesg containing failed s2disk output.

Tried to do s2disk under high memory pressure. I have attached a dmesg
excluding the noise from my firewall and wireless card. The log has wrapped due
to these messages so it's starting exactly at the point where I do 's2disk'.

This is the card:

[    0.355731] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0d90a0a1
[    0.355734] nouveau  [  DEVICE][0000:01:00.0] Chipset: GF119 (NVD9)
[    0.355737] nouveau  [  DEVICE][0000:01:00.0] Family : NVD0
[    0.356330] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    0.429669] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    0.429671] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    0.429874] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    0.429878] nouveau  [   VBIOS][0000:01:00.0] version 75.19.55.00.02
[    0.430371] nouveau 0000:01:00.0: irq 44 for MSI/MSI-X
[    0.430381] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    0.430413] nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
[    0.430416] nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB
[    0.430418] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    0.453371] nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
[    0.453393] nouveau  [  PTHERM][0000:01:00.0] fan management: disabled
[    0.453398] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    0.455773] [TTM] Zone  kernel: Available graphics memory: 1025304 kiB
[    0.455775] [TTM] Initializing pool allocator
[    0.455782] [TTM] Initializing DMA pool allocator
[    0.455794] nouveau  [     DRM] VRAM: 1024 MiB
[    0.455797] nouveau  [     DRM] GART: 1048576 MiB
[    0.455802] nouveau  [     DRM] TMDS table version 2.0
[    0.455804] nouveau  [     DRM] DCB version 4.0
[    0.455807] nouveau  [     DRM] DCB outp 00: 02000300 00000000
[    0.455810] nouveau  [     DRM] DCB outp 01: 01000302 00020030
[    0.455812] nouveau  [     DRM] DCB outp 02: 02011362 00020010
[    0.455815] nouveau  [     DRM] DCB outp 03: 04022310 00000000
[    0.455817] nouveau  [     DRM] DCB conn 00: 00001030
[    0.455820] nouveau  [     DRM] DCB conn 01: 00002161
[    0.455822] nouveau  [     DRM] DCB conn 02: 00000200
[    0.456951] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    0.456953] [drm] No driver support for vblank timestamp query.
[    0.457177] nouveau  [     DRM] 2 available performance level(s)
[    0.457181] nouveau  [     DRM] 1: core 270MHz shader 540MHz memory 405MHz
voltage 900mV
[    0.457185] nouveau  [     DRM] 3: core 810MHz shader 1620MHz memory 500MHz
voltage 1110mV
[    0.457189] nouveau  [     DRM] c: core 270MHz shader 540MHz memory 405MHz
voltage 900mV fanspeed 40%
[    0.461446] nouveau  [     DRM] MM: using COPY0 for buffer copies
[    0.537183] nouveau  [     DRM] allocated 1280x1024 fb: 0x60000, bo
ffff88007cc94000
[    0.537284] fbcon: nouveaufb (fb0) is primary device
[    0.605604] Console: switching to colour frame buffer device 160x64
[    0.607900] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    0.607902] nouveau 0000:01:00.0: registered panic notifier
[    0.607908] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
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

--1381123645.DC221.5254--

--===============0103143516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0103143516==--
