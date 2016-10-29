From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98489] New: Nouveau not loading PGRAPH firmware blob
 for gk106 in kernel 4.7.10
Date: Sat, 29 Oct 2016 10:01:59 +0000
Message-ID: <bug-98489-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0271881530=="
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


--===============0271881530==
Content-Type: multipart/alternative; boundary="14777353190.1b6eE6C5d.6483";
 charset="UTF-8"


--14777353190.1b6eE6C5d.6483
Date: Sat, 29 Oct 2016 10:01:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98489

            Bug ID: 98489
           Summary: Nouveau not loading PGRAPH firmware blob for gk106 in
                    kernel 4.7.10
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: tuxenergy-JGs/UdohzUI@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Hi. Many people know that GTX660 (gk106, nve06) is working well only with
firmware blobs. (see i.e. https://bugs.freedesktop.org/show_bug.cgi?id=3D93=
629)
I had using them in my old Gentoo Hardened with kernel 4.4.8 and all was fi=
ne,
video card worked very well with 4 .bin files in /lib/firmware/nvidia/gk106

fecs_inst.bin
fecs_data.bin
gpccs_inst.bin
gpccs_data.bin

Now I installed a new system from scratch on same computer. Used **exactly =
same
kernel config** (it means it is valid for all *FIRMWARE* values), but newer
kernel version 4.7.10-r1. I put same firmware files into
/lib/firmware/nvidia/gk106, put nouveau.config=3D"NvGrUseFw=3D1" in grub ke=
rnel
line, but it is not loading, I can't see line in `dmesg | grep nouveau` gr:
using external firmware, as it was in my old 4.4.8 setup.=20

After that, I tried to copy these blobs to old naming space,
/lib/firmware/nouveau/fuc*, tried to include them in kernel directly, tried=
 to
include it in initramfs, nothing helps. It doesn't run.
My current dmesg | grep nouveau:=20
[    0.000000] Kernel command line: nouveau.config=3D"NvGrUseFw=3D1"
BOOT_IMAGE=3D/kernel-genkernel-x86_64-4.7.10-hardened-r1 root=3D/dev/sda2
nouveau.config=3DNvGrUseFw=3D1 pax_sanitize_slab=3D0
[   50.006877] nouveau 0000:01:00.0: NVIDIA GK106 (0e6000a1)
[   50.069144] nouveau 0000:01:00.0: bios: version 80.06.28.00.39
[   50.070725] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[   50.130957] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[   50.130959] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   50.130963] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[   50.130965] nouveau 0000:01:00.0: DRM: DCB version 4.0
[   50.130967] nouveau 0000:01:00.0: DRM: DCB outp 00: 02000f00 00000000
[   50.130970] nouveau 0000:01:00.0: DRM: DCB outp 01: 01000f02 00020030
[   50.130972] nouveau 0000:01:00.0: DRM: DCB outp 03: 02011f62 00020010
[   50.130973] nouveau 0000:01:00.0: DRM: DCB outp 04: 04822fb6 0f420010
[   50.130975] nouveau 0000:01:00.0: DRM: DCB outp 05: 04022f72 00020010
[   50.130977] nouveau 0000:01:00.0: DRM: DCB outp 06: 08033f82 00020030
[   50.130979] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
[   50.130981] nouveau 0000:01:00.0: DRM: DCB conn 01: 00010161
[   50.130983] nouveau 0000:01:00.0: DRM: DCB conn 02: 00020246
[   50.130985] nouveau 0000:01:00.0: DRM: DCB conn 03: 01000331
[   50.192971] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[   50.484265] nouveau 0000:01:00.0: DRM: allocated 1920x1080 fb: 0x60000, =
bo
ffff880401a4f000
[   50.484398] fbcon: nouveaufb (fb0) is primary device
[   50.944161] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   50.969789] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0

My old dmesg | grep nouveau
[    0.000000] Kernel command line:
BOOT_IMAGE=3D/kernel-genkernel-x86_64-4.4.8-hardened-r1 root=3D/dev/sda2
nouveau.config=3DNvGrUseFw=3D1 pax_sanitize_slab=3D0
[   36.316263] nouveau 0000:01:00.0: NVIDIA GK106 (0e6000a1)
[   36.377566] nouveau 0000:01:00.0: bios: version 80.06.28.00.39
[   36.378674] nouveau 0000:01:00.0: gr: using external firmware
[   36.525601] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[   36.582036] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[   36.582038] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   36.582041] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[   36.582043] nouveau 0000:01:00.0: DRM: DCB version 4.0
[   36.582045] nouveau 0000:01:00.0: DRM: DCB outp 00: 02000f00 00000000
[   36.582047] nouveau 0000:01:00.0: DRM: DCB outp 01: 01000f02 00020030
[   36.582049] nouveau 0000:01:00.0: DRM: DCB outp 03: 02011f62 00020010
[   36.582051] nouveau 0000:01:00.0: DRM: DCB outp 04: 04822fb6 0f420010
[   36.582053] nouveau 0000:01:00.0: DRM: DCB outp 05: 04022f72 00020010
[   36.582055] nouveau 0000:01:00.0: DRM: DCB outp 06: 08033f82 00020030
[   36.582057] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
[   36.582058] nouveau 0000:01:00.0: DRM: DCB conn 01: 00010161
[   36.582060] nouveau 0000:01:00.0: DRM: DCB conn 02: 00020246
[   36.582062] nouveau 0000:01:00.0: DRM: DCB conn 03: 01000331
[   36.645456] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[   36.932869] nouveau 0000:01:00.0: DRM: allocated 1920x1080 fb: 0x60000, =
bo
ffff8804057f2000
[   36.933004] fbcon: nouveaufb (fb0) is primary device
[   37.394395] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   37.419462] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0

So it contains line 'gr: using external firmware'

Please help me load these blobs back to my new system to work without freez=
es.

Thanks a lot

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14777353190.1b6eE6C5d.6483
Date: Sat, 29 Oct 2016 10:01:59 +0000
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
   title=3D"NEW - Nouveau not loading PGRAPH firmware blob for gk106 in ker=
nel 4.7.10"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98489">98489</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau not loading PGRAPH firmware blob for gk106 in kernel =
4.7.10
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
          <td>tuxenergy&#64;mail.ru
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hi. Many people know that GTX660 (gk106, nve06) is working wel=
l only with
firmware blobs. (see i.e. <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"show_bug.cgi?id=3D93629">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D93629</a>)
I had using them in my old Gentoo Hardened with kernel 4.4.8 and all was fi=
ne,
video card worked very well with 4 .bin files in /lib/firmware/nvidia/gk106

fecs_inst.bin
fecs_data.bin
gpccs_inst.bin
gpccs_data.bin

Now I installed a new system from scratch on same computer. Used **exactly =
same
kernel config** (it means it is valid for all *FIRMWARE* values), but newer
kernel version 4.7.10-r1. I put same firmware files into
/lib/firmware/nvidia/gk106, put nouveau.config=3D&quot;NvGrUseFw=3D1&quot; =
in grub kernel
line, but it is not loading, I can't see line in `dmesg | grep nouveau` gr:
using external firmware, as it was in my old 4.4.8 setup.=20

After that, I tried to copy these blobs to old naming space,
/lib/firmware/nouveau/fuc*, tried to include them in kernel directly, tried=
 to
include it in initramfs, nothing helps. It doesn't run.
My current dmesg | grep nouveau:=20
[    0.000000] Kernel command line: nouveau.config=3D&quot;NvGrUseFw=3D1&qu=
ot;
BOOT_IMAGE=3D/kernel-genkernel-x86_64-4.7.10-hardened-r1 root=3D/dev/sda2
nouveau.config=3DNvGrUseFw=3D1 pax_sanitize_slab=3D0
[   50.006877] nouveau 0000:01:00.0: NVIDIA GK106 (0e6000a1)
[   50.069144] nouveau 0000:01:00.0: bios: version 80.06.28.00.39
[   50.070725] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[   50.130957] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[   50.130959] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   50.130963] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[   50.130965] nouveau 0000:01:00.0: DRM: DCB version 4.0
[   50.130967] nouveau 0000:01:00.0: DRM: DCB outp 00: 02000f00 00000000
[   50.130970] nouveau 0000:01:00.0: DRM: DCB outp 01: 01000f02 00020030
[   50.130972] nouveau 0000:01:00.0: DRM: DCB outp 03: 02011f62 00020010
[   50.130973] nouveau 0000:01:00.0: DRM: DCB outp 04: 04822fb6 0f420010
[   50.130975] nouveau 0000:01:00.0: DRM: DCB outp 05: 04022f72 00020010
[   50.130977] nouveau 0000:01:00.0: DRM: DCB outp 06: 08033f82 00020030
[   50.130979] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
[   50.130981] nouveau 0000:01:00.0: DRM: DCB conn 01: 00010161
[   50.130983] nouveau 0000:01:00.0: DRM: DCB conn 02: 00020246
[   50.130985] nouveau 0000:01:00.0: DRM: DCB conn 03: 01000331
[   50.192971] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[   50.484265] nouveau 0000:01:00.0: DRM: allocated 1920x1080 fb: 0x60000, =
bo
ffff880401a4f000
[   50.484398] fbcon: nouveaufb (fb0) is primary device
[   50.944161] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   50.969789] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0

My old dmesg | grep nouveau
[    0.000000] Kernel command line:
BOOT_IMAGE=3D/kernel-genkernel-x86_64-4.4.8-hardened-r1 root=3D/dev/sda2
nouveau.config=3DNvGrUseFw=3D1 pax_sanitize_slab=3D0
[   36.316263] nouveau 0000:01:00.0: NVIDIA GK106 (0e6000a1)
[   36.377566] nouveau 0000:01:00.0: bios: version 80.06.28.00.39
[   36.378674] nouveau 0000:01:00.0: gr: using external firmware
[   36.525601] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[   36.582036] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[   36.582038] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   36.582041] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[   36.582043] nouveau 0000:01:00.0: DRM: DCB version 4.0
[   36.582045] nouveau 0000:01:00.0: DRM: DCB outp 00: 02000f00 00000000
[   36.582047] nouveau 0000:01:00.0: DRM: DCB outp 01: 01000f02 00020030
[   36.582049] nouveau 0000:01:00.0: DRM: DCB outp 03: 02011f62 00020010
[   36.582051] nouveau 0000:01:00.0: DRM: DCB outp 04: 04822fb6 0f420010
[   36.582053] nouveau 0000:01:00.0: DRM: DCB outp 05: 04022f72 00020010
[   36.582055] nouveau 0000:01:00.0: DRM: DCB outp 06: 08033f82 00020030
[   36.582057] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
[   36.582058] nouveau 0000:01:00.0: DRM: DCB conn 01: 00010161
[   36.582060] nouveau 0000:01:00.0: DRM: DCB conn 02: 00020246
[   36.582062] nouveau 0000:01:00.0: DRM: DCB conn 03: 01000331
[   36.645456] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[   36.932869] nouveau 0000:01:00.0: DRM: allocated 1920x1080 fb: 0x60000, =
bo
ffff8804057f2000
[   36.933004] fbcon: nouveaufb (fb0) is primary device
[   37.394395] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   37.419462] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0

So it contains line 'gr: using external firmware'

Please help me load these blobs back to my new system to work without freez=
es.

Thanks a lot</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14777353190.1b6eE6C5d.6483--

--===============0271881530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0271881530==--
