From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 36422] unable to hibernate with nouveau and NV11
	[bisected]
Date: Fri, 22 Apr 2011 16:43:40 -0700 (PDT)
Message-ID: <20110422234340.438E913000C@annarchy.freedesktop.org>
References: <bug-36422-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-36422-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=36422

--- Comment #6 from c sights <csights-97jfqw80gc6171pxa8y+qA@public.gmane.org> 2011-04-22 16:43:39 PDT ---
    Here are what appear to be the relevant parts of dmesg for the "last good"
and "first bad" kernels.  The difference I see is that the "last good" emits
"failed parsing" messages, whereas the "last bad" does not.  I will attach the
full dmesg separately.

LAST GOOD d17f395cdcec39033a481f96d75e8b3d3c41d43a
[drm] Initialized drm 1.1.0 20060810
nouveau 0000:02:00.0: PCI INT A -> Link[APC4] -> GSI 19 (level, high) -> IRQ 19
[drm] nouveau 0000:02:00.0: Detected an NV10 generation card (0x011000b2)
[drm] nouveau 0000:02:00.0: Attempting to load BIOS image from PROM
[drm] nouveau 0000:02:00.0: ... appears to be valid
[drm] nouveau 0000:02:00.0: BMP BIOS found
[drm] nouveau 0000:02:00.0: BMP version 5.17
[drm] nouveau 0000:02:00.0: Bios version 03.11.00.18
[drm] nouveau 0000:02:00.0: Found Display Configuration Block version 1.2
[drm] nouveau 0000:02:00.0: No useful information in BIOS output table; adding
all possible outputs
[drm] nouveau 0000:02:00.0: Probing TV encoders on I2C bus: 1
[drm] nouveau 0000:02:00.0: No TV encoders found.
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 0 at offset 0x07FE
[drm] nouveau 0000:02:00.0: 0x0818: Failed parsing init table opcode:
INIT_CONFIGURE_PREINIT -19
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 1 at offset 0x0EA7
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 2 at offset 0x0819
[drm] nouveau 0000:02:00.0: 0x08AB: Failed parsing init table opcode:
INIT_CONFIGURE_CLK -19
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 3 at offset 0x0E4E
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 4 at offset 0x08AC
[drm] nouveau 0000:02:00.0: 0x08D9: Failed parsing init table opcode:
INIT_CONFIGURE_MEM -19
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 5 at offset 0x09BB
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 6 at offset 0x08DA
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 7 at offset 0x0956
[drm] nouveau 0000:02:00.0: Detected 32MiB VRAM
[TTM] Zone  kernel: Available graphics memory: 443408 kiB.
[TTM] Zone highmem: Available graphics memory: 1168372 kiB.
[TTM] Initializing pool allocator.
agpgart-nvidia 0000:00:00.0: AGP 2.0 bridge
agpgart-nvidia 0000:00:00.0: putting AGP V2 device into 4x mode
nouveau 0000:02:00.0: putting AGP V2 device into 4x mode
[drm] nouveau 0000:02:00.0: 64 MiB GART (aperture)
[drm] nouveau 0000:02:00.0: Allocating FIFO number 0
[drm] nouveau 0000:02:00.0: nouveau_channel_alloc: initialised FIFO 0
[drm] nouveau 0000:02:00.0: Initial CRTC_OWNER is 0
[drm] nouveau 0000:02:00.0: Saving VGA fonts
[drm] nouveau 0000:02:00.0: Detected a VGA connector
[drm] nouveau 0000:02:00.0: Detected a DVI-D connector
[drm] nouveau 0000:02:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:02:00.0: Setting dpms mode 3 on tmds encoder (output 1)
[drm] nouveau 0000:02:00.0: allocated 1280x1024 fb: 0x48000, bo f665ec00
[drm] nouveau 0000:02:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:02:00.0: Output VGA-1 is running on CRTC 0 using output @
Console: switching to colour frame buffer device 160x64
fb0: nouveaufb frame buffer device
drm: registered panic notifier
[drm] Initialized nouveau 0.0.16 20090420 for 0000:02:00.0 on minor 0



FIRST BAD 816544b21b020bdb9dcb9a5003fe3e1f109e8698
[drm] Initialized drm 1.1.0 20060810
nouveau 0000:02:00.0: PCI INT A -> Link[APC4] -> GSI 19 (level, high) -> IRQ 19
[drm] nouveau 0000:02:00.0: Detected an NV10 generation card (0x011000b2)
[drm] nouveau 0000:02:00.0: Attempting to load BIOS image from PROM
[drm] nouveau 0000:02:00.0: ... appears to be valid
[drm] nouveau 0000:02:00.0: BMP BIOS found
[drm] nouveau 0000:02:00.0: BMP version 5.17
[drm] nouveau 0000:02:00.0: Bios version 03.11.00.18
[drm] nouveau 0000:02:00.0: Found Display Configuration Block version 1.2
[drm] nouveau 0000:02:00.0: No useful information in BIOS output table; adding
all possible outputs
[drm] nouveau 0000:02:00.0: Probing TV encoders on I2C bus: 1
[drm] nouveau 0000:02:00.0: No TV encoders found.
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 0 at offset 0x07FE
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 1 at offset 0x0EA7
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 2 at offset 0x0819
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 3 at offset 0x0E4E
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 4 at offset 0x08AC
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 5 at offset 0x09BB
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 6 at offset 0x08DA
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 7 at offset 0x0956
[drm] nouveau 0000:02:00.0: Detected 32MiB VRAM
[TTM] Zone  kernel: Available graphics memory: 443408 kiB.
[TTM] Zone highmem: Available graphics memory: 1168372 kiB.
[TTM] Initializing pool allocator.
agpgart-nvidia 0000:00:00.0: AGP 2.0 bridge
agpgart-nvidia 0000:00:00.0: putting AGP V2 device into 4x mode
nouveau 0000:02:00.0: putting AGP V2 device into 4x mode
[drm] nouveau 0000:02:00.0: 64 MiB GART (aperture)
[drm] nouveau 0000:02:00.0: Allocating FIFO number 0
[drm] nouveau 0000:02:00.0: nouveau_channel_alloc: initialised FIFO 0
[drm] nouveau 0000:02:00.0: Initial CRTC_OWNER is 0
[drm] nouveau 0000:02:00.0: Saving VGA fonts
[drm] nouveau 0000:02:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:02:00.0: Setting dpms mode 3 on tmds encoder (output 1)
[drm] nouveau 0000:02:00.0: allocated 1280x1024 fb: 0x48000, bo f68e9400
[drm] nouveau 0000:02:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:02:00.0: Output VGA-1 is running on CRTC 0 using output @
Console: switching to colour frame buffer device 160x64
fb0: nouveaufb frame buffer device
drm: registered panic notifier
[drm] Initialized nouveau 0.0.16 20090420 for 0000:02:00.0 on minor 0


    There is a range of commits skipped while bisecting because they don't
compile.  If anyone can devise a patch to fix up the compile error that would
be nice!  Here is the first compile error encountered after the "last good"
commit:

  CC [M]  drivers/gpu/drm/nouveau/nouveau_drv.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_state.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_channel.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_mem.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_object.o
drivers/gpu/drm/nouveau/nouveau_object.c: In function 'nouveau_gpuobj_new':
drivers/gpu/drm/nouveau/nouveau_object.c:236:23: error: 'struct drm_mm' has no
member named 'ml_entry'
make[4]: *** [drivers/gpu/drm/nouveau/nouveau_object.o] Error 1
make[3]: *** [drivers/gpu/drm/nouveau] Error 2
make[2]: *** [drivers/gpu/drm] Error 2
make[1]: *** [drivers/gpu] Error 2
make: *** [drivers] Error 2

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
