From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105903] New: Only mouse cursor visible on DP-1
 connected monitor, no graphics (was working earlier - reverse PRIME)
Date: Thu, 05 Apr 2018 08:43:26 +0000
Message-ID: <bug-105903-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1547524592=="
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


--===============1547524592==
Content-Type: multipart/alternative; boundary="15229178060.AC25.5715"
Content-Transfer-Encoding: 7bit


--15229178060.AC25.5715
Date: Thu, 5 Apr 2018 08:43:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105903

            Bug ID: 105903
           Summary: Only mouse cursor visible on DP-1 connected monitor,
                    no graphics (was working earlier - reverse PRIME)
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: benny-t2dRYjLbInkVZ4pArIi0Q3XJ5CkEIoRN@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 138617
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D138617&action=3Dedit
dmesg kernel log

I use Gentoo and nouveau with reverse PRIME to get an external monitor work=
ing
with my laptop. This setup used to work, but no longer does.

This is the script I use to turn the external outputs on:

tux_xc1706 ~ # cat nouveau_on.sh=20
#!/bin/bash
read intel nv <<<"$(xrandr --listproviders |  awk '/outputs:/{print $4}' | =
tr
'\n' ' ')"
xrandr --setprovideroutputsource $nv $intel
xrandr --output DP-1-1 --mode 1920x1080 --right-of eDP-1

The monitor also gets connected and I can move the mouse pointer there - bu=
t if
I move a window from my laptop screen to the external monitor, the window is
not visible on the external monitor - only the mouse pointer.

This is my xorg.conf:

Section "ServerLayout"
    Identifier     "Layout0"
    Screen      0  "modesetting"
    Inactive       "nouveau"
EndSection

Section "Monitor"
    Identifier     "Monitor0"
    Option         "DPMS"
EndSection

Section "Device"
    Identifier     "nouveau"
    Driver         "nouveau"
    BusID          "PCI:1:0:0"
    Option         "DRI" "3"
EndSection

Section "Device"
    Identifier     "modesetting"
    Driver         "modesetting"
    BusID          "PCI:0:2:0"
EndSection

Section "Screen"
    Identifier     "nouveau"
    Device         "nouveau"
EndSection

Section "Screen"
    Identifier     "modesetting"
    Device         "modesetting"
    Monitor        "Monitor0"
EndSection

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15229178060.AC25.5715
Date: Thu, 5 Apr 2018 08:43:26 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Only mouse cursor visible on DP-1 connected monitor, no g=
raphics (was working earlier - reverse PRIME)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105903">105903</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Only mouse cursor visible on DP-1 connected monitor, no graph=
ics (was working earlier - reverse PRIME)
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
          <td>benny&#64;ammitzboell-consult.dk
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D138617=
" name=3D"attach_138617" title=3D"dmesg kernel log">attachment 138617</a> <=
a href=3D"attachment.cgi?id=3D138617&amp;action=3Dedit" title=3D"dmesg kern=
el log">[details]</a></span>
dmesg kernel log

I use Gentoo and nouveau with reverse PRIME to get an external monitor work=
ing
with my laptop. This setup used to work, but no longer does.

This is the script I use to turn the external outputs on:

tux_xc1706 ~ # cat nouveau_on.sh=20
#!/bin/bash
read intel nv &lt;&lt;&lt;&quot;$(xrandr --listproviders |  awk '/outputs:/=
{print $4}' | tr
'\n' ' ')&quot;
xrandr --setprovideroutputsource $nv $intel
xrandr --output DP-1-1 --mode 1920x1080 --right-of eDP-1

The monitor also gets connected and I can move the mouse pointer there - bu=
t if
I move a window from my laptop screen to the external monitor, the window is
not visible on the external monitor - only the mouse pointer.

This is my xorg.conf:

Section &quot;ServerLayout&quot;
    Identifier     &quot;Layout0&quot;
    Screen      0  &quot;modesetting&quot;
    Inactive       &quot;nouveau&quot;
EndSection

Section &quot;Monitor&quot;
    Identifier     &quot;Monitor0&quot;
    Option         &quot;DPMS&quot;
EndSection

Section &quot;Device&quot;
    Identifier     &quot;nouveau&quot;
    Driver         &quot;nouveau&quot;
    BusID          &quot;PCI:1:0:0&quot;
    Option         &quot;DRI&quot; &quot;3&quot;
EndSection

Section &quot;Device&quot;
    Identifier     &quot;modesetting&quot;
    Driver         &quot;modesetting&quot;
    BusID          &quot;PCI:0:2:0&quot;
EndSection

Section &quot;Screen&quot;
    Identifier     &quot;nouveau&quot;
    Device         &quot;nouveau&quot;
EndSection

Section &quot;Screen&quot;
    Identifier     &quot;modesetting&quot;
    Device         &quot;modesetting&quot;
    Monitor        &quot;Monitor0&quot;
EndSection</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15229178060.AC25.5715--

--===============1547524592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1547524592==--
