From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97588] New: Disconnecting/Reconnecting monitor
 results in 'laggy' graphics and disappearing mouse cursor
Date: Sat, 03 Sep 2016 21:36:52 +0000
Message-ID: <bug-97588-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2100050879=="
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


--===============2100050879==
Content-Type: multipart/alternative; boundary="14729386121.0EF29a47D.21536";
 charset="UTF-8"


--14729386121.0EF29a47D.21536
Date: Sat, 3 Sep 2016 21:36:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97588

            Bug ID: 97588
           Summary: Disconnecting/Reconnecting monitor results in 'laggy'
                    graphics and disappearing mouse cursor
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: rik-2ntFt4fPDM4@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 126188
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D126188&action=3Dedit
kernel_log

Overview:
Whenever I disconnect or reconnect my monitor via HDMI or switch systems wi=
th
my HDMI switcher, the screen seems to be laggy and my mouse cursor won't mo=
ve.
There seems to be input from the mouse as I can use the 'hidden' cursor to =
log
out and log back in which resolves the issue.

I can only describe the effect as being extremely laggy. In chrome I can see
that tabs change, however content won't show. I can type in the terminal but
only see some letters appearing (really slowly and random).

Steps to Reproduce:

1) Disconnect HDMI cable
2) Reconnect

Actual Results:
Slow and unusable screen

Expected Results:
Usable screen

Hardware:
NVIDIA Corporation GM206 [GeForce GTX 960]

Software:
Fedora 24
Kernel 4.7.2-201.fc24.x86_64

X.Org X Server 1.18.4
Release Date: 2016-07-19
X Protocol Version 11, Revision 0
Build Operating System:  4.6.4-301.fc24.x86_64=20
Current Operating System: Linux ElGuapo 4.7.2-201.fc24.x86_64 #1 SMP Fri Au=
g 26
15:58:40 UTC 2016 x86_64
Kernel command line: BOOT_IMAGE=3D/boot/vmlinuz-4.7.2-201.fc24.x86_64
root=3D/dev/mapper/fedora-root ro rd.lvm.lv=3Dfedora/root rd.lvm.lv=3Dfedor=
a/swap
rhgb quiet log_buf_len=3D1M
Build Date: 25 August 2016  05:27:31PM
Build ID: xorg-x11-server 1.18.4-4.fc24=20
Current version of pixman: 0.34.0

xorg-x11-drv-nouveau
Version     : 1.0.12
Release     : 4.fc24

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14729386121.0EF29a47D.21536
Date: Sat, 3 Sep 2016 21:36:52 +0000
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
   title=3D"NEW - Disconnecting/Reconnecting monitor results in 'laggy' gra=
phics and disappearing mouse cursor"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97588">97588</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Disconnecting/Reconnecting monitor results in 'laggy' graphic=
s and disappearing mouse cursor
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
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
          <td>rik&#64;mief.nl
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D126188=
" name=3D"attach_126188" title=3D"kernel_log">attachment 126188</a> <a href=
=3D"attachment.cgi?id=3D126188&amp;action=3Dedit" title=3D"kernel_log">[det=
ails]</a></span>
kernel_log

Overview:
Whenever I disconnect or reconnect my monitor via HDMI or switch systems wi=
th
my HDMI switcher, the screen seems to be laggy and my mouse cursor won't mo=
ve.
There seems to be input from the mouse as I can use the 'hidden' cursor to =
log
out and log back in which resolves the issue.

I can only describe the effect as being extremely laggy. In chrome I can see
that tabs change, however content won't show. I can type in the terminal but
only see some letters appearing (really slowly and random).

Steps to Reproduce:

1) Disconnect HDMI cable
2) Reconnect

Actual Results:
Slow and unusable screen

Expected Results:
Usable screen

Hardware:
NVIDIA Corporation GM206 [GeForce GTX 960]

Software:
Fedora 24
Kernel 4.7.2-201.fc24.x86_64

X.Org X Server 1.18.4
Release Date: 2016-07-19
X Protocol Version 11, Revision 0
Build Operating System:  4.6.4-301.fc24.x86_64=20
Current Operating System: Linux ElGuapo 4.7.2-201.fc24.x86_64 #1 SMP Fri Au=
g 26
15:58:40 UTC 2016 x86_64
Kernel command line: BOOT_IMAGE=3D/boot/vmlinuz-4.7.2-201.fc24.x86_64
root=3D/dev/mapper/fedora-root ro rd.lvm.lv=3Dfedora/root rd.lvm.lv=3Dfedor=
a/swap
rhgb quiet log_buf_len=3D1M
Build Date: 25 August 2016  05:27:31PM
Build ID: xorg-x11-server 1.18.4-4.fc24=20
Current version of pixman: 0.34.0

xorg-x11-drv-nouveau
Version     : 1.0.12
Release     : 4.fc24</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14729386121.0EF29a47D.21536--

--===============2100050879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2100050879==--
