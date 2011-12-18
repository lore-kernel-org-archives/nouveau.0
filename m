From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 43939] New: DVI monitor connected via HDMI is blank
 / standby (NV96 / 9500GS)
Date: Sun, 18 Dec 2011 22:05:05 +0000
Message-ID: <bug-43939-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=43939

             Bug #: 43939
           Summary: DVI monitor connected via HDMI is blank / standby
                    (NV96 / 9500GS)
    Classification: Unclassified
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: anthony.foiani+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I recently upgraded my main workstation to Fedora 16 (x86-64).  I have two Dell
2001FP monitors, one connected via DVI-D and one via an HDMI-to-DVI cable.

My previous setup was using Fedora 14 with the proprietary nVidia drivers, and
that drove both monitors correctly.  I also occasionally dual-boot into Windows
7, and both monitors work correctly there as well.

With Fedora 16 and the nouveau drivers, the second monitor (on HDMI) seems to
be recognized but it never "wakes up".

If I disconnect the first monitor, so that the HDMI-driven monitor is the only
one on the system, it successfully shows the motherboard boot-time splash
graphic, the BIOS POST, and GRUB menu; as soon as the linux boot gets past
"initializing ramdisk" (or something like that), the monitor goes to sleep.

From these experiments and some hints on the #nouveau channel, it would appear
that the kernel nouveau bits are somehow not activating the HDMI output
correctly.

I did try the 3.2-rc6 kernel from Fedora Rawhide / Koji, and it didn't help
this issue.

Any other hints would be welcome, and I'm also happy to try to collect more
data.  I'll be attaching some log files in a moment.

Here is the xrandr output:

$ DISPLAY=:0.0 xrandr --props
Screen 0: minimum 320 x 200, current 3200 x 1200, maximum 8192 x 8192
DVI-I-1 connected 1600x1200+0+0 (normal left inverted right x axis y axis)
367mm x 275mm
    EDID:
        00ffffffffffff0010ac08a04c305231
        310e010380291f78ee6390a3574b9b25
        115054a54b008180a940714f01010101
        010101010101483f403062b0324040c0
        13006f131100001e000000ff00433036
        34363443313152304c20000000fc0044
        454c4c203230303146500a20000000fd
        00384c1f5010000a202020202020003f
    dithering:    Off
        supported: Off          On           Automatic   
    scaling mode:    Full
        supported: None         Full         Center       Full aspect 
    select subconnector:    Automatic
        supported: Automatic    DVI-D        DVI-A       
    subconnector:    DVI-D
        supported: Unknown      DVI-D        DVI-A       
   1600x1200      60.0*+
   1280x1024      75.0     60.0  
   1152x864       75.0  
   1024x768       75.1     60.0  
   800x600        75.0     60.3  
   640x480        75.0     60.0  
   720x400        70.1  
VGA-1 disconnected (normal left inverted right x axis y axis)
    scaling mode:    None
        supported: None         Full         Center       Full aspect 
HDMI-1 connected 1600x1200+1600+0 (normal left inverted right x axis y axis)
367mm x 275mm
    EDID:
        00ffffffffffff0010ac08a04c415434
        230f010380291f78ee6390a3574b9b25
        115054a54b008180a940714f01010101
        010101010101483f403062b0324040c0
        13006f131100001e000000ff00433036
        343635384f3454414c20000000fc0044
        454c4c203230303146500a20000000fd
        00384c1f5010000a202020202020000c
    dithering:    Off
        supported: Off          On           Automatic   
    scaling mode:    Full
        supported: None         Full         Center       Full aspect 
   1600x1200      60.0*+
   1280x1024      75.0     60.0  
   1152x864       75.0  
   1024x768       75.1     60.0  
   800x600        75.0     60.3  
   640x480        75.0     60.0  
   720x400        70.1

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
