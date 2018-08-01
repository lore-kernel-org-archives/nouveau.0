From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107447] New: regression in thermal management of
 Quadro FX 1500
Date: Wed, 01 Aug 2018 15:51:27 +0000
Message-ID: <bug-107447-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0608899979=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0608899979==
Content-Type: multipart/alternative; boundary="15331386870.e1F5bE.26246"
Content-Transfer-Encoding: 7bit


--15331386870.e1F5bE.26246
Date: Wed, 1 Aug 2018 15:51:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107447

            Bug ID: 107447
           Summary: regression in thermal management of  Quadro FX 1500
           Product: Mesa
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: Thomas.Blume-IBi9RG/b67k@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 140926
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D140926&action=3Dedit
dmesg kernel 4.4

On my machine with an:

  Model: "nVidia Quadro FX 1500"
  Vendor: pci 0x10de "nVidia Corporation"
  Device: pci 0x029e "Quadro FX 1500"
  SubVendor: pci 0x10de "nVidia Corporation"
  SubDevice: pci 0x032c=20
  Revision: 0xa1
  Driver: "nouveau"
  Driver Modules: "drm"

graphics card, the gpu fan start running at high load.
The issue started after installing openSUSE Leap15 with kernel version 4.12.
The same issue is visible using kernel version 4.17.
It was working fine on older openSUSE versions, up to kernel version 4.4.
Installing kernel version 4.4 on Leap 15 makes the issue go away.
The nouveau driver debug logs show when booting with kernel 4.12:

-->

 grep therm /mnt/dmesg-4_12.txt
[    5.985658] nouveau 0000:01:00.0: therm: FAN control: PWM
[    5.985667] nouveau 0000:01:00.0: therm: parsing the fan table failed
[    5.985680] nouveau 0000:01:00.0: therm: fan management: automatic
[    5.985687] nouveau 0000:01:00.0: therm: FAN target request: 90%
[    5.985692] nouveau 0000:01:00.0: therm: FAN target: 90
[    5.985697] nouveau 0000:01:00.0: therm: FAN update: 23
[    5.985707] nouveau 0000:01:00.0: therm: internal sensor: yes
[    6.005559] nouveau 0000:01:00.0: therm: programmed thresholds [ 90(3),
95(3), 130(2), 135(5) ]
[    6.485750] nouveau 0000:01:00.0: therm: FAN update: 26
[    6.985841] nouveau 0000:01:00.0: therm: FAN update: 29
[    7.485929] nouveau 0000:01:00.0: therm: FAN update: 32
[    7.986009] nouveau 0000:01:00.0: therm: FAN update: 35
[    8.486100] nouveau 0000:01:00.0: therm: FAN update: 38
[    8.986193] nouveau 0000:01:00.0: therm: FAN update: 41
[    9.486270] nouveau 0000:01:00.0: therm: FAN update: 44
[    9.987905] nouveau 0000:01:00.0: therm: FAN update: 47
[   10.489188] nouveau 0000:01:00.0: therm: FAN update: 50
[   10.990485] nouveau 0000:01:00.0: therm: FAN update: 53
[   11.491779] nouveau 0000:01:00.0: therm: FAN update: 56
[   11.993032] nouveau 0000:01:00.0: therm: FAN update: 59
[   12.494276] nouveau 0000:01:00.0: therm: FAN update: 62
[   12.995621] nouveau 0000:01:00.0: therm: FAN update: 65
[   13.497070] nouveau 0000:01:00.0: therm: FAN update: 68
[   13.998516] nouveau 0000:01:00.0: therm: FAN update: 71
[   14.500055] nouveau 0000:01:00.0: therm: FAN update: 74
[   15.001850] nouveau 0000:01:00.0: therm: FAN update: 77
[   15.505237] nouveau 0000:01:00.0: therm: FAN update: 80
[   16.006924] nouveau 0000:01:00.0: therm: FAN update: 83
[   16.508429] nouveau 0000:01:00.0: therm: FAN update: 86
[   17.009946] nouveau 0000:01:00.0: therm: FAN update: 89
[   17.511480] nouveau 0000:01:00.0: therm: FAN update: 90
--<

with kernel 4.4 it only shows:

-->
 grep therm /mnt/dmesg-4_4.txt=20
[    7.547113] nouveau 0000:01:00.0: therm: FAN control: PWM
[    7.547117] nouveau 0000:01:00.0: therm: parsing the fan table failed
[    7.547121] nouveau 0000:01:00.0: therm: fan management: automatic
[    7.547124] nouveau 0000:01:00.0: therm: internal sensor: yes
[    7.566971] nouveau 0000:01:00.0: therm: programmed thresholds [ 90(3),
95(3), 130(2), 135(5) ]
--<

Attaching dmesg with noveau debug logs for kernel 4.4. and kernel 4.12.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15331386870.e1F5bE.26246
Date: Wed, 1 Aug 2018 15:51:27 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - regression in thermal management of Quadro FX 1500"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107447">107447</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>regression in thermal management of  Quadro FX 1500
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
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
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>Thomas.Blume&#64;suse.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D140926=
" name=3D"attach_140926" title=3D"dmesg kernel 4.4">attachment 140926</a> <=
a href=3D"attachment.cgi?id=3D140926&amp;action=3Dedit" title=3D"dmesg kern=
el 4.4">[details]</a></span>
dmesg kernel 4.4

On my machine with an:

  Model: &quot;nVidia Quadro FX 1500&quot;
  Vendor: pci 0x10de &quot;nVidia Corporation&quot;
  Device: pci 0x029e &quot;Quadro FX 1500&quot;
  SubVendor: pci 0x10de &quot;nVidia Corporation&quot;
  SubDevice: pci 0x032c=20
  Revision: 0xa1
  Driver: &quot;nouveau&quot;
  Driver Modules: &quot;drm&quot;

graphics card, the gpu fan start running at high load.
The issue started after installing openSUSE Leap15 with kernel version 4.12.
The same issue is visible using kernel version 4.17.
It was working fine on older openSUSE versions, up to kernel version 4.4.
Installing kernel version 4.4 on Leap 15 makes the issue go away.
The nouveau driver debug logs show when booting with kernel 4.12:

--&gt;

 grep therm /mnt/dmesg-4_12.txt
[    5.985658] nouveau 0000:01:00.0: therm: FAN control: PWM
[    5.985667] nouveau 0000:01:00.0: therm: parsing the fan table failed
[    5.985680] nouveau 0000:01:00.0: therm: fan management: automatic
[    5.985687] nouveau 0000:01:00.0: therm: FAN target request: 90%
[    5.985692] nouveau 0000:01:00.0: therm: FAN target: 90
[    5.985697] nouveau 0000:01:00.0: therm: FAN update: 23
[    5.985707] nouveau 0000:01:00.0: therm: internal sensor: yes
[    6.005559] nouveau 0000:01:00.0: therm: programmed thresholds [ 90(3),
95(3), 130(2), 135(5) ]
[    6.485750] nouveau 0000:01:00.0: therm: FAN update: 26
[    6.985841] nouveau 0000:01:00.0: therm: FAN update: 29
[    7.485929] nouveau 0000:01:00.0: therm: FAN update: 32
[    7.986009] nouveau 0000:01:00.0: therm: FAN update: 35
[    8.486100] nouveau 0000:01:00.0: therm: FAN update: 38
[    8.986193] nouveau 0000:01:00.0: therm: FAN update: 41
[    9.486270] nouveau 0000:01:00.0: therm: FAN update: 44
[    9.987905] nouveau 0000:01:00.0: therm: FAN update: 47
[   10.489188] nouveau 0000:01:00.0: therm: FAN update: 50
[   10.990485] nouveau 0000:01:00.0: therm: FAN update: 53
[   11.491779] nouveau 0000:01:00.0: therm: FAN update: 56
[   11.993032] nouveau 0000:01:00.0: therm: FAN update: 59
[   12.494276] nouveau 0000:01:00.0: therm: FAN update: 62
[   12.995621] nouveau 0000:01:00.0: therm: FAN update: 65
[   13.497070] nouveau 0000:01:00.0: therm: FAN update: 68
[   13.998516] nouveau 0000:01:00.0: therm: FAN update: 71
[   14.500055] nouveau 0000:01:00.0: therm: FAN update: 74
[   15.001850] nouveau 0000:01:00.0: therm: FAN update: 77
[   15.505237] nouveau 0000:01:00.0: therm: FAN update: 80
[   16.006924] nouveau 0000:01:00.0: therm: FAN update: 83
[   16.508429] nouveau 0000:01:00.0: therm: FAN update: 86
[   17.009946] nouveau 0000:01:00.0: therm: FAN update: 89
[   17.511480] nouveau 0000:01:00.0: therm: FAN update: 90
--&lt;

with kernel 4.4 it only shows:

--&gt;
 grep therm /mnt/dmesg-4_4.txt=20
[    7.547113] nouveau 0000:01:00.0: therm: FAN control: PWM
[    7.547117] nouveau 0000:01:00.0: therm: parsing the fan table failed
[    7.547121] nouveau 0000:01:00.0: therm: fan management: automatic
[    7.547124] nouveau 0000:01:00.0: therm: internal sensor: yes
[    7.566971] nouveau 0000:01:00.0: therm: programmed thresholds [ 90(3),
95(3), 130(2), 135(5) ]
--&lt;

Attaching dmesg with noveau debug logs for kernel 4.4. and kernel 4.12.</pr=
e>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15331386870.e1F5bE.26246--

--===============0608899979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0608899979==--
