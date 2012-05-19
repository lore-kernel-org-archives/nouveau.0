From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50121] New: [Regression] NV34 Fx5200 fails to resume
 with commit 5d720f2450
Date: Sat, 19 May 2012 16:33:58 +0000
Message-ID: <bug-50121-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=50121

             Bug #: 50121
           Summary: [Regression] NV34 Fx5200 fails to resume with commit
                    5d720f2450
    Classification: Unclassified
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 61851
  --> https://bugs.freedesktop.org/attachment.cgi?id=61851
Dmesg log of bad resume

The following commit:

Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Mon Apr 30 13:55:29 2012 +1000

    drm/nouveau/fence: convert to exec engine, and improve channel sync

    Now have a somewhat simpler semaphore sync implementation for nv17:nv84,
    and a switched to using semaphores as fences on nv84+ and making use of
    the hardware's >= acquire operation.

Probably causes the FX5200 to fail to resume. I'm not 100% completely sure,
since reverting this commit on top of head is not without conflicts since the
revent cleanups and reworks. I cannot proceed without help. If someone could
generate a revert of this commit on top of current HEAD, I will then be able to
confirm this is the exact bad commit.

Further down below you will only find computer generated output (in this
order):

- The git bisect log
- The output of lspci for the nvidia card
- A list of currently used userspace packages (with version) from
https://launchpad.net/~xorg-edgers/+archive/ppa:
- Attached: The file nouveau.bad.resume.txt shows dmesg output of a bad resume
(commit 1d226cc142b).
- Attached: The file nouveau.good.resume.txt shows dmesg output of a good
resume (commit 5d720f245).

gebruiker@Delta:~/Documenten/Ronald/linux-git$ git bisect log
git bisect start
# bad: [0e29f737548c749482371ba307a6de15ae2c1956] drm/nouveau: make engine
subclass subdev, and noaccel a bitfield
git bisect bad 0e29f737548c749482371ba307a6de15ae2c1956
# good: [9eb608d0091c11e5712b421c8d3c7cec8950d14e] drm/nv04/disp: disable
vblank interrupts when disabling display
git bisect good 9eb608d0091c11e5712b421c8d3c7cec8950d14e
# bad: [da9472c2db711fb589e248566ea17288d3c993e5] drm/nv04/software: fix engine
creation
git bisect bad da9472c2db711fb589e248566ea17288d3c993e5
# bad: [f903665be55c7d347bcfd684745026af30439a8d] drm/nv50: remove execution
engine context saves on suspend
git bisect bad f903665be55c7d347bcfd684745026af30439a8d
# bad: [da495ac412f6a70185305facd756f0f04fb5fd3b] drm/nouveau: fix engine
context destructor ordering
git bisect bad da495ac412f6a70185305facd756f0f04fb5fd3b
# good: [11d9712f6d91203bd3f34ef2cebf1fd188e73756] drm/nouveau: move
flip-related channel setup to software engine
git bisect good 11d9712f6d91203bd3f34ef2cebf1fd188e73756
# good: [1d226cc142b4e504150b9d5455545720fbde6f1f] drm/nouveau/fence: minor api
changes for an upcoming rework
git bisect good 1d226cc142b4e504150b9d5455545720fbde6f1f
# bad: [5d720f24505c3fb6b4740fbf5b6e99839de2fbd9] drm/nouveau/fence: convert to
exec engine, and improve channel sync
git bisect bad 5d720f24505c3fb6b4740fbf5b6e99839de2fbd9

root@Delta:/var/log# lspci -s 01:00.0 -vvvv -nnnn
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation NV34 [GeForce FX
5200] [10de:0322] (rev a1) (prog-if 00 [VGA controller])
    Subsystem: ASUSTeK Computer Inc. Device [1043:80df]
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
    Latency: 32 (1250ns min, 250ns max)
    Interrupt: pin A routed to IRQ 16
    Region 0: Memory at de000000 (32-bit, non-prefetchable) [size=16M]
    Region 1: Memory at d0000000 (32-bit, prefetchable) [size=128M]
    Expansion ROM at dfee0000 [disabled] [size=128K]
    Capabilities: [60] Power Management version 2
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [44] AGP version 3.0
        Status: RQ=32 Iso- ArqSz=0 Cal=3 SBA+ ITACoh- GART64- HTrans- 64bit-
FW+ AGP3+ Rate=x4,x8
        Command: RQ=32 ArqSz=0 Cal=0 SBA+ AGP+ GART64- 64bit- FW+ Rate=x8
    Kernel driver in use: nouveau

Xorg-edgers packages used relevant for this bug:
- libdrm
2.4.34+git20120512.e07b6506-0ubuntu0ricotz~precise
- libpciaccess
0.13-1~precise2
- mesa
8.1~git20120512.f9654084-0ubuntu0ricotz~precise
- xorg-server
2:1.12.1.901+git20120510+server-1.12-branch.58dfb139-0ubuntu0ricotz~precise
- xserver-xorg-video-nouveau
1:0.0.16+git20120509.58156446-0ubuntu0sarvatt~precise

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
