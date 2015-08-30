From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91804] New: nouveau kernel drive should not steal fb
 until after getting vbios
Date: Sun, 30 Aug 2015 06:26:02 +0000
Message-ID: <bug-91804-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0485505801=="
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


--===============0485505801==
Content-Type: multipart/alternative; boundary="1440915962.8D3EA1.12176"; charset="UTF-8"


--1440915962.8D3EA1.12176
Date: Sun, 30 Aug 2015 06:26:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91804

            Bug ID: 91804
           Summary: nouveau kernel drive should not steal fb until after
                    getting vbios
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jeremyhu-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Forked from bug #91779.

In some configurations, the fb will transition to nouveaufb, but then it will
fail to initialize.  In such cases, it is not possible to then transition back
to the previous fb driver.  Various forums suggest that users use nomodeset as
a workaround for this issue, which works because nouveaufb will error out
before stealing fb if KMS is disabled.

I suggest that the check for valid vbios be moved before fb is transitioned
away from the previous driver to allow for a more graceful fallback in
instances like this.

Here is the kernel logging that results from 'sudo modprobe nouveau
debug=VBIOS=debug' on such a configuration:

Aug 29 23:19:45 wedge kernel: [  294.071101] [drm] Initialized drm 1.1.0
20060810
Aug 29 23:19:45 wedge kernel: [  294.127783] wmi: Mapper loaded
Aug 29 23:19:46 wedge kernel: [  294.190330] checking generic (c0030000 710000)
vs hw (c0000000 10000000)
Aug 29 23:19:46 wedge kernel: [  294.190337] fb: conflicting fb hw usage
nouveaufb vs EFI VGA - removing generic driver
Aug 29 23:19:46 wedge kernel: [  294.190449] Console: switching to colour dummy
device 80x25
Aug 29 23:19:46 wedge kernel: [  294.191803] nouveau 0000:01:00.0: enabling
device (0006 -> 0007)
Aug 29 23:19:46 wedge kernel: [  294.192979] [drm] hdmi device  not found 1 0 1
Aug 29 23:19:46 wedge kernel: [  294.193257] nouveau  [  DEVICE][0000:01:00.0]
BOOT0  : 0x084700a2
Aug 29 23:19:46 wedge kernel: [  294.193260] nouveau  [  DEVICE][0000:01:00.0]
Chipset: G84 (NV84)
Aug 29 23:19:46 wedge kernel: [  294.193262] nouveau  [  DEVICE][0000:01:00.0]
Family : NV50
Aug 29 23:19:46 wedge kernel: [  294.196982] nouveau  [   VBIOS][0000:01:00.0]
checking PRAMIN for image...
Aug 29 23:19:46 wedge kernel: [  294.196990] nouveau  [   VBIOS][0000:01:00.0]
... signature not found
Aug 29 23:19:46 wedge kernel: [  294.196992] nouveau  [   VBIOS][0000:01:00.0]
checking PROM for image...
Aug 29 23:19:46 wedge kernel: [  294.197010] nouveau  [   VBIOS][0000:01:00.0]
... signature not found
Aug 29 23:19:46 wedge kernel: [  294.197012] nouveau  [   VBIOS][0000:01:00.0]
checking ACPI for image...
Aug 29 23:19:46 wedge kernel: [  294.197017] nouveau  [   VBIOS][0000:01:00.0]
... signature not found
Aug 29 23:19:46 wedge kernel: [  294.197019] nouveau  [   VBIOS][0000:01:00.0]
checking PCIROM for image...
Aug 29 23:19:46 wedge kernel: [  294.197070] nouveau 0000:01:00.0: Invalid ROM
contents
Aug 29 23:19:46 wedge kernel: [  294.197084] nouveau  [   VBIOS][0000:01:00.0]
... signature not found
Aug 29 23:19:46 wedge kernel: [  294.197087] nouveau  [   VBIOS][0000:01:00.0]
checking PLATFORM for image...
Aug 29 23:19:46 wedge kernel: [  294.197089] nouveau  [   VBIOS][0000:01:00.0]
... signature not found
Aug 29 23:19:46 wedge kernel: [  294.197091] nouveau E[   VBIOS][0000:01:00.0]
unable to locate usable image
Aug 29 23:19:46 wedge kernel: [  294.197095] nouveau E[  DEVICE][0000:01:00.0]
failed to create 0x10000001, -22
Aug 29 23:19:46 wedge kernel: [  294.197098] nouveau E[     DRM] failed to
create 0x80000080, -22
Aug 29 23:19:46 wedge kernel: [  294.197627] nouveau: probe of 0000:01:00.0
failed with error -22

The above was with Ubuntu 14.04.3 (Linux wedge 3.13.0-62-generic #102-Ubuntu
SMP Tue Aug 11 14:29:36 UTC 2015 x86_64 x86_64 x86_64 GNU/Linux) but I also see
the same issue with Ubuntu 15.10 20150826 snapshot (linux 4.1 based).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1440915962.8D3EA1.12176
Date: Sun, 30 Aug 2015 06:26:02 +0000
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
   title="NEW - nouveau kernel drive should not steal fb until after getting vbios"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91804">91804</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau kernel drive should not steal fb until after getting vbios
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
          <td>jeremyhu&#64;freedesktop.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Forked from <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Pure EFI: MacBookPro3,1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents"
   href="show_bug.cgi?id=91779">bug #91779</a>.

In some configurations, the fb will transition to nouveaufb, but then it will
fail to initialize.  In such cases, it is not possible to then transition back
to the previous fb driver.  Various forums suggest that users use nomodeset as
a workaround for this issue, which works because nouveaufb will error out
before stealing fb if KMS is disabled.

I suggest that the check for valid vbios be moved before fb is transitioned
away from the previous driver to allow for a more graceful fallback in
instances like this.

Here is the kernel logging that results from 'sudo modprobe nouveau
debug=VBIOS=debug' on such a configuration:

Aug 29 23:19:45 wedge kernel: [  294.071101] [drm] Initialized drm 1.1.0
20060810
Aug 29 23:19:45 wedge kernel: [  294.127783] wmi: Mapper loaded
Aug 29 23:19:46 wedge kernel: [  294.190330] checking generic (c0030000 710000)
vs hw (c0000000 10000000)
Aug 29 23:19:46 wedge kernel: [  294.190337] fb: conflicting fb hw usage
nouveaufb vs EFI VGA - removing generic driver
Aug 29 23:19:46 wedge kernel: [  294.190449] Console: switching to colour dummy
device 80x25
Aug 29 23:19:46 wedge kernel: [  294.191803] nouveau 0000:01:00.0: enabling
device (0006 -&gt; 0007)
Aug 29 23:19:46 wedge kernel: [  294.192979] [drm] hdmi device  not found 1 0 1
Aug 29 23:19:46 wedge kernel: [  294.193257] nouveau  [  DEVICE][0000:01:00.0]
BOOT0  : 0x084700a2
Aug 29 23:19:46 wedge kernel: [  294.193260] nouveau  [  DEVICE][0000:01:00.0]
Chipset: G84 (NV84)
Aug 29 23:19:46 wedge kernel: [  294.193262] nouveau  [  DEVICE][0000:01:00.0]
Family : NV50
Aug 29 23:19:46 wedge kernel: [  294.196982] nouveau  [   VBIOS][0000:01:00.0]
checking PRAMIN for image...
Aug 29 23:19:46 wedge kernel: [  294.196990] nouveau  [   VBIOS][0000:01:00.0]
... signature not found
Aug 29 23:19:46 wedge kernel: [  294.196992] nouveau  [   VBIOS][0000:01:00.0]
checking PROM for image...
Aug 29 23:19:46 wedge kernel: [  294.197010] nouveau  [   VBIOS][0000:01:00.0]
... signature not found
Aug 29 23:19:46 wedge kernel: [  294.197012] nouveau  [   VBIOS][0000:01:00.0]
checking ACPI for image...
Aug 29 23:19:46 wedge kernel: [  294.197017] nouveau  [   VBIOS][0000:01:00.0]
... signature not found
Aug 29 23:19:46 wedge kernel: [  294.197019] nouveau  [   VBIOS][0000:01:00.0]
checking PCIROM for image...
Aug 29 23:19:46 wedge kernel: [  294.197070] nouveau 0000:01:00.0: Invalid ROM
contents
Aug 29 23:19:46 wedge kernel: [  294.197084] nouveau  [   VBIOS][0000:01:00.0]
... signature not found
Aug 29 23:19:46 wedge kernel: [  294.197087] nouveau  [   VBIOS][0000:01:00.0]
checking PLATFORM for image...
Aug 29 23:19:46 wedge kernel: [  294.197089] nouveau  [   VBIOS][0000:01:00.0]
... signature not found
Aug 29 23:19:46 wedge kernel: [  294.197091] nouveau E[   VBIOS][0000:01:00.0]
unable to locate usable image
Aug 29 23:19:46 wedge kernel: [  294.197095] nouveau E[  DEVICE][0000:01:00.0]
failed to create 0x10000001, -22
Aug 29 23:19:46 wedge kernel: [  294.197098] nouveau E[     DRM] failed to
create 0x80000080, -22
Aug 29 23:19:46 wedge kernel: [  294.197627] nouveau: probe of 0000:01:00.0
failed with error -22

The above was with Ubuntu 14.04.3 (Linux wedge 3.13.0-62-generic #102-Ubuntu
SMP Tue Aug 11 14:29:36 UTC 2015 x86_64 x86_64 x86_64 GNU/Linux) but I also see
the same issue with Ubuntu 15.10 20150826 snapshot (linux 4.1 based).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1440915962.8D3EA1.12176--

--===============0485505801==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0485505801==--
