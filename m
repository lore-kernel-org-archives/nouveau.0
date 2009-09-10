From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23832] New: extended display not working
Date: Thu, 10 Sep 2009 01:04:19 -0700 (PDT)
Message-ID: <bug-23832-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23832

           Summary: extended display not working
           Product: xorg
           Version: 7.4
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: rrs-7WuBAv+fczCJ8c2fQYRYNw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I'm trying to use the nouveau driver (without 3D). I'm mainly looking for is,
RandR support.

Here are my results:

rrs@learner:~$ xrandr
Screen 0: minimum 320 x 200, current 1280 x 800, maximum 1280 x 1280
LVDS-0 connected 1280x800+0+0 261mm x 163mm
   1280x800       60.0*+
   1024x768       60.0
   800x600        60.3
   640x480        59.9
VGA-0 connected 1024x768+0+0 338mm x 270mm
   1280x1024      60.0 +   75.0
   1024x768       75.0*    70.1     60.0
   832x624        74.6
   800x600        72.2     75.0     60.3     56.2
   640x480        75.0     72.8     66.7     59.9
   720x400        70.1


The report says that my VGA is connected. But the external monitor remains in
(kind of) stand-by mode. It is blank. As reported by xrandr, my external
monitor support 1280x1024 resolution. I've tried other resolutions also. But
none have worked.

The same monitor works with another laptop running an ATI card with the radeon
driver.


This laptop used to work TwinView in the beginning (with binary-only driver).
Probably 3 years ago. Then sometime in between nvidia driver updates screwed
it. For around 2 years, TwinView has never worked again.
Today, when I used nvidia-settings to configure TwinView, it should the desktop
on the external monitor for around 5 seconds and then went blank.
As per nvidia-settings, the desktop is extended, but the external desktop
screen remains blank (stand-by).

Since nouveau now support RandR, I think it is better to spend my time helping
here. Please let me know if you need additional information.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
