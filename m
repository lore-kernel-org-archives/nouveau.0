From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 47191] New: random xorg hang with
 PGRAPH_TRAP_TPDMA_2D - TP 0 - Unknown fault at address
Date: Sat, 10 Mar 2012 18:34:31 +0000
Message-ID: <bug-47191-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

https://bugs.freedesktop.org/show_bug.cgi?id=47191

             Bug #: 47191
           Summary: random xorg hang with PGRAPH_TRAP_TPDMA_2D - TP 0 -
                    Unknown fault at address
    Classification: Unclassified
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: high
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: htexmexh-1jCL+rEOqeNBDgjK7y7TUQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I get random xorg hangs where the only thing I can do is REISUB out. I am
running the nouveau driver with xorg-server-1.9.5 and kernel 3.2.7.

I find this in /var/log/messages at the time of the crash:
Mar 10 16:03:52 greatdemonslayer kernel: [drm] nouveau 0000:01:00.0:
PGRAPH_TRAP_TPDMA_2D - TP 0 - Unknown fault at address 002422c400
Mar 10 16:03:52 greatdemonslayer kernel: [drm] nouveau 0000:01:00.0:
PGRAPH_TRAP_TPDMA_2D - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00100000, e20:
00000037, e24: 0$
Mar 10 16:03:52 greatdemonslayer kernel: [drm] nouveau 0000:01:00.0: PGRAPH -
TRAP
Mar 10 16:03:52 greatdemonslayer kernel: [drm] nouveau 0000:01:00.0: PGRAPH -
ch 2 (0x0000b30000) subc 2 class 0x502d mthd 0x0860 data 0xffffffff
Mar 10 16:03:52 greatdemonslayer kernel: [drm] nouveau 0000:01:00.0: VM:
trapped write at 0x002422c400 on ch 2 [0x00000b30] PGRAPH/PROP/DST2D reason:
PAGE_NOT_PRESENT
Mar 10 16:05:55 greatdemonslayer kernel: [drm] nouveau 0000:01:00.0:
PGRAPH_TRAP_TPDMA_2D - TP 0 - Unknown fault at address 002526b300
Mar 10 16:05:55 greatdemonslayer kernel: [drm] nouveau 0000:01:00.0:
PGRAPH_TRAP_TPDMA_2D - TP 0 - e0c: 00000000, e18: 00000000, e1c: 000c0000, e20:
00000037, e24: 0$
Mar 10 16:05:55 greatdemonslayer kernel: [drm] nouveau 0000:01:00.0: PGRAPH -
TRAP
Mar 10 16:05:55 greatdemonslayer kernel: [drm] nouveau 0000:01:00.0: PGRAPH -
ch 2 (0x0000b30000) subc 2 class 0x502d mthd 0x0860 data 0x00000000
Mar 10 16:05:55 greatdemonslayer kernel: [drm] nouveau 0000:01:00.0: VM:
trapped write at 0x002526b300 on ch 2 [0x00000b30] PGRAPH/PROP/DST2D reason:
PAGE_NOT_PRESENT
Mar 10 16:35:46 greatdemonslayer -- MARK --

I have gotten similar hangs with recent proprietary nvidia drivers, and that's
why I switched to nouveau. I don't know if this is hardware related, but it
didn't happen with older nvidia drivers.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
