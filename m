From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77003] New: Fan speed to high with Kernel versions
 3.13.x - Nvidia GeForce GTS 240
Date: Thu, 03 Apr 2014 13:34:11 +0000
Message-ID: <bug-77003-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1325976882=="
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


--===============1325976882==
Content-Type: multipart/alternative; boundary="1396532051.AC8Dcbd1.18830"; charset="us-ascii"


--1396532051.AC8Dcbd1.18830
Date: Thu, 3 Apr 2014 13:34:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D77003

          Priority: medium
            Bug ID: 77003
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Fan speed to high with Kernel versions 3.13.x - Nvidia
                    GeForce GTS 240
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: the.ant-hi6Y0CQ0nG0@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 96850
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D96850&action=3Dedit
Kernel_log

Since Kernel 3.13.x the fan speed of my NVIDIA GeForce GTS240 is much too h=
igh.

Output from sensors:
...
nouveau-pci-0100
Adapter: PCI adapter
fan1:        6693 RPM
temp1:        +69.0=C2=B0C  (high =3D +95.0=C2=B0C, hyst =3D  +3.0=C2=B0C)
                       (crit =3D +105.0=C2=B0C, hyst =3D  +5.0=C2=B0C)
                       (emerg =3D +135.0=C2=B0C, hyst =3D  +5.0=C2=B0C)
...

With any kernel version below, i.e. Kernel 3.12.9 everything is fine. Fan s=
peed
around 5000 RPM.=20

First I thought it could be related to
https://bugzilla.kernel.org/show_bug.cgi?id=3D71711 but Guenter Roeck recom=
mended
to open a bug report against Nouveau:

" ... Looks like Nouveau fan control does not work. No idea what may be cau=
sing
this ...
well, possibly. There are two suspicious commits between 3.12 and 3.13.
Maybe the "remove everything" commit has undesirable side effects.

eec9901 drm/nouveau/hwmon: fix compilation without CONFIG_HWMON
b9ed919 drm/nouveau/drm/pm: remove everything except the hwmon interfaces to
THERM
..."

Thank you,
Roman

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1396532051.AC8Dcbd1.18830
Date: Thu, 3 Apr 2014 13:34:11 +0000
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
   title=3D"NEW --- - Fan speed to high with Kernel versions 3.13.x - Nvidi=
a GeForce GTS 240"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D77003">77003</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Fan speed to high with Kernel versions 3.13.x - Nvidia GeForc=
e GTS 240
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
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
          <td>the.ant&#64;gmx.net
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D96850"=
 name=3D"attach_96850" title=3D"Kernel_log">attachment 96850</a> <a href=3D=
"attachment.cgi?id=3D96850&amp;action=3Dedit" title=3D"Kernel_log">[details=
]</a></span>
Kernel_log

Since Kernel 3.13.x the fan speed of my NVIDIA GeForce GTS240 is much too h=
igh.

Output from sensors:
...
nouveau-pci-0100
Adapter: PCI adapter
fan1:        6693 RPM
temp1:        +69.0=C2=B0C  (high =3D +95.0=C2=B0C, hyst =3D  +3.0=C2=B0C)
                       (crit =3D +105.0=C2=B0C, hyst =3D  +5.0=C2=B0C)
                       (emerg =3D +135.0=C2=B0C, hyst =3D  +5.0=C2=B0C)
...

With any kernel version below, i.e. Kernel 3.12.9 everything is fine. Fan s=
peed
around 5000 RPM.=20

First I thought it could be related to
<a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D71711">https://bug=
zilla.kernel.org/show_bug.cgi?id=3D71711</a> but Guenter Roeck recommended
to open a bug report against Nouveau:

&quot; ... Looks like Nouveau fan control does not work. No idea what may b=
e causing
this ...
well, possibly. There are two suspicious commits between 3.12 and 3.13.
Maybe the &quot;remove everything&quot; commit has undesirable side effects.

eec9901 drm/nouveau/hwmon: fix compilation without CONFIG_HWMON
b9ed919 drm/nouveau/drm/pm: remove everything except the hwmon interfaces to
THERM
...&quot;

Thank you,
Roman</pre>
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

--1396532051.AC8Dcbd1.18830--

--===============1325976882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1325976882==--
