From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 19342] New: PB 12" G4: Pointer to flat panel table
	invalid
Date: Tue, 30 Dec 2008 22:45:14 -0800 (PST)
Message-ID: <bug-19342-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=19342

           Summary: PB 12" G4: Pointer to flat panel table invalid
           Product: xorg
           Version: 7.3
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=21579)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=21579)
org.conf

I just installed Debian on my PowerBook G4 12", but my X server refuses to
start.  I've appended my Xorg.log and xorg.conf.

This is with a Debian testing system with the following (relevant) packages:

   # dpkg -l '*nouveau' 'drm*' 'xserver-xorg'
   Desired=Unknown/Install/Remove/Purge/Hold
   |
Status=Not/Inst/Cfg-files/Unpacked/Failed-cfg/Half-inst/trig-aWait/Trig-pend
   |/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err:
uppercase=bad)
   ||/ Name                          Version                               
Description
  
+++-===============================================================================================================================
   un  drm-modules                   <none>                                 (no
description available)
   ii  drm-modules-2.6.26-1-powerpc  2.4.1+git+20081116+930c0e7-1+2.6.26-12 DRM
rendering modules for Linux (kernel 2.6.26-1-powerpc).
   ii  drm-modules-source            2.4.1+git+20081116+930c0e7-1          
Source for the DRM kernel rendering modules
   ii  xserver-xorg                  1:7.3+18                               the
X.Org X server
   ii  xserver-xorg-video-nouveau    1:0.0.10~git+20081028+cea05e1-1       
X.Org X server -- Nouveau display driver (experimental)

Reading this list it appears that the `nouveau' driver should work on my
machine (tho I'm not quite sure yet whether I'll be able to use the
composite-video output to my TV set).  So I guess I'm doing something
stupid, but I can't seem to figure out what.  I tried with and without the
UseFBDev option, but it makes no difference.  Any idea what I might
be missing?


        Stefan


# cat /etc/X11/xorg.conf

Section "InputDevice"
        Identifier      "Generic Keyboard"
        Driver          "kbd"
        Option          "XkbRules"      "xorg"
        Option          "XkbModel"      "pc104"
        Option          "XkbLayout"     "us"
EndSection

Section "InputDevice"
        Identifier      "Configured Mouse"
        Driver          "mouse"
EndSection

Section "Device"
        Identifier      "Configured Video Device"
        BusID           "PCI:0:16:0"
        Driver          "nouveau"
        Option          "UseFBDev"              "true"
EndSection

Section "Monitor"
        Identifier      "Configured Monitor"
EndSection

Section "Screen"
        Identifier      "Default Screen"
        Monitor         "Configured Monitor"
EndSection


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
