From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51809] New: jReality "Export->Image" on nouveau
 corrupts memory / locks up X server
Date: Sat, 07 Jul 2012 00:54:20 +0000
Message-ID: <bug-51809-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=51809

             Bug #: 51809
           Summary: jReality "Export->Image" on nouveau corrupts memory /
                    locks up X server
    Classification: Unclassified
           Product: Mesa
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: luke.hutch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org


The jReality viewer applet (e.g. run with "javaws
http://www3.math.tu-berlin.de/jreality/ws/jrealityApps/plateauProblemPlugins.jnlp")
manages to corrupt memory in the X server and/or hard lock up the X server if
you choose "File->Export->Image". The crash or corruption happens a few seconds
after you hit "Save", while the applet is performing off-screen GL rendering.
Sometimes junk is written to the X backing store, sometimes the desktop just
completely locks up. The machine still seems to be running, but even killing
Xorg remotely doesn't seem to return the display back to a text vterm.

Observed in both Fedora 16 and Fedora 17.

kernel-3.3.4-5.fc17.x86_64
xorg-x11-drv-nouveau-0.0.16-34.20110720gitb806e3f.fc17.x86_64
xorg-x11-server-Xorg-1.12.0-2.fc17.x86_64
jdk-1.7.0_05-fcs.x86_64
java-1.7.0-openjdk-1.7.0.3-2.2.1.fc17.8.x86_64

# lspci
00:00.0 Memory controller: nVidia Corporation CK804 Memory Controller (rev a3)
00:01.0 ISA bridge: nVidia Corporation CK804 ISA Bridge (rev a3)
00:01.1 SMBus: nVidia Corporation CK804 SMBus (rev a2)
00:02.0 USB Controller: nVidia Corporation CK804 USB Controller (rev a2)
00:02.1 USB Controller: nVidia Corporation CK804 USB Controller (rev a3)
00:04.0 Multimedia audio controller: nVidia Corporation CK804 AC'97 Audio
Controller (rev a2)
00:06.0 IDE interface: nVidia Corporation CK804 IDE (rev f2)
00:07.0 IDE interface: nVidia Corporation CK804 Serial ATA Controller (rev f3)
00:08.0 IDE interface: nVidia Corporation CK804 Serial ATA Controller (rev f3)
00:09.0 PCI bridge: nVidia Corporation CK804 PCI Bridge (rev a2)
00:0a.0 Bridge: nVidia Corporation CK804 Ethernet Controller (rev a3)
00:0b.0 PCI bridge: nVidia Corporation CK804 PCIE Bridge (rev a3)
00:0c.0 PCI bridge: nVidia Corporation CK804 PCIE Bridge (rev a3)
00:0d.0 PCI bridge: nVidia Corporation CK804 PCIE Bridge (rev a3)
00:0e.0 PCI bridge: nVidia Corporation CK804 PCIE Bridge (rev a3)
00:18.0 Host bridge: Advanced Micro Devices [AMD] K8 [Athlon64/Opteron]
HyperTransport Technology Configuration
00:18.1 Host bridge: Advanced Micro Devices [AMD] K8 [Athlon64/Opteron] Address
Map
00:18.2 Host bridge: Advanced Micro Devices [AMD] K8 [Athlon64/Opteron] DRAM
Controller
00:18.3 Host bridge: Advanced Micro Devices [AMD] K8 [Athlon64/Opteron]
Miscellaneous Control
00:19.0 Host bridge: Advanced Micro Devices [AMD] K8 [Athlon64/Opteron]
HyperTransport Technology Configuration
00:19.1 Host bridge: Advanced Micro Devices [AMD] K8 [Athlon64/Opteron] Address
Map
00:19.2 Host bridge: Advanced Micro Devices [AMD] K8 [Athlon64/Opteron] DRAM
Controller
00:19.3 Host bridge: Advanced Micro Devices [AMD] K8 [Athlon64/Opteron]
Miscellaneous Control
01:05.0 FireWire (IEEE 1394): Texas Instruments TSB43AB22A IEEE-1394a-2000
Controller (PHY/Link) [iOHCI-Lynx]
05:00.0 VGA compatible controller: nVidia Corporation G73GL [Quadro FX 560]
(rev a1)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
