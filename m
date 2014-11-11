From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86164] New: Dual screen causes KDE crash on NV50
 (NV98) in nouveau (bisected)
Date: Tue, 11 Nov 2014 18:31:25 +0000
Message-ID: <bug-86164-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1795046823=="
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


--===============1795046823==
Content-Type: multipart/alternative; boundary="1415730685.f4521.3847"; charset="UTF-8"


--1415730685.f4521.3847
Date: Tue, 11 Nov 2014 18:31:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86164

            Bug ID: 86164
           Summary: Dual screen causes KDE crash on NV50 (NV98) in nouveau
                    (bisected)
           Product: xorg
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: maris.nartiss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 109296
  --> https://bugs.freedesktop.org/attachment.cgi?id=109296&action=edit
A Xorg log file of failing session

Starting with "[86024ceef015ffe31a204cc5bc6c326a19363ff1] glamor: initial
support (no dri)" is not possible to configure a secondary monitor while
running KDE 4.14.2. 

Steps to reproduce:
Version A:
 * while a KDE session is open, plug in a secondary monitor
 * use KDE display configuration tool to enable second monitor
 * X11 server gets restarted -> KDM window appears

Version B:
 * start system with a secondary monitor attached
 * observe how system is running in a "clone" mode (there is output on
secondary monitor)
 * log in in KDM
 * observe how X11 gets restarted -> KDM window appears

Solution - use any revision before 86024ceef0

Unfortunately log files are empty - there are no meaninful messages that could
shead a light on the issue. No crash is recorded, xorgsession-errors are just
indicating on IO error while connecting to X11;

There is some issue with EDID, although KDE monitor configuration displays
correct information. dmesg snip:
[    0.000000] Kernel command line: BOOT_IMAGE=/boot/kernel-3.17.2
root=/dev/sda2 ro nouveau.noaccel=1 resume=/dev/sda6
[   13.310327] nouveau 0000:01:00.0: irq 36 for MSI/MSI-X
[   14.481036] fbcon: nouveaufb (fb0) is primary device
[   14.818215] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   14.818217] nouveau 0000:01:00.0: registered panic notifier
[   14.832075] [drm] Initialized nouveau 1.2.0 20120801 for 0000:01:00.0 on
minor 0
[  103.530600] Raw EDID:
[  103.530603]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  103.530605]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  103.530605]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  103.530606]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  103.530607]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  103.530608]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  103.530609]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  103.530610]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  103.530614] nouveau 0000:01:00.0: VGA-1: EDID block 0 invalid.
[  103.530617] nouveau E[     DRM] DDC responded, but no EDID for VGA-1


git bisect start
# bad: [3fb97d78202213c1221a1d3ad8a5cebda78fdf44] fix null pointer deref
git bisect bad 3fb97d78202213c1221a1d3ad8a5cebda78fdf44
# good: [480f0998ffed6d9a5c6656dba75182f00fd88a1b] bump to 1.0.10 for release
git bisect good 480f0998ffed6d9a5c6656dba75182f00fd88a1b
# bad: [f0fa8313714c2a5b16e784b257b5ff79da3a443b] dri2: Enable sync of
bufferswaps to Vblank by default.
git bisect bad f0fa8313714c2a5b16e784b257b5ff79da3a443b
# bad: [81148bb1dbc7007c021c59411d56cb31cfc74ef2] glamor: provide dri3 support
when enabled
git bisect bad 81148bb1dbc7007c021c59411d56cb31cfc74ef2
# good: [b24cae0bf5db6ece21439d4c6ff3668aed4c78d6] dri2: move "is supported"
checks out of nv_driver.c
git bisect good b24cae0bf5db6ece21439d4c6ff3668aed4c78d6
# good: [4b138ab18f58c6d459e21dc319615f536c8e69c8] merge nv_dma.c into
nv_accel_common.c
git bisect good 4b138ab18f58c6d459e21dc319615f536c8e69c8
# good: [fd0ce8839f307693d86c7602dd926ce79e6b777d] add support for maxwell,
minus Xv/renderaccel
git bisect good fd0ce8839f307693d86c7602dd926ce79e6b777d
# bad: [86024ceef015ffe31a204cc5bc6c326a19363ff1] glamor: initial support (no
dri)
git bisect bad 86024ceef015ffe31a204cc5bc6c326a19363ff1
# first bad commit: [86024ceef015ffe31a204cc5bc6c326a19363ff1] glamor: initial
support (no dri)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1415730685.f4521.3847
Date: Tue, 11 Nov 2014 18:31:25 +0000
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
   title="NEW - Dual screen causes KDE crash on NV50 (NV98) in nouveau (bisected)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86164">86164</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Dual screen causes KDE crash on NV50 (NV98) in nouveau (bisected)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
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
          <td>maris.nartiss&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=109296" name="attach_109296" title="A Xorg log file of failing session">attachment 109296</a> <a href="attachment.cgi?id=109296&amp;action=edit" title="A Xorg log file of failing session">[details]</a></span>
A Xorg log file of failing session

Starting with &quot;[86024ceef015ffe31a204cc5bc6c326a19363ff1] glamor: initial
support (no dri)&quot; is not possible to configure a secondary monitor while
running KDE 4.14.2. 

Steps to reproduce:
Version A:
 * while a KDE session is open, plug in a secondary monitor
 * use KDE display configuration tool to enable second monitor
 * X11 server gets restarted -&gt; KDM window appears

Version B:
 * start system with a secondary monitor attached
 * observe how system is running in a &quot;clone&quot; mode (there is output on
secondary monitor)
 * log in in KDM
 * observe how X11 gets restarted -&gt; KDM window appears

Solution - use any revision before 86024ceef0

Unfortunately log files are empty - there are no meaninful messages that could
shead a light on the issue. No crash is recorded, xorgsession-errors are just
indicating on IO error while connecting to X11;

There is some issue with EDID, although KDE monitor configuration displays
correct information. dmesg snip:
[    0.000000] Kernel command line: BOOT_IMAGE=/boot/kernel-3.17.2
root=/dev/sda2 ro nouveau.noaccel=1 resume=/dev/sda6
[   13.310327] nouveau 0000:01:00.0: irq 36 for MSI/MSI-X
[   14.481036] fbcon: nouveaufb (fb0) is primary device
[   14.818215] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   14.818217] nouveau 0000:01:00.0: registered panic notifier
[   14.832075] [drm] Initialized nouveau 1.2.0 20120801 for 0000:01:00.0 on
minor 0
[  103.530600] Raw EDID:
[  103.530603]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  103.530605]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  103.530605]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  103.530606]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  103.530607]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  103.530608]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  103.530609]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  103.530610]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  103.530614] nouveau 0000:01:00.0: VGA-1: EDID block 0 invalid.
[  103.530617] nouveau E[     DRM] DDC responded, but no EDID for VGA-1


git bisect start
# bad: [3fb97d78202213c1221a1d3ad8a5cebda78fdf44] fix null pointer deref
git bisect bad 3fb97d78202213c1221a1d3ad8a5cebda78fdf44
# good: [480f0998ffed6d9a5c6656dba75182f00fd88a1b] bump to 1.0.10 for release
git bisect good 480f0998ffed6d9a5c6656dba75182f00fd88a1b
# bad: [f0fa8313714c2a5b16e784b257b5ff79da3a443b] dri2: Enable sync of
bufferswaps to Vblank by default.
git bisect bad f0fa8313714c2a5b16e784b257b5ff79da3a443b
# bad: [81148bb1dbc7007c021c59411d56cb31cfc74ef2] glamor: provide dri3 support
when enabled
git bisect bad 81148bb1dbc7007c021c59411d56cb31cfc74ef2
# good: [b24cae0bf5db6ece21439d4c6ff3668aed4c78d6] dri2: move &quot;is supported&quot;
checks out of nv_driver.c
git bisect good b24cae0bf5db6ece21439d4c6ff3668aed4c78d6
# good: [4b138ab18f58c6d459e21dc319615f536c8e69c8] merge nv_dma.c into
nv_accel_common.c
git bisect good 4b138ab18f58c6d459e21dc319615f536c8e69c8
# good: [fd0ce8839f307693d86c7602dd926ce79e6b777d] add support for maxwell,
minus Xv/renderaccel
git bisect good fd0ce8839f307693d86c7602dd926ce79e6b777d
# bad: [86024ceef015ffe31a204cc5bc6c326a19363ff1] glamor: initial support (no
dri)
git bisect bad 86024ceef015ffe31a204cc5bc6c326a19363ff1
# first bad commit: [86024ceef015ffe31a204cc5bc6c326a19363ff1] glamor: initial
support (no dri)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1415730685.f4521.3847--

--===============1795046823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1795046823==--
