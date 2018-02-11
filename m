From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105045] New: System freeze with nouveau
Date: Sun, 11 Feb 2018 17:09:07 +0000
Message-ID: <bug-105045-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0829452660=="
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


--===============0829452660==
Content-Type: multipart/alternative; boundary="15183689470.dcBF.12159"
Content-Transfer-Encoding: 7bit


--15183689470.dcBF.12159
Date: Sun, 11 Feb 2018 17:09:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105045

            Bug ID: 105045
           Summary: System freeze with nouveau
           Product: Mesa
           Version: 17.3
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: serg.partizan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 137273
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D137273&action=3Dedit
dmesg after  crash

I use ArchLinux with latest updates:

- linux 4.15.2-2
- mesa 17.3.3-2
- wayland 1.14.0-1
- wayland-protocols 1.12-1
- gnome-shell 3.26.2+14+g64c857e3f-1

And Nvidia GTX 1080 hardware.


My system sometimes freezes when i open new tab in gvim. It does not respon=
d to
Ctrl+Alt+1-7, so i cannot switch to terminal. But it reacts to REISUB, whic=
h i
used until today.

Today I connected to desktop via ssh, used `strace` to connect to Xwayland,=
 and
it was doing over and over something with DRM_IOCTL_NOUVEAU_GEM_PUSHBUF.
I forgot to save that log, i will include it next time.

Then i killed process with `kill -QUIT`, and it saved coredumps from Xwayla=
nd
and gnome-shell. After that gdm restarted and everything was fine.

Attaching dmesg and coredumps. What else can i do to help fix this bug?

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15183689470.dcBF.12159
Date: Sun, 11 Feb 2018 17:09:07 +0000
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
   title=3D"NEW - System freeze with nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105045">105045</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>System freeze with nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>17.3
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
          <td>critical
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
          <td>serg.partizan&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D137273=
" name=3D"attach_137273" title=3D"dmesg after  crash">attachment 137273</a>=
 <a href=3D"attachment.cgi?id=3D137273&amp;action=3Dedit" title=3D"dmesg af=
ter  crash">[details]</a></span>
dmesg after  crash

I use ArchLinux with latest updates:

- linux 4.15.2-2
- mesa 17.3.3-2
- wayland 1.14.0-1
- wayland-protocols 1.12-1
- gnome-shell 3.26.2+14+g64c857e3f-1

And Nvidia GTX 1080 hardware.


My system sometimes freezes when i open new tab in gvim. It does not respon=
d to
Ctrl+Alt+1-7, so i cannot switch to terminal. But it reacts to REISUB, whic=
h i
used until today.

Today I connected to desktop via ssh, used `strace` to connect to Xwayland,=
 and
it was doing over and over something with DRM_IOCTL_NOUVEAU_GEM_PUSHBUF.
I forgot to save that log, i will include it next time.

Then i killed process with `kill -QUIT`, and it saved coredumps from Xwayla=
nd
and gnome-shell. After that gdm restarted and everything was fine.

Attaching dmesg and coredumps. What else can i do to help fix this bug?</pr=
e>
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

--15183689470.dcBF.12159--

--===============0829452660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0829452660==--
