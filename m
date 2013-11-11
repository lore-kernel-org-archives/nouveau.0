From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71472] New: GT-740M not detected
Date: Mon, 11 Nov 2013 09:00:27 +0000
Message-ID: <bug-71472-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0523376330=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0523376330==
Content-Type: multipart/alternative; boundary="1384160427.15aB80c1.17129"; charset="us-ascii"


--1384160427.15aB80c1.17129
Date: Mon, 11 Nov 2013 09:00:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71472

          Priority: medium
            Bug ID: 71472
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: GT-740M not detected
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: temnota.am-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

GK208M not detected by kernel driver. 

[  206.920626] ACPI Warning: \_SB_.PCI0.GFX0._DSM: Argument #4 type mismatch -
Found [Integer], ACPI requires [Package] (20130725/nsarguments-95)
[  206.920693] ACPI Warning: \_SB_.PCI0.GFX0._DSM: Argument #4 type mismatch -
Found [Buffer], ACPI requires [Package] (20130725/nsarguments-95)
[  206.921040] nouveau T[  DEVICE][0000:01:00.0] inc() == 2
[  206.921055] [drm] hdmi device  not found 1 0 1
[  206.921072] nouveau T[     DRM] inc() == 3
[  206.921077] nouveau T[  DEVICE][0000:01:00.0] use(+1) == 1
[  206.921082] nouveau T[  DEVICE][0000:01:00.0] initialising...
[  206.921086] nouveau D[  DEVICE][0000:01:00.0] initialised
[  206.921090] nouveau T[     DRM] inc() == 4
[  206.921095] nouveau T[     DRM] inc() == 5
[  206.921099] nouveau T[  DEVICE][0000:01:00.0] inc() == 3
[  206.921373] nouveau E[  DEVICE][0000:01:00.0] unknown chipset, 0x108120a1
[  206.921378] nouveau E[     DRM] failed to create 0x80000080, -22
[  206.921381] nouveau T[  DEVICE][0000:01:00.0] dec() == 2
[  206.921384] nouveau T[     DRM] dec() == 4
[  206.921386] nouveau T[     DRM] dec() == 3
[  206.921389] nouveau T[  DEVICE][0000:01:00.0] use(-1) == 0
[  206.921392] nouveau T[  DEVICE][0000:01:00.0] stopping...
[  206.921394] nouveau D[  DEVICE][0000:01:00.0] stopped
[  206.921397] nouveau T[     DRM] dec() == 2
[  206.921400] nouveau D[     DRM] fini running
[  206.921403] nouveau T[     DRM] 0xffffffff:0xffffffff fini children
[  206.921406] nouveau T[     DRM] 0xffffffff:0xffffffff fini running
[  206.921409] nouveau T[     DRM] use(-1) == 1
[  206.921412] nouveau T[     DRM] 0xffffffff:0xffffffff fini completed
[  206.921414] nouveau D[     DRM] fini completed with 0
[  206.921417] nouveau T[     DRM] dec() == 0
[  206.921419] nouveau D[     DRM] destroying
[  206.921422] nouveau T[  DEVICE][0000:01:00.0] dec() == 1
[  206.921425] nouveau T[     DRM] 0xffffffff:0xffffffff destroy running
[  206.921427] nouveau T[     DRM] 0xffffffff:0xffffffff destroy completed
[  206.921430] nouveau T[     DRM] dec() == -1
[  206.921767] nouveau T[  DEVICE][0000:01:00.0] dec() == 0
[  206.921773] nouveau D[  DEVICE][0000:01:00.0] destroying
[  206.921783] nouveau: probe of 0000:01:00.0 failed with error -22

-- lspci --
00:02.0 VGA compatible controller: Intel Corporation 3rd Gen Core processor
Graphics Controller (rev 09) (prog-if 00 [VGA controller])
        Subsystem: Toshiba America Info Systems Device fa43
        Flags: bus master, fast devsel, latency 0, IRQ 44
        Memory at d3000000 (64-bit, non-prefetchable) [size=4M]
        Memory at c0000000 (64-bit, prefetchable) [size=256M]
        I/O ports at 4000 [size=64]
        Expansion ROM at <unassigned> [disabled]
        Capabilities: <access denied>
        Kernel driver in use: i915

01:00.0 3D controller: NVIDIA Corporation GK208M [GeForce GT 740M] (rev a1)
        Subsystem: Toshiba America Info Systems Device fa43
        Flags: bus master, fast devsel, latency 0, IRQ 16
        Memory at d2000000 (32-bit, non-prefetchable) [size=16M]
        Memory at a0000000 (64-bit, prefetchable) [size=256M]
        Memory at b0000000 (64-bit, prefetchable) [size=32M]
        I/O ports at 3000 [size=128]
        [virtual] Expansion ROM at b2000000 [disabled] [size=512K]
        Capabilities: <access denied>

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384160427.15aB80c1.17129
Date: Mon, 11 Nov 2013 09:00:27 +0000
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
   title="NEW --- - GT-740M not detected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71472">71472</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GT-740M not detected
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
          <td>temnota.am&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
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
        <pre>GK208M not detected by kernel driver. 

[  206.920626] ACPI Warning: \_SB_.PCI0.GFX0._DSM: Argument #4 type mismatch -
Found [Integer], ACPI requires [Package] (20130725/nsarguments-95)
[  206.920693] ACPI Warning: \_SB_.PCI0.GFX0._DSM: Argument #4 type mismatch -
Found [Buffer], ACPI requires [Package] (20130725/nsarguments-95)
[  206.921040] nouveau T[  DEVICE][0000:01:00.0] inc() == 2
[  206.921055] [drm] hdmi device  not found 1 0 1
[  206.921072] nouveau T[     DRM] inc() == 3
[  206.921077] nouveau T[  DEVICE][0000:01:00.0] use(+1) == 1
[  206.921082] nouveau T[  DEVICE][0000:01:00.0] initialising...
[  206.921086] nouveau D[  DEVICE][0000:01:00.0] initialised
[  206.921090] nouveau T[     DRM] inc() == 4
[  206.921095] nouveau T[     DRM] inc() == 5
[  206.921099] nouveau T[  DEVICE][0000:01:00.0] inc() == 3
[  206.921373] nouveau E[  DEVICE][0000:01:00.0] unknown chipset, 0x108120a1
[  206.921378] nouveau E[     DRM] failed to create 0x80000080, -22
[  206.921381] nouveau T[  DEVICE][0000:01:00.0] dec() == 2
[  206.921384] nouveau T[     DRM] dec() == 4
[  206.921386] nouveau T[     DRM] dec() == 3
[  206.921389] nouveau T[  DEVICE][0000:01:00.0] use(-1) == 0
[  206.921392] nouveau T[  DEVICE][0000:01:00.0] stopping...
[  206.921394] nouveau D[  DEVICE][0000:01:00.0] stopped
[  206.921397] nouveau T[     DRM] dec() == 2
[  206.921400] nouveau D[     DRM] fini running
[  206.921403] nouveau T[     DRM] 0xffffffff:0xffffffff fini children
[  206.921406] nouveau T[     DRM] 0xffffffff:0xffffffff fini running
[  206.921409] nouveau T[     DRM] use(-1) == 1
[  206.921412] nouveau T[     DRM] 0xffffffff:0xffffffff fini completed
[  206.921414] nouveau D[     DRM] fini completed with 0
[  206.921417] nouveau T[     DRM] dec() == 0
[  206.921419] nouveau D[     DRM] destroying
[  206.921422] nouveau T[  DEVICE][0000:01:00.0] dec() == 1
[  206.921425] nouveau T[     DRM] 0xffffffff:0xffffffff destroy running
[  206.921427] nouveau T[     DRM] 0xffffffff:0xffffffff destroy completed
[  206.921430] nouveau T[     DRM] dec() == -1
[  206.921767] nouveau T[  DEVICE][0000:01:00.0] dec() == 0
[  206.921773] nouveau D[  DEVICE][0000:01:00.0] destroying
[  206.921783] nouveau: probe of 0000:01:00.0 failed with error -22

-- lspci --
00:02.0 VGA compatible controller: Intel Corporation 3rd Gen Core processor
Graphics Controller (rev 09) (prog-if 00 [VGA controller])
        Subsystem: Toshiba America Info Systems Device fa43
        Flags: bus master, fast devsel, latency 0, IRQ 44
        Memory at d3000000 (64-bit, non-prefetchable) [size=4M]
        Memory at c0000000 (64-bit, prefetchable) [size=256M]
        I/O ports at 4000 [size=64]
        Expansion ROM at &lt;unassigned&gt; [disabled]
        Capabilities: &lt;access denied&gt;
        Kernel driver in use: i915

01:00.0 3D controller: NVIDIA Corporation GK208M [GeForce GT 740M] (rev a1)
        Subsystem: Toshiba America Info Systems Device fa43
        Flags: bus master, fast devsel, latency 0, IRQ 16
        Memory at d2000000 (32-bit, non-prefetchable) [size=16M]
        Memory at a0000000 (64-bit, prefetchable) [size=256M]
        Memory at b0000000 (64-bit, prefetchable) [size=32M]
        I/O ports at 3000 [size=128]
        [virtual] Expansion ROM at b2000000 [disabled] [size=512K]
        Capabilities: &lt;access denied&gt;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384160427.15aB80c1.17129--

--===============0523376330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0523376330==--
