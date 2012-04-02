From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23023] no backlight support  in /sys or /proc ;
 xbacklight not working
Date: Mon, 02 Apr 2012 20:50:57 +0000
Message-ID: <bug-23023-8800-7qIvNdzX4G@http.bugs.freedesktop.org/>
References: <bug-23023-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23023-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=23023

--- Comment #4 from Alex Mayorga Adame <alex_mayorga-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> 2012-04-02 13:50:57 PDT ---
Ended up here looking for a solution to "Fn+F5 and Fn+F6 don't modify
brightness on Sony VAIO VPCCW (GT 230M)"[1]

Posting the card details below in case they're useful to anyone.

[1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/551668

alex-mayorga@VPCCW1FFXL:~$ lspci | grep VGA
01:00.0 VGA compatible controller: NVIDIA Corporation GT216 [GeForce GT 230M]
(rev a2)
alex-mayorga@VPCCW1FFXL:~$ xrandr
Screen 0: minimum 320 x 200, current 1366 x 768, maximum 8192 x 8192
LVDS-1 connected 1366x768+0+0 (normal left inverted right x axis y axis) 309mm
x 174mm
   1366x768       59.9*+
   1024x768       59.9  
   800x600        59.9  
   640x480        59.4  
   720x400        59.6  
   640x400        60.0  
   640x350        59.8  
VGA-1 disconnected (normal left inverted right x axis y axis)
HDMI-1 disconnected (normal left inverted right x axis y axis)
alex-mayorga@VPCCW1FFXL:~$ apt-cache policy xserver-xorg-video-nouveau
xserver-xorg-video-nouveau:
  Installed: 1:0.0.16+git20111201+b5534a1-1build2
  Candidate: 1:0.0.16+git20111201+b5534a1-1build2
  Version table:
 *** 1:0.0.16+git20111201+b5534a1-1build2 0
        500 http://archive.ubuntu.com/ubuntu/ precise/main amd64 Packages
        100 /var/lib/dpkg/status
alex-mayorga@VPCCW1FFXL:~$ uname -a
Linux VPCCW1FFXL 3.2.0-21-generic #34-Ubuntu SMP Fri Mar 30 04:25:35 UTC 2012
x86_64 x86_64 x86_64 GNU/Linux

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
