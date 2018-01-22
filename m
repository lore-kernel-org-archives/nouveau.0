From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104728] New: [possible regression] VMD crashes on
 startup on GT 640 / GK107 / NVE7
Date: Mon, 22 Jan 2018 12:46:33 +0000
Message-ID: <bug-104728-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1162262570=="
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


--===============1162262570==
Content-Type: multipart/alternative; boundary="15166251930.9EEe.29281"
Content-Transfer-Encoding: 7bit


--15166251930.9EEe.29281
Date: Mon, 22 Jan 2018 12:46:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104728

            Bug ID: 104728
           Summary: [possible regression] VMD crashes on startup on GT 640
                    / GK107 / NVE7
           Product: Mesa
           Version: 17.2
          Hardware: All
                OS: All
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: vedran-v8Fv/IwHOXbR7s880joybQ@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 136893
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D136893&action=3Dedit
Apitrace

I'm using

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK107 [GeForce=
 GT
640] [10de:0fc1] (rev a1)

OpenGL vendor string: nouveau
OpenGL renderer string: NVE7
OpenGL core profile version string: 4.3 (Core Profile) Mesa 17.2.4
OpenGL core profile shading language version string: 4.30
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile

on Fedora 27 with kernel 4.14.13 and Mesa 17.2.4 (I also tried what follows
with 17.3.0rc3 pulled from rawhide, made no change). When running VMD 1.9.3
[1], I get:

apitrace: loaded into /usr/bin/apitrace
apitrace: unloaded from /usr/bin/apitrace
apitrace: loaded into /usr/bin/tcsh
apitrace: loaded into /usr/bin/id
apitrace: unloaded from /usr/bin/id
apitrace: loaded into /usr/bin/id
apitrace: unloaded from /usr/bin/id
apitrace: loaded into /usr/bin/uname
apitrace: unloaded from /usr/bin/uname
apitrace: loaded into /usr/bin/uname
apitrace: unloaded from /usr/bin/uname
apitrace: loaded into /usr/bin/uname
apitrace: unloaded from /usr/bin/uname
apitrace: loaded into /usr/bin/uname
apitrace: unloaded from /usr/bin/uname
apitrace: loaded into /usr/bin/uname
apitrace: unloaded from /usr/bin/uname
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: /lib64/libGL.so.1: no version
information available (required by
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64)
apitrace: loaded into /sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64
apitrace: tracing to /home/miletivn/vmd_LINUXAMD64.trace
apitrace: attempting to read configuration file:
/home/miletivn/.config/apitrace/gltrace.conf
apitrace: warning: caught signal 11
apitrace: flushing trace due to an exception
/usr/bin/../lib64/apitrace/wrappers/glxtrace.so+0x222f6c
/lib64/libpthread.so.0+0x12a7f
/lib64/libX11.so.6: XGetICValues+0x72
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: Tk_HandleEvent+0x1ea
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x75f2dd
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7d1045
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7d6f63
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: TclEvalObjEx+0x1a2
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7fad60
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ffcc
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: Tcl_FSEvalFileEx+0x150
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x79fa99
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: Tcl_EvalObjv+0x47
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: TclEvalObjEx+0x315
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7fad60
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7d1045
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: TclObjInterpProcCore+0x3f6
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7d1045
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: TclObjInterpProcCore+0x3f6
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ec34
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ffcc
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: Tcl_FSEvalFileEx+0x150
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x79fa99
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ffcc
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x8084b0
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: Tcl_PkgRequireProc+0x8
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x8091fa
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ffcc
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x8084b0
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: Tcl_PkgRequireProc+0x8
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x8092a9
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7d1045
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7d6f63
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: TclEvalObjEx+0x1a2
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7fad60
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ffcc
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: Tcl_FSEvalFileEx+0x150
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x79fa99
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ffcc
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x8084b0
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: Tcl_PkgRequireProc+0x8
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x8092a9
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7d1045
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: TclObjInterpProcCore+0x3f6
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7d1045
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: TclObjInterpProcCore+0x3f6
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7d1045
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7d6f63
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: TclEvalObjEx+0x1a2
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: Tcl_RecordAndEvalObj+0x1ab
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: Tcl_RecordAndEval+0x44
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64:
_ZN13TclTextInterp10evalStringEPKc+0xf
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64:
_ZN6UIText14act_on_commandEiP7Command+0x5f
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64:
_ZN12CommandQueue10runcommandEP7Command+0xb8
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: _Z14VMDreadStartupP6VMDApp+0x=
27c
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: main+0xdc
/lib64/libc.so.6: __libc_start_main+0xe9
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0xe7378
apitrace: info: taking default action for signal 11
Segmentation fault (core dumped)

Apitrace of the run is attached. This doesn't happen with the proprietary
driver, and I can't confirm it's a regression, but there appear to be repor=
ts
of VMD working on nouveau (albeit slowly).

[1] http://www.ks.uiuc.edu/Research/vmd/

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15166251930.9EEe.29281
Date: Mon, 22 Jan 2018 12:46:33 +0000
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
   title=3D"NEW - [possible regression] VMD crashes on startup on GT 640 / =
GK107 / NVE7"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104728">104728</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[possible regression] VMD crashes on startup on GT 640 / GK10=
7 / NVE7
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>17.2
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>All
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
          <td>major
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
          <td>vedran&#64;miletic.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D136893=
" name=3D"attach_136893" title=3D"Apitrace">attachment 136893</a> <a href=
=3D"attachment.cgi?id=3D136893&amp;action=3Dedit" title=3D"Apitrace">[detai=
ls]</a></span>
Apitrace

I'm using

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK107 [GeForce=
 GT
640] [10de:0fc1] (rev a1)

OpenGL vendor string: nouveau
OpenGL renderer string: NVE7
OpenGL core profile version string: 4.3 (Core Profile) Mesa 17.2.4
OpenGL core profile shading language version string: 4.30
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile

on Fedora 27 with kernel 4.14.13 and Mesa 17.2.4 (I also tried what follows
with 17.3.0rc3 pulled from rawhide, made no change). When running VMD 1.9.3
[1], I get:

apitrace: loaded into /usr/bin/apitrace
apitrace: unloaded from /usr/bin/apitrace
apitrace: loaded into /usr/bin/tcsh
apitrace: loaded into /usr/bin/id
apitrace: unloaded from /usr/bin/id
apitrace: loaded into /usr/bin/id
apitrace: unloaded from /usr/bin/id
apitrace: loaded into /usr/bin/uname
apitrace: unloaded from /usr/bin/uname
apitrace: loaded into /usr/bin/uname
apitrace: unloaded from /usr/bin/uname
apitrace: loaded into /usr/bin/uname
apitrace: unloaded from /usr/bin/uname
apitrace: loaded into /usr/bin/uname
apitrace: unloaded from /usr/bin/uname
apitrace: loaded into /usr/bin/uname
apitrace: unloaded from /usr/bin/uname
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: /lib64/libGL.so.1: no version
information available (required by
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64)
apitrace: loaded into /sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64
apitrace: tracing to /home/miletivn/vmd_LINUXAMD64.trace
apitrace: attempting to read configuration file:
/home/miletivn/.config/apitrace/gltrace.conf
apitrace: warning: caught signal 11
apitrace: flushing trace due to an exception
/usr/bin/../lib64/apitrace/wrappers/glxtrace.so+0x222f6c
/lib64/libpthread.so.0+0x12a7f
/lib64/libX11.so.6: XGetICValues+0x72
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: Tk_HandleEvent+0x1ea
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x75f2dd
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7d1045
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7d6f63
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: TclEvalObjEx+0x1a2
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7fad60
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ffcc
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: Tcl_FSEvalFileEx+0x150
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x79fa99
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: Tcl_EvalObjv+0x47
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: TclEvalObjEx+0x315
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7fad60
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7d1045
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: TclObjInterpProcCore+0x3f6
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7d1045
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: TclObjInterpProcCore+0x3f6
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ec34
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ffcc
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: Tcl_FSEvalFileEx+0x150
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x79fa99
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ffcc
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x8084b0
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: Tcl_PkgRequireProc+0x8
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x8091fa
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ffcc
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x8084b0
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: Tcl_PkgRequireProc+0x8
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x8092a9
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7d1045
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7d6f63
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: TclEvalObjEx+0x1a2
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7fad60
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ffcc
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: Tcl_FSEvalFileEx+0x150
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x79fa99
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ffcc
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x8084b0
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: Tcl_PkgRequireProc+0x8
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x8092a9
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7d1045
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: TclObjInterpProcCore+0x3f6
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7d1045
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: TclObjInterpProcCore+0x3f6
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x78ed86
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7d1045
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0x7d6f63
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: TclEvalObjEx+0x1a2
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: Tcl_RecordAndEvalObj+0x1ab
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: Tcl_RecordAndEval+0x44
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64:
_ZN13TclTextInterp10evalStringEPKc+0xf
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64:
_ZN6UIText14act_on_commandEiP7Command+0x5f
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64:
_ZN12CommandQueue10runcommandEP7Command+0xb8
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: _Z14VMDreadStartupP6VMDApp+0x=
27c
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64: main+0xdc
/lib64/libc.so.6: __libc_start_main+0xe9
/sw/mbm/app/vmd/1.9.3/lib/vmd/vmd_LINUXAMD64+0xe7378
apitrace: info: taking default action for signal 11
Segmentation fault (core dumped)

Apitrace of the run is attached. This doesn't happen with the proprietary
driver, and I can't confirm it's a regression, but there appear to be repor=
ts
of VMD working on nouveau (albeit slowly).

[1] <a href=3D"http://www.ks.uiuc.edu/Research/vmd/">http://www.ks.uiuc.edu=
/Research/vmd/</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15166251930.9EEe.29281--

--===============1162262570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1162262570==--
