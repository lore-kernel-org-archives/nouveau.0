From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80942] New: NV4E - regular system crash with nouveau
	driver
Date: Sat, 05 Jul 2014 11:42:37 +0000
Message-ID: <bug-80942-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1582147535=="
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


--===============1582147535==
Content-Type: multipart/alternative; boundary="1404560557.CFDCF1.19202"; charset="us-ascii"


--1404560557.CFDCF1.19202
Date: Sat, 5 Jul 2014 11:42:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D80942

          Priority: medium
            Bug ID: 80942
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: NV4E - regular system crash with nouveau driver
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: b.torremans-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 102296
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D102296&action=3Dedit
kernel log

I'm experiencing regular system crashes with the nouveau driver.

System info :

Host/Kernel/OS  "siduxbox" running Linux 3.15-2.slh.6-aptosid-amd64 x86_64 [
sidux 2008-01 =CE=9D=CF=85=CE=BE - kde-full - (200804120109) ]
CPU Info        2x AMD Athlon 64 X2 Dual-Core TK-53 256 KB cache flags( sse=
3 ht
nx lm svm ) clocked at [ 800.000 MHz ]
Videocard       NVIDIA C51 [GeForce Go 6100]     [  ]
Network cards   NVIDIA MCP51
                PCI device 0x4243:0x4311
Processes 146 | Uptime 3:34 | Memory 707.2/1754.4MB | HDD ST9120822AS,MHW20=
80BH
Size 200GB (65%used) | Client Shell | Infobash v3.47

This system has been running with nouveau for years, but the last month i'm
experiencing regular system crashes.
Alt+SysRq sequence doesn't help to get out of it most of the time.

In attachment you have the kernel log of 3 crashes this morning.

Any idea how to solve this ?

Thanks

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1404560557.CFDCF1.19202
Date: Sat, 5 Jul 2014 11:42:37 +0000
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
   title=3D"NEW --- - NV4E - regular system crash with nouveau driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D80942">80942</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NV4E - regular system crash with nouveau driver
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
          <td>b.torremans&#64;gmail.com
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D102296=
" name=3D"attach_102296" title=3D"kernel log">attachment 102296</a> <a href=
=3D"attachment.cgi?id=3D102296&amp;action=3Dedit" title=3D"kernel log">[det=
ails]</a></span>
kernel log

I'm experiencing regular system crashes with the nouveau driver.

System info :

Host/Kernel/OS  &quot;siduxbox&quot; running Linux 3.15-2.slh.6-aptosid-amd=
64 x86_64 [
sidux 2008-01 =CE=9D=CF=85=CE=BE - kde-full - (200804120109) ]
CPU Info        2x AMD Athlon 64 X2 Dual-Core TK-53 256 KB cache flags( sse=
3 ht
nx lm svm ) clocked at [ 800.000 MHz ]
Videocard       NVIDIA C51 [GeForce Go 6100]     [  ]
Network cards   NVIDIA MCP51
                PCI device 0x4243:0x4311
Processes 146 | Uptime 3:34 | Memory 707.2/1754.4MB | HDD ST9120822AS,MHW20=
80BH
Size 200GB (65%used) | Client Shell | Infobash v3.47

This system has been running with nouveau for years, but the last month i'm
experiencing regular system crashes.
Alt+SysRq sequence doesn't help to get out of it most of the time.

In attachment you have the kernel log of 3 crashes this morning.

Any idea how to solve this ?

Thanks</pre>
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

--1404560557.CFDCF1.19202--

--===============1582147535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1582147535==--
