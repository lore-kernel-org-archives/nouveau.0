From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105813] New: GT710 locks up X and spams logs
Date: Fri, 30 Mar 2018 01:32:39 +0000
Message-ID: <bug-105813-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0761783754=="
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


--===============0761783754==
Content-Type: multipart/alternative; boundary="15223735591.4e7EB.28131"
Content-Transfer-Encoding: 7bit


--15223735591.4e7EB.28131
Date: Fri, 30 Mar 2018 01:32:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105813

            Bug ID: 105813
           Summary: GT710 locks up X and spams logs
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: zarniwhoop-XZoyATsUNX5Wk0Htik3J/w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

I recently bought a low-end Ryzen and needed a basic video card with a vga
connector, so I bought a GT710 (GK208B). The system is intended to be used =
for
compiling/measuring builds from source, but it is almost unusable in X beca=
use
of video errors which cause the desktop to lockup (no mouse clicks or keybo=
ard,
MagicSysRQ works).

Packages: linux-4.15.12, gcc-7.3.0, glibc-2.27, mesa-17.3.7,
xorg-server-1.19.6, nouveau-1.0.15.

So far this bug has bitten me twice. The first time I had built xorg and was
running fluxbox while I built the rest of my desktop. I had 4 or 5 urxvt te=
rms
open across two desktops, nothing else, running a compile in one. I had been
reading mail on the second desktop, then tried to go back to the first to c=
heck
progress.

After waiting a little I rebooted.  The system log had what I thought was a=
 lot
of output (about 50000 lines, I think), starting
Mar 28 16:39:00 origin kernel: [41644.858087] nouveau 0000:26:00.0: fifo:
FB_FLUSH_TIMEOUT
Mar 28 16:40:02 origin kernel: [41707.692180] nouveau 0000:26:00.0: fifo:
FB_FLUSH_TIMEOUT
Mar 28 16:40:02 origin kernel: [41707.692215] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000001
Mar 28 16:40:02 origin kernel: [41707.692264] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000003
Mar 28 16:40:16 origin kernel: [41720.825498] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 28 16:40:16 origin kernel: [41720.825502] nouveau 0000:26:00.0: fifo:
FB_FLUSH_TIMEOUT
Mar 28 16:40:16 origin kernel: [41720.826544] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 28 16:40:16 origin kernel: [41720.827590] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 28 16:40:16 origin kernel: [41720.828639] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002

(similar CHSW ERROR messages after that).

Because of the other problem, which I will post after this, I then tried us=
ing
hte modesetting driver in Xorg. But I got a similar, bigger, report (left it
trying to compile, came back to find an xscreensaver screen, when I reboote=
d I
had almost 1.3 million lines in the log:
Mar 29 22:06:59 origin kernel: [ 2732.695254] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 29 22:06:59 origin kernel: [ 2732.695259] nouveau 0000:26:00.0: fifo:
FB_FLUSH_TIMEOUT
Mar 29 22:06:59 origin kernel: [ 2732.696296] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 29 22:06:59 origin kernel: [ 2732.697342] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 29 22:06:59 origin kernel: [ 2732.698390] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
...
Mar 29 22:29:40 origin kernel: [ 4093.784821] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 29 22:29:40 origin kernel: [ 4093.784977] sysrq: SysRq : Emergency Sync
Mar 29 22:29:40 origin kernel: [ 4093.785868] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 29 22:29:40 origin kernel: [ 4093.786915] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 29 22:29:40 origin kernel: [ 4093.787963] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 29 22:29:40 origin kernel: [ 4093.789011] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 29 22:29:40 origin kernel: [ 4093.790058] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 29 22:29:40 origin kernel: [ 4093.791106] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 29 22:29:40 origin kernel: [ 4093.792154] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 29 22:29:40 origin kernel: [ 4093.793201] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
 (and then a few more before it rebooted).

Because this is a new machine, I have no idea if this is a regression or has
always been like this.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15223735591.4e7EB.28131
Date: Fri, 30 Mar 2018 01:32:39 +0000
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
   title=3D"NEW - GT710 locks up X and spams logs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105813">105813</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GT710 locks up X and spams logs
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
          <td>zarniwhoop&#64;ntlworld.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I recently bought a low-end Ryzen and needed a basic video car=
d with a vga
connector, so I bought a GT710 (GK208B). The system is intended to be used =
for
compiling/measuring builds from source, but it is almost unusable in X beca=
use
of video errors which cause the desktop to lockup (no mouse clicks or keybo=
ard,
MagicSysRQ works).

Packages: linux-4.15.12, gcc-7.3.0, glibc-2.27, mesa-17.3.7,
xorg-server-1.19.6, nouveau-1.0.15.

So far this bug has bitten me twice. The first time I had built xorg and was
running fluxbox while I built the rest of my desktop. I had 4 or 5 urxvt te=
rms
open across two desktops, nothing else, running a compile in one. I had been
reading mail on the second desktop, then tried to go back to the first to c=
heck
progress.

After waiting a little I rebooted.  The system log had what I thought was a=
 lot
of output (about 50000 lines, I think), starting
Mar 28 16:39:00 origin kernel: [41644.858087] nouveau 0000:26:00.0: fifo:
FB_FLUSH_TIMEOUT
Mar 28 16:40:02 origin kernel: [41707.692180] nouveau 0000:26:00.0: fifo:
FB_FLUSH_TIMEOUT
Mar 28 16:40:02 origin kernel: [41707.692215] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000001
Mar 28 16:40:02 origin kernel: [41707.692264] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000003
Mar 28 16:40:16 origin kernel: [41720.825498] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 28 16:40:16 origin kernel: [41720.825502] nouveau 0000:26:00.0: fifo:
FB_FLUSH_TIMEOUT
Mar 28 16:40:16 origin kernel: [41720.826544] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 28 16:40:16 origin kernel: [41720.827590] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 28 16:40:16 origin kernel: [41720.828639] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002

(similar CHSW ERROR messages after that).

Because of the other problem, which I will post after this, I then tried us=
ing
hte modesetting driver in Xorg. But I got a similar, bigger, report (left it
trying to compile, came back to find an xscreensaver screen, when I reboote=
d I
had almost 1.3 million lines in the log:
Mar 29 22:06:59 origin kernel: [ 2732.695254] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 29 22:06:59 origin kernel: [ 2732.695259] nouveau 0000:26:00.0: fifo:
FB_FLUSH_TIMEOUT
Mar 29 22:06:59 origin kernel: [ 2732.696296] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 29 22:06:59 origin kernel: [ 2732.697342] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 29 22:06:59 origin kernel: [ 2732.698390] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
...
Mar 29 22:29:40 origin kernel: [ 4093.784821] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 29 22:29:40 origin kernel: [ 4093.784977] sysrq: SysRq : Emergency Sync
Mar 29 22:29:40 origin kernel: [ 4093.785868] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 29 22:29:40 origin kernel: [ 4093.786915] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 29 22:29:40 origin kernel: [ 4093.787963] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 29 22:29:40 origin kernel: [ 4093.789011] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 29 22:29:40 origin kernel: [ 4093.790058] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 29 22:29:40 origin kernel: [ 4093.791106] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 29 22:29:40 origin kernel: [ 4093.792154] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
Mar 29 22:29:40 origin kernel: [ 4093.793201] nouveau 0000:26:00.0: fifo:
CHSW_ERROR 00000002
 (and then a few more before it rebooted).

Because this is a new machine, I have no idea if this is a regression or has
always been like this.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15223735591.4e7EB.28131--

--===============0761783754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0761783754==--
