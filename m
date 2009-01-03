From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 19356] DPMS does not turn off LCD backlight on NV34M
 [ GeForce FX Go5200]
Date: Sat,  3 Jan 2009 03:28:08 -0800 (PST)
Message-ID: <20090103112808.B8CCB130054@annarchy.freedesktop.org>
References: <bug-19356-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-19356-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=19356





--- Comment #5 from Markus Tacker <m@tacker.org>  2009-01-03 03:28:07 PST ---
(In reply to comment #4)
> Can you describe your setup?

It's a third generation iMac (Rev A aka G5).

cpuinfo:
processor       : 0
cpu             : PPC970FX, altivec supported
clock           : 1800.000000MHz
revision        : 3.0 (pvr 003c 0300)
timebase        : 33333333
platform        : PowerMac
model           : PowerMac8,1
machine         : PowerMac8,1
motherboard     : PowerMac8,1 MacRISC4 Power Macintosh 
detected as     : 338 (iMac G5)
pmac flags      : 00000000
L2 cache        : 512K unified
pmac-generation : NewWorld

> What is your exact pci id

Does this help?

# nvclock -i
-- General info --
Card:           nVidia GeForce FX 5200 (Mac)
Architecture:   NV34 B1
PCI id:         0x329
GPU clock:      261.000 MHz
Bustype:        AGP

-- Memory info --
Amount:         64 MB
Type:           128 bit DDR
Clock:          513.000 MHz

-- AGP info --
Status:         Disabled
Rate:           0X
AGP rates:      4X 8X
Fast Writes:    Disabled
SBA:            Disabled


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
