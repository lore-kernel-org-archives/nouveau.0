From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107167] New: constantly firing events while screen
 attached to NVIDIA card is disabled
Date: Mon, 09 Jul 2018 14:10:10 +0000
Message-ID: <bug-107167-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1747357484=="
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


--===============1747357484==
Content-Type: multipart/alternative; boundary="15311454100.5CAC22.17844"
Content-Transfer-Encoding: 7bit


--15311454100.5CAC22.17844
Date: Mon, 9 Jul 2018 14:10:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107167

            Bug ID: 107167
           Summary: constantly firing events while screen attached to
                    NVIDIA card is disabled
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: sam-qkiumcfQ8OTe9xe1eoZjHA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 140522
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D140522&action=3Dedit
output of 'udevadm monitor -p | ts' while screen is locked

I've got a Lenovo P50 with hybrid graphics cards:

00:02.0 VGA compatible controller: Intel Corporation HD Graphics 530 (rev 0=
6)
01:00.0 VGA compatible controller: NVIDIA Corporation GM107GLM [Quadro M200=
0M]
(rev a2)

The internal display is connected to the Intel card. External display ports=
 are
wired to the NVIDIA card. I'm using the autobind-GPUs Xorg patch so that I
don't have to run `xrandr --setprovideroutputsource` in order to make the
external ports usable.

While I'm away from the system, the monitor gets blanked. While it's in this
state, I see many change events from the NVIDIA device (udevadm monitor out=
put
attached). This exacerbates a memory leak in gnome-desktop that causes clie=
nts
to consume several GiB of memory after I come back to the laptop, having le=
ft
it idle over the weekend.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15311454100.5CAC22.17844
Date: Mon, 9 Jul 2018 14:10:10 +0000
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
   title=3D"NEW - constantly firing events while screen attached to NVIDIA =
card is disabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107167">107167</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>constantly firing events while screen attached to NVIDIA card=
 is disabled
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
          <td>sam&#64;robots.org.uk
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D140522=
" name=3D"attach_140522" title=3D"output of 'udevadm monitor -p | ts' while=
 screen is locked">attachment 140522</a> <a href=3D"attachment.cgi?id=3D140=
522&amp;action=3Dedit" title=3D"output of 'udevadm monitor -p | ts' while s=
creen is locked">[details]</a></span>
output of 'udevadm monitor -p | ts' while screen is locked

I've got a Lenovo P50 with hybrid graphics cards:

00:02.0 VGA compatible controller: Intel Corporation HD Graphics 530 (rev 0=
6)
01:00.0 VGA compatible controller: NVIDIA Corporation GM107GLM [Quadro M200=
0M]
(rev a2)

The internal display is connected to the Intel card. External display ports=
 are
wired to the NVIDIA card. I'm using the autobind-GPUs Xorg patch so that I
don't have to run `xrandr --setprovideroutputsource` in order to make the
external ports usable.

While I'm away from the system, the monitor gets blanked. While it's in this
state, I see many change events from the NVIDIA device (udevadm monitor out=
put
attached). This exacerbates a memory leak in gnome-desktop that causes clie=
nts
to consume several GiB of memory after I come back to the laptop, having le=
ft
it idle over the weekend.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15311454100.5CAC22.17844--

--===============1747357484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1747357484==--
