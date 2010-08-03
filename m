From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29386] New: 2D performance drops drastically when
 enabling a 2nd monitor
Date: Tue,  3 Aug 2010 10:37:00 -0700 (PDT)
Message-ID: <bug-29386-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29386

           Summary: 2D performance drops drastically when enabling a 2nd
                    monitor
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: malsaqer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=37547)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=37547)
Xorg.0.log

I have two 1280x1024 identical monitor and nv18 MX 440 older nvidia card. The
card has one VGA-1 and one DVI-I outputs. The operating system is Fedora 13 and
xorg-x11-server-Xorg-1.8.2-2.fc13.i686
xorg-x11-drv-nouveau-0.0.16-7.20100423git13c1043.fc13.i686
___________________________
$ lspci -vnn | grep nVidia
VGA compatible controller [0300]: nVidia Corporation NV18 [GeForce4 MX 440 AGP
8x] [10de:0181] (rev a2) (prog-if 00 [VGA controller])
___________________________
$ xrandr -q
Screen 0: minimum 320 x 200, current 1280 x 1024, maximum 4096 x 4096
VGA-1 connected (normal left inverted right x axis y axis)
   1280x1024      60.0 +   75.0  
   1280x960       60.0  
   1152x864       75.0  
   1024x768       85.0     75.1     70.1     60.0  
   832x624        74.6  
   800x600        85.1     72.2     75.0     60.3     56.2  
   640x480        85.0     72.8     75.0     66.7     60.0  
   720x400        70.1  
DVI-I-1 connected 1280x1024+0+0 (normal left inverted right x axis y axis)
376mm x 301mm
   1280x1024      60.0*+   75.0  
   1280x960       60.0  
   1152x864       75.0  
   1024x768       85.0     75.1     70.1     60.0  
   832x624        74.6  
   800x600        85.1     72.2     75.0     60.3     56.2  
   640x480        85.0     72.8     75.0     66.7     60.0  
   720x400        70.1  
TV-1 disconnected (normal left inverted right x axis y axis)
_____________________________________________________________

If I enable the VGA-1 at auto resolution, the 2D performance drops so bad that
when I raise a window, I see it gets painted on the screen for a couple of
seconds. browser scrolling is so slow and all gui apps as well. Desktop effects
are disabled.
The commands I use are:
____________________________________________________
$ xrandr --screen 0 --output VGA-1 --auto
$ xrandr --screen 0 --output VGA-1 --left-of DVI-I-1
____________________________________________________

Direct rendering is enabled according to glxinfo
_______________________________________________
$ glxinfo | grep -i render
direct rendering: Yes
OpenGL renderer string: Mesa DRI nv18 20091015
_______________________________________________

If I clone the monitors, however, performance is not dropped. I also tried
lowering the resolutions of the monitors until performance did not drop when I
reached the 1024x768 resolution for each screen.

So it is probably the buffer size needed to accommodate the two outputs in one
big screen of size.

I know this is an older card, but I also know it can handle two screens because
I have used it with FC12 and under with nVidia drivers with no performance
problems.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
