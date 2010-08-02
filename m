From: yaiba.kurogane-khu2bkKidpXVItvQsEIGlw@public.gmane.org
Subject: [nouveau-drm] failed to set mode on crtc
Date: Tue, 03 Aug 2010 00:19:15 +0200
Message-ID: <4C574463.3080201@interia.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

  Hi. I have a problem with current kernel 2.6.35 and nouveau module 
compiled from git (today).From xorg.0.log I got information that no 
output was found.And here is some nasty kernel logs:

...
Aug  2 21:53:02 zilog kernel: Linux agpgart interface v0.103
Aug  2 21:53:02 zilog kernel: [drm] Initialized drm 1.1.0 20060810
Aug  2 21:53:02 zilog kernel: nouveau 0000:01:00.0: PCI INT A -> GSI 16 
(level, low) -> IRQ 16
Aug  2 21:53:02 zilog kernel: [drm] nouveau 0000:01:00.0: Detected an 
NV10 generation card (0x017100a3)
Aug  2 21:53:02 zilog kernel: [drm] nouveau 0000:01:00.0: Attempting to 
load BIOS image from PRAMIN
Aug  2 21:53:02 zilog kernel: [drm] nouveau 0000:01:00.0: ... appears to 
be valid
Aug  2 21:53:02 zilog kernel: [drm] nouveau 0000:01:00.0: BMP BIOS found
Aug  2 21:53:02 zilog kernel: [drm] nouveau 0000:01:00.0: BMP version 5.20
Aug  2 21:53:02 zilog kernel: [drm] nouveau 0000:01:00.0: Bios version 
04.17.00.18
Aug  2 21:53:02 zilog kernel: [drm] nouveau 0000:01:00.0: Found Display 
Configuration Block version 1.4
Aug  2 21:53:02 zilog kernel: [drm] nouveau 0000:01:00.0: No useful 
information in BIOS output table; adding all possible outputs
Aug  2 21:53:02 zilog kernel: [drm] nouveau 0000:01:00.0: Loading NV17 
power sequencing microcode
Aug  2 21:53:02 zilog kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS 
init table 0 at offset 0xC4D2
Aug  2 21:53:02 zilog kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS 
init table 1 at offset 0xC77E
Aug  2 21:53:02 zilog kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS 
init table 2 at offset 0xC5BC
Aug  2 21:53:02 zilog kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS 
init table 3 at offset 0xCC81
Aug  2 21:53:02 zilog kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS 
init table 4 at offset 0xC719
Aug  2 21:53:02 zilog kernel: [drm] nouveau 0000:01:00.0: Detected 64MiB 
VRAM
Aug  2 21:53:02 zilog kernel: [TTM] Zone  kernel: Available graphics 
memory: 320512 kiB.
Aug  2 21:53:02 zilog kernel: [TTM] Initializing pool allocator.
Aug  2 21:53:02 zilog kernel: [drm] nouveau 0000:01:00.0: 64 MiB GART 
(aperture)
Aug  2 21:53:02 zilog kernel: [drm] nouveau 0000:01:00.0: Saving VGA fonts
Aug  2 21:53:02 zilog kernel: [drm] nouveau 0000:01:00.0: Allocating 
FIFO number 0
Aug  2 21:53:02 zilog kernel: [drm] nouveau 0000:01:00.0: 
nouveau_channel_alloc: initialised FIFO 0
Aug  2 21:53:02 zilog kernel: [drm] nouveau 0000:01:00.0: Setting dpms 
mode 3 on vga encoder (output 0)
Aug  2 21:53:02 zilog kernel: [drm] nouveau 0000:01:00.0: Setting dpms 
mode 3 on tmds encoder (output 1)
Aug  2 21:53:02 zilog kernel: [drm] nouveau 0000:01:00.0: allocated 
1280x1024 fb: 0x48000, bo e6e43c00
Aug  2 21:53:02 zilog kernel: [drm:drm_crtc_helper_set_config] *ERROR* 
failed to set mode on crtc e72b1000
Aug  2 21:53:02 zilog kernel: fbcon_init: detected unhandled fb_set_par 
error, error code -22
Aug  2 21:53:02 zilog kernel: [drm:drm_crtc_helper_set_config] *ERROR* 
failed to set mode on crtc e72b1000
Aug  2 21:53:02 zilog kernel: Console: switching to colour frame buffer 
device 160x64
Aug  2 21:53:02 zilog kernel: [drm:drm_crtc_helper_set_config] *ERROR* 
failed to set mode on crtc e72b1000
Aug  2 21:53:02 zilog kernel: fb0: nouveaufb frame buffer device
Aug  2 21:53:02 zilog kernel: drm: registered panic notifier
Aug  2 21:53:02 zilog kernel: Slow work thread pool: Starting up
Aug  2 21:53:02 zilog kernel: Slow work thread pool: Ready
Aug  2 21:53:02 zilog kernel: [drm] Initialized nouveau 0.0.16 20090420 
for 0000:01:00.0 on minor 0
...

What is going on?

----------------------------------------------------------------------
Rozpocznij z nami zabawe ... czekamy na Ciebie w saloonie.
Sprawdz >> http://linkint.pl/f27ba
