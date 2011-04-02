From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35901] New: two full hd displays (left and right)
 with nouveau does not work any more
Date: Sat,  2 Apr 2011 02:25:32 -0700 (PDT)
Message-ID: <bug-35901-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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

https://bugs.freedesktop.org/show_bug.cgi?id=35901

           Summary: two full hd displays (left and right) with nouveau
                    does not work any more
           Product: xorg
           Version: 7.4
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: grafgrimm77-Mmb7MZpHnFY@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


the "old" combination works fine:
  x11-drivers/xf86-video-nouveau-0.0.16_pre2010101
  x11-base/xorg-server-1.9.5
  x11-libs/libdrm-2.4.22
  media-libs/mesa-7.9

with the following settings:
Section "Screen"
    Identifier  "Screen-two"
    Device      "nouveau-two"
    Monitor     "DVI-D-1"
    Monitor     "VGA-1"
    DefaultDepth 24
    Subsection "Display"
        Depth 24
        Virtual 3840 1080
    EndSubsection
EndSection

and the following commands:
xrandr --output VGA-1 --mode 1920x1080
xrandr --output DVI-D-1 --mode 1920x1080
xrandr --output DVI-D-1 --primar
xrandr --output VGA-1 --left-of DVI-D-1


the new (perhaps not the newest) combination cause problems:
  x11-drivers/xf86-video-nouveau-0.0.16_pre20101130
  x11-base/xorg-server-1.9.5
  x11-base/xorg-drivers-1.9
  media-libs/mesa-7.10.1
  x11-libs/libdrm-2.4.23

I figured out that using both displays one above the other works:
  xrandr --output DVI-D-1 --below VGA-1. 
  the final resolution is: 1920 * 2160
  The only problem is a completly wrong auto-dpi-setting. 

But my favorite layout (booth displays beside each other does not work):
  xrandr --output DVI-D-1 --right-of VGA-1
  here the final resolution is: 3840 * 1080
"does not work" means: i see a mouse courser which a can move around booth
displays, but the picture has errors (vertical stripes) and the desktop is not
usable at all (no text, no icons). I used kde4 and xfce4 for testing. 

When I use 1280*1024 on the left screen, "xrandr --output DVI-D-1 --below
VGA-1." works fine. so the final resolution is 3200 * 1080

So why 3840 * 1080 is too much? The maximum should be 4096 * 4096 as 
  xrandr --query
tells me: 

Screen 0: minimum 320 x 200, current 3840 x 1080, maximum 4096 x 4096
VGA-1 connected 1920x1080+0+0 (normal left inverted right x axis y axis) 477mm
x 268mm
   1920x1080      60.0*+
DVI-D-1 connected 1920x1080+1920+0 (normal left inverted right x axis y axis)
531mm x 299mm
   1920x1080      60.0*+
This output was made with the old working combination.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
