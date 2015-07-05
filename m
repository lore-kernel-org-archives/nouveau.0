From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91233] New: The system hanged again
Date: Sun, 05 Jul 2015 15:42:58 +0000
Message-ID: <bug-91233-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2121005886=="
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


--===============2121005886==
Content-Type: multipart/alternative; boundary="1436110978.BFBBaA1.18523"; charset="UTF-8"


--1436110978.BFBBaA1.18523
Date: Sun, 5 Jul 2015 15:42:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91233

            Bug ID: 91233
           Summary: The system hanged again
           Product: xorg
           Version: unspecified
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: porton-Q+l+L2ir60w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

There was this bug with Nouveau:
https://bugs.freedesktop.org/show_bug.cgi?id=89842

I believe this bug was fixed.

I have updated my Debian system to libdrm-nouveau2 2.4.62-1. After this the
crashes became much less frequent.

But today my Gnome session hanged again. Only mouse was moving. Keyboard and
mouse clicks became non-functional.

I pressed Alt+Ctrl+Backspace. After this I saw partially rendered buggy screen
of GDM.

I switched to a root console. There were the following errors: (Unfortunately,
I haven't recorded the very first error.)

[66411.140012] nouveau E[gnome-session-c[12401]] failed to idle channel
0xcccc0000 [gnome-session-c[12401]]
# service gpm [66400.124711] nouveau E[gnome-session-c[12401]] failed to idle
channel 0xcccc0000 [gnome-session-c[12401]]
start
[66403.128885] nouveau E[gnome-session-c[12401]] failed to idle channel
0xcccc0000 [gnome-session-c[12401]]
[66406.133056] nouveau E[gnome-session-c[12401]] failed to idle channel
0xcccc0000 [gnome-session-c[12401]]
[66408.135863] nouveau E[   PFIFO][0000:01:00.0] channel 6
[gnome-session-c[12401]] unload timeout
victor:~# [66414.144184] nouveau E[gnome-session-c[12401]] failed to idle
channel 0xcccc0000 [gnome-session-c[12401]]
[66417.148357] nouveau E[gnome-session-c[12401]] failed to idle channel
0xcccc0000 [gnome-session-c[12401]]

libdrm-nouveau2 2.4.62-1
Linux 3.10-2-amd64
X.Org X Server 1.17.1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1436110978.BFBBaA1.18523
Date: Sun, 5 Jul 2015 15:42:58 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - The system hanged again"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91233">91233</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>The system hanged again
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
          <td>x86 (IA32)
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
          <td>major
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
          <td>porton&#64;narod.ru
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>There was this bug with Nouveau:
<a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Nvidia nouveau drivers hangs all gnome when opening the new legacy tray (and many other situations) in 3.16.0"
   href="show_bug.cgi?id=89842">https://bugs.freedesktop.org/show_bug.cgi?id=89842</a>

I believe this bug was fixed.

I have updated my Debian system to libdrm-nouveau2 2.4.62-1. After this the
crashes became much less frequent.

But today my Gnome session hanged again. Only mouse was moving. Keyboard and
mouse clicks became non-functional.

I pressed Alt+Ctrl+Backspace. After this I saw partially rendered buggy screen
of GDM.

I switched to a root console. There were the following errors: (Unfortunately,
I haven't recorded the very first error.)

[66411.140012] nouveau E[gnome-session-c[12401]] failed to idle channel
0xcccc0000 [gnome-session-c[12401]]
# service gpm [66400.124711] nouveau E[gnome-session-c[12401]] failed to idle
channel 0xcccc0000 [gnome-session-c[12401]]
start
[66403.128885] nouveau E[gnome-session-c[12401]] failed to idle channel
0xcccc0000 [gnome-session-c[12401]]
[66406.133056] nouveau E[gnome-session-c[12401]] failed to idle channel
0xcccc0000 [gnome-session-c[12401]]
[66408.135863] nouveau E[   PFIFO][0000:01:00.0] channel 6
[gnome-session-c[12401]] unload timeout
victor:~# [66414.144184] nouveau E[gnome-session-c[12401]] failed to idle
channel 0xcccc0000 [gnome-session-c[12401]]
[66417.148357] nouveau E[gnome-session-c[12401]] failed to idle channel
0xcccc0000 [gnome-session-c[12401]]

libdrm-nouveau2 2.4.62-1
Linux 3.10-2-amd64
X.Org X Server 1.17.1</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1436110978.BFBBaA1.18523--

--===============2121005886==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2121005886==--
