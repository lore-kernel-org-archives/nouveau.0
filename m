From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 13319] New: YV12 and YUY2 overlay broken on PPC with
	NV34M
Date: Tue, 20 Nov 2007 07:14:55 -0800 (PST)
Message-ID: <bug-13319-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=13319

           Summary: YV12 and YUY2 overlay broken on PPC with NV34M
           Product: xorg
           Version: 7.3
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: feth-6Drk4CGzKSisTnJN9+BGXg@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


mplayer -vo xv is only producing blue and I must specify mplayer -vo
xv:port=106.

data follows :

Linux tartine 2.6.22-3-powerpc #1 Tue Nov 13 15:52:56 UTC 2007 ppc GNU/Linux

0000:00:10.0 VGA compatible controller: nVidia Corporation NV34M [GeForce FX
Go5200] (rev a1)

xv is working fine with the nv driver.

dpkg -l xserver-xorg libxrandr2
||/ Nom             Version         Description
+++-===============-===============-==============================================
ii  libxrandr2      2:1.2.2-1       X11 RandR extension library
ii  xserver-xorg    1:7.3+6         the X.Org X server

X-Video Extension version 2.2
screen #0
  Adaptor #0: "NV Video Overlay with Composite"
    number of ports: 1
    port base: 105
    operations supported: PutImage 
    supported visuals:
      depth 24, visualID 0x23
      depth 24, visualID 0x24
      depth 24, visualID 0x25
      depth 24, visualID 0x26
      depth 24, visualID 0x27
      depth 24, visualID 0x28
      depth 24, visualID 0x29
      depth 24, visualID 0x2a
      depth 24, visualID 0x2b
      depth 24, visualID 0x2c
      depth 24, visualID 0x2d
      depth 24, visualID 0x2e
      depth 24, visualID 0x2f
      depth 24, visualID 0x30
      depth 24, visualID 0x31
      depth 24, visualID 0x32
      depth 24, visualID 0x33
      depth 24, visualID 0x34
      depth 24, visualID 0x35
      depth 24, visualID 0x36
      depth 24, visualID 0x37
      depth 24, visualID 0x38
      depth 24, visualID 0x39
      depth 24, visualID 0x3a
      depth 24, visualID 0x3b
      depth 24, visualID 0x3c
      depth 24, visualID 0x3d
      depth 24, visualID 0x3e
      depth 24, visualID 0x3f
      depth 24, visualID 0x40
      depth 24, visualID 0x41
      depth 24, visualID 0x42
      depth 24, visualID 0x43
      depth 24, visualID 0x44
      depth 24, visualID 0x45
      depth 24, visualID 0x46
      depth 24, visualID 0x47
      depth 24, visualID 0x48
      depth 24, visualID 0x49
      depth 24, visualID 0x4a
      depth 24, visualID 0x4b
      depth 24, visualID 0x4c
      depth 24, visualID 0x4d
      depth 24, visualID 0x4e
      depth 24, visualID 0x4f
      depth 24, visualID 0x50
      depth 24, visualID 0x51
      depth 24, visualID 0x52
    number of attributes: 9
      "XV_DOUBLE_BUFFER" (range 0 to 1)
              client settable attribute
              client gettable attribute (current value is 1)
      "XV_COLORKEY" (range 0 to 16777215)
              client settable attribute
              client gettable attribute (current value is 66046)
      "XV_AUTOPAINT_COLORKEY" (range 0 to 1)
              client settable attribute
              client gettable attribute (current value is 0)
      "XV_SET_DEFAULTS" (range 0 to 0)
              client settable attribute
      "XV_BRIGHTNESS" (range -512 to 511)
              client settable attribute
              client gettable attribute (current value is 0)
      "XV_CONTRAST" (range 0 to 8191)
              client settable attribute
              client gettable attribute (current value is 4096)
      "XV_SATURATION" (range 0 to 8191)
              client settable attribute
              client gettable attribute (current value is 4096)
      "XV_HUE" (range 0 to 360)
              client settable attribute
              client gettable attribute (current value is 0)
      "XV_ITURBT_709" (range 0 to 1)
              client settable attribute
              client gettable attribute (current value is 0)
    maximum XvImage size: 2046 x 2046
    Number of image formats: 4
      id: 0x32595559 (YUY2)
        guid: 59555932-0000-0010-8000-00aa00389b71
        bits per pixel: 16
        number of planes: 1
        type: YUV (packed)
      id: 0x32315659 (YV12)
        guid: 59563132-0000-0010-8000-00aa00389b71
        bits per pixel: 12
        number of planes: 3
        type: YUV (planar)
      id: 0x59565955 (UYVY)
        guid: 55595659-0000-0010-8000-00aa00389b71
        bits per pixel: 16
        number of planes: 1
        type: YUV (packed)
      id: 0x30323449 (I420)
        guid: 49343230-0000-0010-8000-00aa00389b71
        bits per pixel: 12
        number of planes: 3
        type: YUV (planar)
  Adaptor #1: "NV Video Blitter"
    number of ports: 32
    port base: 106
    operations supported: PutImage 
    supported visuals:
      depth 24, visualID 0x23
      depth 24, visualID 0x24
      depth 24, visualID 0x25
      depth 24, visualID 0x26
      depth 24, visualID 0x27
      depth 24, visualID 0x28
      depth 24, visualID 0x29
      depth 24, visualID 0x2a
      depth 24, visualID 0x2b
      depth 24, visualID 0x2c
      depth 24, visualID 0x2d
      depth 24, visualID 0x2e
      depth 24, visualID 0x2f
      depth 24, visualID 0x30
      depth 24, visualID 0x31
      depth 24, visualID 0x32
      depth 24, visualID 0x33
      depth 24, visualID 0x34
      depth 24, visualID 0x35
      depth 24, visualID 0x36
      depth 24, visualID 0x37
      depth 24, visualID 0x38
      depth 24, visualID 0x39
      depth 24, visualID 0x3a
      depth 24, visualID 0x3b
      depth 24, visualID 0x3c
      depth 24, visualID 0x3d
      depth 24, visualID 0x3e
      depth 24, visualID 0x3f
      depth 24, visualID 0x40
      depth 24, visualID 0x41
      depth 24, visualID 0x42
      depth 24, visualID 0x43
      depth 24, visualID 0x44
      depth 24, visualID 0x45
      depth 24, visualID 0x46
      depth 24, visualID 0x47
      depth 24, visualID 0x48
      depth 24, visualID 0x49
      depth 24, visualID 0x4a
      depth 24, visualID 0x4b
      depth 24, visualID 0x4c
      depth 24, visualID 0x4d
      depth 24, visualID 0x4e
      depth 24, visualID 0x4f
      depth 24, visualID 0x50
      depth 24, visualID 0x51
      depth 24, visualID 0x52
    number of attributes: 2
      "XV_SET_DEFAULTS" (range 0 to 0)
              client settable attribute
      "XV_SYNC_TO_VBLANK" (range 0 to 1)
              client settable attribute
              client gettable attribute (current value is 1)
    maximum XvImage size: 2046 x 2046
    Number of image formats: 5
      id: 0x32595559 (YUY2)
        guid: 59555932-0000-0010-8000-00aa00389b71
        bits per pixel: 16
        number of planes: 1
        type: YUV (packed)
      id: 0x32315659 (YV12)
        guid: 59563132-0000-0010-8000-00aa00389b71
        bits per pixel: 12
        number of planes: 3
        type: YUV (planar)
      id: 0x59565955 (UYVY)
        guid: 55595659-0000-0010-8000-00aa00389b71
        bits per pixel: 16
        number of planes: 1
        type: YUV (packed)
      id: 0x30323449 (I420)
        guid: 49343230-0000-0010-8000-00aa00389b71
        bits per pixel: 12
        number of planes: 3
        type: YUV (planar)
      id: 0x3
        guid: 03000000-0000-0010-8000-00aa00389b71
        bits per pixel: 32
        number of planes: 1
        type: RGB (packed)
        depth: 24
        red, green, blue masks: 0xff0000, 0xff00, 0xff


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
