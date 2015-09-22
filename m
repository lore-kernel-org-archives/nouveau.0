From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92077] New: nouveau graphics freeze when using KDE
 Plasma 5; PGR engine fault
Date: Tue, 22 Sep 2015 17:54:10 +0000
Message-ID: <bug-92077-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0341083175=="
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


--===============0341083175==
Content-Type: multipart/alternative; boundary="1442944450.36AA2d6c0.20336"; charset="UTF-8"


--1442944450.36AA2d6c0.20336
Date: Tue, 22 Sep 2015 17:54:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92077

            Bug ID: 92077
           Summary: nouveau graphics freeze when using KDE Plasma 5; PGR
                    engine fault
           Product: Mesa
           Version: 10.3
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: gentoo-5cK0ikVjkE4@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

I upgraded KDE to Plasma-workspaces version 5. (Gentoo system)
Now, sometimes when my system has been idle for a while, it appears
"unresponsive" when I come back (screen doesn't wake up on mouse, mouse pointer
doesn't work if I switch off screen sleep, no reaction to any keys, etc.). The
system doesn't crash, but the nouveau graphics output does, and I cannot reach
a console using the keyboard, either.

I found the below output in /var/log/messages (a number of instances of
observing the bug; ... indicates that I had to restart the system).

Versions used:
x11-drivers/xf86-video-nouveau-1.0.11
x11-base/xorg-server-1.16.4
media-libs/mesa-10.3.7-r1
x11-libs/libdrm-2.4.59
x11-base/xorg-drivers-1.16
Kernel: 4.0.5 (self-compiled)

I filed a bug against Plasma 5 but I'm not sure if it's their bug. See
https://bugs.kde.org/show_bug.cgi?id=352605

I also have an apitrace record of plasmashell, replaying which (like a mini
film) also freezes the nouveau. But it's a rather large file (1.4 GB) and
contains private photos.

From /var/log/messages:

Sep  6 16:31:09 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] read fault
at 0x0004042000 [PTE] from GR/GPC0/T1_1 on channel 0x0
03f7af000 [plasmashell[6790]]
Sep  6 16:31:09 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] PGR engine
fault on channel 10, recovering...
Sep  6 16:33:20 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] read fault
at 0x0000023000 [PTE] from PBDMA0/HOST_CPU on channel 
0x003fbe0000 [unknown]
[...]
Sep  7 23:30:25 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] write fault
at 0x0003d49000 [PTE] from GR/GPC0/PROP_0 on channel 
0x003f8ef000 [plasmashell[19341]]
Sep  7 23:30:25 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] PGR engine
fault on channel 8, recovering...
[...]
Sep  8 23:21:29 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] write fault
at 0x0003e02000 [PTE] from GR/GPC0/PROP_0 on channel 
0x003f8ef000 [plasmashell[4952]]
Sep  8 23:21:29 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] PGR engine
fault on channel 8, recovering...
[...]
Sep 10 02:00:03 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] read fault
at 0x0001740000 [PTE] from GR/GPC0/T1_0 on channel 0x0
03f8ef000 [plasmashell[4709]]
Sep 10 02:00:03 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] PGR engine
fault on channel 8, recovering...
[...]
Sep 11 03:07:57 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] read fault
at 0x0003508000 [PTE] from GR/GPC0/T1_0 on channel 0x0
03f84f000 [plasmashell[6720]]
Sep 11 03:07:57 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] PGR engine
fault on channel 9, recovering...
[...]
Sep 12 00:19:50 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] write fault
at 0x0003ef5000 [PTE] from GR/GPC0/PROP_0 on channel 
0x003facd000 [plasmashell[20804]]
Sep 12 00:19:50 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] PGR engine
fault on channel 5, recovering...

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1442944450.36AA2d6c0.20336
Date: Tue, 22 Sep 2015 17:54:10 +0000
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
   title="NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engine fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92077">92077</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau graphics freeze when using KDE Plasma 5; PGR engine fault
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>10.3
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
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
          <td>gentoo&#64;moin.fi
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I upgraded KDE to Plasma-workspaces version 5. (Gentoo system)
Now, sometimes when my system has been idle for a while, it appears
&quot;unresponsive&quot; when I come back (screen doesn't wake up on mouse, mouse pointer
doesn't work if I switch off screen sleep, no reaction to any keys, etc.). The
system doesn't crash, but the nouveau graphics output does, and I cannot reach
a console using the keyboard, either.

I found the below output in /var/log/messages (a number of instances of
observing the bug; ... indicates that I had to restart the system).

Versions used:
x11-drivers/xf86-video-nouveau-1.0.11
x11-base/xorg-server-1.16.4
media-libs/mesa-10.3.7-r1
x11-libs/libdrm-2.4.59
x11-base/xorg-drivers-1.16
Kernel: 4.0.5 (self-compiled)

I filed a bug against Plasma 5 but I'm not sure if it's their bug. See
<a href="https://bugs.kde.org/show_bug.cgi?id=352605">https://bugs.kde.org/show_bug.cgi?id=352605</a>

I also have an apitrace record of plasmashell, replaying which (like a mini
film) also freezes the nouveau. But it's a rather large file (1.4 GB) and
contains private photos.

From /var/log/messages:

Sep  6 16:31:09 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] read fault
at 0x0004042000 [PTE] from GR/GPC0/T1_1 on channel 0x0
03f7af000 [plasmashell[6790]]
Sep  6 16:31:09 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] PGR engine
fault on channel 10, recovering...
Sep  6 16:33:20 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] read fault
at 0x0000023000 [PTE] from PBDMA0/HOST_CPU on channel 
0x003fbe0000 [unknown]
[...]
Sep  7 23:30:25 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] write fault
at 0x0003d49000 [PTE] from GR/GPC0/PROP_0 on channel 
0x003f8ef000 [plasmashell[19341]]
Sep  7 23:30:25 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] PGR engine
fault on channel 8, recovering...
[...]
Sep  8 23:21:29 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] write fault
at 0x0003e02000 [PTE] from GR/GPC0/PROP_0 on channel 
0x003f8ef000 [plasmashell[4952]]
Sep  8 23:21:29 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] PGR engine
fault on channel 8, recovering...
[...]
Sep 10 02:00:03 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] read fault
at 0x0001740000 [PTE] from GR/GPC0/T1_0 on channel 0x0
03f8ef000 [plasmashell[4709]]
Sep 10 02:00:03 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] PGR engine
fault on channel 8, recovering...
[...]
Sep 11 03:07:57 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] read fault
at 0x0003508000 [PTE] from GR/GPC0/T1_0 on channel 0x0
03f84f000 [plasmashell[6720]]
Sep 11 03:07:57 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] PGR engine
fault on channel 9, recovering...
[...]
Sep 12 00:19:50 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] write fault
at 0x0003ef5000 [PTE] from GR/GPC0/PROP_0 on channel 
0x003facd000 [plasmashell[20804]]
Sep 12 00:19:50 localhost kernel: nouveau E[   PFIFO][0000:02:00.0] PGR engine
fault on channel 5, recovering...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1442944450.36AA2d6c0.20336--

--===============0341083175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0341083175==--
