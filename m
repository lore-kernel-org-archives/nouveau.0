From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99841] New: Switching to VT freezes X only on a dual
	screen
Date: Thu, 16 Feb 2017 17:44:23 +0000
Message-ID: <bug-99841-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0898212253=="
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


--===============0898212253==
Content-Type: multipart/alternative; boundary="14872670631.C1B3b6b.8072";
 charset="UTF-8"


--14872670631.C1B3b6b.8072
Date: Thu, 16 Feb 2017 17:44:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99841

            Bug ID: 99841
           Summary: Switching to VT freezes X only on a dual screen
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: riesebie-xZYEWGoilGM@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 129683
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D129683&action=3Dedit
Config-4.10.0-rc8

Kernel Graphic Driver: nouveau
Dual Screen: Yes
After switching to VT via "<ctrl> <alt> FN" or "chvt N" X freezes. No keybo=
ard
response, no pointer response.

Booting with only one screen VT-switch works as expected. Running 4.9.? runs
fine, though. Doesn't matter whether I use libinput or evdev. I don't found
meaningful logs other than the last lines in

Xorg.0.log:
  [    49.408] (II) AIGLX: Suspending AIGLX clients for VT switch=C2=AC
  [    49.408] (II) NOUVEAU(0): NVLeaveVT is called.=C2=AC
  [    54.592] (II) UnloadModule: "libinput"=C2=AC
  [    54.598] (II) UnloadModule: "libinput"=C2=AC
  [    54.598] (II) UnloadModule: "libinput"=C2=AC
  [    54.598] (II) UnloadModule: "libinput"=20

xrandr:
Screen 0: minimum 320 x 200, current 3520 x 1200, maximum 16384 x 16384
DVI-I-1 connected primary 1920x1200+0+0 (normal left inverted right x axis y
axis) 518mm x 324mm
   1920x1200     59.95*+
   1920x1080     60.00    50.00    59.94=20=20
   1600x1200     60.00=20=20
   1680x1050     59.88=20=20
   1280x1024     60.02=20=20
   1440x900      59.90=20=20
   1280x960      60.00=20=20
   1280x800      59.91=20=20
   1280x720      60.00    50.00    59.94=20=20
   1024x768      60.00=20=20
   800x600       60.32    56.25=20=20
   720x576       50.00=20=20
   720x480       60.00    59.94=20=20
   640x480       60.00    59.94=20=20
DVI-D-1 connected 1600x1200+1920+0 (normal left inverted right x axis y axi=
s)
408mm x 306mm
   1600x1200     60.00*+
   1280x1024     75.02    60.02=20=20
   1280x960      60.00=20=20
   1152x864      75.00=20=20
   1024x768      75.03    70.07    60.00=20=20
   832x624       74.55=20=20
   800x600       72.19    75.00    60.32    56.25=20=20
   640x480       75.00    72.81    66.67    59.94=20=20
   720x400       70.08=20=20
HDMI-1 disconnected (normal left inverted right x axis y axis)
DP-1 disconnected (normal left inverted right x axis y axis)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14872670631.C1B3b6b.8072
Date: Thu, 16 Feb 2017 17:44:23 +0000
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
   title=3D"NEW - Switching to VT freezes X only on a dual screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99841">99841</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Switching to VT freezes X only on a dual screen
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
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
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
          <td>riesebie&#64;lxtec.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D129683=
" name=3D"attach_129683" title=3D"Config-4.10.0-rc8">attachment 129683</a> =
<a href=3D"attachment.cgi?id=3D129683&amp;action=3Dedit" title=3D"Config-4.=
10.0-rc8">[details]</a></span>
Config-4.10.0-rc8

Kernel Graphic Driver: nouveau
Dual Screen: Yes
After switching to VT via &quot;&lt;ctrl&gt; &lt;alt&gt; FN&quot; or &quot;=
chvt N&quot; X freezes. No keyboard
response, no pointer response.

Booting with only one screen VT-switch works as expected. Running 4.9.? runs
fine, though. Doesn't matter whether I use libinput or evdev. I don't found
meaningful logs other than the last lines in

Xorg.0.log:
  [    49.408] (II) AIGLX: Suspending AIGLX clients for VT switch=C2=AC
  [    49.408] (II) NOUVEAU(0): NVLeaveVT is called.=C2=AC
  [    54.592] (II) UnloadModule: &quot;libinput&quot;=C2=AC
  [    54.598] (II) UnloadModule: &quot;libinput&quot;=C2=AC
  [    54.598] (II) UnloadModule: &quot;libinput&quot;=C2=AC
  [    54.598] (II) UnloadModule: &quot;libinput&quot;=20

xrandr:
Screen 0: minimum 320 x 200, current 3520 x 1200, maximum 16384 x 16384
DVI-I-1 connected primary 1920x1200+0+0 (normal left inverted right x axis y
axis) 518mm x 324mm
   1920x1200     59.95*+
   1920x1080     60.00    50.00    59.94=20=20
   1600x1200     60.00=20=20
   1680x1050     59.88=20=20
   1280x1024     60.02=20=20
   1440x900      59.90=20=20
   1280x960      60.00=20=20
   1280x800      59.91=20=20
   1280x720      60.00    50.00    59.94=20=20
   1024x768      60.00=20=20
   800x600       60.32    56.25=20=20
   720x576       50.00=20=20
   720x480       60.00    59.94=20=20
   640x480       60.00    59.94=20=20
DVI-D-1 connected 1600x1200+1920+0 (normal left inverted right x axis y axi=
s)
408mm x 306mm
   1600x1200     60.00*+
   1280x1024     75.02    60.02=20=20
   1280x960      60.00=20=20
   1152x864      75.00=20=20
   1024x768      75.03    70.07    60.00=20=20
   832x624       74.55=20=20
   800x600       72.19    75.00    60.32    56.25=20=20
   640x480       75.00    72.81    66.67    59.94=20=20
   720x400       70.08=20=20
HDMI-1 disconnected (normal left inverted right x axis y axis)
DP-1 disconnected (normal left inverted right x axis y axis)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14872670631.C1B3b6b.8072--

--===============0898212253==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0898212253==--
