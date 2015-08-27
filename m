From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91779] New: MacBookPro3,
 1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents
Date: Thu, 27 Aug 2015 20:08:33 +0000
Message-ID: <bug-91779-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0365274581=="
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


--===============0365274581==
Content-Type: multipart/alternative; boundary="1440706113.78661.7095"; charset="UTF-8"


--1440706113.78661.7095
Date: Thu, 27 Aug 2015 20:08:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91779

            Bug ID: 91779
           Summary: MacBookPro3,1 (NV84) fails to load nouveau on linux
                    4.1 -- Invalid ROM contents
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

I thought this may have been bug #89047, but it looks like a different issue as
it is still reproducing on the 4.1 kernel.

This may be related to or a dupe of bug #90626 or bug #91402.

I have a MacBookPro3,1 with nVidia GeForce 8600M GT.  The information below has
been taken from Ubunto 15.10 (20150826 snapshot) with the following kernel:
Linux wedge 4.1.0-3-generic #3-Ubuntu SMP Tue Jul 28 12:25:10 UTC 2015 x86_64
x86_64 x86_64 GNU/Linux

The same behavior is observed on 3.19 kernels (Ubuntu 14.04.3 and 15.04).  I
did not try older kernels.

lspci shows:

01:00.0 VGA compatible controller: NVIDIA Corporation G84M [GeForce 8600M GT]
(rev a1) (prog-if 00 [VGA controller])
    Subsystem: Apple Inc. Device 00a0
    Physical Slot: 1
    Flags: fast devsel
    Memory at d2000000 (32-bit, non-prefetchable) [size=16M]
    Memory at c0000000 (64-bit, prefetchable) [size=256M]
    Memory at d0000000 (64-bit, non-prefetchable) [size=32M]
    I/O ports at 5000 [disabled] [size=128]
    Expansion ROM at d3000000 [disabled] [size=128K]
    Capabilities: <access denied>

In order to get a usable fb with this configuration, I need to blacklist the
nouveau kernel module.  I'm able to use X11 with fbdev, but I'm unable to use
the fb (or X11) with nouveau.

Upon loading the nouveau kernel module, the following is logged by the kernel:

Aug 27 12:30:44 wedge kernel: [   57.905775] [drm] Initialized drm 1.1.0
20060810
Aug 27 12:30:44 wedge kernel: [   57.938200] wmi: Mapper loaded
Aug 27 12:30:44 wedge kernel: [   58.013484] checking generic (c0030000 710000)
vs hw (c0000000 10000000)
Aug 27 12:30:44 wedge kernel: [   58.013489] fb: switching to nouveaufb from
EFI VGA
Aug 27 12:30:44 wedge kernel: [   58.013567] Console: switching to colour dummy
device 80x25
Aug 27 12:30:44 wedge kernel: [   58.014140] nouveau 0000:01:00.0: enabling
device (0006 -> 0007)
Aug 27 12:30:44 wedge kernel: [   58.014535] nouveau  [  DEVICE][0000:01:00.0]
BOOT0  : 0x084700a2
Aug 27 12:30:44 wedge kernel: [   58.014540] nouveau  [  DEVICE][0000:01:00.0]
Chipset: G84 (NV84)
Aug 27 12:30:44 wedge kernel: [   58.014542] nouveau  [  DEVICE][0000:01:00.0]
Family : NV50
Aug 27 12:30:44 wedge kernel: [   58.014612] nouveau 0000:01:00.0: Invalid ROM
contents
Aug 27 12:30:44 wedge kernel: [   58.014630] nouveau ![   VBIOS][0000:01:00.0]
unable to locate usable image
Aug 27 12:30:44 wedge kernel: [   58.014636] nouveau E[  DEVICE][0000:01:00.0]
failed to create 0x10000001, -22
Aug 27 12:30:44 wedge kernel: [   58.014644] nouveau E[     DRM] failed to
create 0x00000080, -22
Aug 27 12:30:44 wedge kernel: [   58.014980] nouveau: probe of 0000:01:00.0
failed with error -22

After loading nouvea, the fb does not update.  Unloading nouveau succeeds, but
the fb stays unresponsive (it does not switch back to EFI VGA).  The following
is logged when unloading nouveau:

Aug 27 12:39:06 wedge kernel: [  559.546939] [drm] Module unloaded

---

Issues that should be addressed:
  1) Upon failing, fb should switch back to EFI VGA so as to not make the
system unusable
  2) Upon unloading the module, fb should switch back to EFI VGA
  3) The underlying error should be fixed

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1440706113.78661.7095
Date: Thu, 27 Aug 2015 20:08:33 +0000
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
   title="NEW - MacBookPro3,1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91779">91779</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>MacBookPro3,1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents
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
        <pre>I thought this may have been <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - linux-3.19 nvd9 Invalid rom content"
   href="show_bug.cgi?id=89047">bug #89047</a>, but it looks like a different issue as
it is still reproducing on the 4.1 kernel.

This may be related to or a dupe of <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;= 4.1"
   href="show_bug.cgi?id=90626">bug #90626</a> or <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - linux-4.1 nv108 Invalid ROM contents"
   href="show_bug.cgi?id=91402">bug #91402</a>.

I have a MacBookPro3,1 with nVidia GeForce 8600M GT.  The information below has
been taken from Ubunto 15.10 (20150826 snapshot) with the following kernel:
Linux wedge 4.1.0-3-generic #3-Ubuntu SMP Tue Jul 28 12:25:10 UTC 2015 x86_64
x86_64 x86_64 GNU/Linux

The same behavior is observed on 3.19 kernels (Ubuntu 14.04.3 and 15.04).  I
did not try older kernels.

lspci shows:

01:00.0 VGA compatible controller: NVIDIA Corporation G84M [GeForce 8600M GT]
(rev a1) (prog-if 00 [VGA controller])
    Subsystem: Apple Inc. Device 00a0
    Physical Slot: 1
    Flags: fast devsel
    Memory at d2000000 (32-bit, non-prefetchable) [size=16M]
    Memory at c0000000 (64-bit, prefetchable) [size=256M]
    Memory at d0000000 (64-bit, non-prefetchable) [size=32M]
    I/O ports at 5000 [disabled] [size=128]
    Expansion ROM at d3000000 [disabled] [size=128K]
    Capabilities: &lt;access denied&gt;

In order to get a usable fb with this configuration, I need to blacklist the
nouveau kernel module.  I'm able to use X11 with fbdev, but I'm unable to use
the fb (or X11) with nouveau.

Upon loading the nouveau kernel module, the following is logged by the kernel:

Aug 27 12:30:44 wedge kernel: [   57.905775] [drm] Initialized drm 1.1.0
20060810
Aug 27 12:30:44 wedge kernel: [   57.938200] wmi: Mapper loaded
Aug 27 12:30:44 wedge kernel: [   58.013484] checking generic (c0030000 710000)
vs hw (c0000000 10000000)
Aug 27 12:30:44 wedge kernel: [   58.013489] fb: switching to nouveaufb from
EFI VGA
Aug 27 12:30:44 wedge kernel: [   58.013567] Console: switching to colour dummy
device 80x25
Aug 27 12:30:44 wedge kernel: [   58.014140] nouveau 0000:01:00.0: enabling
device (0006 -&gt; 0007)
Aug 27 12:30:44 wedge kernel: [   58.014535] nouveau  [  DEVICE][0000:01:00.0]
BOOT0  : 0x084700a2
Aug 27 12:30:44 wedge kernel: [   58.014540] nouveau  [  DEVICE][0000:01:00.0]
Chipset: G84 (NV84)
Aug 27 12:30:44 wedge kernel: [   58.014542] nouveau  [  DEVICE][0000:01:00.0]
Family : NV50
Aug 27 12:30:44 wedge kernel: [   58.014612] nouveau 0000:01:00.0: Invalid ROM
contents
Aug 27 12:30:44 wedge kernel: [   58.014630] nouveau ![   VBIOS][0000:01:00.0]
unable to locate usable image
Aug 27 12:30:44 wedge kernel: [   58.014636] nouveau E[  DEVICE][0000:01:00.0]
failed to create 0x10000001, -22
Aug 27 12:30:44 wedge kernel: [   58.014644] nouveau E[     DRM] failed to
create 0x00000080, -22
Aug 27 12:30:44 wedge kernel: [   58.014980] nouveau: probe of 0000:01:00.0
failed with error -22

After loading nouvea, the fb does not update.  Unloading nouveau succeeds, but
the fb stays unresponsive (it does not switch back to EFI VGA).  The following
is logged when unloading nouveau:

Aug 27 12:39:06 wedge kernel: [  559.546939] [drm] Module unloaded

---

Issues that should be addressed:
  1) Upon failing, fb should switch back to EFI VGA so as to not make the
system unusable
  2) Upon unloading the module, fb should switch back to EFI VGA
  3) The underlying error should be fixed</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1440706113.78661.7095--

--===============0365274581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0365274581==--
