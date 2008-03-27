From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15232] New: X11 doesn't start on my mobile nvidia
	8600 gt
Date: Thu, 27 Mar 2008 14:26:45 -0700 (PDT)
Message-ID: <bug-15232-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15232

           Summary: X11 doesn't start on my mobile nvidia 8600 gt
           Product: xorg
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: list-nouveau-jheuOLE9CCKzQB+pC5nmwQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=15519)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=15519)
Logfile with failing nouveau driver

hello,

i have a new dell vostro 1500 notebook with this nvidia card:

[root@vostro ~]# nvclock -i
Xlib:  extension "NV-CONTROL" missing on display ":0.0".
-- General info --
Card:           nVidia Geforce 8600M GT
Architecture:   G84 A2
PCI id:         0x407
GPU clock:      297.000 MHz
Bustype:        PCI-Express

-- Shader info --
Clock: 594.000 MHz
Stream units: 32 (11b)
ROP units: 8 (11b)
-- Memory info --
Amount:         256 MB
Type:           128 bit DDR2
Clock:          199.800 MHz

-- PCI-Express info --
Current Rate:   16X
Maximum rate:   16X

-- Sensor info --
Sensor: GPU Internal Sensor
GPU temperature: 45C

-- VideoBios information --
Version: 60.84.50.00.02
Signon message: NB8P-GS P410 sku1 VGA BIOS
Performance level 0: gpu 275MHz/shader 550MHz/memory 200MHz/1.15V/100%
Performance level 1: gpu 475MHz/shader 950MHz/memory 400MHz/1.20V/100%
VID mask: 3
Voltage level 0: 1.00V, VID: 0
Voltage level 1: 1.15V, VID: 1
Voltage level 2: 1.18V, VID: 2
Voltage level 3: 1.20V, VID: 3

Running X with driver="nv" works well, but running it with a new compiled git
version of the nouveau driver is failing.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
