From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99335] New: nouveau graphics often freezes when
 using KDE Plasma 5
Date: Mon, 09 Jan 2017 20:04:34 +0000
Message-ID: <bug-99335-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0478186547=="
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


--===============0478186547==
Content-Type: multipart/alternative; boundary="14839922730.0af5E94dD.25035";
 charset="UTF-8"


--14839922730.0af5E94dD.25035
Date: Mon, 9 Jan 2017 20:04:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99335

            Bug ID: 99335
           Summary: nouveau graphics often freezes when using KDE Plasma 5
           Product: Mesa
           Version: 12.0
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: alexander.persh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 128839
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D128839&action=3Dedit
dmesg

Nouveau graphics on my system (Gentoo) often freezes with errors in dmesg.=
=20

The system works fine for some time, but starts freezing at random intervals
(after 3 mins or 10 mins or 2 hours of work, etc) in random windows (chromi=
um,
krusader, smplayer, login screen after auto-lock, etc) and a lot of artifac=
ts
appear on the screen. After about 30 secs it freezes completely. My keyboard
does not react to any key combinations, mouse pointer moves with lags and m=
ouse
buttons do not work so only hard reset helps.

For example, here are two photos of my frozen screen with artifacts:
http://i.imgur.com/vTbrNay.jpg
http://i.imgur.com/YIvEBGn.jpg

I wrote a script that saves dmesg to a file each 5 secs to get error logs.
Please find two examples with different errors attached.

I use the following versions of packages:
media-libs/mesa-12.0.1
x11-base/xorg-drivers-1.18-r1
x11-base/xorg-server-1.18.4
x11-drivers/xf86-video-nouveau-1.0.11
x11-libs/libdrm-2.4.70
sys-kernel/hardened-sources-4.7.10

My graphics card is Nvidia GeForce GTS 250 (G92 chip).

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14839922730.0af5E94dD.25035
Date: Mon, 9 Jan 2017 20:04:33 +0000
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
   title=3D"NEW - nouveau graphics often freezes when using KDE Plasma 5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99335">99335</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau graphics often freezes when using KDE Plasma 5
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>12.0
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
          <td>major
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
          <td>alexander.persh&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D128839=
" name=3D"attach_128839" title=3D"dmesg">attachment 128839</a> <a href=3D"a=
ttachment.cgi?id=3D128839&amp;action=3Dedit" title=3D"dmesg">[details]</a><=
/span>
dmesg

Nouveau graphics on my system (Gentoo) often freezes with errors in dmesg.=
=20

The system works fine for some time, but starts freezing at random intervals
(after 3 mins or 10 mins or 2 hours of work, etc) in random windows (chromi=
um,
krusader, smplayer, login screen after auto-lock, etc) and a lot of artifac=
ts
appear on the screen. After about 30 secs it freezes completely. My keyboard
does not react to any key combinations, mouse pointer moves with lags and m=
ouse
buttons do not work so only hard reset helps.

For example, here are two photos of my frozen screen with artifacts:
<a href=3D"http://i.imgur.com/vTbrNay.jpg">http://i.imgur.com/vTbrNay.jpg</=
a>
<a href=3D"http://i.imgur.com/YIvEBGn.jpg">http://i.imgur.com/YIvEBGn.jpg</=
a>

I wrote a script that saves dmesg to a file each 5 secs to get error logs.
Please find two examples with different errors attached.

I use the following versions of packages:
media-libs/mesa-12.0.1
x11-base/xorg-drivers-1.18-r1
x11-base/xorg-server-1.18.4
x11-drivers/xf86-video-nouveau-1.0.11
x11-libs/libdrm-2.4.70
sys-kernel/hardened-sources-4.7.10

My graphics card is Nvidia GeForce GTS 250 (G92 chip).</pre>
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

--14839922730.0af5E94dD.25035--

--===============0478186547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0478186547==--
