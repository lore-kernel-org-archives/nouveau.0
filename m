From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108615] New: [NVE7] changing resolution causes blank
 screen
Date: Wed, 31 Oct 2018 20:28:21 +0000
Message-ID: <bug-108615-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0921853319=="
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


--===============0921853319==
Content-Type: multipart/alternative; boundary="15410177011.4d1E0.18678"
Content-Transfer-Encoding: 7bit


--15410177011.4d1E0.18678
Date: Wed, 31 Oct 2018 20:28:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108615

            Bug ID: 108615
           Summary: [NVE7] changing resolution causes blank screen
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jbytecoder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 142308
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D142308&action=3Dedit
Xorg server log just after resolution switch

Using latest software ( linux-4.19.0, xf86-video-nouveau-1.0.15, mesa-18.2.=
3,
libdrm-2.4.96, xorg-server-1.20.3 ). When I try to change screen resolution
using xrandr to anything below native resolution the screen goes blank. To =
be
exact=20
issuing xrandr -s 1024x768 causes the flowing:
1) screen turns completely black right away
2) after some time  ( no more that 500ms ), the screen changes to black with
backlight on. Looks a lot like no modesetting console without any content=20
3) this situation persists, indefinitely

What is interesting is that switching to console works. The console just wo=
rks.
However when I switch back to X, the above procedure repeats with one detai=
l -
for a brief moment ( at the same moment as step 1) ) the content of desktop=
 in
selected resolution is visible. It seems that the desktop content is somewh=
ere
in memory but the driver decides to render some other area of memory

The only resolution to this problem that is working is to use older kernel,
linux-4.9.95 to be precise=20=20

I discovered the issue, playing games through wine. But to isolate the caus=
e I
gathered dmesg & xorg.log, running only an openbox and using xrandr to cause
the issue

I don't know what further info could be usefull

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15410177011.4d1E0.18678
Date: Wed, 31 Oct 2018 20:28:21 +0000
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
   title=3D"NEW - [NVE7] changing resolution causes blank screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108615">108615</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE7] changing resolution causes blank screen
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
          <td>jbytecoder&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D142308=
" name=3D"attach_142308" title=3D"Xorg server log just after resolution swi=
tch">attachment 142308</a> <a href=3D"attachment.cgi?id=3D142308&amp;action=
=3Dedit" title=3D"Xorg server log just after resolution switch">[details]</=
a></span>
Xorg server log just after resolution switch

Using latest software ( linux-4.19.0, xf86-video-nouveau-1.0.15, mesa-18.2.=
3,
libdrm-2.4.96, xorg-server-1.20.3 ). When I try to change screen resolution
using xrandr to anything below native resolution the screen goes blank. To =
be
exact=20
issuing xrandr -s 1024x768 causes the flowing:
1) screen turns completely black right away
2) after some time  ( no more that 500ms ), the screen changes to black with
backlight on. Looks a lot like no modesetting console without any content=20
3) this situation persists, indefinitely

What is interesting is that switching to console works. The console just wo=
rks.
However when I switch back to X, the above procedure repeats with one detai=
l -
for a brief moment ( at the same moment as step 1) ) the content of desktop=
 in
selected resolution is visible. It seems that the desktop content is somewh=
ere
in memory but the driver decides to render some other area of memory

The only resolution to this problem that is working is to use older kernel,
linux-4.9.95 to be precise=20=20

I discovered the issue, playing games through wine. But to isolate the caus=
e I
gathered dmesg &amp; xorg.log, running only an openbox and using xrandr to =
cause
the issue

I don't know what further info could be usefull</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15410177011.4d1E0.18678--

--===============0921853319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0921853319==--
