From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 55449] New: Problems identifying card
Date: Sat, 29 Sep 2012 12:28:28 +0000
Message-ID: <bug-55449-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2012254704=="
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


--===============2012254704==
Content-Type: multipart/alternative; boundary="1348921709.0b861.30721"; charset="us-ascii"


--1348921709.0b861.30721
Date: Sat, 29 Sep 2012 12:28:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=55449

          Priority: medium
            Bug ID: 55449
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Problems identifying card
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: PowerPC
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

I'm trying to bootstrap nouveau on the NV15 (Geforce 2 GTS / Asus V7700 TVR)
card on my PowerPC board. System hangs early if the driver is made builtin into
the kernel. I tried building the  driver as module and here is the log:


nouveau 0000:f0:10.0: enabling device (0000 -> 0002)
nouveau 0000:f0:10.0: enabling bus mastering
[drm] nouveau 0000:f0:10.0: Detected an NV30 generation card (0xa3005001)
[drm] nouveau 0000:f0:10.0: Unable to get the OF node
[drm] nouveau 0000:f0:10.0: Checking PRAMIN for VBIOS
[drm] nouveau 0000:f0:10.0: ... BIOS signature not found
[drm] nouveau 0000:f0:10.0: Checking PROM for VBIOS
[drm] nouveau 0000:f0:10.0: ... appears to be valid
[drm] nouveau 0000:f0:10.0: Using VBIOS from PROM
[drm] nouveau 0000:f0:10.0: BMP BIOS found
[drm] nouveau 0000:f0:10.0: BMP version 5.6
[drm] nouveau 0000:f0:10.0: Bios version 02.15.01.14
[drm] nouveau 0000:f0:10.0: No useful DCB data in VBIOS
[drm] nouveau 0000:f0:10.0: MXM: no VBIOS data, nothing to do
[drm] nouveau 0000:f0:10.0: Adaptor not initialised, running VBIOS init tables.
[drm] nouveau 0000:f0:10.0: PTIMER: unknown input clock freq
[TTM] Zone  kernel: Available graphics memory: 501592 kiB
[TTM] Initializing pool allocator
[TTM] Initializing DMA pool allocator
[drm] nouveau 0000:f0:10.0: Detected 0MiB VRAM (SDRAM)
[drm] nouveau 0000:f0:10.0: 128 MiB GART (aperture)
[drm:drm_mm_takedown] *ERROR* Memory manager not clean. Delaying takedown
[drm:drm_mm_takedown] *ERROR* Memory manager not clean. Delaying takedown
[TTM] Finalizing pool allocator
[TTM] Finalizing DMA pool allocator
[TTM] Zone  kernel: Used memory at exit: 9 kiB
nouveau: probe of 0000:f0:10.0 failed with error -22


System information: PowerPC 970FX, Linux v3.6-rc7. AGP GART support is disabled
as AGP is not working properly on this system.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1348921709.0b861.30721
Date: Sat, 29 Sep 2012 12:28:29 +0000
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
   title="NEW --- - Problems identifying card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55449">55449</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Problems identifying card
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
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>dbaryshkov&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>PowerPC
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
        <pre>I'm trying to bootstrap nouveau on the NV15 (Geforce 2 GTS / Asus V7700 TVR)
card on my PowerPC board. System hangs early if the driver is made builtin into
the kernel. I tried building the  driver as module and here is the log:


nouveau 0000:f0:10.0: enabling device (0000 -&gt; 0002)
nouveau 0000:f0:10.0: enabling bus mastering
[drm] nouveau 0000:f0:10.0: Detected an NV30 generation card (0xa3005001)
[drm] nouveau 0000:f0:10.0: Unable to get the OF node
[drm] nouveau 0000:f0:10.0: Checking PRAMIN for VBIOS
[drm] nouveau 0000:f0:10.0: ... BIOS signature not found
[drm] nouveau 0000:f0:10.0: Checking PROM for VBIOS
[drm] nouveau 0000:f0:10.0: ... appears to be valid
[drm] nouveau 0000:f0:10.0: Using VBIOS from PROM
[drm] nouveau 0000:f0:10.0: BMP BIOS found
[drm] nouveau 0000:f0:10.0: BMP version 5.6
[drm] nouveau 0000:f0:10.0: Bios version 02.15.01.14
[drm] nouveau 0000:f0:10.0: No useful DCB data in VBIOS
[drm] nouveau 0000:f0:10.0: MXM: no VBIOS data, nothing to do
[drm] nouveau 0000:f0:10.0: Adaptor not initialised, running VBIOS init tables.
[drm] nouveau 0000:f0:10.0: PTIMER: unknown input clock freq
[TTM] Zone  kernel: Available graphics memory: 501592 kiB
[TTM] Initializing pool allocator
[TTM] Initializing DMA pool allocator
[drm] nouveau 0000:f0:10.0: Detected 0MiB VRAM (SDRAM)
[drm] nouveau 0000:f0:10.0: 128 MiB GART (aperture)
[drm:drm_mm_takedown] *ERROR* Memory manager not clean. Delaying takedown
[drm:drm_mm_takedown] *ERROR* Memory manager not clean. Delaying takedown
[TTM] Finalizing pool allocator
[TTM] Finalizing DMA pool allocator
[TTM] Zone  kernel: Used memory at exit: 9 kiB
nouveau: probe of 0000:f0:10.0 failed with error -22


System information: PowerPC 970FX, Linux v3.6-rc7. AGP GART support is disabled
as AGP is not working properly on this system.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1348921709.0b861.30721--

--===============2012254704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2012254704==--
