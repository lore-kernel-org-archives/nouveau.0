From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98457] New: [NVD9] GPU lockup after resume from
 hibernation with Nouveau driver and firmware-nonfree
Date: Thu, 27 Oct 2016 08:29:51 +0000
Message-ID: <bug-98457-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0944662595=="
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


--===============0944662595==
Content-Type: multipart/alternative; boundary="14775569911.D94Bf.12596";
 charset="UTF-8"


--14775569911.D94Bf.12596
Date: Thu, 27 Oct 2016 08:29:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98457

            Bug ID: 98457
           Summary: [NVD9] GPU lockup after resume from hibernation with
                    Nouveau driver and firmware-nonfree
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: wadev-cl+VPiYnx/0HWmgEVkV9KA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

With 4.7.0-1-amd64 debian kernel and 4.8.4 upstream kernel, the following
symptom happens after resume from hibernation:

Oct 27 09:59:37 terra kernel: [    4.615904] nouveau 0000:01:00.0: NVIDIA G=
F119
(0d90a0a1)
Oct 27 09:59:37 terra kernel: [    4.763654] nouveau 0000:01:00.0: bios:
version 75.19.56.00.00
Oct 27 09:59:37 terra kernel: [    4.764202] nouveau 0000:01:00.0: fb: 2048=
 MiB
DDR3
Oct 27 09:59:37 terra kernel: [    4.822165] nouveau 0000:01:00.0: DRM: VRA=
M:
2048 MiB
Oct 27 09:59:37 terra kernel: [    4.822166] nouveau 0000:01:00.0: DRM: GAR=
T:
1048576 MiB
Oct 27 09:59:37 terra kernel: [    4.822168] nouveau 0000:01:00.0: DRM: TMDS
table version 2.0
Oct 27 09:59:37 terra kernel: [    4.822168] nouveau 0000:01:00.0: DRM: DCB
version 4.0
Oct 27 09:59:37 terra kernel: [    4.822169] nouveau 0000:01:00.0: DRM: DCB
outp 00: 02000300 00000000
Oct 27 09:59:37 terra kernel: [    4.822170] nouveau 0000:01:00.0: DRM: DCB
outp 01: 01000302 00020030
Oct 27 09:59:37 terra kernel: [    4.822171] nouveau 0000:01:00.0: DRM: DCB
outp 02: 02011362 00020010
Oct 27 09:59:37 terra kernel: [    4.822172] nouveau 0000:01:00.0: DRM: DCB
outp 03: 04022310 00000000
Oct 27 09:59:37 terra kernel: [    4.822172] nouveau 0000:01:00.0: DRM: DCB
conn 00: 00001030
Oct 27 09:59:37 terra kernel: [    4.822173] nouveau 0000:01:00.0: DRM: DCB
conn 01: 00002161
Oct 27 09:59:37 terra kernel: [    4.822174] nouveau 0000:01:00.0: DRM: DCB
conn 02: 00000200
Oct 27 09:59:37 terra kernel: [    4.894804] nouveau 0000:01:00.0: DRM: MM:
using COPY0 for buffer copies
Oct 27 09:59:37 terra kernel: [    5.082142] nouveau 0000:01:00.0: DRM:
allocated 1920x1080 fb: 0x60000, bo ffff8c2694bae000
Oct 27 09:59:37 terra kernel: [    5.082217] fbcon: nouveaufb (fb0) is prim=
ary
device
Oct 27 09:59:37 terra kernel: [    5.162211] nouveau 0000:01:00.0: fb0:
nouveaufb frame buffer device
Oct 27 09:59:37 terra kernel: [    5.176376] [drm] Initialized nouveau 1.3.1
20120801 for 0000:01:00.0 on minor 0
Oct 27 10:11:27 terra kernel: [  682.165720] nouveau 0000:01:00.0: DRM:
suspending console...
Oct 27 10:11:27 terra kernel: [  682.165725] nouveau 0000:01:00.0: DRM:
suspending display...
Oct 27 10:11:27 terra kernel: [  682.165747] nouveau 0000:01:00.0: DRM:
evicting buffers...
Oct 27 10:11:27 terra kernel: [  682.264493] nouveau 0000:01:00.0: DRM: wai=
ting
for kernel channels to go idle...
Oct 27 10:11:27 terra kernel: [  682.264531] nouveau 0000:01:00.0: DRM:
suspending client object trees...
Oct 27 10:11:27 terra kernel: [  682.264877] nouveau 0000:01:00.0: DRM:
suspending kernel object tree...
Oct 27 10:11:27 terra kernel: [  683.204263] nouveau 0000:01:00.0: DRM:
resuming kernel object tree...
Oct 27 10:11:27 terra kernel: [  683.261389] nouveau 0000:01:00.0: DRM:
resuming client object trees...
Oct 27 10:11:27 terra kernel: [  683.261572] nouveau 0000:01:00.0: DRM:
resuming display...
Oct 27 10:11:27 terra kernel: [  683.312957] nouveau 0000:01:00.0: DRM:
resuming console...
Oct 27 10:11:27 terra kernel: [  683.313003] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313019] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313039] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313052] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313065] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313079] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313092] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313106] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313119] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313133] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313146] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313160] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313174] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313187] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313201] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313214] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313228] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313244] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313257] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.480999] nouveau 0000:01:00.0: DRM: GPU
lockup - switching to software fbcon
Oct 27 10:11:33 terra kernel: [  690.449768] nouveau 0000:01:00.0: fifo: wr=
ite
fault at 00011b6000 engine 00 [PGRAPH] client 0f [GPC0/PROP] reason 02
[PAGE_NOT_PRESENT] on channel 2 [007fbb$
Oct 27 10:11:33 terra kernel: [  690.449896] nouveau 0000:01:00.0: fifo: gr
engine fault on channel 2, recovering...

This happens when I suspend from tty0 (console) with "echo disk >
/sys/power/state".
After that, no symptoms of the previous lockup (with the Firefox Google Maps
rendering issue), that is, freezing, general unresponsiveness or similar; I=
 get
the console back and can restart the display manager, then all works OK (ex=
cept
that I have to kill instances of singleton-like processes probably clinging=
 to
the defunct display).

If I do the same from an X terminal, then at the end of the resume process,=
 the
system does a cold boot.

No probably related messages during the shutdown though.

Version info:

OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NVD9
OpenGL core profile version string: 3.3 (Core Profile) Mesa 10.3.2
OpenGL core profile shading language version string: 3.30
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile

(I used gcc 4.9.2 to compile the kernel and modules, if that means anything=
.)

I'm going to try the "trunk" build or whatever when I will have some time.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14775569911.D94Bf.12596
Date: Thu, 27 Oct 2016 08:29:51 +0000
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
   title=3D"NEW - [NVD9] GPU lockup after resume from hibernation with Nouv=
eau driver and firmware-nonfree"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98457">98457</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVD9] GPU lockup after resume from hibernation with Nouveau =
driver and firmware-nonfree
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
          <td>wadev&#64;mailbox.hu
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>With 4.7.0-1-amd64 debian kernel and 4.8.4 upstream kernel, th=
e following
symptom happens after resume from hibernation:

Oct 27 09:59:37 terra kernel: [    4.615904] nouveau 0000:01:00.0: NVIDIA G=
F119
(0d90a0a1)
Oct 27 09:59:37 terra kernel: [    4.763654] nouveau 0000:01:00.0: bios:
version 75.19.56.00.00
Oct 27 09:59:37 terra kernel: [    4.764202] nouveau 0000:01:00.0: fb: 2048=
 MiB
DDR3
Oct 27 09:59:37 terra kernel: [    4.822165] nouveau 0000:01:00.0: DRM: VRA=
M:
2048 MiB
Oct 27 09:59:37 terra kernel: [    4.822166] nouveau 0000:01:00.0: DRM: GAR=
T:
1048576 MiB
Oct 27 09:59:37 terra kernel: [    4.822168] nouveau 0000:01:00.0: DRM: TMDS
table version 2.0
Oct 27 09:59:37 terra kernel: [    4.822168] nouveau 0000:01:00.0: DRM: DCB
version 4.0
Oct 27 09:59:37 terra kernel: [    4.822169] nouveau 0000:01:00.0: DRM: DCB
outp 00: 02000300 00000000
Oct 27 09:59:37 terra kernel: [    4.822170] nouveau 0000:01:00.0: DRM: DCB
outp 01: 01000302 00020030
Oct 27 09:59:37 terra kernel: [    4.822171] nouveau 0000:01:00.0: DRM: DCB
outp 02: 02011362 00020010
Oct 27 09:59:37 terra kernel: [    4.822172] nouveau 0000:01:00.0: DRM: DCB
outp 03: 04022310 00000000
Oct 27 09:59:37 terra kernel: [    4.822172] nouveau 0000:01:00.0: DRM: DCB
conn 00: 00001030
Oct 27 09:59:37 terra kernel: [    4.822173] nouveau 0000:01:00.0: DRM: DCB
conn 01: 00002161
Oct 27 09:59:37 terra kernel: [    4.822174] nouveau 0000:01:00.0: DRM: DCB
conn 02: 00000200
Oct 27 09:59:37 terra kernel: [    4.894804] nouveau 0000:01:00.0: DRM: MM:
using COPY0 for buffer copies
Oct 27 09:59:37 terra kernel: [    5.082142] nouveau 0000:01:00.0: DRM:
allocated 1920x1080 fb: 0x60000, bo ffff8c2694bae000
Oct 27 09:59:37 terra kernel: [    5.082217] fbcon: nouveaufb (fb0) is prim=
ary
device
Oct 27 09:59:37 terra kernel: [    5.162211] nouveau 0000:01:00.0: fb0:
nouveaufb frame buffer device
Oct 27 09:59:37 terra kernel: [    5.176376] [drm] Initialized nouveau 1.3.1
20120801 for 0000:01:00.0 on minor 0
Oct 27 10:11:27 terra kernel: [  682.165720] nouveau 0000:01:00.0: DRM:
suspending console...
Oct 27 10:11:27 terra kernel: [  682.165725] nouveau 0000:01:00.0: DRM:
suspending display...
Oct 27 10:11:27 terra kernel: [  682.165747] nouveau 0000:01:00.0: DRM:
evicting buffers...
Oct 27 10:11:27 terra kernel: [  682.264493] nouveau 0000:01:00.0: DRM: wai=
ting
for kernel channels to go idle...
Oct 27 10:11:27 terra kernel: [  682.264531] nouveau 0000:01:00.0: DRM:
suspending client object trees...
Oct 27 10:11:27 terra kernel: [  682.264877] nouveau 0000:01:00.0: DRM:
suspending kernel object tree...
Oct 27 10:11:27 terra kernel: [  683.204263] nouveau 0000:01:00.0: DRM:
resuming kernel object tree...
Oct 27 10:11:27 terra kernel: [  683.261389] nouveau 0000:01:00.0: DRM:
resuming client object trees...
Oct 27 10:11:27 terra kernel: [  683.261572] nouveau 0000:01:00.0: DRM:
resuming display...
Oct 27 10:11:27 terra kernel: [  683.312957] nouveau 0000:01:00.0: DRM:
resuming console...
Oct 27 10:11:27 terra kernel: [  683.313003] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313019] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313039] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313052] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313065] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313079] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313092] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313106] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313119] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313133] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313146] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313160] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313174] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313187] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313201] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313214] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313228] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313244] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.313257] nouveau 0000:01:00.0: fifo:
PBDMA0: 00010000 [] ch 1 [007fd51000 DRM] subc 0 mthd 0000 data 00000000
Oct 27 10:11:27 terra kernel: [  683.480999] nouveau 0000:01:00.0: DRM: GPU
lockup - switching to software fbcon
Oct 27 10:11:33 terra kernel: [  690.449768] nouveau 0000:01:00.0: fifo: wr=
ite
fault at 00011b6000 engine 00 [PGRAPH] client 0f [GPC0/PROP] reason 02
[PAGE_NOT_PRESENT] on channel 2 [007fbb$
Oct 27 10:11:33 terra kernel: [  690.449896] nouveau 0000:01:00.0: fifo: gr
engine fault on channel 2, recovering...

This happens when I suspend from tty0 (console) with &quot;echo disk &gt;
/sys/power/state&quot;.
After that, no symptoms of the previous lockup (with the Firefox Google Maps
rendering issue), that is, freezing, general unresponsiveness or similar; I=
 get
the console back and can restart the display manager, then all works OK (ex=
cept
that I have to kill instances of singleton-like processes probably clinging=
 to
the defunct display).

If I do the same from an X terminal, then at the end of the resume process,=
 the
system does a cold boot.

No probably related messages during the shutdown though.

Version info:

OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NVD9
OpenGL core profile version string: 3.3 (Core Profile) Mesa 10.3.2
OpenGL core profile shading language version string: 3.30
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile

(I used gcc 4.9.2 to compile the kernel and modules, if that means anything=
.)

I'm going to try the &quot;trunk&quot; build or whatever when I will have s=
ome time.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14775569911.D94Bf.12596--

--===============0944662595==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0944662595==--
