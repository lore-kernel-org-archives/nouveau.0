From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63135] [bisected] G69/nv50 DisplayPort dual-head
 fails to switch to KMS
Date: Thu, 16 May 2013 08:37:20 +0000
Message-ID: <bug-63135-8800-ne0MT90HTr@http.bugs.freedesktop.org/>
References: <bug-63135-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1424748060=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-63135-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1424748060==
Content-Type: multipart/alternative; boundary="1368693440.50C8De011.23796"; charset="us-ascii"


--1368693440.50C8De011.23796
Date: Thu, 16 May 2013 08:37:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63135

poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Severity|normal                      |critical
           Priority|medium                      |highest

--- Comment #5 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

"nouveau E[    PBUS][0000:01:00.0] MMIO read of 0xFOO FAULT at 0xBAR"

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation ION VGA
[10de:087d] (rev b1)
3.9.2-200.fc18.x86_64
..
fb: conflicting fb hw usage nouveaufb vs VESA VGA - removing generic driver
nouveau 0000:01:00.0: setting latency timer to 64
nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0ace80b1
nouveau  [  DEVICE][0000:01:00.0] Chipset: MCP79/MCP7A (NVAC)
nouveau  [  DEVICE][0000:01:00.0] Family : NV50
nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
nouveau  [   VBIOS][0000:01:00.0] BIT signature found
nouveau  [   VBIOS][0000:01:00.0] version 62.79.78.00.00
nouveau  [     PFB][0000:01:00.0] RAM type: stolen system memory
nouveau  [     PFB][0000:01:00.0] RAM size: 256 MiB
nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
nouveau  [  PTHERM][0000:01:00.0] fan management: disabled
nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
nouveau  [  PTHERM][0000:01:00.0] Programmed thresholds [ 90(3), 95(3), 95(2),
135(5) ]
nouveau  [     DRM] VRAM: 256 MiB
nouveau  [     DRM] GART: 512 MiB
nouveau  [     DRM] TMDS table version 2.0
nouveau  [     DRM] DCB version 4.0
nouveau  [     DRM] DCB outp 00: 02000300 0000001e
nouveau  [     DRM] DCB outp 01: 01011322 00000030
nouveau  [     DRM] DCB outp 02: 02022332 00020010
nouveau  [     DRM] DCB conn 00: 00000000
nouveau  [     DRM] DCB conn 01: 00001131
nouveau  [     DRM] DCB conn 02: 00002261
***************************************************************************
nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00030003 FAULT at 0x100220
nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000008 FAULT at 0x100228
nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000008 FAULT at 0x10022c
nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000008 FAULT at 0x100234
nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000008 FAULT at 0x100240
nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000008 FAULT at 0x1002c0
nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000008 FAULT at 0x1002c4
nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000008 FAULT at 0x1002e4
***************************************************************************
nouveau  [     DRM] 4 available performance level(s)
nouveau  [     DRM] 0: core 200MHz shader 400MHz voltage 1010mV fanspeed 60%
nouveau  [     DRM] 1: core 300MHz shader 600MHz voltage 1010mV fanspeed 100%
nouveau  [     DRM] 2: core 350MHz shader 800MHz voltage 1010mV fanspeed 100%
nouveau  [     DRM] 3: core 450MHz shader 1100MHz voltage 1010mV fanspeed 100%
nouveau  [     DRM] c:
nouveau  [     DRM] MM: using M2MF for buffer copies
nouveau  [     DRM] allocated 800x600 fb: 0x50000, bo ffff8800c81b0800
fbcon: nouveaufb (fb0) is primary device
nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[drm] Initialized nouveau 1.1.0 20120801 for 0000:01:00.0 on minor 1
..

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1368693440.50C8De011.23796
Date: Thu, 16 May 2013 08:37:20 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [bisected] G69/nv50 DisplayPort dual-head fails to switch to KMS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63135">bug 63135</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Severity</td>
           <td>normal
           </td>
           <td>critical
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Priority</td>
           <td>medium
           </td>
           <td>highest
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [bisected] G69/nv50 DisplayPort dual-head fails to switch to KMS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63135#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [bisected] G69/nv50 DisplayPort dual-head fails to switch to KMS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63135">bug 63135</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
&quot;nouveau E[    PBUS][0000:01:00.0] MMIO read of 0xFOO FAULT at 0xBAR&quot;

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation ION VGA
[10de:087d] (rev b1)
3.9.2-200.fc18.x86_64
..
fb: conflicting fb hw usage nouveaufb vs VESA VGA - removing generic driver
nouveau 0000:01:00.0: setting latency timer to 64
nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0ace80b1
nouveau  [  DEVICE][0000:01:00.0] Chipset: MCP79/MCP7A (NVAC)
nouveau  [  DEVICE][0000:01:00.0] Family : NV50
nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
nouveau  [   VBIOS][0000:01:00.0] BIT signature found
nouveau  [   VBIOS][0000:01:00.0] version 62.79.78.00.00
nouveau  [     PFB][0000:01:00.0] RAM type: stolen system memory
nouveau  [     PFB][0000:01:00.0] RAM size: 256 MiB
nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
nouveau  [  PTHERM][0000:01:00.0] fan management: disabled
nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
nouveau  [  PTHERM][0000:01:00.0] Programmed thresholds [ 90(3), 95(3), 95(2),
135(5) ]
nouveau  [     DRM] VRAM: 256 MiB
nouveau  [     DRM] GART: 512 MiB
nouveau  [     DRM] TMDS table version 2.0
nouveau  [     DRM] DCB version 4.0
nouveau  [     DRM] DCB outp 00: 02000300 0000001e
nouveau  [     DRM] DCB outp 01: 01011322 00000030
nouveau  [     DRM] DCB outp 02: 02022332 00020010
nouveau  [     DRM] DCB conn 00: 00000000
nouveau  [     DRM] DCB conn 01: 00001131
nouveau  [     DRM] DCB conn 02: 00002261
***************************************************************************
nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00030003 FAULT at 0x100220
nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000008 FAULT at 0x100228
nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000008 FAULT at 0x10022c
nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000008 FAULT at 0x100234
nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000008 FAULT at 0x100240
nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000008 FAULT at 0x1002c0
nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000008 FAULT at 0x1002c4
nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000008 FAULT at 0x1002e4
***************************************************************************
nouveau  [     DRM] 4 available performance level(s)
nouveau  [     DRM] 0: core 200MHz shader 400MHz voltage 1010mV fanspeed 60%
nouveau  [     DRM] 1: core 300MHz shader 600MHz voltage 1010mV fanspeed 100%
nouveau  [     DRM] 2: core 350MHz shader 800MHz voltage 1010mV fanspeed 100%
nouveau  [     DRM] 3: core 450MHz shader 1100MHz voltage 1010mV fanspeed 100%
nouveau  [     DRM] c:
nouveau  [     DRM] MM: using M2MF for buffer copies
nouveau  [     DRM] allocated 800x600 fb: 0x50000, bo ffff8800c81b0800
fbcon: nouveaufb (fb0) is primary device
nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[drm] Initialized nouveau 1.1.0 20120801 for 0000:01:00.0 on minor 1
..</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1368693440.50C8De011.23796--

--===============1424748060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1424748060==--
