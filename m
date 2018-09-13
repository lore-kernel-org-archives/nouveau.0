From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107919] New: RandR unable to set Screen Size when
 using Intel+nouveau
Date: Thu, 13 Sep 2018 11:03:55 +0000
Message-ID: <bug-107919-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0605553665=="
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


--===============0605553665==
Content-Type: multipart/alternative; boundary="15368366350.FA3915936.22582"
Content-Transfer-Encoding: 7bit


--15368366350.FA3915936.22582
Date: Thu, 13 Sep 2018 11:03:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107919

            Bug ID: 107919
           Summary: RandR unable to set Screen Size when using
                    Intel+nouveau
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: main.haarp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

I am using a Thinkpad W530 which features an Intel GPU (Ivy Bridge) hooked =
up
to the internal LCD and an Nvidia K2000M (NVE7/GK107) hooked up to the
DisplayPorts.

Gentoo Linux
Kernel: 4.14.65
xorg-server-1.19.5
xf86-video-intel-2.99.917_p20180214
xf86-video-nouveau-1.0.15


Both GPUs drive outputs via "xrandr --setprovideroutputsource nouveau Intel=
".
Under these conditions, changing monitor layouts works once. Then, when the
laptop is suspended and brought to a different workplace with a different
monitor layout, most subsequent xrandr calls fail. RRSetScreenSize refuses =
to
work. Example:

    xrandr --output LVDS1 --mode 1920x1080 --pos 0x0 --rotate normal
    xrandr --output DP-1-2 --primary --mode 2560x1440 --pos 1920x0 --rotate
normal
    xrandr --output DP-1-3 --mode 2560x1440 --pos 4480x0 --rotate normal

Result:

X Error of failed request:  BadValue (integer parameter out of range for
operation)
  Major opcode of failed request:  139 (RANDR)
  Minor opcode of failed request:  7 (RRSetScreenSize)
  Value in failed request:  0x0
  Serial number of failed request:  57
  Current serial number in output stream:  58


Once this bug appears, xrandr behaves pretty strangely and "randomly" as fa=
r as
requested changes go:

- xrandr refuses to set some modes/positions/rotations
- This can be partially mitigated by toggling outputs off entirely and on
again. xrandr will still complain, but do as told
- Trying many different modes/positions/rotations and off/on cycles may
eventually yield the desired layout
- Attempts to change the screen size directly with e.g. "xrandr --db 9999x9=
999"
fails with the same error
- Something simple like making an active output primary, e.g. "xrandr --out=
put
DP-1-2 --primary" fails with the same error
- Setting the same layout that is currently active is also complained about
- xrandr calls that previously failed may suddenly work after waiting a few
hours

Neither the kernel nor X show any relevant logs. I will check other debug
levels as instructed.

If you would like me to test anything or need more information, please let =
me
know.
Thanks!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15368366350.FA3915936.22582
Date: Thu, 13 Sep 2018 11:03:55 +0000
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
   title=3D"NEW - RandR unable to set Screen Size when using Intel+nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107919">107919</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>RandR unable to set Screen Size when using Intel+nouveau
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
          <td>main.haarp&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I am using a Thinkpad W530 which features an Intel GPU (Ivy Br=
idge) hooked up
to the internal LCD and an Nvidia K2000M (NVE7/GK107) hooked up to the
DisplayPorts.

Gentoo Linux
Kernel: 4.14.65
xorg-server-1.19.5
xf86-video-intel-2.99.917_p20180214
xf86-video-nouveau-1.0.15


Both GPUs drive outputs via &quot;xrandr --setprovideroutputsource nouveau =
Intel&quot;.
Under these conditions, changing monitor layouts works once. Then, when the
laptop is suspended and brought to a different workplace with a different
monitor layout, most subsequent xrandr calls fail. RRSetScreenSize refuses =
to
work. Example:

    xrandr --output LVDS1 --mode 1920x1080 --pos 0x0 --rotate normal
    xrandr --output DP-1-2 --primary --mode 2560x1440 --pos 1920x0 --rotate
normal
    xrandr --output DP-1-3 --mode 2560x1440 --pos 4480x0 --rotate normal

Result:

X Error of failed request:  BadValue (integer parameter out of range for
operation)
  Major opcode of failed request:  139 (RANDR)
  Minor opcode of failed request:  7 (RRSetScreenSize)
  Value in failed request:  0x0
  Serial number of failed request:  57
  Current serial number in output stream:  58


Once this bug appears, xrandr behaves pretty strangely and &quot;randomly&q=
uot; as far as
requested changes go:

- xrandr refuses to set some modes/positions/rotations
- This can be partially mitigated by toggling outputs off entirely and on
again. xrandr will still complain, but do as told
- Trying many different modes/positions/rotations and off/on cycles may
eventually yield the desired layout
- Attempts to change the screen size directly with e.g. &quot;xrandr --db 9=
999x9999&quot;
fails with the same error
- Something simple like making an active output primary, e.g. &quot;xrandr =
--output
DP-1-2 --primary&quot; fails with the same error
- Setting the same layout that is currently active is also complained about
- xrandr calls that previously failed may suddenly work after waiting a few
hours

Neither the kernel nor X show any relevant logs. I will check other debug
levels as instructed.

If you would like me to test anything or need more information, please let =
me
know.
Thanks!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15368366350.FA3915936.22582--

--===============0605553665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0605553665==--
