From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23198] nv50/NVS135M: video hangs/flickers when
	fullscreen
Date: Sat, 22 Aug 2009 06:00:41 -0700 (PDT)
Message-ID: <20090822130042.007EF13005B@annarchy.freedesktop.org>
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





--- Comment #2 from Stefan Neufeind <freedesktop.org-Rkx4Xfb3x/xKcvNr4i3U6IQuADTiUCJX@public.gmane.org>  2009-08-22 06:00:38 PST ---
Running packages from Fedora 11 (testing) including packages:
xorg-x11-server-utils-7.4-7.fc11.x86_64
xorg-x11-server-common-1.6.3-4.fc11.x86_64
xorg-x11-server-Xorg-1.6.3-4.fc11.x86_64

Not running kms (yet), since Fedora 11 doesn't have that by default (possible
through kernelparameter nouveau.modeset=1). When turning it on other problems
appear (e.g. external and notebook-internal display appear in wrong order, some
smaller graphics-errors etc.). Might *activating* KMS help narrow down
performance-problems or would you estimate that not running KMS might be the
safer part for now which "should work"?

+++ nvclock -i
Xlib:  extension "NV-CONTROL" missing on display ":0.0".
-- General info --                                      
Card:           nVidia Quadro NVS 135M                  
Architecture:   G86 A2                                  
PCI id:         0x42b                                   
GPU clock:      297.000 MHz                             
Bustype:        PCI-Express                             

-- Shader info --
Clock: 594.000 MHz
Stream units: 16 (1b)
ROP units: 4 (1b)
-- Memory info --
Amount:         128 MB
Type:           128 bit DDR3
Clock:          302.400 MHz

-- PCI-Express info --
Current Rate:   16X
Maximum rate:   16X

-- Sensor info --
Sensor: GPU Internal Sensor
GPU temperature: 85C

-- VideoBios information --
Version: 60.86.68.00.16
Signon message: G86M G3-64 Briscoe sku0 VGA BIOS
Performance level 0: gpu 275MHz/shader 550MHz/memory 301MHz/1.15V/100%
Performance level 1: gpu 400MHz/shader 800MHz/memory 594MHz/1.15V/100%
VID mask: 7
Voltage level 0: 1.00V, VID: 4
Voltage level 1: 1.15V, VID: 0
Voltage level 2: 1.18V, VID: 2
Voltage level 3: 1.20V, VID: 3


+++ xvinfo
X-Video Extension version 2.2
screen #0                    
  Adaptor #0: "Nouveau GeForce 8/9 Textured Video"
    number of ports: 32
    port base: 57
    operations supported: PutImage
    supported visuals:
      depth 24, visualID 0x21
      depth 24, visualID 0x22
    no port attributes defined
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
