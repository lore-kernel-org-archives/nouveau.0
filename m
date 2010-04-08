From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27064] Nouveau fails to start X. This is a Nvidia
 G210m, the laptop is an asus UL50vt
Date: Thu,  8 Apr 2010 00:47:05 -0700 (PDT)
Message-ID: <20100408074705.44A09130011@annarchy.freedesktop.org>
References: <bug-27064-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27064-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

https://bugs.freedesktop.org/show_bug.cgi?id=27064

--- Comment #2 from Giacomo Bagnoli <gbagnoli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-04-08 00:47:03 PDT ---
I have a similar problem with a laptop with dual-graphics.
I have tried 2.6.24-rc3 and latest linux-2.6 git (in which i pulled latest code
from nouveau git and acpi/test). This is the "nouveau" part of dmesg, full
dmesg is attached.

[    9.136247] bus: 'pci': add driver nouveau
[    9.136258] bus: 'pci': driver_probe_device: matched device 0000:01:00.0
with
 driver nouveau
[    9.136261] bus: 'pci': really_probe: probing driver nouveau with device
0000
:01:00.0
[    9.136275] nouveau 0000:01:00.0: setting latency timer to 64
[    9.137762] device: 'controlD64': device_add
[    9.137794] PM: Adding info for No Bus:controlD64
[    9.137848] device: 'card0': device_add
[    9.137855] PM: Adding info for No Bus:card0
[    9.139301] [drm] nouveau 0000:01:00.0: Detected an NV50 generation card
(0x0a5580a2)
[    9.145797] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from
PRAMIN
[    9.145811] [drm] nouveau 0000:01:00.0: ... BIOS signature not found
[    9.145814] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from
PROM
[    9.145826] [drm] nouveau 0000:01:00.0: ... BIOS signature not found
[    9.145829] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from
PCIROM
[    9.145924] nouveau 0000:01:00.0: Invalid ROM contents
[    9.145970] [drm] nouveau 0000:01:00.0: ... BIOS signature not found
[    9.145972] [drm] nouveau 0000:01:00.0: No valid BIOS image found
[    9.145998] device: 'card0': device_unregister
[    9.146000] PM: Removing info for No Bus:card0
[    9.146045] device: 'controlD64': device_unregister    9.145970] [drm]
nouveau 0000:01:00.0: ... BIOS signature not found
[    9.145972] [drm] nouveau 0000:01:00.0: No valid BIOS image found
[    9.145998] device: 'card0': device_unregister
[    9.146000] PM: Removing info for No Bus:card0
[    9.146045] device: 'controlD64': device_unregister
[    9.146049] PM: Removing info for No Bus:controlD64



[    9.146049] PM: Removing info for No Bus:controlD64

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
