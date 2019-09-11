From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111642] New: NV43 GeForce 6600 Nouveau is not stable
 on legacy hardware
Date: Wed, 11 Sep 2019 06:43:56 +0000
Message-ID: <bug-111642-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0778749783=="
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


--===============0778749783==
Content-Type: multipart/alternative; boundary="15681842360.5E13.4999"
Content-Transfer-Encoding: 7bit


--15681842360.5E13.4999
Date: Wed, 11 Sep 2019 06:43:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111642

            Bug ID: 111642
           Summary: NV43 GeForce 6600 Nouveau is not stable on legacy
                    hardware
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: not set
          Priority: not set
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: diggest-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

First of all I appreciate this community work, the driver didn't work at all
for the NV43 gpu few years ago but now it is working but not stable yet.=20

I am on Ubuntu 18.04.3 LTS, tested on kernels 4.15/4.18/5.0,
xserver-xorg-video-nouveau 1:1.0.15-2, libdrm-nouveau2 2.4.97-1ubuntu1~18.0=
4.1
Have also tested it with xserver-xorg-video-nouveau-hwe-18.04
1:1.0.16-1~18.04.1
dmesg is full of these lines:
[  199.658774] nouveau 0000:04:00.0: systemd-logind[1352]: validate: -22
[  199.658902] nouveau 0000:04:00.0: systemd-logind[1352]: fail set_domain
[  199.658905] nouveau 0000:04:00.0: systemd-logind[1352]: validating bo li=
st
[  199.658907] nouveau 0000:04:00.0: systemd-logind[1352]: validate: -22
[  200.075155] nouveau 0000:04:00.0: systemd-logind[1352]: fail set_domain
[  200.075158] nouveau 0000:04:00.0: systemd-logind[1352]: validating bo li=
st
[  200.075160] nouveau 0000:04:00.0: systemd-logind[1352]: validate: -22
[  200.075215] nouveau 0000:04:00.0: systemd-logind[1352]: fail set_domain
syslog is full of these lines:
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x000482fc
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x00000003
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x00104300
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x0000000a
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x14001400
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x0025a000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x01240000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x00000000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: message repeated 3 times=
: [
nouveau: #0110x00000000]
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x000c8300
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x00000000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x00000000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x04000500
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x00020000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x00000000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: kernel rejected
pushbuf: Invalid argument
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: ch2: krec 0 pus=
hes
1 bufs 3 relocs 4
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: ch2: buf 000000=
00
00000005 00000004 00000004 00000000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: ch2: buf 000000=
01
0000000b 00000002 00000002 00000000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: ch2: buf 000000=
02
0000000c 00000002 00000000 00000002
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: ch2: rel 000000=
00
00002d30 00000001 00000000 00044308 00000000 00000000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: ch2: rel 000000=
00
00002d34 00000001 00000001 00000000 00000000 00000000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: ch2: rel 000000=
00
00002d38 00000002 00000000 0004430c 00000000 00000000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: ch2: rel 000000=
00
00002d3c 00000002 00000001 00000000 00000000 00000000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: ch2: psh 000000=
00
0000002d30 0000002d48
... and there are 5 gigs of this messages in syslog

The system is working but sometimes just freeze completely. May work for ho=
urs
and then freeze. May freeze on login.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15681842360.5E13.4999
Date: Wed, 11 Sep 2019 06:43:56 +0000
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
   title=3D"NEW - NV43 GeForce 6600 Nouveau is not stable on legacy hardwar=
e"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111642">111642</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NV43 GeForce 6600 Nouveau is not stable on legacy hardware
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
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
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
          <td>diggest&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>First of all I appreciate this community work, the driver didn=
't work at all
for the NV43 gpu few years ago but now it is working but not stable yet.=20

I am on Ubuntu 18.04.3 LTS, tested on kernels 4.15/4.18/5.0,
xserver-xorg-video-nouveau 1:1.0.15-2, libdrm-nouveau2 2.4.97-1ubuntu1~18.0=
4.1
Have also tested it with xserver-xorg-video-nouveau-hwe-18.04
1:1.0.16-1~18.04.1
dmesg is full of these lines:
[  199.658774] nouveau 0000:04:00.0: systemd-logind[1352]: validate: -22
[  199.658902] nouveau 0000:04:00.0: systemd-logind[1352]: fail set_domain
[  199.658905] nouveau 0000:04:00.0: systemd-logind[1352]: validating bo li=
st
[  199.658907] nouveau 0000:04:00.0: systemd-logind[1352]: validate: -22
[  200.075155] nouveau 0000:04:00.0: systemd-logind[1352]: fail set_domain
[  200.075158] nouveau 0000:04:00.0: systemd-logind[1352]: validating bo li=
st
[  200.075160] nouveau 0000:04:00.0: systemd-logind[1352]: validate: -22
[  200.075215] nouveau 0000:04:00.0: systemd-logind[1352]: fail set_domain
syslog is full of these lines:
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x000482fc
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x00000003
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x00104300
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x0000000a
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x14001400
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x0025a000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x01240000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x00000000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: message repeated 3 times=
: [
nouveau: #0110x00000000]
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x000c8300
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x00000000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x00000000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x04000500
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x00020000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: #0110x00000000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: kernel rejected
pushbuf: Invalid argument
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: ch2: krec 0 pus=
hes
1 bufs 3 relocs 4
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: ch2: buf 000000=
00
00000005 00000004 00000004 00000000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: ch2: buf 000000=
01
0000000b 00000002 00000002 00000000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: ch2: buf 000000=
02
0000000c 00000002 00000000 00000002
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: ch2: rel 000000=
00
00002d30 00000001 00000000 00044308 00000000 00000000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: ch2: rel 000000=
00
00002d34 00000001 00000001 00000000 00000000 00000000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: ch2: rel 000000=
00
00002d38 00000002 00000000 0004430c 00000000 00000000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: ch2: rel 000000=
00
00002d3c 00000002 00000001 00000000 00000000 00000000
Sep 11 01:50:33 /usr/lib/gdm3/gdm-x-session[7653]: nouveau: ch2: psh 000000=
00
0000002d30 0000002d48
... and there are 5 gigs of this messages in syslog

The system is working but sometimes just freeze completely. May work for ho=
urs
and then freeze. May freeze on login.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15681842360.5E13.4999--

--===============0778749783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0778749783==--
