From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94826] New: Cannot set external display as primary
 in optimus mode
Date: Tue, 05 Apr 2016 08:51:25 +0000
Message-ID: <bug-94826-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1668849478=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1668849478==
Content-Type: multipart/alternative; boundary="14598462850.2E39f5eFd.12679";
 charset="UTF-8"


--14598462850.2E39f5eFd.12679
Date: Tue, 5 Apr 2016 08:51:25 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94826

            Bug ID: 94826
           Summary: Cannot set external display as primary in optimus mode
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: pkolaczk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

I have a Dell M4600 laptop with an external display attached to display port.
DP is wired to nvidia chip in this laptop.

With optimus disabled in bios setup, both displays work fine using Nvidia chip
and the external screen can be marked as primary and behaves as primary.
Unfortunately in this mode, 2D performance is quite bad, to the point it is
hardly usable. I guess this is due to power management problems that I know are
being worked on, but please confirm yo know about it and I don't need to file a
separate bug for this.

After enabling optimus in bios, both displays work fine using Intel chip, the
DP connection is detected properly and nvidia chip powers up to enable DP. 2D
performance is smooth and usable. However, setting the external display as
primary is not possible with xrandr:

Screen 0: minimum 8 x 8, current 4480 x 1600, maximum 32767 x 32767
LVDS1 connected primary 1920x1080+0+365 (normal left inverted right x axis y
axis) 344mm x 194mm
   1920x1080      59.9*+   59.9     39.9
   1680x1050      60.0     59.9
   1600x1024      60.2 
   1400x1050      60.0
   1600x900       60.0
   1280x1024      60.0
   1440x900       59.9  
   1280x960       60.0
   1368x768       60.0
   1360x768       59.8     60.0
   1152x864       60.0
   1280x720       60.0
   1024x768       60.0
   1024x576       60.0
   960x540        60.0
   800x600        60.3     56.2
   864x486        60.0
   640x480        59.9
   720x405        60.0
   640x360        60.0
VGA1 disconnected (normal left inverted right x axis y axis)
VIRTUAL1 disconnected (normal left inverted right x axis y axis)
DP-1-1 connected 2560x1600+1920+0 641mm x 401mm
   2560x1600      60.0*+
   1920x1440      60.0
   1920x1200      59.9
   1920x1080      60.0     50.0     59.9     24.0     24.0
   1920x1080i     60.1     50.0     60.0
   1600x1200      60.0
   1280x1024      75.0     60.0
   1280x800       59.8
   1152x864       75.0
   1280x720       60.0     50.0     59.9
   1024x768       75.1     60.0
   800x600        75.0     60.3
   720x576        50.0
   720x576i       50.1  
   720x480        60.0     59.9
   720x480i       60.1     60.1
   640x480        75.0     60.0     59.9
   720x400        70.1
DP-1-2 disconnected
DP-1-3 disconnected
  1280x1024 (0x52)  108.0MHz
        h: width  1280 start 1328 end 1440 total 1688 skew    0 clock   64.0KHz
        v: height 1024 start 1025 end 1028 total 1066           clock   60.0Hz
  1024x768 (0x59)   65.0MHz
        h: width  1024 start 1048 end 1184 total 1344 skew    0 clock   48.4KHz
        v: height  768 start  771 end  777 total  806           clock   60.0Hz
  800x600 (0x5b)   40.0MHz
        h: width   800 start  840 end  968 total 1056 skew    0 clock   37.9KHz
        v: height  600 start  601 end  605 total  628           clock   60.3Hz
  640x480 (0x64)   25.2MHz
        h: width   640 start  656 end  752 total  800 skew    0 clock   31.5KHz
        v: height  480 start  490 end  492 total  525           clock   59.9Hz

pkolaczk@m4600 ~ $ xrandr --output LVDS1 --noprimary
pkolaczk@m4600 ~ $ xrandr --verbose --output DP-1-1 --primary
crtc 3:    2560x1600   60.0 +1920+0 "DP-1-1"
X Error of failed request:  BadMatch (invalid parameter attributes)
  Major opcode of failed request:  140 (RANDR)
  Minor opcode of failed request:  30 (RRSetOutputPrimary)
  Serial number of failed request:  45
  Current serial number in output stream:  47

Xorg.log.0 entries added during the last xrandr command:
[  2392.882] (II) NOUVEAU(G0): EDID vendor "DEL", prod id 16485
[  2392.883] (II) NOUVEAU(G0): Using hsync ranges from config file
[  2392.883] (II) NOUVEAU(G0): Using vrefresh ranges from config file
[  2392.883] (II) NOUVEAU(G0): Printing DDC gathered Modelines:
[  2392.883] (II) NOUVEAU(G0): Modeline "2560x1600"x0.0  268.50  2560 2608 2640
2720  1600 1603 1609 1646 +hsync -vsync (98.7 kHz eP)
[  2392.883] (II) NOUVEAU(G0): Modeline "1920x1080"x0.0  148.50  1920 2008 2052
2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "1920x1080i"x0.0   74.25  1920 2008
2052 2200  1080 1084 1094 1125 interlace +hsync +vsync (33.8 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "1280x720"x0.0   74.25  1280 1390 1430
1650  720 725 730 750 +hsync +vsync (45.0 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "720x480"x0.0   27.00  720 736 798 858 
480 489 495 525 -hsync -vsync (31.5 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "800x600"x0.0   40.00  800 840 968 1056
 600 601 605 628 +hsync +vsync (37.9 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "640x480"x0.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "640x480"x0.0   25.18  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "720x400"x0.0   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "1024x768"x0.0   78.75  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "1024x768"x0.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "800x600"x0.0   49.50  800 816 896 1056
 600 601 604 625 +hsync +vsync (46.9 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "1152x864"x0.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "1280x800"x0.0   83.50  1280 1352 1480
1680  800 803 809 831 -hsync +vsync (49.7 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "1600x1200"x0.0  162.00  1600 1664 1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "1920x1200"x0.0  193.25  1920 2056 2256
2592  1200 1203 1209 1245 -hsync +vsync (74.6 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "1920x1440"x0.0  234.00  1920 2048 2256
2600  1440 1441 1444 1500 -hsync +vsync (90.0 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "720x576"x0.0   27.00  720 732 796 864 
576 581 586 625 -hsync -vsync (31.2 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "1440x480i"x0.0   27.00  1440 1478 1602
1716  480 488 494 525 interlace -hsync -vsync (15.7 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "1440x240"x0.0   27.00  1440 1478 1602
1716  240 244 247 262 -hsync -vsync (15.7 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "1440x288"x0.0   27.00  1440 1464 1590
1728  288 290 293 312 -hsync -vsync (15.6 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "1280x720"x0.0   74.25  1280 1720 1760
1980  720 725 730 750 +hsync +vsync (37.5 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "1440x576i"x0.0   27.00  1440 1464 1590
1728  576 580 586 625 interlace -hsync -vsync (15.6 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "1920x1080i"x0.0   74.25  1920 2448
2492 2640  1080 1084 1094 1125 interlace +hsync +vsync (28.1 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "1920x1080"x0.0   74.25  1920 2558 2602
2750  1080 1084 1089 1125 +hsync +vsync (27.0 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline "1920x1080"x0.0   74.25  1920 2448 2492
2640  1080 1084 1089 1125 +hsync +vsync (28.1 kHz e)
[  2393.008] reporting 5 6 58 473


Hardware:
pkolaczk@m4600 ~ $ lspci | grep VGA
00:02.0 VGA compatible controller: Intel Corporation 2nd Generation Core
Processor Family Integrated Graphics Controller (rev 09)
01:00.0 VGA compatible controller: NVIDIA Corporation GF108GLM [Quadro 1000M]
(rev a1)

Software:
Kernel:
Linux m4600 4.5.0-040500-generic #201603140130 SMP Mon Mar 14 05:32:22 UTC 2016
x86_64 x86_64 x86_64 GNU/Linux
Also tried 4.6.0-rc2 generic from kernel-ppa/mainline, same results.

xserver-xorg-video-nouveau: 1:1.0.12+git1603170734.b824d3~gd~t
Also tried an older version 1:1.0.11 and the problem was present.

intel i915 driver:
[     6.831] (II) intel(0): Using Kernel Mode Setting driver: i915, version
1.6.0 20151218
[     6.831] (II) intel(0): SNA compiled: xserver-xorg-video-intel
2:2.99.917+git1604040733.90792c~gd~t (Oibaf <fmrummey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>)


X.Org X Server 1.15.1
Release Date: 2014-04-13

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14598462850.2E39f5eFd.12679
Date: Tue, 5 Apr 2016 08:51:25 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Cannot set external display as primary in optimus mode"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94826">94826</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Cannot set external display as primary in optimus mode
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>pkolaczk&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I have a Dell M4600 laptop with an external display attached to display port.
DP is wired to nvidia chip in this laptop.

With optimus disabled in bios setup, both displays work fine using Nvidia chip
and the external screen can be marked as primary and behaves as primary.
Unfortunately in this mode, 2D performance is quite bad, to the point it is
hardly usable. I guess this is due to power management problems that I know are
being worked on, but please confirm yo know about it and I don't need to file a
separate bug for this.

After enabling optimus in bios, both displays work fine using Intel chip, the
DP connection is detected properly and nvidia chip powers up to enable DP. 2D
performance is smooth and usable. However, setting the external display as
primary is not possible with xrandr:

Screen 0: minimum 8 x 8, current 4480 x 1600, maximum 32767 x 32767
LVDS1 connected primary 1920x1080+0+365 (normal left inverted right x axis y
axis) 344mm x 194mm
   1920x1080      59.9*+   59.9     39.9
   1680x1050      60.0     59.9
   1600x1024      60.2 
   1400x1050      60.0
   1600x900       60.0
   1280x1024      60.0
   1440x900       59.9  
   1280x960       60.0
   1368x768       60.0
   1360x768       59.8     60.0
   1152x864       60.0
   1280x720       60.0
   1024x768       60.0
   1024x576       60.0
   960x540        60.0
   800x600        60.3     56.2
   864x486        60.0
   640x480        59.9
   720x405        60.0
   640x360        60.0
VGA1 disconnected (normal left inverted right x axis y axis)
VIRTUAL1 disconnected (normal left inverted right x axis y axis)
DP-1-1 connected 2560x1600+1920+0 641mm x 401mm
   2560x1600      60.0*+
   1920x1440      60.0
   1920x1200      59.9
   1920x1080      60.0     50.0     59.9     24.0     24.0
   1920x1080i     60.1     50.0     60.0
   1600x1200      60.0
   1280x1024      75.0     60.0
   1280x800       59.8
   1152x864       75.0
   1280x720       60.0     50.0     59.9
   1024x768       75.1     60.0
   800x600        75.0     60.3
   720x576        50.0
   720x576i       50.1  
   720x480        60.0     59.9
   720x480i       60.1     60.1
   640x480        75.0     60.0     59.9
   720x400        70.1
DP-1-2 disconnected
DP-1-3 disconnected
  1280x1024 (0x52)  108.0MHz
        h: width  1280 start 1328 end 1440 total 1688 skew    0 clock   64.0KHz
        v: height 1024 start 1025 end 1028 total 1066           clock   60.0Hz
  1024x768 (0x59)   65.0MHz
        h: width  1024 start 1048 end 1184 total 1344 skew    0 clock   48.4KHz
        v: height  768 start  771 end  777 total  806           clock   60.0Hz
  800x600 (0x5b)   40.0MHz
        h: width   800 start  840 end  968 total 1056 skew    0 clock   37.9KHz
        v: height  600 start  601 end  605 total  628           clock   60.3Hz
  640x480 (0x64)   25.2MHz
        h: width   640 start  656 end  752 total  800 skew    0 clock   31.5KHz
        v: height  480 start  490 end  492 total  525           clock   59.9Hz

pkolaczk&#64;m4600 ~ $ xrandr --output LVDS1 --noprimary
pkolaczk&#64;m4600 ~ $ xrandr --verbose --output DP-1-1 --primary
crtc 3:    2560x1600   60.0 +1920+0 &quot;DP-1-1&quot;
X Error of failed request:  BadMatch (invalid parameter attributes)
  Major opcode of failed request:  140 (RANDR)
  Minor opcode of failed request:  30 (RRSetOutputPrimary)
  Serial number of failed request:  45
  Current serial number in output stream:  47

Xorg.log.0 entries added during the last xrandr command:
[  2392.882] (II) NOUVEAU(G0): EDID vendor &quot;DEL&quot;, prod id 16485
[  2392.883] (II) NOUVEAU(G0): Using hsync ranges from config file
[  2392.883] (II) NOUVEAU(G0): Using vrefresh ranges from config file
[  2392.883] (II) NOUVEAU(G0): Printing DDC gathered Modelines:
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;2560x1600&quot;x0.0  268.50  2560 2608 2640
2720  1600 1603 1609 1646 +hsync -vsync (98.7 kHz eP)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;1920x1080&quot;x0.0  148.50  1920 2008 2052
2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;1920x1080i&quot;x0.0   74.25  1920 2008
2052 2200  1080 1084 1094 1125 interlace +hsync +vsync (33.8 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;1280x720&quot;x0.0   74.25  1280 1390 1430
1650  720 725 730 750 +hsync +vsync (45.0 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;720x480&quot;x0.0   27.00  720 736 798 858 
480 489 495 525 -hsync -vsync (31.5 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;800x600&quot;x0.0   40.00  800 840 968 1056
 600 601 605 628 +hsync +vsync (37.9 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;640x480&quot;x0.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;640x480&quot;x0.0   25.18  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;720x400&quot;x0.0   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;1280x1024&quot;x0.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;1024x768&quot;x0.0   78.75  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;1024x768&quot;x0.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;800x600&quot;x0.0   49.50  800 816 896 1056
 600 601 604 625 +hsync +vsync (46.9 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;1152x864&quot;x0.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;1280x800&quot;x0.0   83.50  1280 1352 1480
1680  800 803 809 831 -hsync +vsync (49.7 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;1280x1024&quot;x0.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;1600x1200&quot;x0.0  162.00  1600 1664 1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;1920x1200&quot;x0.0  193.25  1920 2056 2256
2592  1200 1203 1209 1245 -hsync +vsync (74.6 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;1920x1440&quot;x0.0  234.00  1920 2048 2256
2600  1440 1441 1444 1500 -hsync +vsync (90.0 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;720x576&quot;x0.0   27.00  720 732 796 864 
576 581 586 625 -hsync -vsync (31.2 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;1440x480i&quot;x0.0   27.00  1440 1478 1602
1716  480 488 494 525 interlace -hsync -vsync (15.7 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;1440x240&quot;x0.0   27.00  1440 1478 1602
1716  240 244 247 262 -hsync -vsync (15.7 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;1440x288&quot;x0.0   27.00  1440 1464 1590
1728  288 290 293 312 -hsync -vsync (15.6 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;1280x720&quot;x0.0   74.25  1280 1720 1760
1980  720 725 730 750 +hsync +vsync (37.5 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;1440x576i&quot;x0.0   27.00  1440 1464 1590
1728  576 580 586 625 interlace -hsync -vsync (15.6 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;1920x1080i&quot;x0.0   74.25  1920 2448
2492 2640  1080 1084 1094 1125 interlace +hsync +vsync (28.1 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;1920x1080&quot;x0.0   74.25  1920 2558 2602
2750  1080 1084 1089 1125 +hsync +vsync (27.0 kHz e)
[  2392.883] (II) NOUVEAU(G0): Modeline &quot;1920x1080&quot;x0.0   74.25  1920 2448 2492
2640  1080 1084 1089 1125 +hsync +vsync (28.1 kHz e)
[  2393.008] reporting 5 6 58 473


Hardware:
pkolaczk&#64;m4600 ~ $ lspci | grep VGA
00:02.0 VGA compatible controller: Intel Corporation 2nd Generation Core
Processor Family Integrated Graphics Controller (rev 09)
01:00.0 VGA compatible controller: NVIDIA Corporation GF108GLM [Quadro 1000M]
(rev a1)

Software:
Kernel:
Linux m4600 4.5.0-040500-generic #201603140130 SMP Mon Mar 14 05:32:22 UTC 2016
x86_64 x86_64 x86_64 GNU/Linux
Also tried 4.6.0-rc2 generic from kernel-ppa/mainline, same results.

xserver-xorg-video-nouveau: 1:1.0.12+git1603170734.b824d3~gd~t
Also tried an older version 1:1.0.11 and the problem was present.

intel i915 driver:
[     6.831] (II) intel(0): Using Kernel Mode Setting driver: i915, version
1.6.0 20151218
[     6.831] (II) intel(0): SNA compiled: xserver-xorg-video-intel
2:2.99.917+git1604040733.90792c~gd~t (Oibaf &lt;<a href="mailto:fmrummey&#64;gmail.com">fmrummey&#64;gmail.com</a>&gt;)


X.Org X Server 1.15.1
Release Date: 2014-04-13</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14598462850.2E39f5eFd.12679--

--===============1668849478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1668849478==--
