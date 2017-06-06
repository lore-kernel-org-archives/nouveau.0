From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101323] New: [nv20] glx-swap-event hangs X server
Date: Tue, 06 Jun 2017 22:37:42 +0000
Message-ID: <bug-101323-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0465830736=="
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


--===============0465830736==
Content-Type: multipart/alternative; boundary="14967886621.60f3.7000";
 charset="UTF-8"


--14967886621.60f3.7000
Date: Tue, 6 Jun 2017 22:37:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101323

            Bug ID: 101323
           Summary: [nv20] glx-swap-event hangs X server
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: idr-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Running 'bin/glx-swap-event --async -auto' on at least NV20 hangs the X ser=
ver.

Some dmesg info that *might* be related (during a full piglit run):

[ 3288.695639] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 16bc data 00000001
[ 3288.695674] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 0af0 data 00000000
[ 3288.695692] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 0af4 data 00000000
[ 3288.695711] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 0af8 data 4affffff
[ 3288.695728] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 0afc data 477fff00
[ 3288.695747] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0800
[STATE_INVALID] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 14f8 data ffffffff
[ 3288.695765] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0800
[STATE_INVALID] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 14fc data ffffffff
[ 3288.695783] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0800
[STATE_INVALID] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 147c data 00000000
[ 3288.695800] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 03f8 data 00000000
[ 3288.695817] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 03fc data 00000000
[ 3288.695864] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 16bc data 00000001
[ 3288.695882] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 0af0 data 00000000
[ 3288.695900] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 0af4 data 00000000
[ 3288.695918] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 0af8 data 4affffff
[ 3288.695935] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 0afc data 477fff00
[ 3288.695952] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0800
[STATE_INVALID] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 14f8 data ffffffff
[ 3288.695969] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0800
[STATE_INVALID] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 14fc data ffffffff
[ 3288.695986] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0800
[STATE_INVALID] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 147c data 00000000
[ 3288.696003] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 03f8 data 00000000
[ 3288.696052] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 03fc data 00000000

Backtrace of the X server process:

(gdb) bt
#0  0x00007f999b0d1787 in ioctl () from /lib64/libc.so.6
#1  0x00007f999c5d52e8 in drmIoctl () from /lib64/libdrm.so.2
#2  0x00007f999c5d7e6b in drmCommandWrite () from /lib64/libdrm.so.2
#3  0x00007f99979701f2 in nouveau_bo_wait () from /lib64/libdrm_nouveau.so.2
#4  0x00007f9997b812e2 in nouveau_dri2_copy_region2 () from
/usr/lib64/xorg/modules/drivers/nouveau_drv.so
#5  0x000000000056ce6b in dri2_copy_region ()
#6  0x000000000056e19f in DRI2SwapBuffers ()
#7  0x000000000056f9ad in ProcDRI2Dispatch ()
#8  0x00000000004370f5 in Dispatch ()
#9  0x000000000043b078 in dix_main ()
#10 0x00007f999aff4401 in __libc_start_main () from /lib64/libc.so.6
#11 0x0000000000424d5a in _start ()

This is on Fedora 24.

xorg-x11-server-Xorg-1.19.3-1.fc25.x86_64
kernel-4.11.3-200.fc25.x86_64
xorg-x11-drv-nouveau-1.0.15-2.fc25.x86_64

I'm using Mesa master from the last couple days (commit 06f425192).

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14967886621.60f3.7000
Date: Tue, 6 Jun 2017 22:37:42 +0000
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
   title=3D"NEW - [nv20] glx-swap-event hangs X server"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101323">101323</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[nv20] glx-swap-event hangs X server
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>idr&#64;freedesktop.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Running 'bin/glx-swap-event --async -auto' on at least NV20 ha=
ngs the X server.

Some dmesg info that *might* be related (during a full piglit run):

[ 3288.695639] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 16bc data 00000001
[ 3288.695674] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 0af0 data 00000000
[ 3288.695692] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 0af4 data 00000000
[ 3288.695711] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 0af8 data 4affffff
[ 3288.695728] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 0afc data 477fff00
[ 3288.695747] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0800
[STATE_INVALID] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 14f8 data ffffffff
[ 3288.695765] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0800
[STATE_INVALID] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 14fc data ffffffff
[ 3288.695783] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0800
[STATE_INVALID] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 147c data 00000000
[ 3288.695800] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 03f8 data 00000000
[ 3288.695817] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 03fc data 00000000
[ 3288.695864] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 16bc data 00000001
[ 3288.695882] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 0af0 data 00000000
[ 3288.695900] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 0af4 data 00000000
[ 3288.695918] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 0af8 data 4affffff
[ 3288.695935] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 0afc data 477fff00
[ 3288.695952] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0800
[STATE_INVALID] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 14f8 data ffffffff
[ 3288.695969] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0800
[STATE_INVALID] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 14fc data ffffffff
[ 3288.695986] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0800
[STATE_INVALID] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 147c data 00000000
[ 3288.696003] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 03f8 data 00000000
[ 3288.696052] nouveau 0000:04:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0040
[ILLEGAL_MTHD] nstatus 05000000 [INVALID_STATE PROTECTION_FAULT] ch 1
[Xorg[713]] subc 7 class 0096 mthd 03fc data 00000000

Backtrace of the X server process:

(gdb) bt
#0  0x00007f999b0d1787 in ioctl () from /lib64/libc.so.6
#1  0x00007f999c5d52e8 in drmIoctl () from /lib64/libdrm.so.2
#2  0x00007f999c5d7e6b in drmCommandWrite () from /lib64/libdrm.so.2
#3  0x00007f99979701f2 in nouveau_bo_wait () from /lib64/libdrm_nouveau.so.2
#4  0x00007f9997b812e2 in nouveau_dri2_copy_region2 () from
/usr/lib64/xorg/modules/drivers/nouveau_drv.so
#5  0x000000000056ce6b in dri2_copy_region ()
#6  0x000000000056e19f in DRI2SwapBuffers ()
#7  0x000000000056f9ad in ProcDRI2Dispatch ()
#8  0x00000000004370f5 in Dispatch ()
#9  0x000000000043b078 in dix_main ()
#10 0x00007f999aff4401 in __libc_start_main () from /lib64/libc.so.6
#11 0x0000000000424d5a in _start ()

This is on Fedora 24.

xorg-x11-server-Xorg-1.19.3-1.fc25.x86_64
kernel-4.11.3-200.fc25.x86_64
xorg-x11-drv-nouveau-1.0.15-2.fc25.x86_64

I'm using Mesa master from the last couple days (commit 06f425192).</pre>
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

--14967886621.60f3.7000--

--===============0465830736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0465830736==--
