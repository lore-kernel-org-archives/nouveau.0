From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93254] New: [NVA5] The Long Dark (game) is very slow
 because of "kernel rejected pushbuf" messages in log files
Date: Fri, 04 Dec 2015 21:48:43 +0000
Message-ID: <bug-93254-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1783157329=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1783157329==
Content-Type: multipart/alternative; boundary="1449265723.dfeB0d060.20152"; charset="UTF-8"


--1449265723.dfeB0d060.20152
Date: Fri, 4 Dec 2015 21:48:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D93254

            Bug ID: 93254
           Summary: [NVA5] The Long Dark (game) is very slow because of
                    "kernel rejected pushbuf" messages in log files
           Product: Mesa
           Version: 11.0
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: alexander-fd-Bd8g6ntRJIRxuZdfhUSrJg@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 120358
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D120358&action=3Dedit
First "kernel rejected pushbuf" error in log file

Kernel: Linux 4.3 (snapshot from 2015-11-04)
Mesa: 11.0.2
nouveau X11 driver: 1.0.11
Platform: Sony VPCF12S1E with NVidiaGT216M (GForce GT 330M)
System: Debian testing based

Starting the game works fine (although it is somewhat slower than with NVid=
ia's
driver), but once you launch the actual game Unity starts logging up to 1GB=
/min
worth of "kernel rejected pushbuf" logs into the
"~/.config/unity3d/Hinterland/The Long Dark/Player.log" log file. Making th=
at
file (and it's containing directory) read-only I could verify that the game
runs at acceptable frame rates and without noticeable glitches most of the
time. Sometimes however, some textures disappear and it hangs for several
seconds before resuming.

Steps to reproduce:

 1) Purchase and download "The Long Dark" from Steam[1]
 2) Navigate to "~/.local/share/Steam/steamapps/common/TheLongDark" (on the
console or a file browser)
 3) Launch the "tld.x86_64" file[2]
 4) Press any key to move past the disclaimer screen
 5) Select "Sandbox" from the main menu[3]
 6) Start a "New" game or "Continue" a previous survival trip
 7) Wait for the actual game to load
 8) Observe extreme slowness while the disk I/O is a 100%

"Step 8" does not happen with NVidia binary drivers and the game is quite
playable.

See "Player.log.head" for first "kernel rejected pushbuf" error.
The corresponding `dmesg` message is:

    nouveau 0000:01:00.0: tld.x86_64[28285]: nv50cal_space: -16

If you tell me what to do for debugging this, I'll definitely help as much =
as I
can in fixing this issue!
(Including kernel patches, traces, etc.)

Notes:
 1. I'm willing to donate a copy of the game to one established Nouveau
contributor
 2. The game cannot be launched from Steam when using recent versions of Op=
en
source drivers due to https://github.com/ValveSoftware/steam-runtime/issues=
/34
 3. Due to the game being alpha right now the "Story"-mode has not been
released yet =E2=80=93 this shouldn't matter however

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1449265723.dfeB0d060.20152
Date: Fri, 4 Dec 2015 21:48:43 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVA5] The Long Dark (game) is very slow because of &quot=
;kernel rejected pushbuf&quot; messages in log files"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93254">93254</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVA5] The Long Dark (game) is very slow because of &quot;ker=
nel rejected pushbuf&quot; messages in log files
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>11.0
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
          <td>alexander-fd&#64;xmine128.tk
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D120358=
" name=3D"attach_120358" title=3D"First &quot;kernel rejected pushbuf&quot;=
 error in log file">attachment 120358</a> <a href=3D"attachment.cgi?id=3D12=
0358&amp;action=3Dedit" title=3D"First &quot;kernel rejected pushbuf&quot; =
error in log file">[details]</a></span>
First &quot;kernel rejected pushbuf&quot; error in log file

Kernel: Linux 4.3 (snapshot from 2015-11-04)
Mesa: 11.0.2
nouveau X11 driver: 1.0.11
Platform: Sony VPCF12S1E with NVidiaGT216M (GForce GT 330M)
System: Debian testing based

Starting the game works fine (although it is somewhat slower than with NVid=
ia's
driver), but once you launch the actual game Unity starts logging up to 1GB=
/min
worth of &quot;kernel rejected pushbuf&quot; logs into the
&quot;~/.config/unity3d/Hinterland/The Long Dark/Player.log&quot; log file.=
 Making that
file (and it's containing directory) read-only I could verify that the game
runs at acceptable frame rates and without noticeable glitches most of the
time. Sometimes however, some textures disappear and it hangs for several
seconds before resuming.

Steps to reproduce:

 1) Purchase and download &quot;The Long Dark&quot; from Steam[1]
 2) Navigate to &quot;~/.local/share/Steam/steamapps/common/TheLongDark&quo=
t; (on the
console or a file browser)
 3) Launch the &quot;tld.x86_64&quot; file[2]
 4) Press any key to move past the disclaimer screen
 5) Select &quot;Sandbox&quot; from the main menu[3]
 6) Start a &quot;New&quot; game or &quot;Continue&quot; a previous surviva=
l trip
 7) Wait for the actual game to load
 8) Observe extreme slowness while the disk I/O is a 100%

&quot;Step 8&quot; does not happen with NVidia binary drivers and the game =
is quite
playable.

See &quot;Player.log.head&quot; for first &quot;kernel rejected pushbuf&quo=
t; error.
The corresponding `dmesg` message is:

    nouveau 0000:01:00.0: tld.x86_64[28285]: nv50cal_space: -16

If you tell me what to do for debugging this, I'll definitely help as much =
as I
can in fixing this issue!
(Including kernel patches, traces, etc.)

Notes:
 1. I'm willing to donate a copy of the game to one established Nouveau
contributor
 2. The game cannot be launched from Steam when using recent versions of Op=
en
source drivers due to <a href=3D"https://github.com/ValveSoftware/steam-run=
time/issues/34">https://github.com/ValveSoftware/steam-runtime/issues/34</a>
 3. Due to the game being alpha right now the &quot;Story&quot;-mode has no=
t been
released yet =E2=80=93 this shouldn't matter however</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1449265723.dfeB0d060.20152--

--===============1783157329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1783157329==--
