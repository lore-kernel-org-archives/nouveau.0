From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25261] New: Fails at start on NV44
Date: Tue, 24 Nov 2009 09:30:44 -0800 (PST)
Message-ID: <bug-25261-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

http://bugs.freedesktop.org/show_bug.cgi?id=25261

           Summary: Fails at start on NV44
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I've been using the `nv' driver for a long while now, but have now need for
XRandR support, so I dediced to try nouveau once again.
I compiled a new kernel from nouveau's git tree (with KMS enabled), a new librm
and a new nouveau driver, all from the latest git trees.

But when I try to start the X server it fails with:

(EE) NOUVEAU(0): [dri] unable to reference front buffer: -12
(EE) NOUVEAU(0): [dri] NVDRIFinishScreenInit failed, disbling DRI
[...]
Backtrace:
0: X(xorg_backtrace+0x26) [0x4ee056]
1: X(xf86SigHandler+0x39) [0x484199]
2: /lib/libc.so.6 [0x7fb0d0704fa0]
3: /usr/lib/xorg/modules/drivers//nouveau_drv.so(NV30_UploadFragProg+0x49)
[0x7fb0cef5ff49]
4: /usr/lib/xorg/modules/drivers//nouveau_drv.so(NVAccelInitNV40TCL+0xf9a)
[0x7fb0cef66fda]
5: /usr/lib/xorg/modules/drivers//nouveau_drv.so(NVAccelCommonInit+0x13d6)
[0x7fb0cef48666]
6: /usr/lib/xorg/modules/drivers//nouveau_drv.so [0x7fb0cef533c6]
7: /usr/lib/xorg/modules/drivers//nouveau_drv.so [0x7fb0cef53e01]
8: X(AddScreen+0x1c6) [0x432ac6]
9: X(InitOutput+0x241) [0x46d381]
10: X(main+0x200) [0x4331d0]
11: /lib/libc.so.6(__libc_start_main+0xfd) [0x7fb0d06f1a8d]
12: X [0x432819]

Fatal server error:
Caught signal 11.  Server aborting

The dmesg also has some relevant messages:

[ 3495.415183] [drm] nouveau 0000:01:00.0: Allocating FIFO number 1
[ 3495.416652] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised
FIFO 1
[ 3498.416879] [TTM] Failed moving buffer. Proposed placement 0x00070004
[ 3498.416883] [TTM] Out of aperture space or DRM memory quota.
[ 3501.569024] [TTM] Failed moving buffer. Proposed placement 0x00070004
[ 3501.569028] [TTM] Out of aperture space or DRM memory quota.
[ 3506.602168] [drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 1
[ 3509.601010] [drm] nouveau 0000:01:00.0: Failed to idle channel 1.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
