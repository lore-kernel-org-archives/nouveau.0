From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101404] New: GTX 970M (GM204-A) not powered off when
 not in use (DynPwr in stead of DynOff)
Date: Tue, 13 Jun 2017 12:32:41 +0000
Message-ID: <bug-101404-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2091026595=="
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


--===============2091026595==
Content-Type: multipart/alternative; boundary="14973571611.DfcDF.26782";
 charset="UTF-8"


--14973571611.DfcDF.26782
Date: Tue, 13 Jun 2017 12:32:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101404

            Bug ID: 101404
           Summary: GTX 970M (GM204-A) not powered off when not in use
                    (DynPwr in stead of DynOff)
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: benny-t2dRYjLbInkVZ4pArIi0Q3XJ5CkEIoRN@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 131921
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D131921&action=3Dedit
dmesg log

Gentoo linux ver. 4.9.16 - using vgaswitcheroo, modesetting and nouveau.

My laptop is a Tuxedo XC1706 (aka Schenker XMG P706 aka Clevo P671RG)
(i7-6700HQ/GTX 970M), external outputs (HDMI and 2 x DP) are wired to the
NVIDIA card. The intel HD only has the laptop screen attached.

Issue 1 (minor):
----------------
Without pcie_port_pm=3Doff and on battery I see DynOff, but ~26W with power=
top
(i.e. nvidia card is not turned off).

With pcie_port_pm=3Doff and on battery I see DynOff and 16-18W with powertop
(i.e. nvidia card is turned off).

Issue 2:
--------
With pcie_port_pm=3Doff and on AC I always see DynPwr even though the nvidi=
a card
is unused (see below) - shouldn't this change to DynOff when unused? Is the=
re a
workaround way to force this to DynOff?

tux_xc1706 ~ # cat /sys/kernel/debug/vgaswitcheroo/switch
0:IGD:+:Pwr:0000:00:02.0
1:DIS: :DynPwr:0000:01:00.0

tux_xc1706 ~ # xrandr --listproviders
Providers: number : 2
Provider 0: id: 0x7a cap: 0xf, Source Output, Sink Output, Source Offload, =
Sink
Offload crtcs: 3 outputs: 1 associated providers: 0 name:modesetting
Provider 1: id: 0x46 cap: 0xf, Source Output, Sink Output, Source Offload, =
Sink
Offload crtcs: 4 outputs: 3 associated providers: 0 name:modesetting

tux_xc1706 ~ # xrandr=20
Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 8192 x 8192
eDP-1 connected primary 1920x1080+0+0 (normal left inverted right x axis y
axis) 382mm x 215mm
   1920x1080     60.02*+
   1400x1050     59.98=20=20
   1280x1024     60.02=20=20
   1280x960      60.00=20=20
   1024x768      60.04    60.00=20=20
   960x720       60.00=20=20
   928x696       60.05=20=20
   896x672       60.01=20=20
   800x600       60.00    60.32    56.25=20=20
   700x525       59.98=20=20
   640x512       60.02=20=20
   640x480       60.00    59.94=20=20
   512x384       60.00=20=20
   400x300       60.32    56.34=20=20
   320x240       60.05

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14973571611.DfcDF.26782
Date: Tue, 13 Jun 2017 12:32:41 +0000
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
   title=3D"NEW - GTX 970M (GM204-A) not powered off when not in use (DynPw=
r in stead of DynOff)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101404">101404</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GTX 970M (GM204-A) not powered off when not in use (DynPwr in=
 stead of DynOff)
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D131921=
" name=3D"attach_131921" title=3D"dmesg log">attachment 131921</a> <a href=
=3D"attachment.cgi?id=3D131921&amp;action=3Dedit" title=3D"dmesg log">[deta=
ils]</a></span>
dmesg log

Gentoo linux ver. 4.9.16 - using vgaswitcheroo, modesetting and nouveau.

My laptop is a Tuxedo XC1706 (aka Schenker XMG P706 aka Clevo P671RG)
(i7-6700HQ/GTX 970M), external outputs (HDMI and 2 x DP) are wired to the
NVIDIA card. The intel HD only has the laptop screen attached.

Issue 1 (minor):
----------------
Without pcie_port_pm=3Doff and on battery I see DynOff, but ~26W with power=
top
(i.e. nvidia card is not turned off).

With pcie_port_pm=3Doff and on battery I see DynOff and 16-18W with powertop
(i.e. nvidia card is turned off).

Issue 2:
--------
With pcie_port_pm=3Doff and on AC I always see DynPwr even though the nvidi=
a card
is unused (see below) - shouldn't this change to DynOff when unused? Is the=
re a
workaround way to force this to DynOff?

tux_xc1706 ~ # cat /sys/kernel/debug/vgaswitcheroo/switch
0:IGD:+:Pwr:0000:00:02.0
1:DIS: :DynPwr:0000:01:00.0

tux_xc1706 ~ # xrandr --listproviders
Providers: number : 2
Provider 0: id: 0x7a cap: 0xf, Source Output, Sink Output, Source Offload, =
Sink
Offload crtcs: 3 outputs: 1 associated providers: 0 name:modesetting
Provider 1: id: 0x46 cap: 0xf, Source Output, Sink Output, Source Offload, =
Sink
Offload crtcs: 4 outputs: 3 associated providers: 0 name:modesetting

tux_xc1706 ~ # xrandr=20
Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 8192 x 8192
eDP-1 connected primary 1920x1080+0+0 (normal left inverted right x axis y
axis) 382mm x 215mm
   1920x1080     60.02*+
   1400x1050     59.98=20=20
   1280x1024     60.02=20=20
   1280x960      60.00=20=20
   1024x768      60.04    60.00=20=20
   960x720       60.00=20=20
   928x696       60.05=20=20
   896x672       60.01=20=20
   800x600       60.00    60.32    56.25=20=20
   700x525       59.98=20=20
   640x512       60.02=20=20
   640x480       60.00    59.94=20=20
   512x384       60.00=20=20
   400x300       60.32    56.34=20=20
   320x240       60.05</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14973571611.DfcDF.26782--

--===============2091026595==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2091026595==--
