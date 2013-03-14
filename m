From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62351] New: Segfault in nouveau_dri.so
Date: Thu, 14 Mar 2013 19:17:59 +0000
Message-ID: <bug-62351-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0517750445=="
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


--===============0517750445==
Content-Type: multipart/alternative; boundary="1363288679.FAcC8C850.24050"; charset="us-ascii"


--1363288679.FAcC8C850.24050
Date: Thu, 14 Mar 2013 19:17:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D62351

          Priority: medium
            Bug ID: 62351
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Segfault in nouveau_dri.so
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: sune-6pRy+okvdpRg9hUCZPvPmw@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Drivers/DRI/nouveau
           Product: Mesa

Using xorg-edgers PPA on ubuntu 12.10 but with newer vanilla kernel, I
consistently get the following when attempting to start the DE Cinnamon as =
well
as Gnome 3 upon which it is based:

cinnamon[4414]: segfault at 1 ip 00007f0bf3d24f95 sp 00007fffac52e440 error=
 4
in nouveau_dri.so[7f0bf3cb6000+143000]

According to dpkg, the version is git20130227.

Card is a NVIDIA Corporation G92 [GeForce 9800 GT] (rev a2)

Please advise as to how I can provide more info and possibly test patches.

Best regards,

Sune M=C3=B8lgaard

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1363288679.FAcC8C850.24050
Date: Thu, 14 Mar 2013 19:17:59 +0000
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
   title=3D"NEW --- - Segfault in nouveau_dri.so"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D62351">62351</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Segfault in nouveau_dri.so
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>sune&#64;molgaard.org
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
        <pre>Using xorg-edgers PPA on ubuntu 12.10 but with newer vanilla k=
ernel, I
consistently get the following when attempting to start the DE Cinnamon as =
well
as Gnome 3 upon which it is based:

cinnamon[4414]: segfault at 1 ip 00007f0bf3d24f95 sp 00007fffac52e440 error=
 4
in nouveau_dri.so[7f0bf3cb6000+143000]

According to dpkg, the version is git20130227.

Card is a NVIDIA Corporation G92 [GeForce 9800 GT] (rev a2)

Please advise as to how I can provide more info and possibly test patches.

Best regards,

Sune M=C3=B8lgaard</pre>
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

--1363288679.FAcC8C850.24050--

--===============0517750445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0517750445==--
