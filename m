From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106994] [PATCH] Fix null pointer dereference in
 drmmode_output_dpms
Date: Thu, 21 Jun 2018 16:36:48 +0000
Message-ID: <bug-106994-8800-h3DymSASQz@http.bugs.freedesktop.org/>
References: <bug-106994-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0538589420=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-106994-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0538589420==
Content-Type: multipart/alternative; boundary="15295990070.421E68.5099"
Content-Transfer-Encoding: 7bit


--15295990070.421E68.5099
Date: Thu, 21 Jun 2018 16:36:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106994

--- Comment #6 from John Lindgren <john-ytntcHzVV1kcWVvVuXF20w@public.gmane.org> ---
xrandr before undocking:

Screen 0: minimum 320 x 200, current 5760 x 1200, maximum 16384 x 16384
eDP-1 connected 1920x1080+0+0 (normal left inverted right x axis y axis) 34=
4mm
x 194mm
   1920x1080     60.02*+
   1680x1050     60.00=20=20
   1400x1050     60.00=20=20
   1280x1024     59.95=20=20
   1280x960      59.99=20=20
   1152x864      59.97=20=20
   1024x768      59.95=20=20
   800x600       59.96=20=20
   640x480       59.94=20=20
   720x400       59.97=20=20
   640x400       59.96=20=20
   640x350       59.84=20=20
DP-1 disconnected (normal left inverted right x axis y axis)
DP-2 disconnected (normal left inverted right x axis y axis)
DP-3 disconnected (normal left inverted right x axis y axis)
DP-1-1 connected 1920x1200+1920+0 (normal left inverted right x axis y axis)
518mm x 324mm
   1920x1200     59.95*+
   1920x1080     60.00=20=20
   1600x1200     60.00=20=20
   1680x1050     59.95=20=20
   1280x1024     60.02=20=20
   1280x960      60.00=20=20
   1024x768      60.00=20=20
   800x600       60.32=20=20
   640x480       59.94=20=20
   720x400       70.08=20=20
DP-1-2 connected 1920x1200+3840+0 (normal left inverted right x axis y axis)
518mm x 324mm
   1920x1200     59.95*+
   1920x1080     60.00=20=20
   1600x1200     60.00=20=20
   1680x1050     59.95=20=20
   1280x1024     60.02=20=20
   1280x960      60.00=20=20
   1024x768      60.00=20=20
   800x600       60.32=20=20
   640x480       59.94=20=20
   720x400       70.08=20=20
DP-1-3 disconnected (normal left inverted right x axis y axis)

xrandr after undocking:

Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 16384 x 16384
eDP-1 connected 1920x1080+0+0 (normal left inverted right x axis y axis) 34=
4mm
x 194mm
   1920x1080     60.02*+
   1680x1050     60.00=20=20
   1400x1050     60.00=20=20
   1280x1024     59.95=20=20
   1280x960      59.99=20=20
   1152x864      59.97=20=20
   1024x768      59.95=20=20
   800x600       59.96=20=20
   640x480       59.94=20=20
   720x400       59.97=20=20
   640x400       59.96=20=20
   640x350       59.84=20=20
DP-1 disconnected (normal left inverted right x axis y axis)
DP-2 disconnected (normal left inverted right x axis y axis)
DP-3 disconnected (normal left inverted right x axis y axis)
DP-1-1 disconnected (normal left inverted right x axis y axis)
DP-1-2 disconnected (normal left inverted right x axis y axis)
DP-1-3 disconnected (normal left inverted right x axis y axis)

No difference after docking again.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15295990070.421E68.5099
Date: Thu, 21 Jun 2018 16:36:47 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [PATCH] Fix null pointer dereference in drmmode_output_dp=
ms"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106994#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [PATCH] Fix null pointer dereference in drmmode_output_dp=
ms"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106994">bug 10699=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
john&#64;jlindgren.net" title=3D"John Lindgren &lt;john&#64;jlindgren.net&g=
t;"> <span class=3D"fn">John Lindgren</span></a>
</span></b>
        <pre>xrandr before undocking:

Screen 0: minimum 320 x 200, current 5760 x 1200, maximum 16384 x 16384
eDP-1 connected 1920x1080+0+0 (normal left inverted right x axis y axis) 34=
4mm
x 194mm
   1920x1080     60.02*+
   1680x1050     60.00=20=20
   1400x1050     60.00=20=20
   1280x1024     59.95=20=20
   1280x960      59.99=20=20
   1152x864      59.97=20=20
   1024x768      59.95=20=20
   800x600       59.96=20=20
   640x480       59.94=20=20
   720x400       59.97=20=20
   640x400       59.96=20=20
   640x350       59.84=20=20
DP-1 disconnected (normal left inverted right x axis y axis)
DP-2 disconnected (normal left inverted right x axis y axis)
DP-3 disconnected (normal left inverted right x axis y axis)
DP-1-1 connected 1920x1200+1920+0 (normal left inverted right x axis y axis)
518mm x 324mm
   1920x1200     59.95*+
   1920x1080     60.00=20=20
   1600x1200     60.00=20=20
   1680x1050     59.95=20=20
   1280x1024     60.02=20=20
   1280x960      60.00=20=20
   1024x768      60.00=20=20
   800x600       60.32=20=20
   640x480       59.94=20=20
   720x400       70.08=20=20
DP-1-2 connected 1920x1200+3840+0 (normal left inverted right x axis y axis)
518mm x 324mm
   1920x1200     59.95*+
   1920x1080     60.00=20=20
   1600x1200     60.00=20=20
   1680x1050     59.95=20=20
   1280x1024     60.02=20=20
   1280x960      60.00=20=20
   1024x768      60.00=20=20
   800x600       60.32=20=20
   640x480       59.94=20=20
   720x400       70.08=20=20
DP-1-3 disconnected (normal left inverted right x axis y axis)

xrandr after undocking:

Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 16384 x 16384
eDP-1 connected 1920x1080+0+0 (normal left inverted right x axis y axis) 34=
4mm
x 194mm
   1920x1080     60.02*+
   1680x1050     60.00=20=20
   1400x1050     60.00=20=20
   1280x1024     59.95=20=20
   1280x960      59.99=20=20
   1152x864      59.97=20=20
   1024x768      59.95=20=20
   800x600       59.96=20=20
   640x480       59.94=20=20
   720x400       59.97=20=20
   640x400       59.96=20=20
   640x350       59.84=20=20
DP-1 disconnected (normal left inverted right x axis y axis)
DP-2 disconnected (normal left inverted right x axis y axis)
DP-3 disconnected (normal left inverted right x axis y axis)
DP-1-1 disconnected (normal left inverted right x axis y axis)
DP-1-2 disconnected (normal left inverted right x axis y axis)
DP-1-3 disconnected (normal left inverted right x axis y axis)

No difference after docking again.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15295990070.421E68.5099--

--===============0538589420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0538589420==--
