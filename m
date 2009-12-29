From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25823] New: Not possible to create second X session
Date: Tue, 29 Dec 2009 14:28:56 -0800 (PST)
Message-ID: <bug-25823-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25823

           Summary: Not possible to create second X session
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: achim_schaefer-Mmb7MZpHnFY@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=32365)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=32365)
Successfull start of vt 7

I'm using kernel 2.6.33-rc2 and compiled the drm and Xdriver myself from the
latest git repos. I have a 5200 with two monitors attached one 1280X1024 the
other 1024x768)
Now starting the Xserver and using it works fine. (much better than the version
which is currently in debian experimental).

But as soon as I start create another Xsession (on vt 8) via kde(4.3.4) change
user I only get black screens.

it is quite hard to get back to a working console, I don't know how I got it,
but I got one back.
With dmesg I see this:
[  228.513498] [drm] nouveau 0000:01:00.0: Allocating FIFO number 1             
[  228.514510] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised
FIFO 1                                                                          
[  228.587351] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder
(output 0)                                                                      
[  228.597304] [drm] DAC-7: set mode 1280x1024_75.00 3e                         
[  228.607513] [drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder
(output 0)                                                                      
[  228.607519] [drm] nouveau 0000:01:00.0: Output VGA-1 is running on CRTC 0
using output A                                                                  
[  228.607847] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder
(output 1)                                                                      
[  228.617793] [drm] DAC-8: set mode 1024x768_60.00 41                          
[  228.628011] [drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder
(output 1)                                                                      
[  228.628016] [drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1
using output B                                                                  
[  321.832750] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder
(output 0)                                                                      
[  321.842694] [drm] DAC-7: set mode 1280x1024 3f                               
[  321.852911] [drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder
(output 0)                                                                      
[  321.852916] [drm] nouveau 0000:01:00.0: Output VGA-1 is running on CRTC 0
using output A                                                                  
[  321.876044] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder
(output 1)
[  321.885990] [drm] DAC-8: set mode 1024x768 40
[  321.896203] [drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder
(output 1)
[  321.896208] [drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1
using output B
[  357.277251] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder
(output 0)
[  357.287199] [drm] DAC-7: set mode   42
[  357.297411] [drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder
(output 0)
[  357.297417] [drm] nouveau 0000:01:00.0: Output VGA-1 is running on CRTC 0
using output A
[  357.332261] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder
(output 1)
[  357.342208] [drm] DAC-8: set mode 07[         43
[  357.352423] [drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder
(output 1)
[  357.352429] [drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1
using output B
[  368.376179] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder
(output 0)
[  368.386123] [drm] DAC-7: set mode 1280x1024 3f
[  368.396336] [drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder
(output 0)
[  368.396341] [drm] nouveau 0000:01:00.0: Output VGA-1 is running on CRTC 0
using output A
[  368.396353] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder
(output 1)
[  368.406290] [drm] DAC-8: set mode 1024x768 40
[  368.416502] [drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder
(output 1)
[  368.416506] [drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1
using output B
[  369.402816] [drm] nouveau 0000:01:00.0: Allocating FIFO number 2
[  369.403829] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised
FIFO 2
[  382.999385] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder
(output 0)
[  383.009337] [drm] DAC-7: set mode 1280x1024_75.00 45
[  383.019546] [drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder
(output 0)
[  383.019551] [drm] nouveau 0000:01:00.0: Output VGA-1 is running on CRTC 0
using output A
[  383.020275] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder
(output 1)
[  383.030221] [drm] DAC-8: set mode 1024x768_60.00 46
[  383.040433] [drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder
(output 1)
[  383.040438] [drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1
using output B
[  383.202592] [drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 2
[  383.206524] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder
(output 0)
[  383.216475] [drm] DAC-7: set mode 1280x1024 3f
[  383.226683] [drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder
(output 0)
[  383.226688] [drm] nouveau 0000:01:00.0: Output VGA-1 is running on CRTC 0
using output A
[  383.229987] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder
(output 1)
[  383.239933] [drm] DAC-8: set mode 1024x768 40
[  383.250149] [drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder
(output 1)
[  383.250154] [drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1
using output B
[  383.252283] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder
(output 0)
[  383.262229] [drm] DAC-7: set mode   47
[  383.272442] [drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder
(output 0)
[  383.272448] [drm] nouveau 0000:01:00.0: Output VGA-1 is running on CRTC 0
using output A
[  383.304902] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder
(output 1)
[  383.314849] [drm] DAC-8: set mode 07[         44
[  383.325065] [drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder
(output 1)
[  383.325070] [drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1
using output B

I think at 228 I started the first X session and at 321 I switched back to the
console (VT1). 
This would mean at 357 I started the second X Session.

I'll attach both Xorg.*.log files (0 for the first X session, 1 for teh other)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
