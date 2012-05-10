From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 49736] New: piglit quck.driver tests kill X server
	on nv43
Date: Thu, 10 May 2012 14:35:47 +0000
Message-ID: <bug-49736-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=49736

             Bug #: 49736
           Summary: piglit quck.driver tests kill X server  on nv43
    Classification: Unclassified
           Product: Mesa
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: randrik-JGs/UdohzUI@public.gmane.org


Using this  configuration

software:

ddx:
commit 581564466c47ab0435ecca3cf4d82c03e1b30259
Author: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Date:   Tue May 8 14:02:44 2012 +0200

    dri2: Don't try to page-flip pixmaps (fdo bug 49351).

libdrm:
commit 5288729823ee1c243023758c35fbe8e3a70ccf9c
Author: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date:   Tue May 1 23:24:45 2012 +0200

    nouveau: fix channel closing

kernel:
nouveau tree
commit 6de446e248e4e0bbb040abc1e76c9876750aac78
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Thu May 10 19:03:11 2012 +1000

    drm/nv04-nv40: fix regression from a previous commit (SQUASH)

mesa:
commit 788fd04dacb9eb1e32010050c57cd2f49779311b
Author: Tom Stellard <thomas.stellard-5C7GfCeVMHo@public.gmane.org>
Date:   Wed May 9 11:50:02 2012 -0400

    radeon/llvm: Remove AMDGPUConstants.pm

_plus_ patches  from
http://lists.freedesktop.org/archives/nouveau/2012-May/010322.html

nvfx_Fix_generic_passing_to_fragment_program_in_NV34.diff
nvfx_SSG_only_requires_one_source_register.diff
nvfx_Silence_pipe_cap_warnings.diff


piglit - 
commit bbed4bd9e7b614cf8b3e016d1f7116c323b23332
Author: Kenneth Graunke <kenneth-xkhwgxqQjnbNLxjTenLetw@public.gmane.org>
Date:   Fri May 4 17:07:03 2012 -0700

    Add a clipping test that draws an extremely large triangle.

X server  1.10.6

hw:
01:00.0 VGA compatible controller: NVIDIA Corporation NV43 [GeForce 6600 GT]
(rev a2) (prog-if 00 [VGA controller])
        Subsystem: XFX Pine Group Inc. GeForce 6600 GT AGP
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 32 (1250ns min, 250ns max)
        Interrupt: pin A routed to IRQ 16
        Region 0: Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
        Region 1: Memory at e0000000 (32-bit, prefetchable) [size=256M]
        Region 2: Memory at fc000000 (32-bit, non-prefetchable) [size=16M]
        Expansion ROM at fe8e0000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [44] AGP version 3.0
                Status: RQ=32 Iso- ArqSz=0 Cal=0 SBA+ ITACoh- GART64- HTrans-
64bit- FW+ AGP3- Rate=x1,x2,x4
                Command: RQ=32 ArqSz=0 Cal=0 SBA+ AGP+ GART64- 64bit- FW+
Rate=x4
        Kernel driver in use: nouveau
        Kernel modules: nouveau


I  run into X crash during quck.driver testing.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
