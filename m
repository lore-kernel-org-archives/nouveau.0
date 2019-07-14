From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111128] New: Impossible to change pstate on GT610M
Date: Sun, 14 Jul 2019 15:20:48 +0000
Message-ID: <bug-111128-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2033180527=="
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


--===============2033180527==
Content-Type: multipart/alternative; boundary="15631176480.79d761bcD.21960"
Content-Transfer-Encoding: 7bit


--15631176480.79d761bcD.21960
Date: Sun, 14 Jul 2019 15:20:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111128

            Bug ID: 111128
           Summary: Impossible to change pstate on GT610M
           Product: Mesa
           Version: 19.1
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: gzgagz-ig2FU/hGoaU@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Hello,
I have an asus UX32VD, with a GT610M inside, which works with the Optimus
architecture, handle by PRIME. The bug is currently with the kernel 5.2.0, =
but
it have always been like that as far as I remember.

uname -a :
Linux ga-laptop 5.2.0-arch2-1-ARCH #1 SMP PREEMPT Mon Jul 8 18:18:54 UTC 20=
19
x86_64 GNU/Linux

lspci :
01:00.0 3D controller: NVIDIA Corporation GF117M [GeForce 610M/710M/810M/82=
0M /
GT 620M/625M/630M/720M] (rev a1)

While it is not in use, nouveau shutdown the chipset as expected :
cat /sys/kernel/debug/dri/1/pstate
07: core 270 MHz memory 405 MHz
0f: core 625 MHz memory 900 MHz
DC: core 0 MHz memory 0 MHz

While an app is launched with DRI_PRIME=3D1, we can see that the chipset is=
 set
to 07 :
DRI_PRIME=3D1 glxgears &
cat /sys/kernel/debug/dri/1/pstate
07: core 270 MHz memory 405 MHz
0f: core 625 MHz memory 900 MHz
DC: core 270 MHz memory 324 MHz

But when I tried to reclock, I have an error :
echo 0f > /sys/kernel/debug/dri/1/pstate
-bash: echo: write error: Function not implemented

And I have this in dmesg:
[  351.283183] nouveau 0000:01:00.0: bus: MMIO write of ffff8c1f FAULT at
6013d4 [ IBUS ]
[  458.362570] nouveau 0000:01:00.0: bus: MMIO write of 0000001f FAULT at
6013d4 [ IBUS ]

Thanks

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15631176480.79d761bcD.21960
Date: Sun, 14 Jul 2019 15:20:48 +0000
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
   title=3D"NEW - Impossible to change pstate on GT610M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111128">111128</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Impossible to change pstate on GT610M
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>19.1
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
          <td>normal
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
          <td>gzgagz&#64;zoho.eu
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hello,
I have an asus UX32VD, with a GT610M inside, which works with the Optimus
architecture, handle by PRIME. The bug is currently with the kernel 5.2.0, =
but
it have always been like that as far as I remember.

uname -a :
Linux ga-laptop 5.2.0-arch2-1-ARCH #1 SMP PREEMPT Mon Jul 8 18:18:54 UTC 20=
19
x86_64 GNU/Linux

lspci :
01:00.0 3D controller: NVIDIA Corporation GF117M [GeForce 610M/710M/810M/82=
0M /
GT 620M/625M/630M/720M] (rev a1)

While it is not in use, nouveau shutdown the chipset as expected :
cat /sys/kernel/debug/dri/1/pstate
07: core 270 MHz memory 405 MHz
0f: core 625 MHz memory 900 MHz
DC: core 0 MHz memory 0 MHz

While an app is launched with DRI_PRIME=3D1, we can see that the chipset is=
 set
to 07 :
DRI_PRIME=3D1 glxgears &amp;
cat /sys/kernel/debug/dri/1/pstate
07: core 270 MHz memory 405 MHz
0f: core 625 MHz memory 900 MHz
DC: core 270 MHz memory 324 MHz

But when I tried to reclock, I have an error :
echo 0f &gt; /sys/kernel/debug/dri/1/pstate
-bash: echo: write error: Function not implemented

And I have this in dmesg:
[  351.283183] nouveau 0000:01:00.0: bus: MMIO write of ffff8c1f FAULT at
6013d4 [ IBUS ]
[  458.362570] nouveau 0000:01:00.0: bus: MMIO write of 0000001f FAULT at
6013d4 [ IBUS ]

Thanks</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15631176480.79d761bcD.21960--

--===============2033180527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============2033180527==--
