From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92274] New: nouveau black screen and errors with two
 monitors attached
Date: Sun, 04 Oct 2015 13:27:40 +0000
Message-ID: <bug-92274-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0786284393=="
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


--===============0786284393==
Content-Type: multipart/alternative; boundary="1443965260.3EBeCC4D1.10836"; charset="UTF-8"


--1443965260.3EBeCC4D1.10836
Date: Sun, 4 Oct 2015 13:27:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92274

            Bug ID: 92274
           Summary: nouveau black screen and errors with two monitors
                    attached
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: joseph-thommes-Mmb7MZpHnFY@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Hello,
I switched from the proprietary nvidia-drivers to nouveau under Gentoo.
I use a Dual-Monitor Setup: one is connected to the DVI-I and the other one to
the HDMI output of my Nvidia GTX 770.
Under my Manjaro installation I use the proprietary driver and everything
works;
under Gentoo everything was fine with the nvidia-drivers, too.
Now I can boot without errors into Gentoo when only one of the monitors is
connected, no matter which one.
However, when both monitors are attached to the graphics card,
I cannot access a tty or my graphical login manger:
the screens turn off showing "no input signal".
Me not being able to access my Gentoo installation by booting into it when the
error happens,
I chrooted into it and used cat /var/log/dmesg.
I know that this is not what the nouveau reporting guide suggests for obtaining
a kernel log,
but if I run dmesg from my chrooted environment I obviously get the kernel log
of my Manjaro boot.
If there is another better way for obtaining the kernel log, please let me
know.

VBIOS is following in a few minutes.

If there is anything else missing, let me know.

lspci | grep VGA
01:00.0 VGA compatible controller: NVIDIA Corporation GK104 [GeForce GTX 770]
(rev a1)

kernel version: x86-64 4.0.5-linux-gentoo
nouveau version: x11-drivers/xf86-video-nouveau-1.0.11
libdrm version: x11-libs/libdrm-2.4.59
mesa version: media-libs/mesa-10.3.7-r1
X server: x11-base/xorg-server-1.16.4

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1443965260.3EBeCC4D1.10836
Date: Sun, 4 Oct 2015 13:27:40 +0000
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
   title="NEW - nouveau black screen and errors with two monitors attached"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92274">92274</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau black screen and errors with two monitors attached
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
          <td>joseph-thommes&#64;gmx.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hello,
I switched from the proprietary nvidia-drivers to nouveau under Gentoo.
I use a Dual-Monitor Setup: one is connected to the DVI-I and the other one to
the HDMI output of my Nvidia GTX 770.
Under my Manjaro installation I use the proprietary driver and everything
works;
under Gentoo everything was fine with the nvidia-drivers, too.
Now I can boot without errors into Gentoo when only one of the monitors is
connected, no matter which one.
However, when both monitors are attached to the graphics card,
I cannot access a tty or my graphical login manger:
the screens turn off showing &quot;no input signal&quot;.
Me not being able to access my Gentoo installation by booting into it when the
error happens,
I chrooted into it and used cat /var/log/dmesg.
I know that this is not what the nouveau reporting guide suggests for obtaining
a kernel log,
but if I run dmesg from my chrooted environment I obviously get the kernel log
of my Manjaro boot.
If there is another better way for obtaining the kernel log, please let me
know.

VBIOS is following in a few minutes.

If there is anything else missing, let me know.

lspci | grep VGA
01:00.0 VGA compatible controller: NVIDIA Corporation GK104 [GeForce GTX 770]
(rev a1)

kernel version: x86-64 4.0.5-linux-gentoo
nouveau version: x11-drivers/xf86-video-nouveau-1.0.11
libdrm version: x11-libs/libdrm-2.4.59
mesa version: media-libs/mesa-10.3.7-r1
X server: x11-base/xorg-server-1.16.4</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1443965260.3EBeCC4D1.10836--

--===============0786284393==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0786284393==--
