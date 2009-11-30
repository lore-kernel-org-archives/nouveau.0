From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25366] New: PGRAPH_ERROR with Quadro NVS 280 SD
	(NV17 or NV18)
Date: Mon, 30 Nov 2009 09:05:13 -0800 (PST)
Message-ID: <bug-25366-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25366

           Summary: PGRAPH_ERROR with Quadro NVS 280 SD (NV17 or NV18)
           Product: xorg
           Version: 7.5
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: pawel-/pY6U1YSWahqsvmp/umkrQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I've upgraded to Fedora 12 recently... As the binary drivers for my old old old
card (nvidia_96xx) are not supported yet (or maybe any more ;-) I've decided to
give nouveau a try.

It starts like a charm, but shortly after (a few minutes) everything goes
bunkers - fonts instead of being black are light grey or pink ;-), bitmaps are
corrupted. In a second I'll attach a screenshot of my screen after about 10-15
minutes.

The kernel (log to be attached as well) is screaming like this:

[drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource: PROTECTION_ERROR, nStatus:
INVALID_STATE
[drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 1/0 Class 0x0039 Mthd 0x0184 Data
0x000011ce:0x000011ce

My system:

$ X -version

X.Org X Server 1.7.1
Release Date: 2009-10-23
X Protocol Version 11, Revision 0
Build Operating System:  2.6.18-164.2.1.el5 
Current Operating System: Linux sedan 2.6.31.5-127.fc12.i686.PAE #1 SMP Sat Nov
7 21:25:57 EST 2009 i686
Kernel command line: ro root=LABEL=/ rhgb quiet SYSFONT=latarcyrheb-sun16
LANG=en_GB.UTF-8 KEYTABLE=pl2
Build Date: 05 November 2009  07:43:20PM
Build ID: xorg-x11-server 1.7.1-7.fc12 
Current version of pixman: 0.16.2
        Before reporting problems, check http://bodhi.fedoraproject.org/
        to make sure that you have the latest version.

The card:

01:00.0 VGA compatible controller: nVidia Corporation NV18GL [Quadro NVS 280
SD] (rev a2) (prog-if 00 [VGA controller])
        Subsystem: nVidia Corporation Device 0190
        Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Interrupt: pin A routed to IRQ 11
        Region 0: Memory at fc000000 (32-bit, non-prefetchable) [size=16M]
        Region 1: Memory at f0000000 (32-bit, prefetchable) [size=128M]
        Expansion ROM at fd000000 [disabled] [size=128K]
        Capabilities: <access denied>
        Kernel modules: nouveau, nvidiafb

As you see lspci claims it's NV18-base card, while the driver says:

[drm] nouveau 0000:01:00.0: Detected an NV17 generation card (0x018a00a3)

Any other data I can provide?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
