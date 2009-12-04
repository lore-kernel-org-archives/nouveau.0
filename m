From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25453] New: nouveau + multiple xorg servers +
 suspend2ram trashes root partition
Date: Fri,  4 Dec 2009 12:34:33 -0800 (PST)
Message-ID: <bug-25453-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25453

           Summary: nouveau + multiple xorg servers + suspend2ram trashes
                    root partition
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: critical
          Priority: high
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: nouveau-rnbUhoFKN64hFhg+JK9F0w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=31752)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=31752)
output of dmesg after resume

One note before: the following only happens with nouveau, there are no problems
with the proprietary nvidia drivers.

I use 2 Xorg servers with nouveau as video graphics driver. Everything works
quite nice, at least I didn't experience any strange behaviour.
I also use suspend2ram. Also this works fine, at least, if I only use 1 X
server.

If I have 2 X servers started and suspend my machine, everything is fine until
the machine wakes up. Sometimes (I haven't yet figured out when exactly
"sometimes" is, but at latest after 2 suspends the problem occurs.) I get some
ugly messages in my dmesg(more in the attached dmesg log):

...
sata_nv 0000:00:07.0: PCI-DMA: Out of IOMMU space for 4096 bytes
sata_nv 0000:00:07.0: PCI-DMA: Out of IOMMU space for 4096 bytes
ata2.00: exception Emask 0x0 SAct 0x0 SErr 0x0 action 0x0
ata2.00: cmd ca/00:08:43:bf:91/00:00:00:00:00/e0 tag 0 dma 4096 out
         res 50/00:00:00:00:00/00:00:00:00:00/e0 Emask 0x40 (internal error)
ata2.00: status: { DRDY }
ata2.00: configured for UDMA/133
ata2: EH complete
...

and my root partition gets mounted read-only.

Here is some information of my system:

tobi@nyx ~ $ sudo lspci -v -s 05:00.0

05:00.0 VGA compatible controller: nVidia Corporation G96 [GeForce 9400 GT]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: nVidia Corporation Device 0551
        Flags: bus master, fast devsel, latency 0, IRQ 18
        Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
        Memory at d0000000 (64-bit, prefetchable) [size=256M]
        Memory at fa000000 (64-bit, non-prefetchable) [size=32M]
        I/O ports at ec00 [size=128]
        [virtual] Expansion ROM at feb80000 [disabled] [size=512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [b4] Vendor Specific Information <?>
        Capabilities: [100] Virtual Channel <?>
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [600] Vendor Specific Information <?>
        Kernel driver in use: nvidia
        Kernel modules: nvidia

Ignore the Kernel driver/modules lines, I got this information while running
the nvidia drivers. If lspci output while running nouveau is needed, ask.

tobi@nyx ~ $ uname -a
Linux nyx 2.6.31-gentoo-r6-nyx #2 SMP PREEMPT Mon Nov 30 23:18:53 CET 2009
x86_64 AMD Athlon(tm) 64 X2 Dual Core Processor 6000+ AuthenticAMD GNU/Linux

The following gentoo packages were installed (on Wed Dec 2 2009, about 20:00
GMT) from the x11-overlay:

x11-drivers/xf86-video-nouveau
x11-libs/libdrm
x11-base/nouveau-drm
x11-base/xorg-server

The proprietary nvidia drivers were of course uninstalled.

If more logfiles or system information is needed, just ask. ;-)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
