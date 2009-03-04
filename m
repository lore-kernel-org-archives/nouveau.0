From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 18300] NV11 Locks Up On Xorg Initialization
Date: Wed,  4 Mar 2009 02:31:04 -0800 (PST)
Message-ID: <20090304103104.B1EFB13005A@annarchy.freedesktop.org>
References: <bug-18300-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-18300-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=18300





--- Comment #17 from Paul Ezvan <paul-/dtJ+8xXzd4@public.gmane.org>  2009-03-04 02:31:03 PST ---
I get also a similar problem with a NV11DDR. The bios indicates 32 Mb of VRAM
at startup, also confirmed in Xorg.log, so it may not be due to low vram
amount.

Here are the logs :

messages.log:
Mar  4 12:04:29 hera init: Switching to runlevel: 5
Mar  4 12:04:29 hera agpgart-sis 0000:00:00.0: AGP 2.0 bridge
Mar  4 12:04:29 hera agpgart-sis 0000:00:00.0: putting AGP V2 device into 4x
mode
Mar  4 12:04:29 hera nouveau 0000:01:00.0: putting AGP V2 device into 4x mode
Mar  4 12:04:29 hera [drm] Allocating FIFO number 0
Mar  4 12:04:29 hera [drm] nouveau_fifo_alloc: initialised FIFO 0
Mar  4 12:04:29 hera [drm] Allocating FIFO number 1
Mar  4 12:04:29 hera [drm] nouveau_fifo_alloc: initialised FIFO 1
Mar  4 12:04:30 hera [drm] PFIFO_CACHE_ERROR - Ch 1/4 Mthd 0x0180 Data
0x00000000

lspci
00:00.0 Host bridge: Silicon Integrated Systems [SiS] 735 Host (rev 01)
00:01.0 PCI bridge: Silicon Integrated Systems [SiS] Virtual PCI-to-PCI bridge
(AGP)
00:02.0 ISA bridge: Silicon Integrated Systems [SiS] SiS85C503/5513 (LPC
Bridge)
00:02.1 SMBus: Silicon Integrated Systems [SiS] SiS961/2 SMBus Controller
00:02.2 USB Controller: Silicon Integrated Systems [SiS] USB 1.1 Controller
(rev 07)
00:02.3 USB Controller: Silicon Integrated Systems [SiS] USB 1.1 Controller
(rev 07)
00:02.5 IDE interface: Silicon Integrated Systems [SiS] 5513 [IDE] (rev d0)
00:02.7 Multimedia audio controller: Silicon Integrated Systems [SiS] AC'97
Sound Controller (rev a0)
00:09.0 Ethernet controller: Asix Electronics Corporation AX88141 Fast Ethernet
Controller (rev 03)
01:00.0 VGA compatible controller: nVidia Corporation NV11DDR [GeForce2 MX200]
(rev b2)

Xorg.0.log attached.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
