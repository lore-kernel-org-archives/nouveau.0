From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66366] New: Laptop with Nvidia GPU is hot while
 using xserver-xorg-video-nouveau driver
Date: Sat, 29 Jun 2013 15:28:00 +0000
Message-ID: <bug-66366-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1410415914=="
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


--===============1410415914==
Content-Type: multipart/alternative; boundary="1372519681.48f61.24640"; charset="us-ascii"


--1372519681.48f61.24640
Date: Sat, 29 Jun 2013 15:28:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D66366

          Priority: medium
            Bug ID: 66366
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Laptop with Nvidia GPU is hot while using
                    xserver-xorg-video-nouveau driver
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: nrbrtx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

I have Sony VAIO F13Z1R laptop with GeForce GT 425M.
Under all versions of Ubuntu (12.04+) it is hot, while using
xserver-xorg-video-nouveau driver.

> sensors
acpitz-virtual-0
Adapter: Virtual device
temp1: +70.0=C2=B0C (crit =3D +98.0=C2=B0C)
temp2: +70.0=C2=B0C (crit =3D +98.0=C2=B0C)

nouveau-pci-0100
Adapter: PCI adapter
temp1: +70.0=C2=B0C (high =3D +95.0=C2=B0C, hyst =3D +3.0=C2=B0C)
                       (crit =3D +105.0=C2=B0C, hyst =3D +5.0=C2=B0C)
                       (emerg =3D +135.0=C2=B0C, hyst =3D +5.0=C2=B0C)

coretemp-isa-0000
Adapter: ISA adapter
Core 0: +70.0=C2=B0C (high =3D +84.0=C2=B0C, crit =3D +100.0=C2=B0C)
Core 1: +70.0=C2=B0C (high =3D +84.0=C2=B0C, crit =3D +100.0=C2=B0C)
Core 2: +70.0=C2=B0C (high =3D +84.0=C2=B0C, crit =3D +100.0=C2=B0C)
Core 3: +70.0=C2=B0C (high =3D +84.0=C2=B0C, crit =3D +100.0=C2=B0C)


For logs see
https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/1=
196049.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1372519681.48f61.24640
Date: Sat, 29 Jun 2013 15:28:01 +0000
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
   title=3D"NEW --- - Laptop with Nvidia GPU is hot while using xserver-xor=
g-video-nouveau driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D66366">66366</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Laptop with Nvidia GPU is hot while using xserver-xorg-video-=
nouveau driver
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
          <td>nrbrtx&#64;gmail.com
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
        <pre>I have Sony VAIO F13Z1R laptop with GeForce GT 425M.
Under all versions of Ubuntu (12.04+) it is hot, while using
xserver-xorg-video-nouveau driver.

<span class=3D"quote">&gt; sensors</span >
acpitz-virtual-0
Adapter: Virtual device
temp1: +70.0=C2=B0C (crit =3D +98.0=C2=B0C)
temp2: +70.0=C2=B0C (crit =3D +98.0=C2=B0C)

nouveau-pci-0100
Adapter: PCI adapter
temp1: +70.0=C2=B0C (high =3D +95.0=C2=B0C, hyst =3D +3.0=C2=B0C)
                       (crit =3D +105.0=C2=B0C, hyst =3D +5.0=C2=B0C)
                       (emerg =3D +135.0=C2=B0C, hyst =3D +5.0=C2=B0C)

coretemp-isa-0000
Adapter: ISA adapter
Core 0: +70.0=C2=B0C (high =3D +84.0=C2=B0C, crit =3D +100.0=C2=B0C)
Core 1: +70.0=C2=B0C (high =3D +84.0=C2=B0C, crit =3D +100.0=C2=B0C)
Core 2: +70.0=C2=B0C (high =3D +84.0=C2=B0C, crit =3D +100.0=C2=B0C)
Core 3: +70.0=C2=B0C (high =3D +84.0=C2=B0C, crit =3D +100.0=C2=B0C)


For logs see
<a href=3D"https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nou=
veau/+bug/1196049">https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-v=
ideo-nouveau/+bug/1196049</a>.</pre>
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

--1372519681.48f61.24640--

--===============1410415914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1410415914==--
