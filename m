From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78106] New: Reported fan rpm is twice the actual
	value (NVC0)
Date: Wed, 30 Apr 2014 09:02:55 +0000
Message-ID: <bug-78106-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0093679370=="
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


--===============0093679370==
Content-Type: multipart/alternative; boundary="1398848575.4DadBB11.31121"; charset="us-ascii"


--1398848575.4DadBB11.31121
Date: Wed, 30 Apr 2014 09:02:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D78106

          Priority: medium
            Bug ID: 78106
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Reported fan rpm is twice the actual value (NVC0)
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: mdop-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 98224
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D98224&action=3Dedit
Kernel log

I have Gigabyte GTX 560 Ti Ultra Durable (01:00.0 VGA compatible controller:
NVIDIA Corporation GF114 [GeForce GTX 560 Ti] (rev a1)) and Nouveau doesn't
report correct fan speed. Reported value is exactly twice the actual speed.=
=20

$ pacman -Q | grep nouveau
nouveau-dri 10.1.1-2
xf86-video-nouveau 1.0.10-2
$ sensors
...
nouveau-pci-0100
Adapter: PCI adapter
fan1:        6840 RPM
temp1:        +31.0=C2=B0C  (high =3D +95.0=C2=B0C, hyst =3D  +3.0=C2=B0C)
                       (crit =3D +105.0=C2=B0C, hyst =3D  +5.0=C2=B0C)
                       (emerg =3D +135.0=C2=B0C, hyst =3D  +5.0=C2=B0C)
...

When I follow Documentation/thermal/nouveau_thermal and the speed to 100%,
nouveau reports "fan1: 6840 RPM" while the highest reported RPM by Windows
(both Gigabyte tools and CPU-Z) is 3390 or 3420 RPM. Similar to when I set =
the
lowest speed (I have modified bios and my pwm1_min is 30) nouveau reports
"fan1: 3180 RPM" while Windows shows 1560 or 1590 RPM.
Could that be because the card has two physical fans? Reporting the speed of
single fan would make more sense IMHO.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1398848575.4DadBB11.31121
Date: Wed, 30 Apr 2014 09:02:55 +0000
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
   title=3D"NEW --- - Reported fan rpm is twice the actual value (NVC0)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D78106">78106</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Reported fan rpm is twice the actual value (NVC0)
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
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>mdop&#64;seznam.cz
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D98224"=
 name=3D"attach_98224" title=3D"Kernel log">attachment 98224</a> <a href=3D=
"attachment.cgi?id=3D98224&amp;action=3Dedit" title=3D"Kernel log">[details=
]</a></span>
Kernel log

I have Gigabyte GTX 560 Ti Ultra Durable (01:00.0 VGA compatible controller:
NVIDIA Corporation GF114 [GeForce GTX 560 Ti] (rev a1)) and Nouveau doesn't
report correct fan speed. Reported value is exactly twice the actual speed.=
=20

$ pacman -Q | grep nouveau
nouveau-dri 10.1.1-2
xf86-video-nouveau 1.0.10-2
$ sensors
...
nouveau-pci-0100
Adapter: PCI adapter
fan1:        6840 RPM
temp1:        +31.0=C2=B0C  (high =3D +95.0=C2=B0C, hyst =3D  +3.0=C2=B0C)
                       (crit =3D +105.0=C2=B0C, hyst =3D  +5.0=C2=B0C)
                       (emerg =3D +135.0=C2=B0C, hyst =3D  +5.0=C2=B0C)
...

When I follow Documentation/thermal/nouveau_thermal and the speed to 100%,
nouveau reports &quot;fan1: 6840 RPM&quot; while the highest reported RPM b=
y Windows
(both Gigabyte tools and CPU-Z) is 3390 or 3420 RPM. Similar to when I set =
the
lowest speed (I have modified bios and my pwm1_min is 30) nouveau reports
&quot;fan1: 3180 RPM&quot; while Windows shows 1560 or 1590 RPM.
Could that be because the card has two physical fans? Reporting the speed of
single fan would make more sense IMHO.</pre>
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

--1398848575.4DadBB11.31121--

--===============0093679370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0093679370==--
