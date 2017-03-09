From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100139] New: [DRI2][PRIME] nouveau driver cannot
 find any connected connector
Date: Thu, 09 Mar 2017 14:31:47 +0000
Message-ID: <bug-100139-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0461583875=="
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


--===============0461583875==
Content-Type: multipart/alternative; boundary="14890699070.be7a.26572";
 charset="UTF-8"


--14890699070.be7a.26572
Date: Thu, 9 Mar 2017 14:31:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100139

            Bug ID: 100139
           Summary: [DRI2][PRIME] nouveau driver cannot find any connected
                    connector
           Product: Mesa
           Version: 10.3
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: anthoine.bourgeois-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 130147
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D130147&action=3Dedit
Serial line output with drm.debug=3D0xe and nouveau.debug=3Dtrace

I try to follow the documentation at
https://nouveau.freedesktop.org/wiki/Optimus/ to enable my nvidia card, I o=
nly
get black screen with the GPU offloading.

Laptop: DELL M6800
OS: Debian Jessie (8.7) with Mesa 10.3.2 and Xorg server 1.16.4
Kernel: 4.9.13
CPU + iGPU: Intel i7-4810MQ
dGPU: Quadro K4100M

Hardware:
00:02.0 VGA compatible controller: Intel Corporation 4th Gen Core Processor
Integrated Graphics Controller (rev 06)
01:00.0 VGA compatible controller: NVIDIA Corporation GK104GLM [Quadro K410=
0M]
(rev a1)

Step 1:
$ xrandr
Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 8192 x 8192
eDP1 connected 1920x1080+0+0 (normal left inverted right x axis y axis) 382=
mm x
215mm
   1920x1080     60.01*+  59.93    48.01=20=20
   1680x1050     59.95    59.88=20=20
   1600x1024     60.17=20=20
   1400x1050     59.98=20=20
   1280x1024     60.02=20=20
   1440x900      59.89=20=20
   1280x960      60.00=20=20
   1360x768      59.80    59.96=20=20
   1152x864      60.00=20=20
   1024x768      60.00=20=20
   800x600       60.32    56.25=20=20
   640x480       59.94=20=20
VGA1 disconnected (normal left inverted right x axis y axis)
DP4 disconnected (normal left inverted right x axis y axis)
HDMI1 disconnected (normal left inverted right x axis y axis)

Step 2:
$ xrandr --listproviders
Providers: number : 2
Provider 0: id: 0x8d cap: 0xb, Source Output, Sink Output, Sink Offload crt=
cs:
3 outputs: 4 associated providers: 0 name:Intel
Provider 1: id: 0x66 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 4 outputs: 3 associated providers: 0 name:nouveau

Step 3:
$ DRI_PRIME=3D0 glxinfo | grep "OpenGL vendor"
OpenGL vendor string: Intel Open Source Technology Center
$ DRI_PRIME=3D1 glxinfo | grep "OpenGL vendor"
OpenGL vendor string: Intel Open Source Technology Center

Step 4:
$ xrandr --setprovideroffloadsink nouveau Intel
$ DRI_PRIME=3D1 glxinfo | grep "OpenGL vendor"
OpenGL vendor string: nouveau

Step 5:
$ DRI_PRIME=3D1 glxgears -info
Running synchronized to the vertical refresh.  The framerate should be
approximately the same as the monitor refresh rate.
GL_RENDERER   =3D Gallium 0.4 on NVE4
GL_VERSION    =3D 3.0 Mesa 10.3.2
GL_VENDOR     =3D nouveau
GL_EXTENSIONS =3D <lots of extensions>
VisualID 104, 0x68
102606 frames in 5.0 seconds =3D 20521.141 FPS
103124 frames in 5.0 seconds =3D 20624.639 FPS

The glxgears window is black and stay black even after a resize.

I see those messages on dmesg:
  [   12.404679] nouveau 0000:01:00.0: No connectors reported connected with
modes
  [   12.404700] [drm] Cannot find any crtc or sizes - going 1024x768
So I run the following step 6:
$ xrandr --setprovideroutputsource nouveau Intel

But the problem is still the same.

I also try vgaswitcheroo and the switch on discrete card gives me a black
screen too. Fortunately I can switch back to the IGD with my serial line. T=
he
option 'nouveau.runpm=3D0' do not change the issue, so I guest it's not PM
related.

How can I help to debug this issue ?

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14890699070.be7a.26572
Date: Thu, 9 Mar 2017 14:31:47 +0000
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
   title=3D"NEW - [DRI2][PRIME] nouveau driver cannot find any connected co=
nnector"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100139">100139</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[DRI2][PRIME] nouveau driver cannot find any connected connec=
tor
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>10.3
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
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>anthoine.bourgeois&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D130147=
" name=3D"attach_130147" title=3D"Serial line output with drm.debug=3D0xe a=
nd nouveau.debug=3Dtrace">attachment 130147</a> <a href=3D"attachment.cgi?i=
d=3D130147&amp;action=3Dedit" title=3D"Serial line output with drm.debug=3D=
0xe and nouveau.debug=3Dtrace">[details]</a></span>
Serial line output with drm.debug=3D0xe and nouveau.debug=3Dtrace

I try to follow the documentation at
<a href=3D"https://nouveau.freedesktop.org/wiki/Optimus/">https://nouveau.f=
reedesktop.org/wiki/Optimus/</a> to enable my nvidia card, I only
get black screen with the GPU offloading.

Laptop: DELL M6800
OS: Debian Jessie (8.7) with Mesa 10.3.2 and Xorg server 1.16.4
Kernel: 4.9.13
CPU + iGPU: Intel i7-4810MQ
dGPU: Quadro K4100M

Hardware:
00:02.0 VGA compatible controller: Intel Corporation 4th Gen Core Processor
Integrated Graphics Controller (rev 06)
01:00.0 VGA compatible controller: NVIDIA Corporation GK104GLM [Quadro K410=
0M]
(rev a1)

Step 1:
$ xrandr
Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 8192 x 8192
eDP1 connected 1920x1080+0+0 (normal left inverted right x axis y axis) 382=
mm x
215mm
   1920x1080     60.01*+  59.93    48.01=20=20
   1680x1050     59.95    59.88=20=20
   1600x1024     60.17=20=20
   1400x1050     59.98=20=20
   1280x1024     60.02=20=20
   1440x900      59.89=20=20
   1280x960      60.00=20=20
   1360x768      59.80    59.96=20=20
   1152x864      60.00=20=20
   1024x768      60.00=20=20
   800x600       60.32    56.25=20=20
   640x480       59.94=20=20
VGA1 disconnected (normal left inverted right x axis y axis)
DP4 disconnected (normal left inverted right x axis y axis)
HDMI1 disconnected (normal left inverted right x axis y axis)

Step 2:
$ xrandr --listproviders
Providers: number : 2
Provider 0: id: 0x8d cap: 0xb, Source Output, Sink Output, Sink Offload crt=
cs:
3 outputs: 4 associated providers: 0 name:Intel
Provider 1: id: 0x66 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 4 outputs: 3 associated providers: 0 name:nouveau

Step 3:
$ DRI_PRIME=3D0 glxinfo | grep &quot;OpenGL vendor&quot;
OpenGL vendor string: Intel Open Source Technology Center
$ DRI_PRIME=3D1 glxinfo | grep &quot;OpenGL vendor&quot;
OpenGL vendor string: Intel Open Source Technology Center

Step 4:
$ xrandr --setprovideroffloadsink nouveau Intel
$ DRI_PRIME=3D1 glxinfo | grep &quot;OpenGL vendor&quot;
OpenGL vendor string: nouveau

Step 5:
$ DRI_PRIME=3D1 glxgears -info
Running synchronized to the vertical refresh.  The framerate should be
approximately the same as the monitor refresh rate.
GL_RENDERER   =3D Gallium 0.4 on NVE4
GL_VERSION    =3D 3.0 Mesa 10.3.2
GL_VENDOR     =3D nouveau
GL_EXTENSIONS =3D &lt;lots of extensions&gt;
VisualID 104, 0x68
102606 frames in 5.0 seconds =3D 20521.141 FPS
103124 frames in 5.0 seconds =3D 20624.639 FPS

The glxgears window is black and stay black even after a resize.

I see those messages on dmesg:
  [   12.404679] nouveau 0000:01:00.0: No connectors reported connected with
modes
  [   12.404700] [drm] Cannot find any crtc or sizes - going 1024x768
So I run the following step 6:
$ xrandr --setprovideroutputsource nouveau Intel

But the problem is still the same.

I also try vgaswitcheroo and the switch on discrete card gives me a black
screen too. Fortunately I can switch back to the IGD with my serial line. T=
he
option 'nouveau.runpm=3D0' do not change the issue, so I guest it's not PM
related.

How can I help to debug this issue ?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14890699070.be7a.26572--

--===============0461583875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0461583875==--
