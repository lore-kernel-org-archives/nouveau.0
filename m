From: Martin PERES <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: [TEST REQUEST] NV50/NV8x/NV9x/NVAx ctxprog and
	ctxvals	generator
Date: Wed, 24 Feb 2010 08:37:52 +0100
Message-ID: <4B84D750.5070604@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

Hello,

Sorry for not answering to the right message, I've just joined the 
mailing list.

I've tried this patch on my Quadro NVS 140M and it fails to load KDM.
It shows the background but fails to show the credential edit boxes.
It seems like the computer is locked up though the mouse can still move 
(can't do any VT switches) and
I still can ssh on it.

Needless to say this works without the patch ;)

Martin

dmesg:
[drm] Initialized drm 1.1.0 20060810
nouveau 0000:01:00.0: power state changed by ACPI to D0
nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
nouveau 0000:01:00.0: setting latency timer to 64
[drm] nouveau 0000:01:00.0: failed to evaluate _DSM: 5
[drm] nouveau 0000:01:00.0: Detected an NV50 generation card (0x086900a2)
[drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PRAMIN
[drm] nouveau 0000:01:00.0: ... appears to be valid
[drm] nouveau 0000:01:00.0: BIT BIOS found
[drm] nouveau 0000:01:00.0: Bios version 60.86.3e.00
[drm] nouveau 0000:01:00.0: TMDS table revision 2.0 not currently supported
[drm] nouveau 0000:01:00.0: BIT table 'd' not found
[drm] nouveau 0000:01:00.0: Found Display Configuration Block version 4.0
[drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x40 5 14 2
[drm] nouveau 0000:01:00.0:   0: 0x00000040: type 0x40 idx 0 tag 0xff
[drm] nouveau 0000:01:00.0:   1: 0x00000100: type 0x00 idx 1 tag 0xff
[drm] nouveau 0000:01:00.0:   2: 0x00001231: type 0x31 idx 2 tag 0x07
[drm] nouveau 0000:01:00.0:   3: 0x00000311: type 0x11 idx 3 tag 0xff
[drm] nouveau 0000:01:00.0: Raw DCB entry 0: 01000323 00010034
[drm] nouveau 0000:01:00.0: Raw DCB entry 1: 02811300 00000028
[drm] nouveau 0000:01:00.0: Raw DCB entry 2: 02822312 00010030
[drm] nouveau 0000:01:00.0: Raw DCB entry 3: 014333f1 0080c080
[drm] nouveau 0000:01:00.0: Raw DCB entry 4: 0000000e 00000000
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset 0xDD0F
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset 0xE04F
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset 0xEAA4
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset 0xEB96
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset 0xED83
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table at offset 0xEDE8
[drm] nouveau 0000:01:00.0: 0xEDE8: Condition still not met after 20ms, 
skipping following opcodes
[drm] nouveau 0000:01:00.0: 0xCE7E: parsing output script 0
[drm] nouveau 0000:01:00.0: 0xCFF4: parsing output script 0
[drm] nouveau 0000:01:00.0: 0xC66A: parsing output script 0
[TTM] Zone  kernel: Available graphics memory: 443326 kiB.
[TTM] Zone highmem: Available graphics memory: 1036578 kiB.
[drm] nouveau 0000:01:00.0: 128 MiB VRAM
[drm] nouveau 0000:01:00.0: 512 MiB GART (aperture)
[drm] nouveau 0000:01:00.0: Allocating FIFO number 1
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 1
[drm] nouveau 0000:01:00.0: Detected a LVDS output
[drm] nouveau 0000:01:00.0: Detected a DAC output
[drm] nouveau 0000:01:00.0: Detected a TMDS output
[drm] nouveau 0000:01:00.0: DCB encoder 1 unknown
[drm] nouveau 0000:01:00.0: Detected a LVDS connector
[drm] nouveau 0000:01:00.0: Detected a VGA connector
[drm] nouveau 0000:01:00.0: Detected a DVI-D connector
[drm] nouveau 0000:01:00.0: allocated 1280x800 fb: 0x40250000, bo f6813200
[drm] LVDS-7: set mode 1280x800 1a
[drm] nouveau 0000:01:00.0: 0xCE82: parsing output script 1
[drm] nouveau 0000:01:00.0: 0xCCE3: parsing clock script 0
Console: switching to colour frame buffer device 160x50
fb0: nouveaufb frame buffer device
registered panic notifier
[drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on minor 0
[drm] nouveau 0000:01:00.0: 0xCE41: parsing clock script 1

...

# When loading KDM
[drm] nouveau 0000:01:00.0: Allocating FIFO number 2
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 2
[drm] nouveau 0000:01:00.0: Allocating FIFO number 3
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 3
# Stuck !
