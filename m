From: "Lev A. Melnikovsky" <melnikovsky-JGs/UdohzUI@public.gmane.org>
Subject: Nouveau [vanilla 2.6.33] + GeForce FX 5200 = blank screen
Date: Sun, 28 Feb 2010 18:50:31 +0300 (MSK)
Message-ID: <alpine.LFD.2.00.1002281835050.32108@nev.ubzr>
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

Hi there,

I have just decided to try this new driver stuff (used 2.6.27 earlier and 
a proprietary nvidia driver) but the monitor (Samsung 214T) becomes black 
and the power LED starts flashing (standby) after loading nouveau module 
(from a fresh 2.6.33). For now I am trying framebuffer only. The monitor 
is connected with a single link DVI cable.

lspci -nn
03:00.0 VGA compatible controller [0300]: nVidia Corporation NV34 [GeForce FX 5200] [10de:0322] (rev a1)

dmesg| grep drm
[drm] Initialized drm 1.1.0 20060810
[drm] nouveau 0000:03:00.0: failed to evaluate _DSM: 5
[drm] nouveau 0000:03:00.0: Detected an NV30 generation card (0x034200b1)
[drm] nouveau 0000:03:00.0: Attempting to load BIOS image from PROM
[drm] nouveau 0000:03:00.0: ... appears to be valid
[drm] nouveau 0000:03:00.0: BMP BIOS found
[drm] nouveau 0000:03:00.0: BMP version 5.39
[drm] nouveau 0000:03:00.0: Bios version 04.34.20.27
[drm] nouveau 0000:03:00.0: Found Display Configuration Block version 2.2
[drm] nouveau 0000:03:00.0: Raw DCB entry 0: 01000300 000088b8
[drm] nouveau 0000:03:00.0: Raw DCB entry 1: 02010310 000088b8
[drm] nouveau 0000:03:00.0: Raw DCB entry 2: 01010312 00000000
[drm] nouveau 0000:03:00.0: Raw DCB entry 3: 02020321 00000003
[drm] nouveau 0000:03:00.0: Loading NV17 power sequencing microcode
[drm] nouveau 0000:03:00.0: Parsing VBIOS init table 0 at offset 0xE5D9
[drm] nouveau 0000:03:00.0: Parsing VBIOS init table 1 at offset 0xE7EA
[drm] nouveau 0000:03:00.0: Parsing VBIOS init table 2 at offset 0xE930
[drm] nouveau 0000:03:00.0: Parsing VBIOS init table 3 at offset 0xEAB6
[drm] nouveau 0000:03:00.0: Parsing VBIOS init table 4 at offset 0xEAD3
[drm] nouveau 0000:03:00.0: Parsing VBIOS init table 5 at offset 0xEAF0
[drm] nouveau 0000:03:00.0: Parsing VBIOS init table 6 at offset 0xEC74
[drm] nouveau 0000:03:00.0: 128 MiB VRAM
[drm] nouveau 0000:03:00.0: 128 MiB GART (aperture)
[drm] nouveau 0000:03:00.0: Allocating FIFO number 0
[drm] nouveau 0000:03:00.0: nouveau_channel_alloc: initialised FIFO 0
[drm] nouveau 0000:03:00.0: Initial CRTC_OWNER is 0
[drm] nouveau 0000:03:00.0: Saving VGA fonts
[drm] nouveau 0000:03:00.0: Detected a VGA connector
[drm] nouveau 0000:03:00.0: Detected a DVI-I connector
[drm] nouveau 0000:03:00.0: Detected a TV connector
[drm] nouveau 0000:03:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:03:00.0: Setting dpms mode 3 on vga encoder (output 1)
[drm] nouveau 0000:03:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:03:00.0: Setting dpms mode 3 on TV encoder (output 3)
[drm] nouveau 0000:03:00.0: allocated 1600x1200 fb: 0x49000, bo f6971400
[drm] nouveau 0000:03:00.0: Output DVI-I-1 is running on CRTC 0 using output A
[drm] nouveau 0000:03:00.0: 0xDBBA: Parsing digital output script table
[drm] nouveau 0000:03:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:03:00.0: Output DVI-I-1 is running on CRTC 0 using output A
[drm] Initialized nouveau 0.0.15 20090420 for 0000:03:00.0 on minor 0

I would appreciate any help. Please let me know if additional information 
(should I set debugging flags?) is required.

Thanks
-L
