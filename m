From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108959] New: Hangs and reboots while browsing
 [and/or playing video]
Date: Wed, 05 Dec 2018 21:53:26 +0000
Message-ID: <bug-108959-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0975139725=="
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


--===============0975139725==
Content-Type: multipart/alternative; boundary="15440468060.A67fc4.8915"
Content-Transfer-Encoding: 7bit


--15440468060.A67fc4.8915
Date: Wed, 5 Dec 2018 21:53:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108959

            Bug ID: 108959
           Summary: Hangs and reboots while browsing [and/or playing
                    video]
           Product: xorg
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: acca-a09SyBuiYrA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 142736
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D142736&action=3Dedit
dmesg dump

Random hangs. No mouse pointer, no keyboard. The host is responsive to SSH
albeit slow. After some time reboots. No traces in journald, /var/log/syslog
mostly repeats dmesg dump.

System info:

$ lspci:
    07:00.0 VGA compatible controller: NVIDIA Corporation GT215 [GeForce GT
240] (rev a2)

$ uname:
Linux  4.18.0-3-amd64 #1 SMP Debian 4.18.20-2 (2018-11-23) x86_64 GNU/Linux

$ dpkg:
xwayland                        2:1.20.3-1
libva-wayland2:amd64            2.3.0-2
libwayland-server0:amd64        1.16.0-1
xserver-xorg-video-nouveau      1:1.0.15-3
libdrm-nouveau2:amd64           2.4.95-1

$ lsmod:
  nouveau              2162688  12
  mxm_wmi                16384  1 nouveau
  wmi                    28672  2 mxm_wmi,nouveau
  video                  45056  1 nouveau
  ttm                   131072  1 nouveau
  drm_kms_helper        196608  1 nouveau
  drm                   475136  13 drm_kms_helper,ttm,nouveau
  i2c_algo_bit           16384  1 nouveau
  button                 16384  1 nouveau

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15440468060.A67fc4.8915
Date: Wed, 5 Dec 2018 21:53:26 +0000
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
   title=3D"NEW - Hangs and reboots while browsing [and/or playing video]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108959">108959</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Hangs and reboots while browsing [and/or playing video]
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>acca&#64;cpan.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D142736=
" name=3D"attach_142736" title=3D"dmesg dump">attachment 142736</a> <a href=
=3D"attachment.cgi?id=3D142736&amp;action=3Dedit" title=3D"dmesg dump">[det=
ails]</a></span>
dmesg dump

Random hangs. No mouse pointer, no keyboard. The host is responsive to SSH
albeit slow. After some time reboots. No traces in journald, /var/log/syslog
mostly repeats dmesg dump.

System info:

$ lspci:
    07:00.0 VGA compatible controller: NVIDIA Corporation GT215 [GeForce GT
240] (rev a2)

$ uname:
Linux  4.18.0-3-amd64 #1 SMP Debian 4.18.20-2 (2018-11-23) x86_64 GNU/Linux

$ dpkg:
xwayland                        2:1.20.3-1
libva-wayland2:amd64            2.3.0-2
libwayland-server0:amd64        1.16.0-1
xserver-xorg-video-nouveau      1:1.0.15-3
libdrm-nouveau2:amd64           2.4.95-1

$ lsmod:
  nouveau              2162688  12
  mxm_wmi                16384  1 nouveau
  wmi                    28672  2 mxm_wmi,nouveau
  video                  45056  1 nouveau
  ttm                   131072  1 nouveau
  drm_kms_helper        196608  1 nouveau
  drm                   475136  13 drm_kms_helper,ttm,nouveau
  i2c_algo_bit           16384  1 nouveau
  button                 16384  1 nouveau</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15440468060.A67fc4.8915--

--===============0975139725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0975139725==--
