From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70390] New: G84: Repeated system crashes under
 graphics load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]
Date: Fri, 11 Oct 2013 20:33:33 +0000
Message-ID: <bug-70390-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1376118947=="
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


--===============1376118947==
Content-Type: multipart/alternative; boundary="1381523613.7fEeb2c1.2170"; charset="us-ascii"


--1381523613.7fEeb2c1.2170
Date: Fri, 11 Oct 2013 20:33:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D70390

          Priority: medium
            Bug ID: 70390
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: G84: Repeated system crashes under graphics load,
                    E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: Martin.vGagern-hi6Y0CQ0nG0@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 87485
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D87485&action=3Dedit
nouveau error lines in kernel log for three incidents

This is taking my bug usptream from the distro level bug I first filed at
https://bugs.gentoo.org/show_bug.cgi?id=3D487656

I've encountered several system crashes in relation to nouveau and graphics
work lately. Most notably three crashes in the past few days, with kernel
version 3.11.4-gentoo. lspci reports the graphics card as
VGA compatible controller: NVIDIA Corporation G84 [GeForce 8400 GS] (rev a1)

I'm attaching an abridged version of the log files first, for a quick glanc=
e.
It is the output of =E2=80=9Cgrep -h -C1 -E '\] nouveau [^ 0]|Linux version=
'=E2=80=9D applied
to the currently available kernel logs. I can see no obious pattern there. =
I've
read that you prefer untruncated dmesg output, but since this issue causes =
my
system to reboot, calling dmesg is not an option, and since I'm reporting
several incidents, this might be a quick starting point.

The crashes themselves aren't reported as Oops, or maybe they are but the f=
ile
system is already unavailable by that time, so I don't notice. Unfortunatel=
y I
don't have a serial terminal attached for logging at all times.

I'll attach the unabridged logs shortly, but I can't even know whether these
successfully flushed all their data. I'll give a few details on each of the=
se
incidents with the corresponding unabridged log.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1381523613.7fEeb2c1.2170
Date: Fri, 11 Oct 2013 20:33:33 +0000
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
   title=3D"NEW --- - G84: Repeated system crashes under graphics load, E[P=
FIFO] DMA_PUSHER and lots of E[PGRAPH]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70390">70390</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>G84: Repeated system crashes under graphics load, E[PFIFO] DM=
A_PUSHER and lots of E[PGRAPH]
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
          <td>Martin.vGagern&#64;gmx.net
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D87485"=
 name=3D"attach_87485" title=3D"nouveau error lines in kernel log for three=
 incidents">attachment 87485</a> <a href=3D"attachment.cgi?id=3D87485&amp;a=
ction=3Dedit" title=3D"nouveau error lines in kernel log for three incident=
s">[details]</a></span>
nouveau error lines in kernel log for three incidents

This is taking my bug usptream from the distro level bug I first filed at
<a href=3D"https://bugs.gentoo.org/show_bug.cgi?id=3D487656">https://bugs.g=
entoo.org/show_bug.cgi?id=3D487656</a>

I've encountered several system crashes in relation to nouveau and graphics
work lately. Most notably three crashes in the past few days, with kernel
version 3.11.4-gentoo. lspci reports the graphics card as
VGA compatible controller: NVIDIA Corporation G84 [GeForce 8400 GS] (rev a1)

I'm attaching an abridged version of the log files first, for a quick glanc=
e.
It is the output of =E2=80=9Cgrep -h -C1 -E '\] nouveau [^ 0]|Linux version=
'=E2=80=9D applied
to the currently available kernel logs. I can see no obious pattern there. =
I've
read that you prefer untruncated dmesg output, but since this issue causes =
my
system to reboot, calling dmesg is not an option, and since I'm reporting
several incidents, this might be a quick starting point.

The crashes themselves aren't reported as Oops, or maybe they are but the f=
ile
system is already unavailable by that time, so I don't notice. Unfortunatel=
y I
don't have a serial terminal attached for logging at all times.

I'll attach the unabridged logs shortly, but I can't even know whether these
successfully flushed all their data. I'll give a few details on each of the=
se
incidents with the corresponding unabridged log.</pre>
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

--1381523613.7fEeb2c1.2170--

--===============1376118947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1376118947==--
