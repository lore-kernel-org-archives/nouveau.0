From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24147] New: xv output slow and causes wmaker screen
	corruption
Date: Fri, 25 Sep 2009 05:46:43 -0700 (PDT)
Message-ID: <bug-24147-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=24147

           Summary: xv output slow and causes wmaker screen corruption
           Product: xorg
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: aeriksson-97jfqw80gc6171pxa8y+qA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Starting "mplayer -vo xv -hardframedrop anyfile.avi" cuases wmclock and
wmcpuload to show garbled icons.

Additonally, the video playback is unbearably slow, circa one frame every 5
seconds. Back when 2.6.29 was shipped (at which point I believe nouveau was
without ttm), xv playback was super smooth.


HW spec:

# lspci
00:00.0 Host bridge: Intel Corporation 440BX/ZX/DX - 82443BX/ZX/DX Host bridge
(rev 02)
00:01.0 PCI bridge: Intel Corporation 440BX/ZX/DX - 82443BX/ZX/DX AGP bridge
(rev 02)
00:07.0 ISA bridge: Intel Corporation 82371AB/EB/MB PIIX4 ISA (rev 02)
00:07.1 IDE interface: Intel Corporation 82371AB/EB/MB PIIX4 IDE (rev 01)
00:07.2 USB Controller: Intel Corporation 82371AB/EB/MB PIIX4 USB (rev 01)
00:07.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 02)
00:0a.0 Network controller: RaLink RT2500 802.11g Cardbus/mini-PCI (rev 01)
00:0b.0 Ethernet controller: Intel Corporation 82557/8/9/0/1 Ethernet Pro 100
(rev 05)
01:00.0 VGA compatible controller: nVidia Corporation NV5 [RIVA TNT2/TNT2 Pro]
(rev 15)
# cat /proc/cpuinfo 
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 3
model name      : Pentium II (Klamath)
stepping        : 4
cpu MHz         : 300.708
cache size      : 512 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
mmx
bogomips        : 601.41
clflush size    : 32
power management:


SW spec: (gentoo)
xorg-cf-files-1.0.2
xorg-server-1.6.3.901-r2
xorg-drivers-1.6
libXxf86dga-1.0.2
libXxf86vm-1.0.2
libXxf86misc-1.0.1
font-xfree86-type1-1.0.0
xf86bigfontproto-1.1.2
xf86vidmodeproto-2.2.2
xf86miscproto-0.9.2
xf86driproto-2.0.4
xf86rushproto-1.1.2
xf86dgaproto-2.0.3
xf86-input-evdev-2.2.4
xf86-video-nouveau-9999 (i.e. git as of 2.6.31-rc8-g3b2a7ad)

wmclock-1.0.12.2
wmcpuload-1.1.0_pre5


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
