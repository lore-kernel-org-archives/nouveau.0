From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90630] New: random driver crashes mostly after
	screen lock
Date: Mon, 25 May 2015 14:13:26 +0000
Message-ID: <bug-90630-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0863502091=="
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


--===============0863502091==
Content-Type: multipart/alternative; boundary="1432563206.bd7E2c451.9795"; charset="UTF-8"


--1432563206.bd7E2c451.9795
Date: Mon, 25 May 2015 14:13:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90630

            Bug ID: 90630
           Summary: random driver crashes mostly after screen lock
           Product: xorg
           Version: 7.7 (2012.06)
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: fd_mitch-3KzNJp4Rz8A@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 116026
  --> https://bugs.freedesktop.org/attachment.cgi?id=116026&action=edit
Kernel dmesg output after boot

Hello,

Since my upgrade to Kubuntu 15.04, I have had multiple freezes due to the
nouveau driver. Most of them happen when I am away from my computer, once the
screen is locked. I disabled the screen switch off feature, but kept the dim
screen after 15 minutes feature. I do not have any suspend or hibernate
features enabled. I still get the freezes.

When the freeze occurs, whatever was on the screen is frozen (so I can see the
time at which the freeze occured). My keyboard and mouse are unresponsive
(numlock led doesn't turn on/off). I can remote in (ssh) to my computer and
restart X and everything works correctly.

I do get some nouveau errors in dmesg, though it seems to be after I restart X.
See below the Xorg.0.log backtrace.

I am using the nouveau driver v1.0.11 with Xorg v7.7 (with ubuntu patches). 

uname -a gives:
Linux chum30182linux 3.19.0-18-generic #18-Ubuntu SMP Tue May 19 18:31:35 UTC
2015 x86_64 x86_64 x86_64 GNU/Linux

lspci -v for my video card is as follows:
02:00.0 VGA compatible controller: NVIDIA Corporation G96GL [Quadro FX 380]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: NVIDIA Corporation Device 063b
        Flags: bus master, fast devsel, latency 0, IRQ 33
        Memory at ca000000 (32-bit, non-prefetchable) [size=16M]
        Memory at d0000000 (64-bit, prefetchable) [size=256M]
        Memory at cc000000 (64-bit, non-prefetchable) [size=32M]
        I/O ports at 3000 [size=128]
        [virtual] Expansion ROM at cb000000 [disabled] [size=512K]
        Capabilities: <access denied>
        Kernel driver in use: nouveau

I have included my dmesg output (kernel_log.txt).

Here is the backtrace in my Xorg.0.log after a freeze.

(EE) Backtrace:
(EE) 0: /usr/bin/X (xorg_backtrace+0x56) [0x7fbea7fc2556]
(EE) 1: /usr/bin/X (QueuePointerEvents+0x52) [0x7fbea7e7eae2]
(EE) 2: /usr/lib/xorg/modules/input/evdev_drv.so (0x7fbe9d265000+0x60ca)
[0x7fbe9d26b0ca]
(EE) 3: /usr/lib/xorg/modules/input/evdev_drv.so (0x7fbe9d265000+0x658d)
[0x7fbe9d26b58d]
(EE) 4: /usr/bin/X (0x7fbea7e0f000+0x96708) [0x7fbea7ea5708]
(EE) 5: /usr/bin/X (0x7fbea7e0f000+0xbfa79) [0x7fbea7ecea79]
(EE) 6: /lib/x86_64-linux-gnu/libc.so.6 (0x7fbea5ad5000+0x352f0)
[0x7fbea5b0a2f0]
(EE) 7: /lib/x86_64-linux-gnu/libc.so.6 (ioctl+0x7) [0x7fbea5bd20b7]
(EE) 8: /usr/lib/x86_64-linux-gnu/libdrm.so.2 (drmIoctl+0x28) [0x7fbea6eb97e8]
(EE) 9: /usr/lib/x86_64-linux-gnu/libdrm.so.2 (drmCommandWrite+0x1b)
[0x7fbea6ebc4ab]
(EE) 10: /usr/lib/x86_64-linux-gnu/libdrm_nouveau.so.2 (nouveau_bo_wait+0x8c)
[0x7fbea200c53c]
(EE) 11: /usr/lib/xorg/modules/drivers/nouveau_drv.so (0x7fbea2211000+0xceb9)
[0x7fbea221deb9]
(EE) 12: /usr/lib/xorg/modules/drivers/nouveau_drv.so (0x7fbea2211000+0xd90d)
[0x7fbea221e90d]
(EE) 13: /usr/bin/X (DRI2SwapBuffers+0x1d0) [0x7fbea7f95100]
(EE) 14: /usr/bin/X (0x7fbea7e0f000+0x187a7c) [0x7fbea7f96a7c]
(EE) 15: /usr/bin/X (0x7fbea7e0f000+0x580a7) [0x7fbea7e670a7]
(EE) 16: /usr/bin/X (0x7fbea7e0f000+0x5c29b) [0x7fbea7e6b29b]
(EE) 17: /lib/x86_64-linux-gnu/libc.so.6 (__libc_start_main+0xf0)
[0x7fbea5af5a40]
(EE) 18: /usr/bin/X (0x7fbea7e0f000+0x4662e) [0x7fbea7e5562e]
(EE) 
(EE) [mi] EQ overflow continuing.  1000 events have been dropped.
(EE) [mi] No further overflow reports will be reported until the clog is
cleared.
(EE) 
(EE) Backtrace:
(EE) 0: /usr/bin/X (xorg_backtrace+0x56) [0x7fbea7fc2556]
(EE) 1: /usr/bin/X (QueuePointerEvents+0x52) [0x7fbea7e7eae2]
(EE) 2: /usr/lib/xorg/modules/input/evdev_drv.so (0x7fbe9d265000+0x60ca)
[0x7fbe9d26b0ca]
(EE) 3: /usr/lib/xorg/modules/input/evdev_drv.so (0x7fbe9d265000+0x658d)
[0x7fbe9d26b58d]
(EE) 4: /usr/bin/X (0x7fbea7e0f000+0x96708) [0x7fbea7ea5708]
(EE) 5: /usr/bin/X (0x7fbea7e0f000+0xbfa79) [0x7fbea7ecea79]
(EE) 6: /lib/x86_64-linux-gnu/libc.so.6 (0x7fbea5ad5000+0x352f0)
[0x7fbea5b0a2f0]
(EE) 7: /lib/x86_64-linux-gnu/libc.so.6 (ioctl+0x7) [0x7fbea5bd20b7]
(EE) 8: /usr/lib/x86_64-linux-gnu/libdrm.so.2 (drmIoctl+0x28) [0x7fbea6eb97e8]
(EE) 9: /usr/lib/x86_64-linux-gnu/libdrm.so.2 (drmCommandWrite+0x1b)
[0x7fbea6ebc4ab]
(EE) 10: /usr/lib/x86_64-linux-gnu/libdrm_nouveau.so.2 (nouveau_bo_wait+0x8c)
[0x7fbea200c53c]
(EE) 11: /usr/lib/xorg/modules/drivers/nouveau_drv.so (0x7fbea2211000+0xceb9)
[0x7fbea221deb9]
(EE) 12: /usr/lib/xorg/modules/drivers/nouveau_drv.so (0x7fbea2211000+0xd90d)
[0x7fbea221e90d]
(EE) 13: /usr/bin/X (DRI2SwapBuffers+0x1d0) [0x7fbea7f95100]
(EE) 14: /usr/bin/X (0x7fbea7e0f000+0x187a7c) [0x7fbea7f96a7c]
(EE) 15: /usr/bin/X (0x7fbea7e0f000+0x580a7) [0x7fbea7e670a7]
(EE) 16: /usr/bin/X (0x7fbea7e0f000+0x5c29b) [0x7fbea7e6b29b]
(EE) 17: /lib/x86_64-linux-gnu/libc.so.6 (__libc_start_main+0xf0)
[0x7fbea5af5a40]
(EE) 18: /usr/bin/X (0x7fbea7e0f000+0x4662e) [0x7fbea7e5562e]


dmesg nouveau errors:
[325306.739494] nouveau E[Xorg[31180]] failed to idle channel 0xcccc0000
[Xorg[31180]]
[325321.739914] nouveau E[Xorg[31180]] failed to idle channel 0xcccc0000
[Xorg[31180]]
[328714.514362] nouveau E[   PFIFO][0000:02:00.0] DMA_PUSHER - ch 2 [Xorg[978]]
get 0x0020024b4c put 0x0020025dcc ib_get 0x00000090 ib_put 0x000000b1 state
0x800048e0 (err: INVALID_CMD) push 0x00406040
[328742.448560] nouveau E[   PFIFO][0000:02:00.0] DMA_PUSHER - ch 2 [Xorg[978]]
get 0x002001f4f0 put 0x002001fbf0 ib_get 0x000003de ib_put 0x000003fd state
0x800048e0 (err: INVALID_CMD) push 0x00406040
[328742.454276] nouveau E[  PGRAPH][0000:02:00.0] DATA_ERROR INVALID_VALUE
[328742.454286] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x000fb2a000 Xorg[978]]
subc 2 class 0x502d mthd 0x08dc data 0x00144230
[328753.925069] nouveau E[   PFIFO][0000:02:00.0] DMA_PUSHER - ch 2 [Xorg[978]]
get 0x002003a894 put 0x002003a9fc ib_get 0x00000050 ib_put 0x00000089 state
0x80000024 (err: INVALID_CMD) push 0x00406040
[328777.449556] nouveau E[   PFIFO][0000:02:00.0] DMA_PUSHER - ch 2 [Xorg[978]]
get 0x00200306f8 put 0x0020030df4 ib_get 0x00000064 ib_put 0x00000089 state
0x80000000 (err: INVALID_CMD) push 0x00406040
[328801.450234] nouveau E[   PFIFO][0000:02:00.0] DMA_PUSHER - ch 2 [Xorg[978]]
get 0x0020035c80 put 0x002003637c ib_get 0x00000092 ib_put 0x000000b7 state
0x80000044 (err: INVALID_CMD) push 0x00406040
[328801.456007] nouveau E[  PGRAPH][0000:02:00.0] DATA_ERROR INVALID_VALUE
[328801.456017] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x000fb2a000 Xorg[978]]
subc 2 class 0x502d mthd 0x08d4 data 0x0004488c
[328801.456046] nouveau E[  PGRAPH][0000:02:00.0] DATA_ERROR INVALID_VALUE
[328801.456053] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x000fb2a000 Xorg[978]]
subc 2 class 0x502d mthd 0x08dc data 0x003048b0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432563206.bd7E2c451.9795
Date: Mon, 25 May 2015 14:13:26 +0000
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
   title="NEW - random driver crashes mostly after screen lock"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90630">90630</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>random driver crashes mostly after screen lock
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.7 (2012.06)
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
          <td>fd_mitch&#64;ptaff.ca
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=116026" name="attach_116026" title="Kernel dmesg output after boot">attachment 116026</a> <a href="attachment.cgi?id=116026&amp;action=edit" title="Kernel dmesg output after boot">[details]</a></span>
Kernel dmesg output after boot

Hello,

Since my upgrade to Kubuntu 15.04, I have had multiple freezes due to the
nouveau driver. Most of them happen when I am away from my computer, once the
screen is locked. I disabled the screen switch off feature, but kept the dim
screen after 15 minutes feature. I do not have any suspend or hibernate
features enabled. I still get the freezes.

When the freeze occurs, whatever was on the screen is frozen (so I can see the
time at which the freeze occured). My keyboard and mouse are unresponsive
(numlock led doesn't turn on/off). I can remote in (ssh) to my computer and
restart X and everything works correctly.

I do get some nouveau errors in dmesg, though it seems to be after I restart X.
See below the Xorg.0.log backtrace.

I am using the nouveau driver v1.0.11 with Xorg v7.7 (with ubuntu patches). 

uname -a gives:
Linux chum30182linux 3.19.0-18-generic #18-Ubuntu SMP Tue May 19 18:31:35 UTC
2015 x86_64 x86_64 x86_64 GNU/Linux

lspci -v for my video card is as follows:
02:00.0 VGA compatible controller: NVIDIA Corporation G96GL [Quadro FX 380]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: NVIDIA Corporation Device 063b
        Flags: bus master, fast devsel, latency 0, IRQ 33
        Memory at ca000000 (32-bit, non-prefetchable) [size=16M]
        Memory at d0000000 (64-bit, prefetchable) [size=256M]
        Memory at cc000000 (64-bit, non-prefetchable) [size=32M]
        I/O ports at 3000 [size=128]
        [virtual] Expansion ROM at cb000000 [disabled] [size=512K]
        Capabilities: &lt;access denied&gt;
        Kernel driver in use: nouveau

I have included my dmesg output (kernel_log.txt).

Here is the backtrace in my Xorg.0.log after a freeze.

(EE) Backtrace:
(EE) 0: /usr/bin/X (xorg_backtrace+0x56) [0x7fbea7fc2556]
(EE) 1: /usr/bin/X (QueuePointerEvents+0x52) [0x7fbea7e7eae2]
(EE) 2: /usr/lib/xorg/modules/input/evdev_drv.so (0x7fbe9d265000+0x60ca)
[0x7fbe9d26b0ca]
(EE) 3: /usr/lib/xorg/modules/input/evdev_drv.so (0x7fbe9d265000+0x658d)
[0x7fbe9d26b58d]
(EE) 4: /usr/bin/X (0x7fbea7e0f000+0x96708) [0x7fbea7ea5708]
(EE) 5: /usr/bin/X (0x7fbea7e0f000+0xbfa79) [0x7fbea7ecea79]
(EE) 6: /lib/x86_64-linux-gnu/libc.so.6 (0x7fbea5ad5000+0x352f0)
[0x7fbea5b0a2f0]
(EE) 7: /lib/x86_64-linux-gnu/libc.so.6 (ioctl+0x7) [0x7fbea5bd20b7]
(EE) 8: /usr/lib/x86_64-linux-gnu/libdrm.so.2 (drmIoctl+0x28) [0x7fbea6eb97e8]
(EE) 9: /usr/lib/x86_64-linux-gnu/libdrm.so.2 (drmCommandWrite+0x1b)
[0x7fbea6ebc4ab]
(EE) 10: /usr/lib/x86_64-linux-gnu/libdrm_nouveau.so.2 (nouveau_bo_wait+0x8c)
[0x7fbea200c53c]
(EE) 11: /usr/lib/xorg/modules/drivers/nouveau_drv.so (0x7fbea2211000+0xceb9)
[0x7fbea221deb9]
(EE) 12: /usr/lib/xorg/modules/drivers/nouveau_drv.so (0x7fbea2211000+0xd90d)
[0x7fbea221e90d]
(EE) 13: /usr/bin/X (DRI2SwapBuffers+0x1d0) [0x7fbea7f95100]
(EE) 14: /usr/bin/X (0x7fbea7e0f000+0x187a7c) [0x7fbea7f96a7c]
(EE) 15: /usr/bin/X (0x7fbea7e0f000+0x580a7) [0x7fbea7e670a7]
(EE) 16: /usr/bin/X (0x7fbea7e0f000+0x5c29b) [0x7fbea7e6b29b]
(EE) 17: /lib/x86_64-linux-gnu/libc.so.6 (__libc_start_main+0xf0)
[0x7fbea5af5a40]
(EE) 18: /usr/bin/X (0x7fbea7e0f000+0x4662e) [0x7fbea7e5562e]
(EE) 
(EE) [mi] EQ overflow continuing.  1000 events have been dropped.
(EE) [mi] No further overflow reports will be reported until the clog is
cleared.
(EE) 
(EE) Backtrace:
(EE) 0: /usr/bin/X (xorg_backtrace+0x56) [0x7fbea7fc2556]
(EE) 1: /usr/bin/X (QueuePointerEvents+0x52) [0x7fbea7e7eae2]
(EE) 2: /usr/lib/xorg/modules/input/evdev_drv.so (0x7fbe9d265000+0x60ca)
[0x7fbe9d26b0ca]
(EE) 3: /usr/lib/xorg/modules/input/evdev_drv.so (0x7fbe9d265000+0x658d)
[0x7fbe9d26b58d]
(EE) 4: /usr/bin/X (0x7fbea7e0f000+0x96708) [0x7fbea7ea5708]
(EE) 5: /usr/bin/X (0x7fbea7e0f000+0xbfa79) [0x7fbea7ecea79]
(EE) 6: /lib/x86_64-linux-gnu/libc.so.6 (0x7fbea5ad5000+0x352f0)
[0x7fbea5b0a2f0]
(EE) 7: /lib/x86_64-linux-gnu/libc.so.6 (ioctl+0x7) [0x7fbea5bd20b7]
(EE) 8: /usr/lib/x86_64-linux-gnu/libdrm.so.2 (drmIoctl+0x28) [0x7fbea6eb97e8]
(EE) 9: /usr/lib/x86_64-linux-gnu/libdrm.so.2 (drmCommandWrite+0x1b)
[0x7fbea6ebc4ab]
(EE) 10: /usr/lib/x86_64-linux-gnu/libdrm_nouveau.so.2 (nouveau_bo_wait+0x8c)
[0x7fbea200c53c]
(EE) 11: /usr/lib/xorg/modules/drivers/nouveau_drv.so (0x7fbea2211000+0xceb9)
[0x7fbea221deb9]
(EE) 12: /usr/lib/xorg/modules/drivers/nouveau_drv.so (0x7fbea2211000+0xd90d)
[0x7fbea221e90d]
(EE) 13: /usr/bin/X (DRI2SwapBuffers+0x1d0) [0x7fbea7f95100]
(EE) 14: /usr/bin/X (0x7fbea7e0f000+0x187a7c) [0x7fbea7f96a7c]
(EE) 15: /usr/bin/X (0x7fbea7e0f000+0x580a7) [0x7fbea7e670a7]
(EE) 16: /usr/bin/X (0x7fbea7e0f000+0x5c29b) [0x7fbea7e6b29b]
(EE) 17: /lib/x86_64-linux-gnu/libc.so.6 (__libc_start_main+0xf0)
[0x7fbea5af5a40]
(EE) 18: /usr/bin/X (0x7fbea7e0f000+0x4662e) [0x7fbea7e5562e]


dmesg nouveau errors:
[325306.739494] nouveau E[Xorg[31180]] failed to idle channel 0xcccc0000
[Xorg[31180]]
[325321.739914] nouveau E[Xorg[31180]] failed to idle channel 0xcccc0000
[Xorg[31180]]
[328714.514362] nouveau E[   PFIFO][0000:02:00.0] DMA_PUSHER - ch 2 [Xorg[978]]
get 0x0020024b4c put 0x0020025dcc ib_get 0x00000090 ib_put 0x000000b1 state
0x800048e0 (err: INVALID_CMD) push 0x00406040
[328742.448560] nouveau E[   PFIFO][0000:02:00.0] DMA_PUSHER - ch 2 [Xorg[978]]
get 0x002001f4f0 put 0x002001fbf0 ib_get 0x000003de ib_put 0x000003fd state
0x800048e0 (err: INVALID_CMD) push 0x00406040
[328742.454276] nouveau E[  PGRAPH][0000:02:00.0] DATA_ERROR INVALID_VALUE
[328742.454286] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x000fb2a000 Xorg[978]]
subc 2 class 0x502d mthd 0x08dc data 0x00144230
[328753.925069] nouveau E[   PFIFO][0000:02:00.0] DMA_PUSHER - ch 2 [Xorg[978]]
get 0x002003a894 put 0x002003a9fc ib_get 0x00000050 ib_put 0x00000089 state
0x80000024 (err: INVALID_CMD) push 0x00406040
[328777.449556] nouveau E[   PFIFO][0000:02:00.0] DMA_PUSHER - ch 2 [Xorg[978]]
get 0x00200306f8 put 0x0020030df4 ib_get 0x00000064 ib_put 0x00000089 state
0x80000000 (err: INVALID_CMD) push 0x00406040
[328801.450234] nouveau E[   PFIFO][0000:02:00.0] DMA_PUSHER - ch 2 [Xorg[978]]
get 0x0020035c80 put 0x002003637c ib_get 0x00000092 ib_put 0x000000b7 state
0x80000044 (err: INVALID_CMD) push 0x00406040
[328801.456007] nouveau E[  PGRAPH][0000:02:00.0] DATA_ERROR INVALID_VALUE
[328801.456017] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x000fb2a000 Xorg[978]]
subc 2 class 0x502d mthd 0x08d4 data 0x0004488c
[328801.456046] nouveau E[  PGRAPH][0000:02:00.0] DATA_ERROR INVALID_VALUE
[328801.456053] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x000fb2a000 Xorg[978]]
subc 2 class 0x502d mthd 0x08dc data 0x003048b0</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432563206.bd7E2c451.9795--

--===============0863502091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0863502091==--
