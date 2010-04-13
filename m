From: Renato Caldas <seventhguardian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Spurious TV load detection on GeForce 6150 (no TV
	connector)
Date: Tue, 13 Apr 2010 09:45:29 +0100
Message-ID: <w2x1caff7431004130145o51094dd7ve3d6a1cc5ff1c7f6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
To: For testers of Fedora development releases <test-TuqUDEhatI4ANWPb/1PvSmm0pvjS0E/A@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hello,

Since I've updated to F13 I keep getting blank screens at "cold" boot
with this card:
00:05.0 VGA compatible controller: nVidia Corporation C51PV [GeForce
6150] (rev a2)

When I say "cold" boot I mean the first couple of times I turn on my
computer in the morning. After a couple of reboots I get plymouth to
show up, and then X11. This never happened with F12.

After comparing the logs (--- bad, +++ good), I found these:

(...)
 input: ImPS/2 Generic Wheel Mouse as
/devices/platform/i8042/serio1/input/input4
-[drm] nouveau 0000:00:05.0: Load detected on output B
-[drm] nouveau 0000:00:05.0: allocated 1280x1024 fb: 0x49000, bo
ffff880034ea0cd8
+[drm] nouveau 0000:00:05.0: allocated 1280x1024 fb: 0x49000, bo
ffff880034ea8cd8
 fbcon: nouveaufb (fb0) is primary device
 [drm] nouveau 0000:00:05.0: Setting dpms mode 0 on vga encoder (output 0)
 [drm] nouveau 0000:00:05.0: Output VGA-1 is running on CRTC 0 using output B
-[drm] nouveau 0000:00:05.0: Setting dpms mode 0 on TV encoder (output 2)
-[drm] nouveau 0000:00:05.0: Output TV-1 is running on CRTC 1 using output B
-Console: switching to colour frame buffer device 90x36
+Console: switching to colour frame buffer device 160x64
 fb0: nouveaufb frame buffer device
(...)
 [drm] nouveau 0000:00:05.0: Allocating FIFO number 1
 [drm] nouveau 0000:00:05.0: nouveau_channel_alloc: initialised FIFO 1
-[drm] nouveau 0000:00:05.0: Setting dpms mode 3 on TV encoder (output 2)
 [drm] nouveau 0000:00:05.0: Allocating FIFO number 2
 [drm] nouveau 0000:00:05.0: nouveau_channel_alloc: initialised FIFO 2
(...)

Although this may seem like a hardware quirk (it may be, partially),
the fact is that I don't have a TV output, only VGA and DVI. So I
guess the driver shouldn't be looking for load on an nonexistent
output. This other log line may be relevant (or not):

Apr 13 08:35:30 localhost kernel: type=1400 audit(1271144119.830:4):
avc:  denied  { mmap_zero } for  pid=462 comm="vbetool"
scontext=system_u:system_r:vbetool_t:s0-s0:c0.c1023
tcontext=system_u:system_r:vbetool_t:s0-s0:c0.c1023 tclass=memprotect

On the other hand, both CRTC's are using output B. I'm not that
familiar with the hardware, and this may be completely wrong, but I
assume an output can only be used by a single CRTC.

Cheers,
  Renato
