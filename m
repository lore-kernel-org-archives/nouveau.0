From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15949] New: LVDS-0 has wrapped screen with Randr1.2
Date: Thu, 15 May 2008 17:53:57 -0700 (PDT)
Message-ID: <bug-15949-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15949

           Summary: LVDS-0 has wrapped screen with Randr1.2
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: simplyw00x-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=16562)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=16562)
Xorg log with external monitor plugged in

Problem:
Left-most 10px of my laptop's screen are offset right 10px, right-most 10px are
displayed on the left of that screen. VGA-0 has no problems.

Steps to re-produce:
xrandr --output VGA-0 --mode 640x480 # to eleminate my previous Virtual line as
a source of the problem
xrandr --output VGA-0 --left-of LVDS-0
xrandr --output LVDS-0 --mode 1280x800

Expected result:
The laptop and the external monitor form one large desktop, with all pixels in
their correct spots!

Actual result:
See attached images

Work-around:
This problem persists even if the external monitor is removed and the computer
re-booted. The only way to restore the correct display of LVDS-0 is to disable
Randr1.2 in xorg.conf and re-boot (zapping X doesn't help in this case).

-------------------------------------------------------------------------
[root@castlereagh ~]# lspci -vv -d10de:0244
00:05.0 VGA compatible controller: nVidia Corporation C51 [Geforce 6150 Go]
(rev a2) (prog-if 00 [VGA controller])
        Subsystem: Hewlett-Packard Company Unknown device 30bf
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 17
        Region 0: Memory at b2000000 (32-bit, non-prefetchable) [size=16M]
        Region 1: Memory at c0000000 (64-bit, prefetchable) [size=256M]
        Region 3: Memory at b1000000 (64-bit, non-prefetchable) [size=16M]
        Capabilities: [48] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [50] Message Signalled Interrupts: Mask- 64bit+ Queue=0/0
Enable-
                Address: 0000000000000000  Data: 0000
        Kernel modules: nvidiafb
-------------------------------------------------------------------------
carl@castlereagh:~$ lshal
[snip]
udi = '/org/freedesktop/Hal/devices/pci_10de_244'
  info.parent = '/org/freedesktop/Hal/devices/computer'  (string)
  info.product = 'C51 [Geforce 6150 Go]'  (string)
  info.subsystem = 'pci'  (string)
  info.udi = '/org/freedesktop/Hal/devices/pci_10de_244'  (string)
  info.vendor = 'nVidia Corporation'  (string)
  linux.hotplug_type = 2  (0x2)  (int)
  linux.subsystem = 'pci'  (string)
  linux.sysfs_path = '/sys/devices/pci0000:00/0000:00:05.0'  (string)
  pci.device_class = 3  (0x3)  (int)
  pci.device_protocol = 0  (0x0)  (int)
  pci.device_subclass = 0  (0x0)  (int)
  pci.linux.sysfs_path = '/sys/devices/pci0000:00/0000:00:05.0'  (string)
  pci.product = 'C51 [Geforce 6150 Go]'  (string)
  pci.product_id = 580  (0x244)  (int)
  pci.subsys_product_id = 12479  (0x30bf)  (int)
  pci.subsys_vendor = 'Hewlett-Packard Company'  (string)
  pci.subsys_vendor_id = 4156  (0x103c)  (int)
  pci.vendor = 'nVidia Corporation'  (string)
  pci.vendor_id = 4318  (0x10de)  (int)
[snip]


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
