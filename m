From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71994] New: Can't set performance level on Fermi
 card, Linux 3.13
Date: Mon, 25 Nov 2013 14:34:45 +0000
Message-ID: <bug-71994-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1166465103=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1166465103==
Content-Type: multipart/alternative; boundary="1385390085.7C7C30.24563"; charset="us-ascii"


--1385390085.7C7C30.24563
Date: Mon, 25 Nov 2013 14:34:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D71994

          Priority: medium
            Bug ID: 71994
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Can't set performance level on Fermi card, Linux 3.13
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: anakin.cs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: 9.2
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 89753
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D89753&action=3Dedit
kernel log

I guess reclocking is supposed to work with Linux 3.13 with Fermi cards (I =
have
a GT 540M), but it doesn't seem to on mine:

# cat /sys/class/drm/card0/device/pstate=20
03: core 50 MHz memory 135 MHz
07: core 202 MHz memory 324 MHz
0f: core 672 MHz memory 800 MHz
--: core 0 MHz memory 0 MHz *

# echo "0f" > /sys/class/drm/card0/device/pstate=20
bash: echo: erreur d'=C3=A9criture : Fonction non implant=C3=A9e

It means in English:
bash: echo: write error : Function not implemented

Am I doing anything wrong ?

I'm on ArchLinux.
linux-mainline 3.13rc1-1
nouveau-dri 9.2.3-2

Best regards,

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1385390085.7C7C30.24563
Date: Mon, 25 Nov 2013 14:34:45 +0000
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
   title=3D"NEW --- - Can't set performance level on Fermi card, Linux 3.13"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D71994">71994</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Can't set performance level on Fermi card, Linux 3.13
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
          <td>anakin.cs&#64;gmail.com
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
          <td>9.2
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D89753"=
 name=3D"attach_89753" title=3D"kernel log">attachment 89753</a> <a href=3D=
"attachment.cgi?id=3D89753&amp;action=3Dedit" title=3D"kernel log">[details=
]</a></span>
kernel log

I guess reclocking is supposed to work with Linux 3.13 with Fermi cards (I =
have
a GT 540M), but it doesn't seem to on mine:

# cat /sys/class/drm/card0/device/pstate=20
03: core 50 MHz memory 135 MHz
07: core 202 MHz memory 324 MHz
0f: core 672 MHz memory 800 MHz
--: core 0 MHz memory 0 MHz *

# echo &quot;0f&quot; &gt; /sys/class/drm/card0/device/pstate=20
bash: echo: erreur d'=C3=A9criture : Fonction non implant=C3=A9e

It means in English:
bash: echo: write error : Function not implemented

Am I doing anything wrong ?

I'm on ArchLinux.
linux-mainline 3.13rc1-1
nouveau-dri 9.2.3-2

Best regards,</pre>
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

--1385390085.7C7C30.24563--

--===============1166465103==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1166465103==--
