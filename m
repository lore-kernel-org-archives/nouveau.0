From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68075] New: nouveau inconsistent changing output
 connector names in xrandr
Date: Tue, 13 Aug 2013 18:04:12 +0000
Message-ID: <bug-68075-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0945238840=="
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


--===============0945238840==
Content-Type: multipart/alternative; boundary="1376417053.bb5cf1.31257"; charset="us-ascii"


--1376417053.bb5cf1.31257
Date: Tue, 13 Aug 2013 18:04:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68075

          Priority: medium
            Bug ID: 68075
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: nouveau inconsistent changing output connector names
                    in xrandr
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: pasik-X3B1VOXEql0@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

I have a Lenovo T430 laptop with both Intel IGD and Nvidia GF108. I've enabled
Optimus in BIOS. Distro currently is Fedora 18 x86_64 with Linux kernel 3.10.4.
I had the same problem with earlier kernel versions aswell. 

It seems the nouveau output connector names in xrandr are inconsistent and
change between reboots, depending "how" the laptop is rebooted (DVI cabled
plugged in or not). I'm using a Lenovo docking station, which has DVI
connectors for external monitors. These DVI connectors are actually connected
to the DisplayPort outputs on nouveau. Laptop is in the docking station during
all these tests.

If DVI cable is NOT connected to docking station at laptop boot time then
nouveau outputs are called DP-1, DP-2 and DP-3 in xrandr output. This is
reliable and consistent, and it's the same on every reboot without DVI cable
plugged in. All fine so far.

But when the DVI cable actually *is* plugged in to the dock at laptop boot time
things get more weird.. During most reboots (but not all, see below) there are
zero outputs reported for nouveau in xrandr! In /sys/class/drm/card*/status
files I can still see correct outputs and their status, it's only xrandr that
doesn't show anything for nouveau. Any ideas why this happens? Also in this
case I can see some weird black/white pattern on the external DVI monitor..
even when the DVI output is not supposed to be enabled/activated.. and there's
no way to actually activate it myself because xrandr doesn't show any outputs
for nouveau.

As mentioned above there's the more rare case aswell.. during *some* reboots
with DVI cable plugged in to the dock, maybe one out of five reboots, there's
no black/white pattern on the external DVI monitor, it's all black like it
should be, and xrandr actually shows the nouveau output connector names! But
they're called Displayport-0, DisplayPort-1 and DisplayPort-2 in xrandr output.
So not DP-1, DP-2 and DP-3 like when the laptop is booted without DVI cable.. 

Why the difference in output names? And any guesses why on most reboots there
are zero outputs detected? I can pretty reliably reproduce this and I'm willing
to do more debugging as needed. 

also in the rare case when the outputs are called DisplayPort-0, DisplayPort-1,
DisplayPort-2 in xrandr output actually enabling them crashes the kernel, but
that's probably a separate issue, and I've filed a separate bug about the
kernel crash: https://bugs.freedesktop.org/show_bug.cgi?id=64774 .



xrandr output with *no* DVI cable connected at boot time:

Screen 0: minimum 320 x 200, current 1600 x 900, maximum 8192 x 8192
LVDS1 connected 1600x900+0+0 (normal left inverted right x axis y axis) 309mm x
174mm
   1600x900       60.0*+   40.0  
   1024x768       60.0  
   800x600        60.3     56.2  
   640x480        59.9  
VGA1 disconnected (normal left inverted right x axis y axis)
LVDS-2 disconnected (normal left inverted right x axis y axis)
VGA-2 disconnected (normal left inverted right x axis y axis)
DP-1 disconnected (normal left inverted right x axis y axis)
DP-2 disconnected (normal left inverted right x axis y axis)
DP-3 disconnected (normal left inverted right x axis y axis)



xrandr output with DVI cable connected at boot time (the rare case when nouveau
outputs are actually detected):

Screen 0: minimum 320 x 200, current 1600 x 900, maximum 8192 x 8192
LVDS1 connected 1600x900+0+0 (normal left inverted right x axis y axis) 309mm x
174mm
   1600x900       60.0*+   40.0  
   1024x768       60.0  
   800x600        60.3     56.2  
   640x480        59.9  
VGA1 disconnected (normal left inverted right x axis y axis)
LVDS-1 disconnected
VGA-1 disconnected
DisplayPort-0 disconnected
DisplayPort-1 connected
   1920x1080      59.9 +
   1600x1200      60.0  
   1680x1050      59.9  
   1280x1024      60.0  
   1440x900       59.9  
   1280x960       60.0  
   1280x800       59.9  
   1024x768       60.0  
   800x600        60.3     56.2  
   640x480        60.0  
DisplayPort-2 disconnected
  1024x768 (0x47)   65.0MHz
        h: width  1024 start 1048 end 1184 total 1344 skew    0 clock   48.4KHz
        v: height  768 start  771 end  777 total  806           clock   60.0Hz
  800x600 (0x48)   40.0MHz
        h: width   800 start  840 end  968 total 1056 skew    0 clock   37.9KHz
        v: height  600 start  601 end  605 total  628           clock   60.3Hz
  800x600 (0x49)   36.0MHz
        h: width   800 start  824 end  896 total 1024 skew    0 clock   35.2KHz
        v: height  600 start  601 end  603 total  625           clock   56.2Hz

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376417053.bb5cf1.31257
Date: Tue, 13 Aug 2013 18:04:13 +0000
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
   title="NEW --- - nouveau inconsistent changing output connector names in xrandr"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68075">68075</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau inconsistent changing output connector names in xrandr
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
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>pasik&#64;iki.fi
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
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
        <pre>I have a Lenovo T430 laptop with both Intel IGD and Nvidia GF108. I've enabled
Optimus in BIOS. Distro currently is Fedora 18 x86_64 with Linux kernel 3.10.4.
I had the same problem with earlier kernel versions aswell. 

It seems the nouveau output connector names in xrandr are inconsistent and
change between reboots, depending &quot;how&quot; the laptop is rebooted (DVI cabled
plugged in or not). I'm using a Lenovo docking station, which has DVI
connectors for external monitors. These DVI connectors are actually connected
to the DisplayPort outputs on nouveau. Laptop is in the docking station during
all these tests.

If DVI cable is NOT connected to docking station at laptop boot time then
nouveau outputs are called DP-1, DP-2 and DP-3 in xrandr output. This is
reliable and consistent, and it's the same on every reboot without DVI cable
plugged in. All fine so far.

But when the DVI cable actually *is* plugged in to the dock at laptop boot time
things get more weird.. During most reboots (but not all, see below) there are
zero outputs reported for nouveau in xrandr! In /sys/class/drm/card*/status
files I can still see correct outputs and their status, it's only xrandr that
doesn't show anything for nouveau. Any ideas why this happens? Also in this
case I can see some weird black/white pattern on the external DVI monitor..
even when the DVI output is not supposed to be enabled/activated.. and there's
no way to actually activate it myself because xrandr doesn't show any outputs
for nouveau.

As mentioned above there's the more rare case aswell.. during *some* reboots
with DVI cable plugged in to the dock, maybe one out of five reboots, there's
no black/white pattern on the external DVI monitor, it's all black like it
should be, and xrandr actually shows the nouveau output connector names! But
they're called Displayport-0, DisplayPort-1 and DisplayPort-2 in xrandr output.
So not DP-1, DP-2 and DP-3 like when the laptop is booted without DVI cable.. 

Why the difference in output names? And any guesses why on most reboots there
are zero outputs detected? I can pretty reliably reproduce this and I'm willing
to do more debugging as needed. 

also in the rare case when the outputs are called DisplayPort-0, DisplayPort-1,
DisplayPort-2 in xrandr output actually enabling them crashes the kernel, but
that's probably a separate issue, and I've filed a separate bug about the
kernel crash: <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau GF108 kernel crash in optimus mode when enabling external display output"
   href="show_bug.cgi?id=64774">https://bugs.freedesktop.org/show_bug.cgi?id=64774</a> .



xrandr output with *no* DVI cable connected at boot time:

Screen 0: minimum 320 x 200, current 1600 x 900, maximum 8192 x 8192
LVDS1 connected 1600x900+0+0 (normal left inverted right x axis y axis) 309mm x
174mm
   1600x900       60.0*+   40.0  
   1024x768       60.0  
   800x600        60.3     56.2  
   640x480        59.9  
VGA1 disconnected (normal left inverted right x axis y axis)
LVDS-2 disconnected (normal left inverted right x axis y axis)
VGA-2 disconnected (normal left inverted right x axis y axis)
DP-1 disconnected (normal left inverted right x axis y axis)
DP-2 disconnected (normal left inverted right x axis y axis)
DP-3 disconnected (normal left inverted right x axis y axis)



xrandr output with DVI cable connected at boot time (the rare case when nouveau
outputs are actually detected):

Screen 0: minimum 320 x 200, current 1600 x 900, maximum 8192 x 8192
LVDS1 connected 1600x900+0+0 (normal left inverted right x axis y axis) 309mm x
174mm
   1600x900       60.0*+   40.0  
   1024x768       60.0  
   800x600        60.3     56.2  
   640x480        59.9  
VGA1 disconnected (normal left inverted right x axis y axis)
LVDS-1 disconnected
VGA-1 disconnected
DisplayPort-0 disconnected
DisplayPort-1 connected
   1920x1080      59.9 +
   1600x1200      60.0  
   1680x1050      59.9  
   1280x1024      60.0  
   1440x900       59.9  
   1280x960       60.0  
   1280x800       59.9  
   1024x768       60.0  
   800x600        60.3     56.2  
   640x480        60.0  
DisplayPort-2 disconnected
  1024x768 (0x47)   65.0MHz
        h: width  1024 start 1048 end 1184 total 1344 skew    0 clock   48.4KHz
        v: height  768 start  771 end  777 total  806           clock   60.0Hz
  800x600 (0x48)   40.0MHz
        h: width   800 start  840 end  968 total 1056 skew    0 clock   37.9KHz
        v: height  600 start  601 end  605 total  628           clock   60.3Hz
  800x600 (0x49)   36.0MHz
        h: width   800 start  824 end  896 total 1024 skew    0 clock   35.2KHz
        v: height  600 start  601 end  603 total  625           clock   56.2Hz</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376417053.bb5cf1.31257--

--===============0945238840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0945238840==--
