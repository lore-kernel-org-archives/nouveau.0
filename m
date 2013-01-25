From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59858] New: nvidia Quadro 1000m - White screen after
	suspend
Date: Fri, 25 Jan 2013 18:56:10 +0000
Message-ID: <bug-59858-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2110725921=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2110725921==
Content-Type: multipart/alternative; boundary="1359140170.5E1A6c1.24828"; charset="us-ascii"


--1359140170.5E1A6c1.24828
Date: Fri, 25 Jan 2013 18:56:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D59858

          Priority: medium
            Bug ID: 59858
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: nvidia Quadro 1000m - White screen after suspend
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: renault-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Since August 2012, it is not possible to suspend my laptop because the wake=
 is
not correctly effected. In fact, my screen become white and I can't change =
that
without restart my laptop or X.

I have these messages during the wake :
Jan 25 15:23:36 DiNozzo kernel: [  168.373621] nouveau E[=20
PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fcf8000]
Jan 25 15:23:36 DiNozzo kernel: [  168.373632] nouveau E[=20
PGRAPH][0000:01:00.0] SHADER 0xa004021e
Jan 25 15:23:36 DiNozzo kernel: [  168.373693] nouveau E[=20
PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fcf8000]
Jan 25 15:23:36 DiNozzo kernel: [  168.373704] nouveau E[=20
PGRAPH][0000:01:00.0] SHADER 0xa004021e
Jan 25 15:23:36 DiNozzo kernel: [  168.384201] nouveau E[=20
PGRAPH][0000:01:00.0] TRAP ch 3 [0x003fd3a000]
Jan 25 15:23:36 DiNozzo kernel: [  168.384213] nouveau E[=20
PGRAPH][0000:01:00.0] SHADER 0xa204021e
Jan 25 15:23:36 DiNozzo kernel: [  168.385017] nouveau E[=20
PGRAPH][0000:01:00.0] TRAP ch 3 [0x003fd3a000]
Jan 25 15:23:36 DiNozzo kernel: [  168.385035] nouveau E[=20
PGRAPH][0000:01:00.0] SHADER 0xa204021e

It's a big loop (more 100 lines with theses informations=E2=80=A6).

Packages :
xserver 1.13.1
mesa-dri-drivers 9.0.1
kernel  3.7.4
xorg-x11-drv-nouveau 1.0.6

Hardware :
HP Elitebook 8560w
nVidia Quadro 1000m

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1359140170.5E1A6c1.24828
Date: Fri, 25 Jan 2013 18:56:10 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - nvidia Quadro 1000m - White screen after suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D59858">59858</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nvidia Quadro 1000m - White screen after suspend
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>renault&#64;fedoraproject.org
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Since August 2012, it is not possible to suspend my laptop bec=
ause the wake is
not correctly effected. In fact, my screen become white and I can't change =
that
without restart my laptop or X.

I have these messages during the wake :
Jan 25 15:23:36 DiNozzo kernel: [  168.373621] nouveau E[=20
PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fcf8000]
Jan 25 15:23:36 DiNozzo kernel: [  168.373632] nouveau E[=20
PGRAPH][0000:01:00.0] SHADER 0xa004021e
Jan 25 15:23:36 DiNozzo kernel: [  168.373693] nouveau E[=20
PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fcf8000]
Jan 25 15:23:36 DiNozzo kernel: [  168.373704] nouveau E[=20
PGRAPH][0000:01:00.0] SHADER 0xa004021e
Jan 25 15:23:36 DiNozzo kernel: [  168.384201] nouveau E[=20
PGRAPH][0000:01:00.0] TRAP ch 3 [0x003fd3a000]
Jan 25 15:23:36 DiNozzo kernel: [  168.384213] nouveau E[=20
PGRAPH][0000:01:00.0] SHADER 0xa204021e
Jan 25 15:23:36 DiNozzo kernel: [  168.385017] nouveau E[=20
PGRAPH][0000:01:00.0] TRAP ch 3 [0x003fd3a000]
Jan 25 15:23:36 DiNozzo kernel: [  168.385035] nouveau E[=20
PGRAPH][0000:01:00.0] SHADER 0xa204021e

It's a big loop (more 100 lines with theses informations=E2=80=A6).

Packages :
xserver 1.13.1
mesa-dri-drivers 9.0.1
kernel  3.7.4
xorg-x11-drv-nouveau 1.0.6

Hardware :
HP Elitebook 8560w
nVidia Quadro 1000m</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1359140170.5E1A6c1.24828--

--===============2110725921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2110725921==--
