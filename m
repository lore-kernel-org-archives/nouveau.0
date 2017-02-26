From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99968] New: [NV4C] System crashes reliably with
	glxinfo
Date: Sun, 26 Feb 2017 01:16:06 +0000
Message-ID: <bug-99968-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1899746500=="
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


--===============1899746500==
Content-Type: multipart/alternative; boundary="14880717661.c9d58D4dc.15993";
 charset="UTF-8"


--14880717661.c9d58D4dc.15993
Date: Sun, 26 Feb 2017 01:16:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99968

            Bug ID: 99968
           Summary: [NV4C] System crashes reliably with glxinfo
           Product: Mesa
           Version: 12.0
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: dmo2118-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
                CC: laurent.riffard+freedesktop-GANU6spQydw@public.gmane.org,
                    nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        Depends on: 91992

Created attachment 129920
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D129920&action=3Dedit
Example display corruption

+++ This bug was initially created as a clone of Bug #91992 +++

Hardware is NVIDIA Corporation C61 [GeForce 6150SE nForce 430] (rev a2) on =
an
old Dell Inspiron 531. Integrated graphics.

The system boots OK (with high-resolution console) into X11. I can log in t=
o a
Lubuntu desktop (2D, no OpenGL, AFAIK). Then, from a terminal window I run:

$ while true; do nice -n19 glxinfo > /dev/null; done

Then I drag the window around for a few seconds. Then the entire system
crashes: total system lockup, followed by display corruption a second or two
later. (I've attached a photograph, because I can't take a normal screen sh=
ot.)
No Ctrl-Alt-F1, no magic SysRq, no ping response.

Other OpenGL apps (i.e. glxgears) can run...sometimes. Other times, they cr=
ash
the same way. It seems to happen on GL init.

Ubuntu 16.10 (with Lubuntu Desktop)
Linux kernel        4.10.0          (freshly compiled)
libdrm              2.4.70-1        (from distro)
Mesa                12.0.3-1ubuntu2 (from distro)
xf86-video-nouveau  1:1.0.12-2      (from distro)

This seems a lot like bug 91992, but I've got my video memory cranked up to=
 256
MB in the BIOS settings, and it still happens.


Referenced Bugs:

https://bugs.freedesktop.org/show_bug.cgi?id=3D91992
[Bug 91992] [NV4C] computer hangs after few minutes of use
--=20
You are receiving this mail because:
You are on the CC list for the bug.
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14880717661.c9d58D4dc.15993
Date: Sun, 26 Feb 2017 01:16:06 +0000
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
   title=3D"NEW - [NV4C] System crashes reliably with glxinfo"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99968">99968</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV4C] System crashes reliably with glxinfo
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>12.0
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
          <td>dmo2118&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>CC</th>
          <td>laurent.riffard+freedesktop&#64;free.fr, nouveau&#64;lists.fr=
eedesktop.org
          </td>
        </tr>

        <tr>
          <th>Depends on</th>
          <td>91992
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D129920=
" name=3D"attach_129920" title=3D"Example display corruption">attachment 12=
9920</a> <a href=3D"attachment.cgi?id=3D129920&amp;action=3Dedit" title=3D"=
Example display corruption">[details]</a></span>
Example display corruption

+++ This bug was initially created as a clone of <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [NV4C] computer hangs after few minutes of use"
   href=3D"show_bug.cgi?id=3D91992">Bug #91992</a> +++

Hardware is NVIDIA Corporation C61 [GeForce 6150SE nForce 430] (rev a2) on =
an
old Dell Inspiron 531. Integrated graphics.

The system boots OK (with high-resolution console) into X11. I can log in t=
o a
Lubuntu desktop (2D, no OpenGL, AFAIK). Then, from a terminal window I run:

$ while true; do nice -n19 glxinfo &gt; /dev/null; done

Then I drag the window around for a few seconds. Then the entire system
crashes: total system lockup, followed by display corruption a second or two
later. (I've attached a photograph, because I can't take a normal screen sh=
ot.)
No Ctrl-Alt-F1, no magic SysRq, no ping response.

Other OpenGL apps (i.e. glxgears) can run...sometimes. Other times, they cr=
ash
the same way. It seems to happen on GL init.

Ubuntu 16.10 (with Lubuntu Desktop)
Linux kernel        4.10.0          (freshly compiled)
libdrm              2.4.70-1        (from distro)
Mesa                12.0.3-1ubuntu2 (from distro)
xf86-video-nouveau  1:1.0.12-2      (from distro)

This seems a lot like <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [NV4C] computer hangs after few minutes of use"
   href=3D"show_bug.cgi?id=3D91992">bug 91992</a>, but I've got my video me=
mory cranked up to 256
MB in the BIOS settings, and it still happens.</pre>
        </div>
      </p>

        <div id=3D"referenced">
          <hr style=3D"border: 1px dashed #969696">
          <b>Referenced Bugs:</b>
          <ul>
              <li>
                [<a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [NV4C] computer hangs after few minutes of use"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91992">Bug 91992<=
/a>] [NV4C] computer hangs after few minutes of use
              </li>
          </ul>
        </div>
        <br>

      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are on the CC list for the bug.</li>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14880717661.c9d58D4dc.15993--

--===============1899746500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1899746500==--
