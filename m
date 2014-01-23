From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51362] [NVE7] DisplayPort output on nVidia Quadro
 K2000M (ThinkPad W530) doesn't work
Date: Thu, 23 Jan 2014 23:55:26 +0000
Message-ID: <bug-51362-8800-UXguesPKqY@http.bugs.freedesktop.org/>
References: <bug-51362-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0930027085=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51362-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0930027085==
Content-Type: multipart/alternative; boundary="1390521325.a06c7E2.31134"; charset="us-ascii"


--1390521325.a06c7E2.31134
Date: Thu, 23 Jan 2014 23:55:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51362

Jamin Collins <jcollins-u0TlgVUp4POoiH3BShWgcg@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #21 from Jamin Collins <jcollins-u0TlgVUp4POoiH3BShWgcg@public.gmane.org> ---
I just tested a Lenovo W530 with Quadro K2000M (also with Optimus disabled),
running 3.13 kernel and associated nouveau driver, along with a mini display
port to HDMI cable.  The combination worked flawlessly.

Marking this as resolved.

$ xrandr
Screen 0: minimum 320 x 200, current 3840 x 1080, maximum 8192 x 8192
LVDS-1 connected 1920x1080+0+0 (normal left inverted right x axis y axis) 344mm
x 193mm
   1920x1080      60.0*+   60.0     50.0  
   1680x1050      60.0  
   1400x1050      60.0  
   1280x1024      59.9  
   1280x960       59.9  
   1152x864       60.0  
   1024x768       59.9  
   800x600        59.9  
   640x480        59.4  
   720x400        59.6  
   640x400        60.0  
   640x350        59.8  
VGA-1 disconnected (normal left inverted right x axis y axis)
DP-1 connected 1920x1080+1920+0 (normal left inverted right x axis y axis)
531mm x 299mm
   1920x1080      60.0*+   50.0     59.9  
   1920x1080i     60.1     50.0     60.0  
   1280x1024      75.0     60.0  
   1152x864       75.0  
   1280x720       60.0     50.0     59.9  
   1440x576i      50.1  $ xrandr
Screen 0: minimum 320 x 200, current 3840 x 1080, maximum 8192 x 8192
LVDS-1 connected 1920x1080+0+0 (normal left inverted right x axis y axis) 344mm
x 193mm
   1920x1080      60.0*+   60.0     50.0  
   1680x1050      60.0  
   1400x1050      60.0  
   1280x1024      59.9  
   1280x960       59.9  
   1152x864       60.0  
   1024x768       59.9  
   800x600        59.9  
   640x480        59.4  
   720x400        59.6  
   640x400        60.0  
   640x350        59.8  
VGA-1 disconnected (normal left inverted right x axis y axis)
DP-1 connected 1920x1080+1920+0 (normal left inverted right x axis y axis)
531mm x 299mm
   1920x1080      60.0*+   50.0     59.9  
   1920x1080i     60.1     50.0     60.0  
   1280x1024      75.0     60.0  
   1152x864       75.0  
   1280x720       60.0     50.0     59.9  
   1440x576i      50.1  
   1024x768       75.1     60.0  
   1440x480i      60.1     60.1  
   800x600        75.0     60.3  
   720x576        50.0  
   720x480        60.0     59.9  
   640x480        75.0     60.0     59.9  
   720x400        70.1  
DP-2 disconnected (normal left inverted right x axis y axis)
DP-3 disconnected (normal left inverted right x axis y axis)

   1024x768       75.1     60.0  
   1440x480i      60.1     60.1  
   800x600        75.0     60.3  
   720x576        50.0  
   720x480        60.0     59.9  
   640x480        75.0     60.0     59.9  
   720x400        70.1  
DP-2 disconnected (normal left inverted right x axis y axis)
DP-3 disconnected (normal left inverted right x axis y axis)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390521325.a06c7E2.31134
Date: Thu, 23 Jan 2014 23:55:25 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:jcollins&#64;asgardsrealm.net" title="Jamin Collins &lt;jcollins&#64;asgardsrealm.net&gt;"> <span class="fn">Jamin Collins</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVE7] DisplayPort output on nVidia Quadro K2000M (ThinkPad W530) doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51362">bug 51362</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVE7] DisplayPort output on nVidia Quadro K2000M (ThinkPad W530) doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51362#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVE7] DisplayPort output on nVidia Quadro K2000M (ThinkPad W530) doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51362">bug 51362</a>
              from <span class="vcard"><a class="email" href="mailto:jcollins&#64;asgardsrealm.net" title="Jamin Collins &lt;jcollins&#64;asgardsrealm.net&gt;"> <span class="fn">Jamin Collins</span></a>
</span></b>
        <pre>I just tested a Lenovo W530 with Quadro K2000M (also with Optimus disabled),
running 3.13 kernel and associated nouveau driver, along with a mini display
port to HDMI cable.  The combination worked flawlessly.

Marking this as resolved.

$ xrandr
Screen 0: minimum 320 x 200, current 3840 x 1080, maximum 8192 x 8192
LVDS-1 connected 1920x1080+0+0 (normal left inverted right x axis y axis) 344mm
x 193mm
   1920x1080      60.0*+   60.0     50.0  
   1680x1050      60.0  
   1400x1050      60.0  
   1280x1024      59.9  
   1280x960       59.9  
   1152x864       60.0  
   1024x768       59.9  
   800x600        59.9  
   640x480        59.4  
   720x400        59.6  
   640x400        60.0  
   640x350        59.8  
VGA-1 disconnected (normal left inverted right x axis y axis)
DP-1 connected 1920x1080+1920+0 (normal left inverted right x axis y axis)
531mm x 299mm
   1920x1080      60.0*+   50.0     59.9  
   1920x1080i     60.1     50.0     60.0  
   1280x1024      75.0     60.0  
   1152x864       75.0  
   1280x720       60.0     50.0     59.9  
   1440x576i      50.1  $ xrandr
Screen 0: minimum 320 x 200, current 3840 x 1080, maximum 8192 x 8192
LVDS-1 connected 1920x1080+0+0 (normal left inverted right x axis y axis) 344mm
x 193mm
   1920x1080      60.0*+   60.0     50.0  
   1680x1050      60.0  
   1400x1050      60.0  
   1280x1024      59.9  
   1280x960       59.9  
   1152x864       60.0  
   1024x768       59.9  
   800x600        59.9  
   640x480        59.4  
   720x400        59.6  
   640x400        60.0  
   640x350        59.8  
VGA-1 disconnected (normal left inverted right x axis y axis)
DP-1 connected 1920x1080+1920+0 (normal left inverted right x axis y axis)
531mm x 299mm
   1920x1080      60.0*+   50.0     59.9  
   1920x1080i     60.1     50.0     60.0  
   1280x1024      75.0     60.0  
   1152x864       75.0  
   1280x720       60.0     50.0     59.9  
   1440x576i      50.1  
   1024x768       75.1     60.0  
   1440x480i      60.1     60.1  
   800x600        75.0     60.3  
   720x576        50.0  
   720x480        60.0     59.9  
   640x480        75.0     60.0     59.9  
   720x400        70.1  
DP-2 disconnected (normal left inverted right x axis y axis)
DP-3 disconnected (normal left inverted right x axis y axis)

   1024x768       75.1     60.0  
   1440x480i      60.1     60.1  
   800x600        75.0     60.3  
   720x576        50.0  
   720x480        60.0     59.9  
   640x480        75.0     60.0     59.9  
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

--1390521325.a06c7E2.31134--

--===============0930027085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0930027085==--
