From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109187] New: [NVC1][optimus] nouveau black display,
 only mouse cursor visible
Date: Mon, 31 Dec 2018 00:03:29 +0000
Message-ID: <bug-109187-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0332096148=="
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


--===============0332096148==
Content-Type: multipart/alternative; boundary="15462146090.66F7.19191"
Content-Transfer-Encoding: 7bit


--15462146090.66F7.19191
Date: Mon, 31 Dec 2018 00:03:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109187

            Bug ID: 109187
           Summary: [NVC1][optimus] nouveau black display, only mouse
                    cursor visible
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: dominik-IZ6Av6enwRKJQ7yn63+t2w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 142919
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D142919&action=3Dedit
Xorg.log with intel+nouveau drivers

I'm getting black output on HDMI-connected display driven by nVidia GeForce=
 GT
525M (GF108M). Mouse cursor is visible on both built-in display and on the
external HDMI-connected display. This used to work on Fedora 27. I can see =
this
on Fedora 29, but I can't pinpoint which package update broke it because I
haven't checked the external display (a projector) for quite some time. This
machine is a Dell XPS 15 L502X with Intel HD3000 integrated graphics and nV=
idia
GeForce GT 525M discrete GPU in Optimus configuration. Here's my xorg.conf
snippet:

Section "Monitor"
        Identifier "Internal LCD"
        DisplaySize 345 195
EndSection

Section "Monitor"
        VendorName "Benq"
        ModelName  "W1100"
        Identifier "Projector"
        DisplaySize 16900 9400
EndSection

Section "Device"
        Identifier "Internal Graphics"
        Driver     "intel"
        Option     "Monitor-LVDS1" "Internal LCD"
        Option     "TearFree" "on"
EndSection

Section "Device"
        Identifier "Optimus Graphics"
        Driver     "nouveau"
        Option     "Monitor-HDMI-1-2" "Projector"
EndSection

Switching both drivers to "modesetting" makes the issue go away. I'm attach=
ing
Xorg logs for both configurations.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15462146090.66F7.19191
Date: Mon, 31 Dec 2018 00:03:29 +0000
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
   title=3D"NEW - [NVC1][optimus] nouveau black display, only mouse cursor =
visible"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109187">109187</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVC1][optimus] nouveau black display, only mouse cursor visi=
ble
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
          <td>dominik&#64;greysector.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D142919=
" name=3D"attach_142919" title=3D"Xorg.log with intel+nouveau drivers">atta=
chment 142919</a> <a href=3D"attachment.cgi?id=3D142919&amp;action=3Dedit" =
title=3D"Xorg.log with intel+nouveau drivers">[details]</a></span>
Xorg.log with intel+nouveau drivers

I'm getting black output on HDMI-connected display driven by nVidia GeForce=
 GT
525M (GF108M). Mouse cursor is visible on both built-in display and on the
external HDMI-connected display. This used to work on Fedora 27. I can see =
this
on Fedora 29, but I can't pinpoint which package update broke it because I
haven't checked the external display (a projector) for quite some time. This
machine is a Dell XPS 15 L502X with Intel HD3000 integrated graphics and nV=
idia
GeForce GT 525M discrete GPU in Optimus configuration. Here's my xorg.conf
snippet:

Section &quot;Monitor&quot;
        Identifier &quot;Internal LCD&quot;
        DisplaySize 345 195
EndSection

Section &quot;Monitor&quot;
        VendorName &quot;Benq&quot;
        ModelName  &quot;W1100&quot;
        Identifier &quot;Projector&quot;
        DisplaySize 16900 9400
EndSection

Section &quot;Device&quot;
        Identifier &quot;Internal Graphics&quot;
        Driver     &quot;intel&quot;
        Option     &quot;Monitor-LVDS1&quot; &quot;Internal LCD&quot;
        Option     &quot;TearFree&quot; &quot;on&quot;
EndSection

Section &quot;Device&quot;
        Identifier &quot;Optimus Graphics&quot;
        Driver     &quot;nouveau&quot;
        Option     &quot;Monitor-HDMI-1-2&quot; &quot;Projector&quot;
EndSection

Switching both drivers to &quot;modesetting&quot; makes the issue go away. =
I'm attaching
Xorg logs for both configurations.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15462146090.66F7.19191--

--===============0332096148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0332096148==--
