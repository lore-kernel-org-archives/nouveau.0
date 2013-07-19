From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64774] nouveau GF108 kernel crash in optimus mode
 when enabling external display output
Date: Fri, 19 Jul 2013 12:52:12 +0000
Message-ID: <bug-64774-8800-kdCiHjjkpx@http.bugs.freedesktop.org/>
References: <bug-64774-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0003269489=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64774-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0003269489==
Content-Type: multipart/alternative; boundary="1374238332.3Fc6C2.11273"; charset="us-ascii"


--1374238332.3Fc6C2.11273
Date: Fri, 19 Jul 2013 12:52:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D64774

--- Comment #14 from Pasi K=C3=A4rkk=C3=A4inen <pasik-X3B1VOXEql0@public.gmane.org> ---

Ok, after a lot of reboots and trying different kernels I realized the issu=
e is
not related to the warn_on patch I added. The difference is caused by the f=
act
that if I boot with DVI monitor connected before powering on the system, or
not.

So what happens is:

1) I boot to Linux with DVI monitor connected to nouveau before powering on=
 the
system. This is how it looks then:

$ grep . /sys/class/drm/card*-*/status
/sys/class/drm/card0-LVDS-1/status:connected
/sys/class/drm/card0-VGA-1/status:disconnected
/sys/class/drm/card1-DP-1/status:disconnected
/sys/class/drm/card1-DP-2/status:connected
/sys/class/drm/card1-DP-3/status:disconnected
/sys/class/drm/card1-LVDS-2/status:disconnected
/sys/class/drm/card1-VGA-2/status:disconnected

DP-2 is the external DVI monitor. So it's listed as "connected", but xrandr
doesn't see it:

$ xrandr
Screen 0: minimum 320 x 200, current 1600 x 900, maximum 8192 x 8192
LVDS1 connected 1600x900+0+0 (normal left inverted right x axis y axis) 309=
mm x
174mm
   1600x900       60.0*+   40.0=20=20
   1024x768       60.0=20=20
   800x600        60.3     56.2=20=20
   640x480        59.9=20=20
VGA1 disconnected (normal left inverted right x axis y axis)


Nothing about the nouveau adapter in xrandr output..=20


2) I boot to Linux with DVI monitor NOT connected to nouveau. I connect the=
 DVI
cable after the system has booted to Xorg. This is how it looks then:

$ grep . /sys/class/drm/card*-*/status
/sys/class/drm/card0-LVDS-1/status:connected
/sys/class/drm/card0-VGA-1/status:disconnected
/sys/class/drm/card1-DP-1/status:disconnected
/sys/class/drm/card1-DP-2/status:connected
/sys/class/drm/card1-DP-3/status:disconnected
/sys/class/drm/card1-LVDS-2/status:disconnected
/sys/class/drm/card1-VGA-2/status:disconnected

So again DP-2 is shown as connected to the DVI monitor, which is true.=20

$ xrandr
Screen 0: minimum 320 x 200, current 1600 x 900, maximum 8192 x 8192
LVDS1 connected 1600x900+0+0 (normal left inverted right x axis y axis) 309=
mm x
174mm
   1600x900       60.0*+   40.0=20=20
   1024x768       60.0=20=20
   800x600        60.3     56.2=20=20
   640x480        59.9=20=20
VGA1 disconnected (normal left inverted right x axis y axis)
LVDS-2 disconnected (normal left inverted right x axis y axis)
VGA-2 disconnected (normal left inverted right x axis y axis)
DP-1 disconnected (normal left inverted right x axis y axis)
DP-2 connected (normal left inverted right x axis y axis)
   1920x1080      59.9 +
   1600x1200      60.0=20=20
   1680x1050      59.9=20=20
   1280x1024      60.0=20=20
   1440x900       59.9=20=20
   1280x960       60.0=20=20
   1280x800       59.9=20=20
   1024x768       60.0=20=20
   800x600        60.3     56.2=20=20
   640x480        60.0=20=20
DP-3 disconnected (normal left inverted right x axis y axis)
  1024x768 (0x8e)   65.0MHz
        h: width  1024 start 1048 end 1184 total 1344 skew    0 clock   48.=
4KHz
        v: height  768 start  771 end  777 total  806           clock   60.=
0Hz
  800x600 (0x8f)   40.0MHz
        h: width   800 start  840 end  968 total 1056 skew    0 clock   37.=
9KHz
        v: height  600 start  601 end  605 total  628           clock   60.=
3Hz
  800x600 (0x90)   36.0MHz
        h: width   800 start  824 end  896 total 1024 skew    0 clock   35.=
2KHz
        v: height  600 start  601 end  603 total  625           clock   56.=
2Hz

And now xrandr can see the DVI monitor aswell. So when I plug-in the DVI ca=
ble
on-the-fly to nouveau adapter, then the external display is actually detect=
ed,
and can be enabled and used (with artifacts/corruption, but that is a separ=
ate
bug ;)=20

So 'xrandr' shows the same problem as I described earlier with the Mate des=
ktop
display-properties GUI application. When the laptop is booted with DVI cable
plugged in from the start, the mate-display-properties GUI doesn't allow me=
 to
enable the DVI monitor - so the behaviour matches xrandr. I assume
mate-display-properties internally uses xrandr.=20

But this sounds like an another bug really..

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1374238332.3Fc6C2.11273
Date: Fri, 19 Jul 2013 12:52:12 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - nouveau GF108 kernel crash in optimus mode when enabl=
ing external display output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D64774#c14">Commen=
t # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - nouveau GF108 kernel crash in optimus mode when enabl=
ing external display output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D64774">bug 64774<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pasik&#64;iki.fi" title=3D"Pasi K=C3=A4rkk=C3=A4inen &lt;pasik&#64;iki.fi&g=
t;"> <span class=3D"fn">Pasi K=C3=A4rkk=C3=A4inen</span></a>
</span></b>
        <pre>
Ok, after a lot of reboots and trying different kernels I realized the issu=
e is
not related to the warn_on patch I added. The difference is caused by the f=
act
that if I boot with DVI monitor connected before powering on the system, or
not.

So what happens is:

1) I boot to Linux with DVI monitor connected to nouveau before powering on=
 the
system. This is how it looks then:

$ grep . /sys/class/drm/card*-*/status
/sys/class/drm/card0-LVDS-1/status:connected
/sys/class/drm/card0-VGA-1/status:disconnected
/sys/class/drm/card1-DP-1/status:disconnected
/sys/class/drm/card1-DP-2/status:connected
/sys/class/drm/card1-DP-3/status:disconnected
/sys/class/drm/card1-LVDS-2/status:disconnected
/sys/class/drm/card1-VGA-2/status:disconnected

DP-2 is the external DVI monitor. So it's listed as &quot;connected&quot;, =
but xrandr
doesn't see it:

$ xrandr
Screen 0: minimum 320 x 200, current 1600 x 900, maximum 8192 x 8192
LVDS1 connected 1600x900+0+0 (normal left inverted right x axis y axis) 309=
mm x
174mm
   1600x900       60.0*+   40.0=20=20
   1024x768       60.0=20=20
   800x600        60.3     56.2=20=20
   640x480        59.9=20=20
VGA1 disconnected (normal left inverted right x axis y axis)


Nothing about the nouveau adapter in xrandr output..=20


2) I boot to Linux with DVI monitor NOT connected to nouveau. I connect the=
 DVI
cable after the system has booted to Xorg. This is how it looks then:

$ grep . /sys/class/drm/card*-*/status
/sys/class/drm/card0-LVDS-1/status:connected
/sys/class/drm/card0-VGA-1/status:disconnected
/sys/class/drm/card1-DP-1/status:disconnected
/sys/class/drm/card1-DP-2/status:connected
/sys/class/drm/card1-DP-3/status:disconnected
/sys/class/drm/card1-LVDS-2/status:disconnected
/sys/class/drm/card1-VGA-2/status:disconnected

So again DP-2 is shown as connected to the DVI monitor, which is true.=20

$ xrandr
Screen 0: minimum 320 x 200, current 1600 x 900, maximum 8192 x 8192
LVDS1 connected 1600x900+0+0 (normal left inverted right x axis y axis) 309=
mm x
174mm
   1600x900       60.0*+   40.0=20=20
   1024x768       60.0=20=20
   800x600        60.3     56.2=20=20
   640x480        59.9=20=20
VGA1 disconnected (normal left inverted right x axis y axis)
LVDS-2 disconnected (normal left inverted right x axis y axis)
VGA-2 disconnected (normal left inverted right x axis y axis)
DP-1 disconnected (normal left inverted right x axis y axis)
DP-2 connected (normal left inverted right x axis y axis)
   1920x1080      59.9 +
   1600x1200      60.0=20=20
   1680x1050      59.9=20=20
   1280x1024      60.0=20=20
   1440x900       59.9=20=20
   1280x960       60.0=20=20
   1280x800       59.9=20=20
   1024x768       60.0=20=20
   800x600        60.3     56.2=20=20
   640x480        60.0=20=20
DP-3 disconnected (normal left inverted right x axis y axis)
  1024x768 (0x8e)   65.0MHz
        h: width  1024 start 1048 end 1184 total 1344 skew    0 clock   48.=
4KHz
        v: height  768 start  771 end  777 total  806           clock   60.=
0Hz
  800x600 (0x8f)   40.0MHz
        h: width   800 start  840 end  968 total 1056 skew    0 clock   37.=
9KHz
        v: height  600 start  601 end  605 total  628           clock   60.=
3Hz
  800x600 (0x90)   36.0MHz
        h: width   800 start  824 end  896 total 1024 skew    0 clock   35.=
2KHz
        v: height  600 start  601 end  603 total  625           clock   56.=
2Hz

And now xrandr can see the DVI monitor aswell. So when I plug-in the DVI ca=
ble
on-the-fly to nouveau adapter, then the external display is actually detect=
ed,
and can be enabled and used (with artifacts/corruption, but that is a separ=
ate
bug ;)=20

So 'xrandr' shows the same problem as I described earlier with the Mate des=
ktop
display-properties GUI application. When the laptop is booted with DVI cable
plugged in from the start, the mate-display-properties GUI doesn't allow me=
 to
enable the DVI monitor - so the behaviour matches xrandr. I assume
mate-display-properties internally uses xrandr.=20

But this sounds like an another bug really..</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374238332.3Fc6C2.11273--

--===============0003269489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0003269489==--
