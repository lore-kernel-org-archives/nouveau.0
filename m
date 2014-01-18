From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73770] New: nouveau doesn't setup 1920x1200 mode on
 HDMI properly
Date: Sat, 18 Jan 2014 19:05:23 +0000
Message-ID: <bug-73770-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1884155807=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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


--===============1884155807==
Content-Type: multipart/alternative; boundary="1390071924.C06721.14708"; charset="us-ascii"


--1390071924.C06721.14708
Date: Sat, 18 Jan 2014 19:05:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73770

          Priority: medium
            Bug ID: 73770
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: nouveau doesn't setup 1920x1200 mode on HDMI properly
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: All
          Reporter: martix.cz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 92350
  --> https://bugs.freedesktop.org/attachment.cgi?id=92350&action=edit
Xorg.0.log

I have 1920x1200 60 Hz monitor connected via DP-HDMI cable to Lenovo T520
laptop.

Actual results:
I have configured 1920x1200 resolution (see xrandr).
Monitor's menu shows 1920x1080 input resolution.
Screen covers 1920x1080 physical area on monitor.
Fonts are blurry, seems like virtual screen image 1920x1200 reduced to
1920x1080 (When I configure 1920x1080 mode, fonts are OK).

nVidia binary blob can set 1920x1200 resolution properly on same HW
configuration.

Informations from EDID are correct, see Xorg.0.log.

Expected results:
Physical screen resolution on monitor should be 1920x1200.

I think there is some hardcoded limitation in DRM or nouveau driver. Because
hardware is perfectly capable of running 1920x1200 via HDMI.

01:00.0 VGA compatible controller: NVIDIA Corporation GF119M [Quadro NVS 4200M]
(rev a1)

xrandr 
Screen 0: minimum 320 x 200, current 1920 x 1200, maximum 8192 x 8192
LVDS-1 connected (normal left inverted right x axis y axis)
   1600x900       60.0 +   50.0  
   1152x864       60.0  
   1024x768       59.9  
   800x600        59.9  
   640x480        59.4  
   720x400        59.6  
   640x400        60.0  
   640x350        59.8  
VGA-1 disconnected (normal left inverted right x axis y axis)
DP-1 connected 1920x1200+0+0 (normal left inverted right x axis y axis) 518mm x
291mm
   1920x1080      60.0 +   59.9  
   1920x1200      60.0* 
   1920x1080i     60.1     50.0     60.0  
   1600x1200      60.0  
   1680x1050      59.9  
   1280x1024      75.0     60.0  
   1440x900       59.9  
   1152x864       75.0  
   1280x720       60.0     50.0     59.9  
   1440x576i      50.1  
   1024x768       75.1     70.1     60.0  
   1440x480i      60.1     60.1  
   832x624        74.6  
   800x600        72.2     75.0     60.3  
   720x576        50.0  
   720x480        60.0     59.9  
   640x480        75.0     72.8     66.7     60.0     59.9  
   720x400        70.1  
DP-2 disconnected (normal left inverted right x axis y axis)
DP-3 disconnected (normal left inverted right x axis y axis)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390071924.C06721.14708
Date: Sat, 18 Jan 2014 19:05:24 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau doesn't setup 1920x1200 mode on HDMI properly"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73770">73770</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau doesn't setup 1920x1200 mode on HDMI properly
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>martix.cz&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=92350" name="attach_92350" title="Xorg.0.log">attachment 92350</a> <a href="attachment.cgi?id=92350&amp;action=edit" title="Xorg.0.log">[details]</a></span>
Xorg.0.log

I have 1920x1200 60 Hz monitor connected via DP-HDMI cable to Lenovo T520
laptop.

Actual results:
I have configured 1920x1200 resolution (see xrandr).
Monitor's menu shows 1920x1080 input resolution.
Screen covers 1920x1080 physical area on monitor.
Fonts are blurry, seems like virtual screen image 1920x1200 reduced to
1920x1080 (When I configure 1920x1080 mode, fonts are OK).

nVidia binary blob can set 1920x1200 resolution properly on same HW
configuration.

Informations from EDID are correct, see Xorg.0.log.

Expected results:
Physical screen resolution on monitor should be 1920x1200.

I think there is some hardcoded limitation in DRM or nouveau driver. Because
hardware is perfectly capable of running 1920x1200 via HDMI.

01:00.0 VGA compatible controller: NVIDIA Corporation GF119M [Quadro NVS 4200M]
(rev a1)

xrandr 
Screen 0: minimum 320 x 200, current 1920 x 1200, maximum 8192 x 8192
LVDS-1 connected (normal left inverted right x axis y axis)
   1600x900       60.0 +   50.0  
   1152x864       60.0  
   1024x768       59.9  
   800x600        59.9  
   640x480        59.4  
   720x400        59.6  
   640x400        60.0  
   640x350        59.8  
VGA-1 disconnected (normal left inverted right x axis y axis)
DP-1 connected 1920x1200+0+0 (normal left inverted right x axis y axis) 518mm x
291mm
   1920x1080      60.0 +   59.9  
   1920x1200      60.0* 
   1920x1080i     60.1     50.0     60.0  
   1600x1200      60.0  
   1680x1050      59.9  
   1280x1024      75.0     60.0  
   1440x900       59.9  
   1152x864       75.0  
   1280x720       60.0     50.0     59.9  
   1440x576i      50.1  
   1024x768       75.1     70.1     60.0  
   1440x480i      60.1     60.1  
   832x624        74.6  
   800x600        72.2     75.0     60.3  
   720x576        50.0  
   720x480        60.0     59.9  
   640x480        75.0     72.8     66.7     60.0     59.9  
   720x400        70.1  
DP-2 disconnected (normal left inverted right x axis y axis)
DP-3 disconnected (normal left inverted right x axis y axis)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390071924.C06721.14708--

--===============1884155807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1884155807==--
