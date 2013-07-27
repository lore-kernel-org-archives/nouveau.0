From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67382] New: [nouveau,
 nv50] linux 3.9.7-3.10.3: Xorg won't be available
Date: Sat, 27 Jul 2013 01:35:43 +0000
Message-ID: <bug-67382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0629116837=="
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


--===============0629116837==
Content-Type: multipart/alternative; boundary="1374888943.A6D1EB21.14718"; charset="us-ascii"


--1374888943.A6D1EB21.14718
Date: Sat, 27 Jul 2013 01:35:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D67382

          Priority: medium
            Bug ID: 67382
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be
                    available
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: anonymous-IjDkMZObD1hBDgjK7y7TUQ@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

After looking at #66129 and testing linux 3.10.3 (includes the patches from
66129) and still having problems, I decided to open a bugreport, as the pro=
blem
appears to be something else.
I'm not sure if the topic describes the problem really well.


First I should mention, that I wrote a bugreport on the kernel tracker:
https://bugzilla.kernel.org/show_bug.cgi?id=3D60071
Which was probably the wrong place, and a complete different description.


Machine:
One from the nv50 (8800 GTS) graphic cards. One monitor.

Notes:
*early KMS


Issue:
With 3.9.6 everything is working fine. Systems boots and I'm getting my DM

3.9.7 introduced following changes:
commit aed4802d2a0d2f6c7179a2c03e184860741788c0
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date: Mon Jun 3 16:40:14 2013 +1000

drm/nv50/kms: use dac loadval from vbios, where it's available

commit d40ee48acde16894fb3b241d7e896d5fa84e0f10 upstream.
-------
commit b242745947ed7562ad91dad9e9fde1a92e40d666
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date: Mon Jun 3 16:07:06 2013 +1000

drm/nv50/disp: force dac power state during load detect

commit ea9197cc323839ef3d5280c0453b2c622caa6bc7 upstream.
-------

Since 3.9.7 (also tested with 3.9.8 and 3.10.3) the X-server won't be
accessible. If that's the right description. I'm just seeing a black screen=
 and
I just can switch back to a tty (which takes it time).
Tried it with a DM and without (plain xinit/startx from tty).


Output:

With Linux 3.9.6:
xrandr message:
=1BxRandr=1B: Found crtc's: 2
=1BxRandr=1B: Linking output DVI-I-1 with crtc 0


Output of xrandr --current:
Screen 0: minimum 320 x 200, current 1680 x 1050, maximum 8192 x 8192
DVI-I-1 connected 1680x1050+0+0 (normal left inverted right x axis y axis)
473mm x 296mm
1680x1050 59.9*+
1400x1050 74.9
1280x1024 75.0
1440x900 75.0 59.9
1152x864 75.0
1024x768 75.1 70.1 60.0
832x624 74.6
800x600 72.2 75.0 60.3 56.2
640x480 72.8 75.0 66.7 60.0
720x400 70.1
DVI-I-2 disconnected (normal left inverted right x axis y axis)


Logs with Linux 3.9.7:
xrandr message:
xRandr: Found crtc's: 2
xRandr: Linking output DVI-I-1 with crtc 0
xRandr: Linking output DVI-I-2 with crtc 1


Output of xrandr --current:
Screen 0: minimum 320 x 200, current 1024 x 768, maximum 8192 x 8192
DVI-I-1 connected 1024x768+0+0 (normal left inverted right x axis y axis) 4=
73mm
x 296mm
1680x1050 59.9 +
1400x1050 74.9
1280x1024 75.0
1440x900 75.0 59.9
1152x864 75.0
1024x768 75.1 70.1 60.0*
832x624 74.6
800x600 72.2 75.0 60.3 56.2
640x480 72.8 75.0 66.7 60.0
720x400 70.1
DVI-I-2 connected 1024x768+0+0 (normal left inverted right x axis y axis) 0=
mm x
0mm
1024x768 60.0*
800x600 60.3 56.2
848x480 60.0
640x480 59.9


I'm adding a dmesg snippet later.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1374888943.A6D1EB21.14718
Date: Sat, 27 Jul 2013 01:35:43 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be ava=
ilable"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D67382">67382</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
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
          <td>anonymous&#64;dodgeit.com
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
        <pre>After looking at #66129 and testing linux 3.10.3 (includes the=
 patches from
66129) and still having problems, I decided to open a bugreport, as the pro=
blem
appears to be something else.
I'm not sure if the topic describes the problem really well.


First I should mention, that I wrote a bugreport on the kernel tracker:
<a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D60071">https://bug=
zilla.kernel.org/show_bug.cgi?id=3D60071</a>
Which was probably the wrong place, and a complete different description.


Machine:
One from the nv50 (8800 GTS) graphic cards. One monitor.

Notes:
*early KMS


Issue:
With 3.9.6 everything is working fine. Systems boots and I'm getting my DM

3.9.7 introduced following changes:
commit aed4802d2a0d2f6c7179a2c03e184860741788c0
Author: Ben Skeggs &lt;<a href=3D"mailto:bskeggs&#64;redhat.com">bskeggs&#6=
4;redhat.com</a>&gt;
Date: Mon Jun 3 16:40:14 2013 +1000

drm/nv50/kms: use dac loadval from vbios, where it's available

commit d40ee48acde16894fb3b241d7e896d5fa84e0f10 upstream.
-------
commit b242745947ed7562ad91dad9e9fde1a92e40d666
Author: Ben Skeggs &lt;<a href=3D"mailto:bskeggs&#64;redhat.com">bskeggs&#6=
4;redhat.com</a>&gt;
Date: Mon Jun 3 16:07:06 2013 +1000

drm/nv50/disp: force dac power state during load detect

commit ea9197cc323839ef3d5280c0453b2c622caa6bc7 upstream.
-------

Since 3.9.7 (also tested with 3.9.8 and 3.10.3) the X-server won't be
accessible. If that's the right description. I'm just seeing a black screen=
 and
I just can switch back to a tty (which takes it time).
Tried it with a DM and without (plain xinit/startx from tty).


Output:

With Linux 3.9.6:
xrandr message:
=1BxRandr=1B: Found crtc's: 2
=1BxRandr=1B: Linking output DVI-I-1 with crtc 0


Output of xrandr --current:
Screen 0: minimum 320 x 200, current 1680 x 1050, maximum 8192 x 8192
DVI-I-1 connected 1680x1050+0+0 (normal left inverted right x axis y axis)
473mm x 296mm
1680x1050 59.9*+
1400x1050 74.9
1280x1024 75.0
1440x900 75.0 59.9
1152x864 75.0
1024x768 75.1 70.1 60.0
832x624 74.6
800x600 72.2 75.0 60.3 56.2
640x480 72.8 75.0 66.7 60.0
720x400 70.1
DVI-I-2 disconnected (normal left inverted right x axis y axis)


Logs with Linux 3.9.7:
xrandr message:
xRandr: Found crtc's: 2
xRandr: Linking output DVI-I-1 with crtc 0
xRandr: Linking output DVI-I-2 with crtc 1


Output of xrandr --current:
Screen 0: minimum 320 x 200, current 1024 x 768, maximum 8192 x 8192
DVI-I-1 connected 1024x768+0+0 (normal left inverted right x axis y axis) 4=
73mm
x 296mm
1680x1050 59.9 +
1400x1050 74.9
1280x1024 75.0
1440x900 75.0 59.9
1152x864 75.0
1024x768 75.1 70.1 60.0*
832x624 74.6
800x600 72.2 75.0 60.3 56.2
640x480 72.8 75.0 66.7 60.0
720x400 70.1
DVI-I-2 connected 1024x768+0+0 (normal left inverted right x axis y axis) 0=
mm x
0mm
1024x768 60.0*
800x600 60.3 56.2
848x480 60.0
640x480 59.9


I'm adding a dmesg snippet later.</pre>
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

--1374888943.A6D1EB21.14718--

--===============0629116837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0629116837==--
