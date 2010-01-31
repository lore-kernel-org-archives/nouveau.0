From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23198] nv50/NVS135M: video hangs/flickers when
	fullscreen
Date: Sun, 31 Jan 2010 14:22:05 -0800 (PST)
Message-ID: <20100131222205.2ADB613009D@annarchy.freedesktop.org>
References: <bug-23198-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23198-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23198


Matthias Schiffer <matthias-XiZCIHpZ/pwb1SvskN2V4Q@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |matthias-XiZCIHpZ/pwb1SvskN2V4Q@public.gmane.org




--- Comment #3 from Matthias Schiffer <matthias-XiZCIHpZ/pwb1SvskN2V4Q@public.gmane.org>  2010-01-31 14:22:02 PST ---
I have the same problems with a completely different setup on my Ubuntu system.

xserver 1.7.99.2 + git 0cb638dc (but I had these problems with all versions
since 1.6)
Kernel 2.6.33-rc5 + Nouveau git 5e660316 (but again, happens with all versions
I have tested in the last 3 months)
xf86-video-nouveau git 2630a155

The problems occur whenever I set MPlayer to fullscreen on my 1920x1200
display. It happens with Metacity compositing enabled or disabled. My card is a
8400M GS, built into a Dell XPS M1330 notebook.

This bug is rather annoying, as it makes XV unusable on my display, but with
MPlayer's x11 driver my computer is to slow to play hd videos. If you don't
know why this happens, do you know where I can start debugging? I don't know
much about the internals of the nouveau driver, but I consider myself a rather
competent C programmer.


# nvclock -i
Xlib:  extension "NV-CONTROL" missing on display ":0.0".
-- General info --
Card:           nVidia Geforce 8400M GS
Architecture:   G86 A2
PCI id:         0x427
GPU clock:      216.000 MHz
Bustype:        PCI-Express

-- Shader info --
Clock: 432.000 MHz
Stream units: 16 (1b)
ROP units: 4 (1b)
-- Memory info --
Amount:         128 MB
Type:           128 bit DDR3
Clock:          351.000 MHz

-- PCI-Express info --
Current Rate:   16X
Maximum rate:   16X

-- Sensor info --
Sensor: GPU Internal Sensor
GPU temperature: 73C

-- VideoBios information --
Version: 60.86.45.00.40
Signon message: G86M G3-64 Thurman sku0 VGA BIOS
Performance level 0: gpu 275MHz/shader 550MHz/memory 301MHz/1.15V/100%
Performance level 1: gpu 400MHz/shader 800MHz/memory 600MHz/1.15V/100%
VID mask: 3
Voltage level 0: 1.00V, VID: 4
Voltage level 1: 1.15V, VID: 0
Voltage level 2: 1.18V, VID: 2
Voltage level 3: 1.20V, VID: 3


# xvinfo 
X-Video Extension version 2.2
screen #0
  Adaptor #0: "Nouveau GeForce 8/9 Textured Video"
    number of ports: 32
    port base: 63
    operations supported: PutImage 
    supported visuals:
      depth 24, visualID 0x21
      depth 24, visualID 0x22
    number of attributes: 2
      "XV_SET_DEFAULTS" (range 0 to 0)
              client settable attribute
      "XV_SYNC_TO_VBLANK" (range 0 to 1)
              client settable attribute
              client gettable attribute (current value is 1)
    maximum XvImage size: 4096 x 4096
    Number of image formats: 3
      id: 0x32315659 (YV12)
        guid: 59563132-0000-0010-8000-00aa00389b71
        bits per pixel: 12
        number of planes: 3
        type: YUV (planar)
      id: 0x30323449 (I420)
        guid: 49343230-0000-0010-8000-00aa00389b71
        bits per pixel: 12
        number of planes: 3
        type: YUV (planar)
      id: 0x32595559 (YUY2)
        guid: 59555932-0000-0010-8000-00aa00389b71
        bits per pixel: 16
        number of planes: 1
        type: YUV (packed)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
