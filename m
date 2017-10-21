From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103382] New: Flickering / Artifacts on TTY with GTX
	1060
Date: Sat, 21 Oct 2017 02:20:03 +0000
Message-ID: <bug-103382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1106926083=="
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


--===============1106926083==
Content-Type: multipart/alternative; boundary="15085524030.2D37.2550";
 charset="UTF-8"


--15085524030.2D37.2550
Date: Sat, 21 Oct 2017 02:20:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103382

            Bug ID: 103382
           Summary: Flickering / Artifacts on TTY with GTX 1060
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: lukas-8mWp1bEDydJWk0Htik3J/w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 134957
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D134957&action=3Dedit
dmesg output

I have been unable to get a working TTY when using nouveau on my GTX 1060. =
 I
have been booting straight to TTY and the TTY flickers and blacks every few
seconds.  When my Ultrawide monitor is detected as the primary monitor, I a=
lso
see colored artifacts on the screen.  However, when I launch sway or a
compositor, the flickering/artifacting mostly stops, but the compositor see=
ms
to be unstable.

I am testing with Arch Linux 64bit with Linux kernel 4.13.7, package version
"1.0.15-2" for extra/xf86-video-nouveau which is current with Arch Linux ex=
tra
at the moment.

I have attached the EDID information for both of my monitors obtained via /=
sys.
 I have also attached `dmesg` output from booting into nouveau and running =
into
this issue.

Here is a link to the VBIOS that I have copied from /sys:
https://xannode.com/vbios.rom

Monitors connected via DisplayPort:
Samsung U28E590D 28-Inch UHD LED-Lit Monitor
LG Ultrawide Monitor

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15085524030.2D37.2550
Date: Sat, 21 Oct 2017 02:20:03 +0000
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
   title=3D"NEW - Flickering / Artifacts on TTY with GTX 1060"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103382">103382</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Flickering / Artifacts on TTY with GTX 1060
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
          <td>lukas&#64;lwsabota.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D134957=
" name=3D"attach_134957" title=3D"dmesg output">attachment 134957</a> <a hr=
ef=3D"attachment.cgi?id=3D134957&amp;action=3Dedit" title=3D"dmesg output">=
[details]</a></span>
dmesg output

I have been unable to get a working TTY when using nouveau on my GTX 1060. =
 I
have been booting straight to TTY and the TTY flickers and blacks every few
seconds.  When my Ultrawide monitor is detected as the primary monitor, I a=
lso
see colored artifacts on the screen.  However, when I launch sway or a
compositor, the flickering/artifacting mostly stops, but the compositor see=
ms
to be unstable.

I am testing with Arch Linux 64bit with Linux kernel 4.13.7, package version
&quot;1.0.15-2&quot; for extra/xf86-video-nouveau which is current with Arc=
h Linux extra
at the moment.

I have attached the EDID information for both of my monitors obtained via /=
sys.
 I have also attached `dmesg` output from booting into nouveau and running =
into
this issue.

Here is a link to the VBIOS that I have copied from /sys:
<a href=3D"https://xannode.com/vbios.rom">https://xannode.com/vbios.rom</a>

Monitors connected via DisplayPort:
Samsung U28E590D 28-Inch UHD LED-Lit Monitor
LG Ultrawide Monitor</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15085524030.2D37.2550--

--===============1106926083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1106926083==--
