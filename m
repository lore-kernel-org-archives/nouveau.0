From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 18286] GeForce 8300 not supported
	(10de:0848/C77/MCP77)
Date: Tue,  7 Jul 2009 12:29:34 -0700 (PDT)
Message-ID: <20090707192934.10C5D13005B@annarchy.freedesktop.org>
References: <bug-18286-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-18286-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=18286





--- Comment #20 from Sebastian Brandt <sbrandt-Mmb7MZpHnFY@public.gmane.org>  2009-07-07 12:29:32 PST ---
Created an attachment (id=27476)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=27476)
dmesg of sucessful modeset

GREAT - modeset works! 
Log messages:

[drm] Initialized drm 1.1.0 20060810
ACPI: PCI Interrupt Link [AIGP] enabled at IRQ 20
nouveau 0000:02:00.0: PCI INT A -> Link[AIGP] -> GSI 20 (level, low) -> IRQ 20
nouveau 0000:02:00.0: setting latency timer to 64
nouveau 0000:02:00.0: Detected an NV50 generation card (0x0aa400a2)
[TTM] TTM available graphics memory: 1539 MiB
[TTM] TTM available object memory: 1539 MiB
nouveau 0000:02:00.0: Allocating FIFO number 1
nouveau 0000:02:00.0: nouveau_fifo_alloc: initialised FIFO 1
nouveau 0000:02:00.0: Attempting to load BIOS image from PRAMIN
nouveau 0000:02:00.0: ... appears to be valid
nouveau 0000:02:00.0: BIT BIOS found
nouveau 0000:02:00.0: Bios version 62.77.1e.00
nouveau 0000:02:00.0: TMDS table revision 2.0 not currently supported
nouveau 0000:02:00.0: Found Display Configuration Block version 4.0
nouveau 0000:02:00.0: Raw DCB entry 0: 01000300 0000001e
nouveau 0000:02:00.0: Raw DCB entry 1: 01011332 00020010
nouveau 0000:02:00.0: Raw DCB entry 2: 0000000e 00000000
nouveau 0000:02:00.0: Parsing VBIOS init table 0 at offset 0xC672
nouveau 0000:02:00.0: ========== unknown reg 0x002FF0A8 ==========
nouveau 0000:02:00.0: ========== unknown reg 0x002FF0A8 ==========
nouveau 0000:02:00.0: ========== unknown reg 0x00021220 ==========
nouveau 0000:02:00.0: Could not find a compatible set of PLL values
nouveau 0000:02:00.0: Parsing VBIOS init table 1 at offset 0xC956
nouveau 0000:02:00.0: Parsing VBIOS init table 2 at offset 0xC958
nouveau 0000:02:00.0: Parsing VBIOS init table 3 at offset 0xCA3D
nouveau 0000:02:00.0: ========== unknown reg 0x00020010 ==========
nouveau 0000:02:00.0: ========== unknown reg 0x0002000C ==========
nouveau 0000:02:00.0: ========== unknown reg 0x0002000C ==========
nouveau 0000:02:00.0: Parsing VBIOS init table 4 at offset 0xCB02
nouveau 0000:02:00.0: Detected a DAC output
nouveau 0000:02:00.0: Detected a TMDS output
nouveau 0000:02:00.0: Detected a VGA connector
nouveau-0000:02:00.0-VGA-1: Test OK
nouveau 0000:02:00.0: Detected a DVI-D connector
nouveau-0000:02:00.0-DVI-D-1: Test OK
allocated 1400x1050 fb: 0x40220000, bo ffff880037c77000
Console: switching to colour frame buffer device 175x65
[drm] TMDS-8: set mode 1400x1050 1f
nouveau 0000:02:00.0: 0xB5A0: parsing output script 1
nouveau 0000:02:00.0: 0xB5A1: parsing output script 2
nouveau 0000:02:00.0: 0xB375: parsing clock script 0
nouveau 0000:02:00.0: ========== unknown reg 0x00021028 ==========
nouveau 0000:02:00.0: ========== unknown reg 0x00021028 ==========
nouveau 0000:02:00.0: ========== unknown reg 0x00021028 ==========
nouveau 0000:02:00.0: ========== unknown reg 0x00021028 ==========
nouveau 0000:02:00.0: ========== unknown reg 0x00021028 ==========
nouveau 0000:02:00.0: ========== unknown reg 0x00021028 ==========
nouveau 0000:02:00.0: ========== unknown reg 0x00021028 ==========
nouveau 0000:02:00.0: ========== unknown reg 0x00021028 ==========
nouveau 0000:02:00.0: ========== unknown reg 0x00021028 ==========
nouveau 0000:02:00.0: ========== unknown reg 0x00021028 ==========
nouveau 0000:02:00.0: ========== unknown reg 0x00021028 ==========
nouveau 0000:02:00.0: ========== unknown reg 0x00021028 ==========
nouveau 0000:02:00.0: ========== unknown reg 0x00021028 ==========
nouveau 0000:02:00.0: ========== unknown reg 0x00021028 ==========
nouveau 0000:02:00.0: ========== unknown reg 0x00021028 ==========
nouveau 0000:02:00.0: ========== unknown reg 0x00021028 ==========
nouveau 0000:02:00.0: 0xACAA: parsing clock script 1
nouveau 0000:02:00.0: GPU lockup - switching to software fbcon
fb0: nouveaufb frame buffer device
registered panic notifier
[drm] Initialized nouveau 0.0.14 20090420 for 0000:02:00.0 on minor 0

Xorg still fails ;-)
dmesg:
nouveau 0000:02:00.0: Unhandled PFIFO_INTR - 0x00000010
* repeatet an awful lot of times *
nouveau 0000:02:00.0: Unhandled PFIFO_INTR - 0x00000010
[TTM]Failed moving buffer. Proposed placement 0x00070004
[TTM]Out of aperture space or DRM memory quota.

Xorg-log:
(EE) NOUVEAU(0): Failed to allocate framebuffer memory


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
