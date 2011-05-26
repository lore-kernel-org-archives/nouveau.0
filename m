From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37643] New: Regression in 2.6.39 : ICC profile
 loading does not have any effect anymore
Date: Thu, 26 May 2011 13:02:38 -0700 (PDT)
Message-ID: <bug-37643-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=37643

           Summary: Regression in 2.6.39 : ICC profile loading does not
                    have any effect anymore
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: casta+freedesktop-3SpzfrOsP4yh6J55Ss3d3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


When I load my ICC profile, there is no error. moreover, when reading the LUT,
the ICC profile is in memory from informations I get from argyllcms tool.
BUT : there is no visual change : the ICC profile has no more effect. Visually,
it's a no-op operation with 2.6.39.
Downgrading to 2.6.38.7 fixes the issue.


Configuration :
- xorg 1.10.1.902
- x11-drivers/xf86-video-nouveau GIT from 20110323 (last git change)
- kernel 2.6.39 (nouveau DRM, KMS enabled)
- nvidia quadro NVS 290 (NV86)


- Loading the ICC profile inside the LUT :
$ argyll-dispwin -v -I /usr/share/color/icc/SyncMaster214T.icc
About to open dispwin object on the display
About to install '/usr/share/color/icc/SyncMaster214T.icc' as display's default
profile
Installed '/usr/share/color/icc/SyncMaster214T.icc' and made it the default
About to destroy dispwin object

- Then checking the LUT state :
$ argyll-dispwin -v -V /usr/share/color/icc/SyncMaster214T.icc
About to open dispwin object on the display
Verify: '/usr/share/color/icc/SyncMaster214T.icc' IS loaded (discrepancy 0.0%)
About to destroy dispwin object


When I load the profile, Xorg.0.log output this logs lines :
[385923.064] (II) NOUVEAU(0): EDID vendor "SAM", prod id 464
[385923.064] (II) NOUVEAU(0): Using hsync ranges from config file
[385923.064] (II) NOUVEAU(0): Using vrefresh ranges from config file
[385923.064] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[385923.064] (II) NOUVEAU(0): Modeline "1600x1200"x0.0  162.00  1600 1664 1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz)
[385923.064] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056 
600 601 605 628 +hsync +vsync (37.9 kHz)
[385923.064] (II) NOUVEAU(0): Modeline "800x600"x0.0   36.00  800 824 896 1024 
600 601 603 625 +hsync +vsync (35.2 kHz)
[385923.064] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz)
[385923.064] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 664 704 832 
480 489 492 520 -hsync -vsync (37.9 kHz)
[385923.064] (II) NOUVEAU(0): Modeline "640x480"x0.0   30.24  640 704 768 864 
480 483 486 525 -hsync -vsync (35.0 kHz)
[385923.064] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz)
[385923.064] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz)
[385923.064] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[385923.064] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.0 kHz)
[385923.064] (II) NOUVEAU(0): Modeline "1024x768"x0.0   75.00  1024 1048 1184
1328  768 771 777 806 -hsync -vsync (56.5 kHz)
[385923.064] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[385923.064] (II) NOUVEAU(0): Modeline "832x624"x0.0   57.28  832 864 928 1152 
624 625 628 667 -hsync -vsync (49.7 kHz)
[385923.064] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056 
600 601 604 625 +hsync +vsync (46.9 kHz)
[385923.064] (II) NOUVEAU(0): Modeline "800x600"x0.0   50.00  800 856 976 1040 
600 637 643 666 +hsync +vsync (48.1 kHz)
[385923.064] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[385923.064] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[385923.064] (II) NOUVEAU(0): Modeline "1280x960"x0.0  108.00  1280 1376 1488
1800  960 961 964 1000 +hsync +vsync (60.0 kHz)



If you need some more information, just ask !

Thanks.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
