From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93828] New: Xorg hangs randomly with nouveau driver
Date: Fri, 22 Jan 2016 21:10:25 +0000
Message-ID: <bug-93828-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1408734174=="
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


--===============1408734174==
Content-Type: multipart/alternative; boundary="14534970250.af3e.30912";
 charset="UTF-8"


--14534970250.af3e.30912
Date: Fri, 22 Jan 2016 21:10:25 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93828

            Bug ID: 93828
           Summary: Xorg hangs randomly with nouveau driver
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: mgresko8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Xorg hangs randomly with nouveau driver. It could be reproduced cometimes when
playing video or starting libreoffice, but not limited to. If pressing
Ctrl+Alt+Backspace, monitor goes to sleep immediately. Alt+Sysrq combinations
are usually working and also ssh.

System journal contains:
 kernel: nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 16 [soffice.bin[30009]]
subc 5 mthd 0184 data beef0201

... and many similar lines with changing numbers after subc, mthd and data.
Folowed by:
/usr/libexec/gdm-x-session[11881]: QXcbConnection: XCB error: 3 (BadWindow),
sequence: 55765, resource id: 100663298, major code: 18 (ChangeProperty), minor
code: 0

and
kernel: nouveau 0000:01:00.0: gr: TRAP_CCACHE 00000001 [FAULT]
kernel: nouveau 0000:01:00.0: gr: TRAP_CCACHE 000e0080 00000000 00000000
00000000 00000000 00000004 00000000
kernel: nouveau 0000:01:00.0: gr: 00200000 [] ch 16 [001eb0f000
soffice.bin[30009]] subc 3 class 8597 mthd 13bc data 00000054
kernel: nouveau 0000:01:00.0: fb: trapped read at 002027ff00 on channel 16
[1eb0f000 soffice.bin[30009]] engine 00 [PGRAPH] client 05 [CCACHE] subclient
00 [CB] reason 00.......
kernel: nouveau 0000:01:00.0: gr: PGRAPH TLB flush idle timeout fail
kernel: nouveau 0000:01:00.0: gr: PGRAPH_STATUS 00000503 [BUSY DISPATCH CTXPROG
CCACHE_PREGEOM]
kernel: nouveau 0000:01:00.0: gr: PGRAPH_VSTATUS0: 00000008 [CCACHE]
kernel: nouveau 0000:01:00.0: gr: PGRAPH_VSTATUS1: 00000000 []
kernel: nouveau 0000:01:00.0: gr: PGRAPH_VSTATUS2: 00000000 []
(EE) [mi] EQ overflowing.  Additional events will be discarded until existing
events are processed.
(EE) 
(EE) Backtrace:
(EE) 0: /usr/libexec/Xorg (mieqEnqueue+0x253) [0x578753]
(EE) 1: /usr/libexec/Xorg (QueuePointerEvents+0x52) [0x44f352]
(EE) 2: /usr/lib64/xorg/modules/input/evdev_drv.so (_init+0x30eb)
[0x7f1f83f13dfb]
(EE) 3: /usr/lib64/xorg/modules/input/evdev_drv.so (_init+0x3855)
[0x7f1f83f15035]
(EE) 4: /usr/libexec/Xorg (DPMSSupported+0xe8) [0x4769c8]
(EE) 5: /usr/libexec/Xorg (xf86SerialModemClearBits+0x2b2) [0x49fe62]
(EE) 6: /lib64/libc.so.6 (__restore_rt+0x0) [0x7f1f8df6fb1f]
(EE) 7: /lib64/libc.so.6 (ioctl+0x5) [0x7f1f8e033705]
(EE) 8: /lib64/libdrm.so.2 (drmIoctl+0x28) [0x7f1f8f32f508]
(EE) 9: /lib64/libdrm.so.2 (drmCommandWrite+0x1b) [0x7f1f8f33208b]
(EE) 10: /lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0xbc) [0x7f1f88a2637c]
(EE) 11: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (_init+0x75f9)
[0x7f1f88c3ed19]
(EE) 12: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (_init+0x801d)
[0x7f1f88c400ed]
(EE) 13: /usr/libexec/Xorg (DRI2SwapBuffers+0x1c8) [0x569268]
(EE) 14: /usr/libexec/Xorg (DRI2GetParam+0xb7c) [0x56ae0c]
(EE) 15: /usr/libexec/Xorg (SendErrorToClient+0x2df) [0x4369bf]
(EE) 16: /usr/libexec/Xorg (remove_fs_handlers+0x453) [0x43a9e3]
(EE) 17: /lib64/libc.so.6 (__libc_start_main+0xf0) [0x7f1f8df5b580]
(EE) 18: /usr/libexec/Xorg (_start+0x29) [0x424ce9]
(EE) 19: ? (?+0x29) [0x29]
(EE) 
(EE) [mi] These backtraces from mieqEnqueue may point to a culprit higher up
the stack.
(EE) [mi] mieq is *NOT* the cause.  It is a victim.
(EE) [mi] EQ overflow continuing.  100 events have been dropped.
(EE)

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14534970250.af3e.30912
Date: Fri, 22 Jan 2016 21:10:25 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Xorg hangs randomly with nouveau driver"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93828">93828</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Xorg hangs randomly with nouveau driver
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
          <td>critical
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
          <td>mgresko8&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Xorg hangs randomly with nouveau driver. It could be reproduced cometimes when
playing video or starting libreoffice, but not limited to. If pressing
Ctrl+Alt+Backspace, monitor goes to sleep immediately. Alt+Sysrq combinations
are usually working and also ssh.

System journal contains:
 kernel: nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 16 [soffice.bin[30009]]
subc 5 mthd 0184 data beef0201

... and many similar lines with changing numbers after subc, mthd and data.
Folowed by:
/usr/libexec/gdm-x-session[11881]: QXcbConnection: XCB error: 3 (BadWindow),
sequence: 55765, resource id: 100663298, major code: 18 (ChangeProperty), minor
code: 0

and
kernel: nouveau 0000:01:00.0: gr: TRAP_CCACHE 00000001 [FAULT]
kernel: nouveau 0000:01:00.0: gr: TRAP_CCACHE 000e0080 00000000 00000000
00000000 00000000 00000004 00000000
kernel: nouveau 0000:01:00.0: gr: 00200000 [] ch 16 [001eb0f000
soffice.bin[30009]] subc 3 class 8597 mthd 13bc data 00000054
kernel: nouveau 0000:01:00.0: fb: trapped read at 002027ff00 on channel 16
[1eb0f000 soffice.bin[30009]] engine 00 [PGRAPH] client 05 [CCACHE] subclient
00 [CB] reason 00.......
kernel: nouveau 0000:01:00.0: gr: PGRAPH TLB flush idle timeout fail
kernel: nouveau 0000:01:00.0: gr: PGRAPH_STATUS 00000503 [BUSY DISPATCH CTXPROG
CCACHE_PREGEOM]
kernel: nouveau 0000:01:00.0: gr: PGRAPH_VSTATUS0: 00000008 [CCACHE]
kernel: nouveau 0000:01:00.0: gr: PGRAPH_VSTATUS1: 00000000 []
kernel: nouveau 0000:01:00.0: gr: PGRAPH_VSTATUS2: 00000000 []
(EE) [mi] EQ overflowing.  Additional events will be discarded until existing
events are processed.
(EE) 
(EE) Backtrace:
(EE) 0: /usr/libexec/Xorg (mieqEnqueue+0x253) [0x578753]
(EE) 1: /usr/libexec/Xorg (QueuePointerEvents+0x52) [0x44f352]
(EE) 2: /usr/lib64/xorg/modules/input/evdev_drv.so (_init+0x30eb)
[0x7f1f83f13dfb]
(EE) 3: /usr/lib64/xorg/modules/input/evdev_drv.so (_init+0x3855)
[0x7f1f83f15035]
(EE) 4: /usr/libexec/Xorg (DPMSSupported+0xe8) [0x4769c8]
(EE) 5: /usr/libexec/Xorg (xf86SerialModemClearBits+0x2b2) [0x49fe62]
(EE) 6: /lib64/libc.so.6 (__restore_rt+0x0) [0x7f1f8df6fb1f]
(EE) 7: /lib64/libc.so.6 (ioctl+0x5) [0x7f1f8e033705]
(EE) 8: /lib64/libdrm.so.2 (drmIoctl+0x28) [0x7f1f8f32f508]
(EE) 9: /lib64/libdrm.so.2 (drmCommandWrite+0x1b) [0x7f1f8f33208b]
(EE) 10: /lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0xbc) [0x7f1f88a2637c]
(EE) 11: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (_init+0x75f9)
[0x7f1f88c3ed19]
(EE) 12: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (_init+0x801d)
[0x7f1f88c400ed]
(EE) 13: /usr/libexec/Xorg (DRI2SwapBuffers+0x1c8) [0x569268]
(EE) 14: /usr/libexec/Xorg (DRI2GetParam+0xb7c) [0x56ae0c]
(EE) 15: /usr/libexec/Xorg (SendErrorToClient+0x2df) [0x4369bf]
(EE) 16: /usr/libexec/Xorg (remove_fs_handlers+0x453) [0x43a9e3]
(EE) 17: /lib64/libc.so.6 (__libc_start_main+0xf0) [0x7f1f8df5b580]
(EE) 18: /usr/libexec/Xorg (_start+0x29) [0x424ce9]
(EE) 19: ? (?+0x29) [0x29]
(EE) 
(EE) [mi] These backtraces from mieqEnqueue may point to a culprit higher up
the stack.
(EE) [mi] mieq is *NOT* the cause.  It is a victim.
(EE) [mi] EQ overflow continuing.  100 events have been dropped.
(EE)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14534970250.af3e.30912--

--===============1408734174==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1408734174==--
