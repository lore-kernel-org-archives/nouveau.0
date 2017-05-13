From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101027] New: Monitor goes black (gpu fans running
 even system does nothing) only system reset helps
Date: Sat, 13 May 2017 00:12:28 +0000
Message-ID: <bug-101027-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0953549641=="
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


--===============0953549641==
Content-Type: multipart/alternative; boundary="14946343481.9ed0B9.31199";
 charset="UTF-8"


--14946343481.9ed0B9.31199
Date: Sat, 13 May 2017 00:12:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101027

            Bug ID: 101027
           Summary: Monitor goes black (gpu fans running even system does
                    nothing) only system reset helps
           Product: xorg
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: mail-3q2wXJgvQBgtTFl30EOYJwC/G2K4zDHf@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Hi,
I am using the nouveau driver because its really great, even better than the
official ndivida driver. i get better rendering results with nouveau than w=
ith
the original nvidia driver what is a shame for nvidia, but thats another to=
pic.

The only problem that I have currently is that nouveau leads to make my mon=
itor
goes off randomly and only a complete system reset helps me out. I have tes=
ted
with another laptop and the same monitor, I didnt see the same problem. Als=
o I
have changed the port and the cable, so that I guess its not the cable eith=
er.

I have tested with the original nvidia linux driver and I didnt see the mon=
itor
going off again. So I guess its because of nouveau. When my monitor goes of=
f I
see also the gpu fans runs in full speed what is strange because the system=
 is
not running any gpu related apps.

my system configuration:=20

$ lspci | grep -i vga
01:00.0 VGA compatible controller: NVIDIA Corporation GP104 [GeForce GTX 10=
80]
(rev a1)

$ uname -a
Linux rs.com 4.10.13-1-ARCH #1 SMP PREEMPT Thu Apr 27 12:15:09 CEST 2017 x8=
6_64
GNU/Linux

My monitor is the Asus Curved PG348Q ROG

I get also strange entires in the bootlog. My monitor went off recently so =
that
I post a log before the monitor went off and the second log is after the
monitor went off (after a system reset). Hope this can help somehow.

FIRST LOG (BEFORE MONITOR WENT BLACK)
https://ptpb.pw/xI8k

AFTER SYSTEM RESET:
https://ptpb.pw/-m9c

I would really like to find a solution as soon as possible coz it blocks my
work.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14946343481.9ed0B9.31199
Date: Sat, 13 May 2017 00:12:28 +0000
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
   title=3D"NEW - Monitor goes black (gpu fans running even system does not=
hing) only system reset helps"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101027">101027</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Monitor goes black (gpu fans running even system does nothing=
) only system reset helps
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>critical
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>mail&#64;rudolfschmidt.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hi,
I am using the nouveau driver because its really great, even better than the
official ndivida driver. i get better rendering results with nouveau than w=
ith
the original nvidia driver what is a shame for nvidia, but thats another to=
pic.

The only problem that I have currently is that nouveau leads to make my mon=
itor
goes off randomly and only a complete system reset helps me out. I have tes=
ted
with another laptop and the same monitor, I didnt see the same problem. Als=
o I
have changed the port and the cable, so that I guess its not the cable eith=
er.

I have tested with the original nvidia linux driver and I didnt see the mon=
itor
going off again. So I guess its because of nouveau. When my monitor goes of=
f I
see also the gpu fans runs in full speed what is strange because the system=
 is
not running any gpu related apps.

my system configuration:=20

$ lspci | grep -i vga
01:00.0 VGA compatible controller: NVIDIA Corporation GP104 [GeForce GTX 10=
80]
(rev a1)

$ uname -a
Linux rs.com 4.10.13-1-ARCH #1 SMP PREEMPT Thu Apr 27 12:15:09 CEST 2017 x8=
6_64
GNU/Linux

My monitor is the Asus Curved PG348Q ROG

I get also strange entires in the bootlog. My monitor went off recently so =
that
I post a log before the monitor went off and the second log is after the
monitor went off (after a system reset). Hope this can help somehow.

FIRST LOG (BEFORE MONITOR WENT BLACK)
<a href=3D"https://ptpb.pw/xI8k">https://ptpb.pw/xI8k</a>

AFTER SYSTEM RESET:
<a href=3D"https://ptpb.pw/-m9c">https://ptpb.pw/-m9c</a>

I would really like to find a solution as soon as possible coz it blocks my
work.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14946343481.9ed0B9.31199--

--===============0953549641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0953549641==--
