From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 18286] [nouveau] GeForce 8200 and 8300 not supported
 (10de:0848/0849/C77/MCP77/MCP78S)
Date: Sat, 16 Jan 2010 21:06:20 -0800 (PST)
Message-ID: <20100117050620.BD5AE2DC012@annarchy.freedesktop.org>
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





--- Comment #31 from Stanislav K. <stas_main-JGs/UdohzUI@public.gmane.org>  2010-01-16 21:06:18 PST ---
I confirm that it doesn't work well on GeForce 8200M, even if kms is not
enabled.
If kms enabled it sets native screen resolution, xorg runs, but very slowly and
2d acceleration doesn't work.

02:00.0 VGA compatible controller: nVidia Corporation C77 [GeForce 8200M G]
(rev a2)

Here is the dmesg with modeset=1:
[drm] Initialized drm 1.1.0 20060810
ACPI: PCI Interrupt Link [LGPU] enabled at IRQ 21
nouveau 0000:02:00.0: PCI INT A -> Link[LGPU] -> GSI 21 (level, low) -> IRQ 21
nouveau 0000:02:00.0: setting latency timer to 64
[drm] nouveau 0000:02:00.0: failed to evaluate _DSM: 5
[drm] nouveau 0000:02:00.0: Detected an NV50 generation card (0x0aa280a2)
[drm] nouveau 0000:02:00.0: Attempting to load BIOS image from PRAMIN
[drm] nouveau 0000:02:00.0: ... appears to be valid
[drm] nouveau 0000:02:00.0: BIT BIOS found
[drm] nouveau 0000:02:00.0: Bios version 62.77.2f.00
[drm] nouveau 0000:02:00.0: TMDS table revision 2.0 not currently supported
[drm] nouveau 0000:02:00.0: Found Display Configuration Block version 4.0
[drm] nouveau 0000:02:00.0: DCB connector table: VHER 0x40 5 16 4
[drm] nouveau 0000:02:00.0:   0: 0x00000040: type 0x40 idx 0 tag 0xff
[drm] nouveau 0000:02:00.0:   1: 0x00000100: type 0x00 idx 1 tag 0xff
[drm] nouveau 0000:02:00.0:   2: 0x00001261: type 0x61 idx 2 tag 0x07
[drm] nouveau 0000:02:00.0: Raw DCB entry 0: 01000323 00010034
[drm] nouveau 0000:02:00.0: Raw DCB entry 1: 02011300 0000001e
[drm] nouveau 0000:02:00.0: Raw DCB entry 2: 02022332 00020010
[drm] nouveau 0000:02:00.0: Raw DCB entry 3: 0000000e 00000000
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 0 at offset 0xD5C5
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 1 at offset 0xD824
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 2 at offset 0xD826
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 3 at offset 0xD90B
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 4 at offset 0xDA5A
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table at offset 0xDABF
[drm] nouveau 0000:02:00.0: 0xDABF: Condition still not met after 20ms,
skipping following opcodes
[drm] nouveau 0000:02:00.0: 0xC1D2: parsing output script 0
[drm] nouveau 0000:02:00.0: 0xC38E: parsing output script 0
[TTM] Zone  kernel: Available graphics memory: 898512 kiB.
[drm] nouveau 0000:02:00.0: 256 MiB VRAM
[drm] nouveau 0000:02:00.0: 512 MiB GART (aperture)
nouveau 0000:02:00.0: firmware: requesting nouveau/nvaa.ctxprog
nouveau 0000:02:00.0: firmware: requesting nouveau/nvaa.ctxvals
[drm] nouveau 0000:02:00.0: Allocating FIFO number 1
[drm] nouveau 0000:02:00.0: nouveau_channel_alloc: initialised FIFO 1
[drm] nouveau 0000:02:00.0: Detected a LVDS output
[drm] nouveau 0000:02:00.0: Detected a DAC output
[drm] nouveau 0000:02:00.0: Detected a TMDS output
[drm] nouveau 0000:02:00.0: Detected a LVDS connector
[drm] nouveau 0000:02:00.0: Detected a VGA connector
[drm] nouveau 0000:02:00.0: Detected a DVI-D connector
[drm] nouveau 0000:02:00.0: allocated 1366x768 fb: 0x40210000, bo
ffff880068c85e00
Console: switching to colour frame buffer device 170x48
fb0: nouveaufb frame buffer device
registered panic notifier
[drm] Initialized nouveau 0.0.15 20090420 for 0000:02:00.0 on minor 0
[drm] nouveau 0000:02:00.0: Allocating FIFO number 2
[drm] nouveau 0000:02:00.0: nouveau_channel_alloc: initialised FIFO 2
[drm] nouveau 0000:02:00.0: nouveau_channel_free: freeing fifo 2
[drm] LVDS-7: set mode 1366x768 1a
[drm] nouveau 0000:02:00.0: 0xC1D6: parsing output script 1
[drm] nouveau 0000:02:00.0: 0xC045: parsing clock script 0
[drm] nouveau 0000:02:00.0: 0xC1CD: parsing clock script 1

When kms is not enabled, xorg just hangs computer and sysrq keys doesn't work,
so i can't attach log.
nouveau-drm version in my distro is 0.0.15_20091220.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
