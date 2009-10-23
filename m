From: Anders Eriksson <aeriksson-97jfqw80gc6171pxa8y+qA@public.gmane.org>
Subject: TTM out of aperture space
Date: Fri, 23 Oct 2009 12:30:37 +0200
Message-ID: <20091023103037.5768A33C303@tippex.mynet.homeunix.org>
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


Afer an upgrade to xorg-server-1.7.0.902 and latest git for the kernel and 
xorg nouveau drivers I cannot start x with kms under wmaker. As root (just twm 
and an xterm) it's ok.

Dmesg shows:
 [drm] DAC-6: set mode 1680x1050 1a
[drm] nouveau 0000:01:00.0: nv04_dac_mode_set called for encoder 0
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on CRTC 0
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Output VGA-1 is running on CRTC 0 using output @
[drm] Initialized nouveau 0.0.15 20090420 for 0000:01:00.0 on minor 0
[drm] nouveau 0000:01:00.0: Setting dpms mode 1 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on CRTC 0
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Allocating FIFO number 1
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 1
[drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 1
[drm] nouveau 0000:01:00.0: Allocating FIFO number 1
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 1
[TTM] Failed moving buffer. Proposed placement 0x00070004
[TTM] Out of aperture space or DRM memory quota.
[drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 1
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on CRTC 0

and the display is powered off. At this point I need to ssh to the machine as 
reboot it.

If I don't use kms, I can start wmaker just fine:
Linux agpgart interface v0.103
agpgart-intel 0000:00:00.0: Intel 440BX Chipset
agpgart-intel 0000:00:00.0: AGP aperture is 64M @ 0xe8000000
[drm] Initialized drm 1.1.0 20060810
[drm] nouveau 0000:01:00.0: Detected an NV4 generation card (0x20154000)
[drm] Initialized nouveau 0.0.15 20090420 for 0000:01:00.0 on minor 0
[TTM] Zone  kernel: Available graphics memory: 221064 kiB.
[drm] nouveau 0000:01:00.0: 16 MiB VRAM
agpgart-intel 0000:00:00.0: AGP 1.0 bridge
agpgart-intel 0000:00:00.0: putting AGP V2 device into 2x mode
[drm] nouveau 0000:01:00.0: 64 MiB GART (aperture)
[drm] nouveau 0000:01:00.0: Allocating FIFO number 0
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 0
[drm] nouveau 0000:01:00.0: Allocating FIFO number 1
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 1


Ideas?

/Anders
