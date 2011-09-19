From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40630] Bad memory clock set on GeForce 9500 GT after
	resume
Date: Mon, 19 Sep 2011 09:48:53 -0700 (PDT)
Message-ID: <20110919164853.404D91301A8@annarchy.freedesktop.org>
References: <bug-40630-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40630-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40630

--- Comment #81 from Diego Viola <diego.viola-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-09-19 09:48:52 PDT ---
[root@myhost ~]# lspci -v
00:00.0 Host bridge: Intel Corporation 4 Series Chipset DRAM Controller (rev
03)
        Subsystem: ASUSTeK Computer Inc. Device 836d
        Flags: bus master, fast devsel, latency 0
        Capabilities: [e0] Vendor Specific Information: Len=0c <?>

00:01.0 PCI bridge: Intel Corporation 4 Series Chipset PCI Express Root Port
(rev 03) (prog-if 00 [Normal decode])
        Flags: bus master, fast devsel, latency 0
        Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
        I/O behind bridge: 0000d000-0000dfff
        Memory behind bridge: fa000000-feafffff
        Prefetchable memory behind bridge: 00000000e0000000-00000000efffffff
        Capabilities: [88] Subsystem: ASUSTeK Computer Inc. Device 836d
        Capabilities: [80] Power Management version 3
        Capabilities: [90] MSI: Enable- Count=1/1 Maskable- 64bit-
        Capabilities: [a0] Express Root Port (Slot+), MSI 00
        Kernel driver in use: pcieport

00:1b.0 Audio device: Intel Corporation N10/ICH 7 Family High Definition Audio
Controller (rev 01)
        Subsystem: ASUSTeK Computer Inc. Device 8445
        Flags: bus master, fast devsel, latency 0, IRQ 6
        Memory at f9ffc000 (64-bit, non-prefetchable) [size=16K]
        Capabilities: [50] Power Management version 2
        Capabilities: [60] MSI: Enable- Count=1/1 Maskable- 64bit+
        Capabilities: [70] Express Root Complex Integrated Endpoint, MSI 00

00:1c.0 PCI bridge: Intel Corporation N10/ICH 7 Family PCI Express Port 1 (rev
01) (prog-if 00 [Normal decode])
        Flags: bus master, fast devsel, latency 0
        Bus: primary=00, secondary=04, subordinate=04, sec-latency=0
        I/O behind bridge: 00002000-00002fff
        Memory behind bridge: 80600000-807fffff
        Prefetchable memory behind bridge: 0000000080800000-00000000809fffff
        Capabilities: [40] Express Root Port (Slot+), MSI 00
        Capabilities: [80] MSI: Enable- Count=1/1 Maskable- 64bit-
        Capabilities: [90] Subsystem: ASUSTeK Computer Inc. Device 8179
        Capabilities: [a0] Power Management version 2
        Kernel driver in use: pcieport

00:1c.1 PCI bridge: Intel Corporation N10/ICH 7 Family PCI Express Port 2 (rev
01) (prog-if 00 [Normal decode])                                                
        Flags: bus master, fast devsel, latency 0                               
        Bus: primary=00, secondary=03, subordinate=03, sec-latency=0            
        I/O behind bridge: 00001000-00001fff                                    
        Memory behind bridge: 80200000-803fffff                                 
        Prefetchable memory behind bridge: 0000000080400000-00000000805fffff    
        Capabilities: [40] Express Root Port (Slot+), MSI 00                    
        Capabilities: [80] MSI: Enable- Count=1/1 Maskable- 64bit-              
        Capabilities: [90] Subsystem: ASUSTeK Computer Inc. Device 8179         
        Capabilities: [a0] Power Management version 2                           
        Kernel driver in use: pcieport                                          

00:1c.3 PCI bridge: Intel Corporation N10/ICH 7 Family PCI Express Port 4 (rev
01) (prog-if 00 [Normal decode])                                                
        Flags: bus master, fast devsel, latency 0                               
        Bus: primary=00, secondary=02, subordinate=02, sec-latency=0            
        I/O behind bridge: 0000e000-0000efff                                    
        Memory behind bridge: feb00000-febfffff                                 
        Prefetchable memory behind bridge: 0000000080000000-00000000801fffff    
        Capabilities: [40] Express Root Port (Slot+), MSI 00                    
        Capabilities: [80] MSI: Enable- Count=1/1 Maskable- 64bit-              
        Capabilities: [90] Subsystem: ASUSTeK Computer Inc. Device 8179         
        Capabilities: [a0] Power Management version 2                           
        Kernel driver in use: pcieport                                          

00:1d.0 USB Controller: Intel Corporation N10/ICH 7 Family USB UHCI Controller
#1 (rev 01) (prog-if 00 [UHCI])                                                 
        Subsystem: ASUSTeK Computer Inc. P5KPL-VM,P5LD2-VM Mainboard            
        Flags: bus master, medium devsel, latency 0, IRQ 23
        I/O ports at c480 [size=32]
        Kernel driver in use: uhci_hcd

00:1d.1 USB Controller: Intel Corporation N10/ICH 7 Family USB UHCI Controller
#2 (rev 01) (prog-if 00 [UHCI])
        Subsystem: ASUSTeK Computer Inc. P5KPL-VM,P5LD2-VM Mainboard
        Flags: bus master, medium devsel, latency 0, IRQ 19
        I/O ports at c800 [size=32]
        Kernel driver in use: uhci_hcd

00:1d.2 USB Controller: Intel Corporation N10/ICH 7 Family USB UHCI Controller
#3 (rev 01) (prog-if 00 [UHCI])
        Subsystem: ASUSTeK Computer Inc. P5KPL-VM,P5LD2-VM Mainboard
        Flags: bus master, medium devsel, latency 0, IRQ 18
        I/O ports at c880 [size=32]
        Kernel driver in use: uhci_hcd

00:1d.3 USB Controller: Intel Corporation N10/ICH 7 Family USB UHCI Controller
#4 (rev 01) (prog-if 00 [UHCI])
        Subsystem: ASUSTeK Computer Inc. P5KPL-VM,P5LD2-VM Mainboard
        Flags: bus master, medium devsel, latency 0, IRQ 16
        I/O ports at cc00 [size=32]
        Kernel driver in use: uhci_hcd

00:1d.7 USB Controller: Intel Corporation N10/ICH 7 Family USB2 EHCI Controller
(rev 01) (prog-if 20 [EHCI])
        Subsystem: ASUSTeK Computer Inc. P5KPL-VM,P5LD2-VM Mainboard
        Flags: bus master, medium devsel, latency 0, IRQ 23
        Memory at f9ffbc00 (32-bit, non-prefetchable) [size=1K]
        Capabilities: [50] Power Management version 2
        Capabilities: [58] Debug port: BAR=1 offset=00a0
        Kernel driver in use: ehci_hcd

00:1e.0 PCI bridge: Intel Corporation 82801 PCI Bridge (rev e1) (prog-if 01
[Subtractive decode])
        Flags: bus master, fast devsel, latency 0
        Bus: primary=00, secondary=05, subordinate=05, sec-latency=32
        Capabilities: [50] Subsystem: ASUSTeK Computer Inc. Device 8179

00:1f.0 ISA bridge: Intel Corporation 82801GB/GR (ICH7 Family) LPC Interface
Bridge (rev 01)
        Subsystem: ASUSTeK Computer Inc. P5KPL-VM Motherboard
        Flags: bus master, medium devsel, latency 0
        Capabilities: [e0] Vendor Specific Information: Len=0c <?>

00:1f.1 IDE interface: Intel Corporation 82801G (ICH7 Family) IDE Controller
(rev 01) (prog-if 8a [Master SecP PriP])
        Subsystem: ASUSTeK Computer Inc. P5KPL-VM Motherboard
        Flags: bus master, medium devsel, latency 0, IRQ 18
        I/O ports at 01f0 [size=8]
        I/O ports at 03f4 [size=1]
        I/O ports at 0170 [size=8]
        I/O ports at 0374 [size=1]
        I/O ports at ffa0 [size=16]
        Kernel driver in use: ata_piix

00:1f.2 IDE interface: Intel Corporation N10/ICH7 Family SATA IDE Controller
(rev 01) (prog-if 8f [Master SecP SecO PriP PriO])
        Subsystem: ASUSTeK Computer Inc. P5KPL-VM Motherboard
        Flags: bus master, 66MHz, medium devsel, latency 0, IRQ 22
        I/O ports at c400 [size=8]
        I/O ports at c080 [size=4]
        I/O ports at c000 [size=8]
        I/O ports at bc00 [size=4]
        I/O ports at b880 [size=16]
        Capabilities: [70] Power Management version 2
        Kernel driver in use: ata_piix

01:00.0 VGA compatible controller: nVidia Corporation G96 [GeForce 9500 GT]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: eVga.com. Corp. Device c958
        Flags: bus master, fast devsel, latency 0, IRQ 16
        Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
        Memory at e0000000 (64-bit, prefetchable) [size=256M]
        Memory at fa000000 (64-bit, non-prefetchable) [size=32M]
        I/O ports at dc00 [size=128]
        Expansion ROM at fea80000 [disabled] [size=512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [b4] Vendor Specific Information: Len=14 <?>
        Kernel driver in use: nouveau
        Kernel modules: nouveau

02:00.0 Ethernet controller: Atheros Communications AR8121/AR8113/AR8114
Gigabit or Fast Ethernet (rev b0)
        Subsystem: ASUSTeK Computer Inc. P5KPL-CM Motherboard
        Flags: bus master, fast devsel, latency 0, IRQ 19
        Memory at febc0000 (64-bit, non-prefetchable) [size=256K]
        I/O ports at ec00 [size=128]
        Capabilities: [40] Power Management version 2
        Capabilities: [48] MSI: Enable- Count=1/1 Maskable- 64bit+
        Capabilities: [58] Express Endpoint, MSI 00
        Kernel driver in use: ATL1E

[root@myhost ~]#

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
