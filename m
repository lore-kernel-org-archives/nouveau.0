From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74164] New: [NV04] Native monitor resolution missing
Date: Tue, 28 Jan 2014 22:39:11 +0000
Message-ID: <bug-74164-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1510226805=="
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


--===============1510226805==
Content-Type: multipart/alternative; boundary="1390948751.1B3B1.22794"; charset="us-ascii"


--1390948751.1B3B1.22794
Date: Tue, 28 Jan 2014 22:39:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74164

          Priority: medium
            Bug ID: 74164
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NV04] Native monitor resolution missing
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: mauromol-IWqWACnzNjyonA0d6jMUrA@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Using Fedora 19 on a Graphics Blaster Riva TNT card.

The monitor resolutions made available by the system are:
1024x768 60.0Hz
800x600 60.3Hz and 56.2Hz
848x480 60.0Hz
640x480 59.9Hz

However, the monitor native resolution is 1280x1024 and the refresh rate can be
up to 75Hz (72Hz is also supported in Windows).

The output from "xrandr -q" and "monitor-get-edid -v | monitor-parse-edid -v"
mismatch. The latter shows that the suggested resolution is indeed 1280x1024
(60.0Hz).

If I do:
xrandr --newmode "1280x1024@60" 108 1280 1328 1440 1688 1024 1025 1028 1066
+hsync +vsync
xrandr --addmode VGA-1 1280x1024@60

and then I change the monitor settings from X, I can use that resolution
indeed.

I'm going to attach the output of xrandr -q and monitor-*-edid.
Other information about my card (POST trace, BIOS dump) can be found attached
to bug #68835.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390948751.1B3B1.22794
Date: Tue, 28 Jan 2014 22:39:11 +0000
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
   title="NEW --- - [NV04] Native monitor resolution missing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74164">74164</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV04] Native monitor resolution missing
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
          <td>mauromol&#64;tiscali.it
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
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
        <pre>Using Fedora 19 on a Graphics Blaster Riva TNT card.

The monitor resolutions made available by the system are:
1024x768 60.0Hz
800x600 60.3Hz and 56.2Hz
848x480 60.0Hz
640x480 59.9Hz

However, the monitor native resolution is 1280x1024 and the refresh rate can be
up to 75Hz (72Hz is also supported in Windows).

The output from &quot;xrandr -q&quot; and &quot;monitor-get-edid -v | monitor-parse-edid -v&quot;
mismatch. The latter shows that the suggested resolution is indeed 1280x1024
(60.0Hz).

If I do:
xrandr --newmode &quot;1280x1024&#64;60&quot; 108 1280 1328 1440 1688 1024 1025 1028 1066
+hsync +vsync
xrandr --addmode VGA-1 1280x1024&#64;60

and then I change the monitor settings from X, I can use that resolution
indeed.

I'm going to attach the output of xrandr -q and monitor-*-edid.
Other information about my card (POST trace, BIOS dump) can be found attached
to <a class="bz_bug_link 
          bz_status_VERIFIED  bz_closed"
   title="VERIFIED FIXED - [NV04] Script offset calculated incorrectly for some BMP 1.x VBIOSes"
   href="show_bug.cgi?id=68835">bug #68835</a>.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390948751.1B3B1.22794--

--===============1510226805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1510226805==--
