From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104222] New: GNOME/Wayland desktop freezes when
 resizing Firefox window
Date: Tue, 12 Dec 2017 11:38:22 +0000
Message-ID: <bug-104222-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1059030116=="
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


--===============1059030116==
Content-Type: multipart/alternative; boundary="15130787022.C2D2eBDb6.5167";
 charset="UTF-8"


--15130787022.C2D2eBDb6.5167
Date: Tue, 12 Dec 2017 11:38:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104222

            Bug ID: 104222
           Summary: GNOME/Wayland desktop freezes when resizing Firefox
                    window
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: sbergman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

On Fedora 27 GNOME/Wayland desktop, I can reliably reproduce the desktop
freezing when grabbing the border of a Firefox window with the mouse and
dragging to resize.  (Where Firefox brings Xwayland into the mix, IIUC.  The
only way I found to make the machine responsive again is to ssh into it and
kill -9 the Xwayland processes, which gets me back to the GNOME login scree=
n.)

journalctl says:

> Dec 12 11:24:42 alpha kernel: nouveau 0000:02:00.0: gr: TRAP ch 16 [003f4=
9a000 Xwayland[27222]]
> Dec 12 11:24:42 alpha kernel: nouveau 0000:02:00.0: gr: GPC0/TPC0/TEX: 80=
000049
> Dec 12 11:24:42 alpha kernel: nouveau 0000:02:00.0: gr: GPC0/TPC1/TEX: 80=
000049
> Dec 12 11:24:42 alpha kernel: nouveau 0000:02:00.0: fifo: read fault at 0=
001c7e000 engine 00 [PGRAPH] client 04 [GPC0/] reason 02 [PAGE_NOT_PRESENT]=
 on channel 16 [003f49a000 Xwayland[27222]]
> Dec 12 11:24:42 alpha kernel: nouveau 0000:02:00.0: fifo: gr engine fault=
 on channel 16, recovering...
> Dec 12 11:24:42 alpha kernel: nouveau 0000:02:00.0: Xwayland[27222]: chan=
nel 16 killed!

The GPU is "VGA compatible controller: NVIDIA Corporation GF108GL [Quadro 6=
00]
(rev a1)" according to lspci.

Reproducible with kernel 4.14.3-300.fc27.x86_64, but not reproducible with
4.13.13-300.fc27.x86_64.

Also not reproducible with neither (from a VT) running `weston --xwayland` =
nor
`weston --use-pixman --xwayland`.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15130787022.C2D2eBDb6.5167
Date: Tue, 12 Dec 2017 11:38:22 +0000
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
   title=3D"NEW - GNOME/Wayland desktop freezes when resizing Firefox windo=
w"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104222">104222</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GNOME/Wayland desktop freezes when resizing Firefox window
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
          <td>sbergman&#64;redhat.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>On Fedora 27 GNOME/Wayland desktop, I can reliably reproduce t=
he desktop
freezing when grabbing the border of a Firefox window with the mouse and
dragging to resize.  (Where Firefox brings Xwayland into the mix, IIUC.  The
only way I found to make the machine responsive again is to ssh into it and
kill -9 the Xwayland processes, which gets me back to the GNOME login scree=
n.)

journalctl says:

<span class=3D"quote">&gt; Dec 12 11:24:42 alpha kernel: nouveau 0000:02:00=
.0: gr: TRAP ch 16 [003f49a000 Xwayland[27222]]
&gt; Dec 12 11:24:42 alpha kernel: nouveau 0000:02:00.0: gr: GPC0/TPC0/TEX:=
 80000049
&gt; Dec 12 11:24:42 alpha kernel: nouveau 0000:02:00.0: gr: GPC0/TPC1/TEX:=
 80000049
&gt; Dec 12 11:24:42 alpha kernel: nouveau 0000:02:00.0: fifo: read fault a=
t 0001c7e000 engine 00 [PGRAPH] client 04 [GPC0/] reason 02 [PAGE_NOT_PRESE=
NT] on channel 16 [003f49a000 Xwayland[27222]]
&gt; Dec 12 11:24:42 alpha kernel: nouveau 0000:02:00.0: fifo: gr engine fa=
ult on channel 16, recovering...
&gt; Dec 12 11:24:42 alpha kernel: nouveau 0000:02:00.0: Xwayland[27222]: c=
hannel 16 killed!</span >

The GPU is &quot;VGA compatible controller: NVIDIA Corporation GF108GL [Qua=
dro 600]
(rev a1)&quot; according to lspci.

Reproducible with kernel 4.14.3-300.fc27.x86_64, but not reproducible with
4.13.13-300.fc27.x86_64.

Also not reproducible with neither (from a VT) running `weston --xwayland` =
nor
`weston --use-pixman --xwayland`.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15130787022.C2D2eBDb6.5167--

--===============1059030116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1059030116==--
