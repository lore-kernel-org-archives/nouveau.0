From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89047] New: linux-3.19 nvd9 Invalid rom content
Date: Mon, 09 Feb 2015 19:35:06 +0000
Message-ID: <bug-89047-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1722535666=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1722535666==
Content-Type: multipart/alternative; boundary="1423510506.d31EecA1.18666"; charset="UTF-8"


--1423510506.d31EecA1.18666
Date: Mon, 9 Feb 2015 19:35:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89047

            Bug ID: 89047
           Summary: linux-3.19 nvd9 Invalid rom content
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jan.vesely-kgbqMDwikbSVc3sceRu5cw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

booting linux 3.19.0 fails to init nvd9 card with these messges in dmesg:
[    0.000000] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-3.19.0-gentoo
root=/dev/sda3 ro quiet splash i915.lvds_downclock=1
init=/usr/lib/systemd/systemd drm.rnodes=1 reboot=a nouveau.pstate=1
[    7.980357] nouveau 0000:01:00.0: enabling device (0004 -> 0007)
[    7.980901] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0d9160a1
[    7.980904] nouveau  [  DEVICE][0000:01:00.0] Chipset: GF119 (NVD9)
[    7.980906] nouveau  [  DEVICE][0000:01:00.0] Family : NVC0
[    8.034908] nouveau 0000:01:00.0: Invalid ROM contents
[    8.035060] nouveau ![   VBIOS][0000:01:00.0] unable to locate usable image
[    8.035114] nouveau E[  DEVICE][0000:01:00.0] failed to create 0x10000001,
-22
[    8.035171] nouveau E[     DRM] failed to create 0x00000080, -22
[    8.037770] nouveau: probe of 0000:01:00.0 failed with error -22

the usual output (on 3.18.6) is:
Feb 09 12:55:18 [kernel] nouveau 0000:01:00.0: enabling device (0004 -> 0007)
Feb 09 12:55:18 [kernel] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0d9160a1
Feb 09 12:55:18 [kernel] nouveau  [  DEVICE][0000:01:00.0] Chipset: GF119
(NVD9)
Feb 09 12:55:18 [kernel] nouveau  [  DEVICE][0000:01:00.0] Family : NVC0
Feb 09 12:55:18 [kernel] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for
image...
Feb 09 12:55:18 [kernel] nouveau  [   VBIOS][0000:01:00.0] ... signature not
found
Feb 09 12:55:18 [kernel] nouveau  [   VBIOS][0000:01:00.0] checking PROM for
image...
Feb 09 12:55:18 [kernel] nouveau  [   VBIOS][0000:01:00.0] ... signature not
found
Feb 09 12:55:18 [kernel] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for
image...
Feb 09 12:55:18 [kernel] nouveau  [   VBIOS][0000:01:00.0] ... appears to be
valid
Feb 09 12:55:18 [kernel] nouveau  [   VBIOS][0000:01:00.0] using image from
ACPI
Feb 09 12:55:18 [kernel] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
Feb 09 12:55:18 [kernel] nouveau  [   VBIOS][0000:01:00.0] version
75.19.6a.01.01
Feb 09 12:55:18 [kernel] nouveau  [ DEVINIT][0000:01:00.0] adaptor not
initialised
Feb 09 12:55:18 [kernel] nouveau  [   VBIOS][0000:01:00.0] running init tables

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1423510506.d31EecA1.18666
Date: Mon, 9 Feb 2015 19:35:06 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - linux-3.19 nvd9 Invalid rom content"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89047">89047</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>linux-3.19 nvd9 Invalid rom content
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>jan.vesely&#64;rutgers.edu
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>booting linux 3.19.0 fails to init nvd9 card with these messges in dmesg:
[    0.000000] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-3.19.0-gentoo
root=/dev/sda3 ro quiet splash i915.lvds_downclock=1
init=/usr/lib/systemd/systemd drm.rnodes=1 reboot=a nouveau.pstate=1
[    7.980357] nouveau 0000:01:00.0: enabling device (0004 -&gt; 0007)
[    7.980901] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0d9160a1
[    7.980904] nouveau  [  DEVICE][0000:01:00.0] Chipset: GF119 (NVD9)
[    7.980906] nouveau  [  DEVICE][0000:01:00.0] Family : NVC0
[    8.034908] nouveau 0000:01:00.0: Invalid ROM contents
[    8.035060] nouveau ![   VBIOS][0000:01:00.0] unable to locate usable image
[    8.035114] nouveau E[  DEVICE][0000:01:00.0] failed to create 0x10000001,
-22
[    8.035171] nouveau E[     DRM] failed to create 0x00000080, -22
[    8.037770] nouveau: probe of 0000:01:00.0 failed with error -22

the usual output (on 3.18.6) is:
Feb 09 12:55:18 [kernel] nouveau 0000:01:00.0: enabling device (0004 -&gt; 0007)
Feb 09 12:55:18 [kernel] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0d9160a1
Feb 09 12:55:18 [kernel] nouveau  [  DEVICE][0000:01:00.0] Chipset: GF119
(NVD9)
Feb 09 12:55:18 [kernel] nouveau  [  DEVICE][0000:01:00.0] Family : NVC0
Feb 09 12:55:18 [kernel] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for
image...
Feb 09 12:55:18 [kernel] nouveau  [   VBIOS][0000:01:00.0] ... signature not
found
Feb 09 12:55:18 [kernel] nouveau  [   VBIOS][0000:01:00.0] checking PROM for
image...
Feb 09 12:55:18 [kernel] nouveau  [   VBIOS][0000:01:00.0] ... signature not
found
Feb 09 12:55:18 [kernel] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for
image...
Feb 09 12:55:18 [kernel] nouveau  [   VBIOS][0000:01:00.0] ... appears to be
valid
Feb 09 12:55:18 [kernel] nouveau  [   VBIOS][0000:01:00.0] using image from
ACPI
Feb 09 12:55:18 [kernel] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
Feb 09 12:55:18 [kernel] nouveau  [   VBIOS][0000:01:00.0] version
75.19.6a.01.01
Feb 09 12:55:18 [kernel] nouveau  [ DEVINIT][0000:01:00.0] adaptor not
initialised
Feb 09 12:55:18 [kernel] nouveau  [   VBIOS][0000:01:00.0] running init tables</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1423510506.d31EecA1.18666--

--===============1722535666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1722535666==--
