From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104344] New: Display Adapter Chain,
 Cable Disconnect causes Nouveau crash
Date: Wed, 20 Dec 2017 05:52:17 +0000
Message-ID: <bug-104344-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1102823177=="
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


--===============1102823177==
Content-Type: multipart/alternative; boundary="15137491381.E122.7008";
 charset="UTF-8"


--15137491381.E122.7008
Date: Wed, 20 Dec 2017 05:52:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104344

            Bug ID: 104344
           Summary: Display Adapter Chain, Cable Disconnect causes Nouveau
                    crash
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: mbazzinotti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 136308
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D136308&action=3Dedit
collation of syslog grep'd for "nouveau|drm"; includes trace. there was no
pertinent log info right before the trace occurred.

While experimenting with physical connections to avert Flicker Bug 88272
(https://bugs.freedesktop.org/show_bug.cgi?id=3D88272)

I found myself using a mini DisplayPort(mDP) adapter which has 3 outputs
(HDMI, DVI, and DP), with its DP output connected to a second DP->DVI adapt=
er.

Let's call the first adapter A, and the 2nd adapter B. The connections are:


-------  mDP  ---  DP  --- DVI ---------=20
Laptop |-----| A |----| B |---| Monitor |
-------       ---      ---     ---------


While connected, display appeared "normal" as per Bug 88272 screen flicker.
When
I unplugged the DVI cable from adapter B, this trace appeared in the dmesg
attachment. Dmesg Output before the trace was not relevant. This issue can =
be
reproduced again and again by reconnecting and disconnecting the cable.

This does not crash X. The desktop appears to run just fine, even during the
nouveau crash IIRC. If I was not watching dmesg, I may not have even notice=
d.

The problem does not happen if unplugging the root adapter from the laptop.=
 I
have not tried unplugging the 2nd adapter to see what happens in that case.

Note: When adapter A is plugged via DVI to monitor directly, unplugging the=
 DVI
cable does not cause a crash; no call stack is outputted to dmesg in this c=
ase.

---------
Hardware |
---------
Macbook Pro 5,4 15" mid-2009
Nvidia GeForce 9400m
mini DisplayPort -> "Gigaware" DVI/HDMI/Displayport adapter -> HP DP>DVI
adapter
Dell LCD Monitor model E2011Hc

--------
Software|
--------
Gentoo Linux 4.12.12.=20
x11-base/xorg-server-1.19.5
x11-drivers/xf86-video-nouveau-1.0.15
i3wm
No compositor

kernel command line: ro root=3DPARTUUID=3Dxxxxxxxx net.ifnames=3D0

-----

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15137491381.E122.7008
Date: Wed, 20 Dec 2017 05:52:18 +0000
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
   title=3D"NEW - Display Adapter Chain, Cable Disconnect causes Nouveau cr=
ash"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104344">104344</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Display Adapter Chain, Cable Disconnect causes Nouveau crash
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
          <td>mbazzinotti&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D136308=
" name=3D"attach_136308" title=3D"collation of syslog grep'd for &quot;nouv=
eau|drm&quot;; includes trace. there was no pertinent log info right before=
 the trace occurred.">attachment 136308</a> <a href=3D"attachment.cgi?id=3D=
136308&amp;action=3Dedit" title=3D"collation of syslog grep'd for &quot;nou=
veau|drm&quot;; includes trace. there was no pertinent log info right befor=
e the trace occurred.">[details]</a></span>
collation of syslog grep'd for &quot;nouveau|drm&quot;; includes trace. the=
re was no
pertinent log info right before the trace occurred.

While experimenting with physical connections to avert Flicker <a class=3D"=
bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [NVAC] Flickering screen on 1920x1080 monitor with 9=
400M in MacbookPro 5,5"
   href=3D"show_bug.cgi?id=3D88272">Bug 88272</a>
(<a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [NVAC] Flickering screen on 1920x1080 monitor with 9=
400M in MacbookPro 5,5"
   href=3D"show_bug.cgi?id=3D88272">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D88272</a>)

I found myself using a mini DisplayPort(mDP) adapter which has 3 outputs
(HDMI, DVI, and DP), with its DP output connected to a second DP-&gt;DVI ad=
apter.

Let's call the first adapter A, and the 2nd adapter B. The connections are:


-------  mDP  ---  DP  --- DVI ---------=20
Laptop |-----| A |----| B |---| Monitor |
-------       ---      ---     ---------


While connected, display appeared &quot;normal&quot; as per <a class=3D"bz_=
bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [NVAC] Flickering screen on 1920x1080 monitor with 9=
400M in MacbookPro 5,5"
   href=3D"show_bug.cgi?id=3D88272">Bug 88272</a> screen flicker.
When
I unplugged the DVI cable from adapter B, this trace appeared in the dmesg
attachment. Dmesg Output before the trace was not relevant. This issue can =
be
reproduced again and again by reconnecting and disconnecting the cable.

This does not crash X. The desktop appears to run just fine, even during the
nouveau crash IIRC. If I was not watching dmesg, I may not have even notice=
d.

The problem does not happen if unplugging the root adapter from the laptop.=
 I
have not tried unplugging the 2nd adapter to see what happens in that case.

Note: When adapter A is plugged via DVI to monitor directly, unplugging the=
 DVI
cable does not cause a crash; no call stack is outputted to dmesg in this c=
ase.

---------
Hardware |
---------
Macbook Pro 5,4 15&quot; mid-2009
Nvidia GeForce 9400m
mini DisplayPort -&gt; &quot;Gigaware&quot; DVI/HDMI/Displayport adapter -&=
gt; HP DP&gt;DVI
adapter
Dell LCD Monitor model E2011Hc

--------
Software|
--------
Gentoo Linux 4.12.12.=20
x11-base/xorg-server-1.19.5
x11-drivers/xf86-video-nouveau-1.0.15
i3wm
No compositor

kernel command line: ro root=3DPARTUUID=3Dxxxxxxxx net.ifnames=3D0

-----</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15137491381.E122.7008--

--===============1102823177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1102823177==--
