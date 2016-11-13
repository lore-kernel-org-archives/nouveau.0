From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98701] New: [NVE6] Desktop freeze,
 fifo read fault at 0000000000 engine 00 [GR] client 14 [SCC] reason
 02 [PTE] on channel 21
Date: Sun, 13 Nov 2016 08:46:44 +0000
Message-ID: <bug-98701-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0892514212=="
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


--===============0892514212==
Content-Type: multipart/alternative; boundary="14790268040.d73dE92.20517";
 charset="UTF-8"


--14790268040.d73dE92.20517
Date: Sun, 13 Nov 2016 08:46:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98701

            Bug ID: 98701
           Summary: [NVE6] Desktop freeze, fifo read fault at 0000000000
                    engine 00 [GR] client 14 [SCC] reason 02 [PTE] on
                    channel 21
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: matthias.h.nagel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Mostly, when I scroll a HTML e-mail within Kontact my system crashes. The
desktop becomes unresponsive. However, I can still move the mouse, but not
click, and I can login via SSH and reboot the system.

Dmesg:

[ 4323.214686] nouveau 0000:01:00.0: kontact[19175]: Unknown handle 0x00000=
039
[ 4323.214694] nouveau 0000:01:00.0: kontact[19175]: validate_init
[ 4323.214698] nouveau 0000:01:00.0: kontact[19175]: validate: -2
[ 4323.230994] nouveau 0000:01:00.0: kontact[19175]: Unknown handle 0x00000=
039
[ 4323.231002] nouveau 0000:01:00.0: kontact[19175]: validate_init
[ 4323.231006] nouveau 0000:01:00.0: kontact[19175]: validate: -2
[ 9642.309946] nouveau 0000:01:00.0: kontact[19175]: Unknown handle 0x00000=
01a
[ 9642.309950] nouveau 0000:01:00.0: kontact[19175]: validate_init
[ 9642.309952] nouveau 0000:01:00.0: kontact[19175]: validate: -2
[ 9654.499185] nouveau 0000:01:00.0: kontact[19175]: Unknown handle 0x00000=
05e
[ 9654.499191] nouveau 0000:01:00.0: kontact[19175]: validate_init
[ 9654.499193] nouveau 0000:01:00.0: kontact[19175]: validate: -2
[ 9655.527534] nouveau 0000:01:00.0: kontact[19175]: Unknown handle 0x00000=
03c
[ 9655.527542] nouveau 0000:01:00.0: kontact[19175]: validate_init
[ 9655.527546] nouveau 0000:01:00.0: kontact[19175]: validate: -2
[ 9655.534613] nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFI=
ELD]
ch 21 [023e9d4000 kontact[19175]] subc 0 class a097 mthd 2384 data 20050004
[ 9655.537255] nouveau 0000:01:00.0: kontact[19175]: Unknown handle 0x00000=
03c
[ 9655.537261] nouveau 0000:01:00.0: kontact[19175]: validate_init
[ 9655.537264] nouveau 0000:01:00.0: kontact[19175]: validate: -2
[ 9655.537530] nouveau 0000:01:00.0: fifo: read fault at 0000000000 engine =
00
[GR] client 14 [SCC] reason 02 [PTE] on channel 21 [023e9d4000 kontact[1917=
5]]
[ 9655.537538] nouveau 0000:01:00.0: fifo: gr engine fault on channel 21,
recovering...

Xorg.0.log:

(EE) [mi] EQ overflowing.  Additional events will be discarded until existi=
ng
events are processed.
(EE)=20
(EE) Backtrace:
(EE) 0: /usr/bin/X (xorg_backtrace+0x56) [0x58bd66]
(EE) 1: /usr/bin/X (mieqEnqueue+0x24b) [0x56db3b]
(EE) 2: /usr/bin/X (QueuePointerEvents+0x52) [0x44e712]
(EE) 3: /usr/lib64/xorg/modules/input/evdev_drv.so (0x7f526fc4b000+0x625f)
[0x7f526fc5125f]
(EE) 4: /usr/lib64/xorg/modules/input/evdev_drv.so (0x7f526fc4b000+0x6aed)
[0x7f526fc51aed]
(EE) 5: /usr/bin/X (0x400000+0x75ab8) [0x475ab8]
(EE) 6: /usr/bin/X (0x400000+0x9b116) [0x49b116]
(EE) 7: /lib64/libc.so.6 (0x7f527aafa000+0x33290) [0x7f527ab2d290]
(EE) 8: /lib64/libc.so.6 (ioctl+0x5) [0x7f527abdba55]
(EE) 9: /usr/lib64/libdrm.so.2 (drmIoctl+0x28) [0x7f527bc7dc68]
(EE) 10: /usr/lib64/libdrm.so.2 (drmCommandWrite+0x1b) [0x7f527bc8098b]
(EE) 11: /usr/lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0xbc) [0x7f5276a6c=
44c]
(EE) 12: /usr/lib64/libdrm_nouveau.so.2 (nouveau_pushbuf_space+0xde)
[0x7f5276a6d85e]
(EE) 13: /usr/lib64/xorg/modules/drivers/nouveau_drv.so
(0x7f5276c71000+0x23b21) [0x7f5276c94b21]
(EE) 14: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7f5276c71000+0x7=
c91)
[0x7f5276c78c91]
(EE) 15: /usr/lib64/xorg/modules/libexa.so (0x7f527642a000+0x9de4)
[0x7f5276433de4]
(EE) 16: /usr/lib64/xorg/modules/libexa.so (0x7f527642a000+0x9f2c)
[0x7f5276433f2c]
(EE) 17: /usr/bin/X (miCopyRegion+0x1b3) [0x56bf73]
(EE) 18: /usr/bin/X (miDoCopy+0x44e) [0x56c51e]
(EE) 19: /usr/lib64/xorg/modules/libexa.so (0x7f527642a000+0x8545)
[0x7f5276432545]
(EE) 20: /usr/bin/X (0x400000+0x117d81) [0x517d81]
(EE) 21: /usr/bin/X (0x400000+0xd13aa) [0x4d13aa]
(EE) 22: /usr/bin/X (0x400000+0xd2ad5) [0x4d2ad5]
(EE) 23: /usr/bin/X (0x400000+0x35faf) [0x435faf]
(EE) 24: /usr/bin/X (0x400000+0x3a033) [0x43a033]
(EE) 25: /lib64/libc.so.6 (__libc_start_main+0xf0) [0x7f527ab1a630]
(EE) 26: /usr/bin/X (_start+0x29) [0x424329]
(EE)=20
(EE) [mi] These backtraces from mieqEnqueue may point to a culprit higher up
the stack.
(EE) [mi] mieq is *NOT* the cause.  It is a victim.


.xsession-error:

kontact:
/var/tmp/portage/x11-libs/libdrm-2.4.70/work/libdrm-2.4.70/nouveau/pushbuf.=
c:727:
nouveau_pushbuf_data: Assertion =C2=BBkref=C2=AB failed.
*** KMail got signal 6 (Exiting)
*** Dead letters dumped.
[1105/184917:ERROR:gles2_cmd_decoder.cc(2109)]
[.CommandBufferContext.RenderWorker-0x1a44370]GL ERROR :GL_OUT_OF_MEMORY :
ScopedTextureBinder::dtor: <- error from previous GL command
[1105/184917:ERROR:gles2_cmd_decoder.cc(4471)] Error: 5 for Command
kCopySubTextureCHROMIUM
[1105/184917:ERROR:gles2_cmd_decoder.cc(3579)]   GLES2DecoderImpl: Trying to
make lost context current.
KCrash: Application 'kontact' crashing...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14790268040.d73dE92.20517
Date: Sun, 13 Nov 2016 08:46:44 +0000
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
   title=3D"NEW - [NVE6] Desktop freeze, fifo read fault at 0000000000 engi=
ne 00 [GR] client 14 [SCC] reason 02 [PTE] on channel 21"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98701">98701</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE6] Desktop freeze, fifo read fault at 0000000000 engine 0=
0 [GR] client 14 [SCC] reason 02 [PTE] on channel 21
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
          <td>matthias.h.nagel&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Mostly, when I scroll a HTML e-mail within Kontact my system c=
rashes. The
desktop becomes unresponsive. However, I can still move the mouse, but not
click, and I can login via SSH and reboot the system.

Dmesg:

[ 4323.214686] nouveau 0000:01:00.0: kontact[19175]: Unknown handle 0x00000=
039
[ 4323.214694] nouveau 0000:01:00.0: kontact[19175]: validate_init
[ 4323.214698] nouveau 0000:01:00.0: kontact[19175]: validate: -2
[ 4323.230994] nouveau 0000:01:00.0: kontact[19175]: Unknown handle 0x00000=
039
[ 4323.231002] nouveau 0000:01:00.0: kontact[19175]: validate_init
[ 4323.231006] nouveau 0000:01:00.0: kontact[19175]: validate: -2
[ 9642.309946] nouveau 0000:01:00.0: kontact[19175]: Unknown handle 0x00000=
01a
[ 9642.309950] nouveau 0000:01:00.0: kontact[19175]: validate_init
[ 9642.309952] nouveau 0000:01:00.0: kontact[19175]: validate: -2
[ 9654.499185] nouveau 0000:01:00.0: kontact[19175]: Unknown handle 0x00000=
05e
[ 9654.499191] nouveau 0000:01:00.0: kontact[19175]: validate_init
[ 9654.499193] nouveau 0000:01:00.0: kontact[19175]: validate: -2
[ 9655.527534] nouveau 0000:01:00.0: kontact[19175]: Unknown handle 0x00000=
03c
[ 9655.527542] nouveau 0000:01:00.0: kontact[19175]: validate_init
[ 9655.527546] nouveau 0000:01:00.0: kontact[19175]: validate: -2
[ 9655.534613] nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFI=
ELD]
ch 21 [023e9d4000 kontact[19175]] subc 0 class a097 mthd 2384 data 20050004
[ 9655.537255] nouveau 0000:01:00.0: kontact[19175]: Unknown handle 0x00000=
03c
[ 9655.537261] nouveau 0000:01:00.0: kontact[19175]: validate_init
[ 9655.537264] nouveau 0000:01:00.0: kontact[19175]: validate: -2
[ 9655.537530] nouveau 0000:01:00.0: fifo: read fault at 0000000000 engine =
00
[GR] client 14 [SCC] reason 02 [PTE] on channel 21 [023e9d4000 kontact[1917=
5]]
[ 9655.537538] nouveau 0000:01:00.0: fifo: gr engine fault on channel 21,
recovering...

Xorg.0.log:

(EE) [mi] EQ overflowing.  Additional events will be discarded until existi=
ng
events are processed.
(EE)=20
(EE) Backtrace:
(EE) 0: /usr/bin/X (xorg_backtrace+0x56) [0x58bd66]
(EE) 1: /usr/bin/X (mieqEnqueue+0x24b) [0x56db3b]
(EE) 2: /usr/bin/X (QueuePointerEvents+0x52) [0x44e712]
(EE) 3: /usr/lib64/xorg/modules/input/evdev_drv.so (0x7f526fc4b000+0x625f)
[0x7f526fc5125f]
(EE) 4: /usr/lib64/xorg/modules/input/evdev_drv.so (0x7f526fc4b000+0x6aed)
[0x7f526fc51aed]
(EE) 5: /usr/bin/X (0x400000+0x75ab8) [0x475ab8]
(EE) 6: /usr/bin/X (0x400000+0x9b116) [0x49b116]
(EE) 7: /lib64/libc.so.6 (0x7f527aafa000+0x33290) [0x7f527ab2d290]
(EE) 8: /lib64/libc.so.6 (ioctl+0x5) [0x7f527abdba55]
(EE) 9: /usr/lib64/libdrm.so.2 (drmIoctl+0x28) [0x7f527bc7dc68]
(EE) 10: /usr/lib64/libdrm.so.2 (drmCommandWrite+0x1b) [0x7f527bc8098b]
(EE) 11: /usr/lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0xbc) [0x7f5276a6c=
44c]
(EE) 12: /usr/lib64/libdrm_nouveau.so.2 (nouveau_pushbuf_space+0xde)
[0x7f5276a6d85e]
(EE) 13: /usr/lib64/xorg/modules/drivers/nouveau_drv.so
(0x7f5276c71000+0x23b21) [0x7f5276c94b21]
(EE) 14: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7f5276c71000+0x7=
c91)
[0x7f5276c78c91]
(EE) 15: /usr/lib64/xorg/modules/libexa.so (0x7f527642a000+0x9de4)
[0x7f5276433de4]
(EE) 16: /usr/lib64/xorg/modules/libexa.so (0x7f527642a000+0x9f2c)
[0x7f5276433f2c]
(EE) 17: /usr/bin/X (miCopyRegion+0x1b3) [0x56bf73]
(EE) 18: /usr/bin/X (miDoCopy+0x44e) [0x56c51e]
(EE) 19: /usr/lib64/xorg/modules/libexa.so (0x7f527642a000+0x8545)
[0x7f5276432545]
(EE) 20: /usr/bin/X (0x400000+0x117d81) [0x517d81]
(EE) 21: /usr/bin/X (0x400000+0xd13aa) [0x4d13aa]
(EE) 22: /usr/bin/X (0x400000+0xd2ad5) [0x4d2ad5]
(EE) 23: /usr/bin/X (0x400000+0x35faf) [0x435faf]
(EE) 24: /usr/bin/X (0x400000+0x3a033) [0x43a033]
(EE) 25: /lib64/libc.so.6 (__libc_start_main+0xf0) [0x7f527ab1a630]
(EE) 26: /usr/bin/X (_start+0x29) [0x424329]
(EE)=20
(EE) [mi] These backtraces from mieqEnqueue may point to a culprit higher up
the stack.
(EE) [mi] mieq is *NOT* the cause.  It is a victim.


.xsession-error:

kontact:
/var/tmp/portage/x11-libs/libdrm-2.4.70/work/libdrm-2.4.70/nouveau/pushbuf.=
c:727:
nouveau_pushbuf_data: Assertion =C2=BBkref=C2=AB failed.
*** KMail got signal 6 (Exiting)
*** Dead letters dumped.
[1105/184917:ERROR:gles2_cmd_decoder.cc(2109)]
[.CommandBufferContext.RenderWorker-0x1a44370]GL ERROR :GL_OUT_OF_MEMORY :
ScopedTextureBinder::dtor: &lt;- error from previous GL command
[1105/184917:ERROR:gles2_cmd_decoder.cc(4471)] Error: 5 for Command
kCopySubTextureCHROMIUM
[1105/184917:ERROR:gles2_cmd_decoder.cc(3579)]   GLES2DecoderImpl: Trying to
make lost context current.
KCrash: Application 'kontact' crashing...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14790268040.d73dE92.20517--

--===============0892514212==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0892514212==--
