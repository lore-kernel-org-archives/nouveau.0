From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24271] New: PGRAPH_ERROR , often after suspend/resume
Date: Thu,  1 Oct 2009 23:59:56 -0700 (PDT)
Message-ID: <bug-24271-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=24271

           Summary: PGRAPH_ERROR , often after suspend/resume
           Product: xorg
           Version: 7.4
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=29993)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=29993)
boot into X, first suspend/resume went fine, second suspend/resume triggered
the PGRAPH_ERROR

Almost every time I suspend/resume, a PGRAPH_ERROR appears in dmesg. I cannot
see any bad consequences of it, but it doesn't seem normal so I thought I would
report it.

[  327.678728] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource:
PROTECTION_ERROR DMA_R_PROTECTION, nStatus:
[  327.678734] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 1/1 Class 0x502d
Mthd 0x08dc Data 0x00000000:0x00000060
[  327.678736] [drm] nouveau 0000:01:00.0: magic set 1:
[  327.678739] [drm] nouveau 0000:01:00.0:      0x00408900: 0x80000077
[  327.678743] [drm] nouveau 0000:01:00.0:      0x00408904: 0xfbef7fff
[  327.678746] [drm] nouveau 0000:01:00.0:      0x00408908: 0xfff5dfff
[  327.678749] [drm] nouveau 0000:01:00.0:      0x0040890c: 0xc000d7eb
[  327.678752] [drm] nouveau 0000:01:00.0:      0x00408910: 0xffff3fef
[  327.678756] [drm] nouveau 0000:01:00.0:      0x00408e08: 0x800bbf61
[  327.678760] [drm] nouveau 0000:01:00.0:      0x00408e0c: 0x00000000
[  327.678763] [drm] nouveau 0000:01:00.0:      0x00408e10: 0xf6e27b40
[  327.678766] [drm] nouveau 0000:01:00.0:      0x00408e14: 0x0000007f
[  327.678769] [drm] nouveau 0000:01:00.0:      0x00408e18: 0x001948a8
[  327.678772] [drm] nouveau 0000:01:00.0:      0x00408e1c: 0x3dfdb57d
[  327.678775] [drm] nouveau 0000:01:00.0:      0x00408e20: 0x063f3f6b
[  327.678778] [drm] nouveau 0000:01:00.0:      0x00408e24: 0x0f33037f
[  327.678781] [drm] nouveau 0000:01:00.0: magic set 2:
[  327.678784] [drm] nouveau 0000:01:00.0:      0x00409900: 0x8000007f
[  327.678787] [drm] nouveau 0000:01:00.0:      0x00409904: 0xdf677bdf
[  327.678790] [drm] nouveau 0000:01:00.0:      0x00409908: 0xfdffbfdf
[  327.678793] [drm] nouveau 0000:01:00.0:      0x0040990c: 0xc000defd
[  327.678796] [drm] nouveau 0000:01:00.0:      0x00409910: 0xfffd3fef
[  327.678801] [drm] nouveau 0000:01:00.0:      0x00409e08: 0x800c8a49
[  327.678804] [drm] nouveau 0000:01:00.0:      0x00409e0c: 0x00000000
[  327.678807] [drm] nouveau 0000:01:00.0:      0x00409e10: 0xf5fb6d60
[  327.678810] [drm] nouveau 0000:01:00.0:      0x00409e14: 0x000000fa
[  327.678813] [drm] nouveau 0000:01:00.0:      0x00409e18: 0x44906309
[  327.678816] [drm] nouveau 0000:01:00.0:      0x00409e1c: 0xfafefee7
[  327.678819] [drm] nouveau 0000:01:00.0:      0x00409e20: 0x05277f78
[  327.678822] [drm] nouveau 0000:01:00.0:      0x00409e24: 0x0b33037f


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
