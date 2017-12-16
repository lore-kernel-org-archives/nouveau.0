From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104291] New: Virgl broken on current mesa (17.4+),
 with nouveau/nv50 as host
Date: Sat, 16 Dec 2017 17:14:04 +0000
Message-ID: <bug-104291-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1457404077=="
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


--===============1457404077==
Content-Type: multipart/alternative; boundary="15134444440.F0FE314.6398";
 charset="UTF-8"


--15134444440.F0FE314.6398
Date: Sat, 16 Dec 2017 17:14:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104291

            Bug ID: 104291
           Summary: Virgl broken on current mesa (17.4+), with
                    nouveau/nv50 as host
           Product: Mesa
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: randrik-JGs/UdohzUI@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Hello.

Sorry for possibly irrelevant bug report, but I just tested virgl and found=
 it
broken - glxinfo works, but glxgears or any gl program segfaults.

On both host and guest (self-assembled live DVD) I have mesa Mesa 17.4.0-de=
vel
(git-96fc5fbf23), X server 1.19.5. Host kernel - Linux slax 4.14.3-x64 #18 =
SMP
Sun Dec 3 09:13:07 MSK 2017 x86_64 AMD FX(tm)-4300 Quad-Core Processor
AuthenticAMD GNU/Linux, guest kernel - 4.12.0-x64.

Qemu - 2.11. Launch command and output:

qemu-system-x86_64 -M q35 -enable-kvm -cdrom /dev/shm/slax_16_12_2017_test.=
iso
-m 512 -display sdl,gl=3Don -soundhw es1370 -smp 4 -vga virtio -usbdevice m=
ouse
qemu-system-x86_64: -usbdevice mouse: '-usbdevice' is deprecated, please use
'-device usb-...' instead
gl_version 33 - core profile enabled

startx inside guest works, glxinfo shows virgl as renderer, but glxgears or=
 any
gl program (chromium BSU [old arcade game], glblur from xscreensavers)
segfaults.

At some point it was working better, but it was long ago .... (16.02.2016, =
to
be prescie).

I also run into assertion on qemu side, described here:=20
https://lists.gnu.org/archive/html/qemu-devel/2017-04/msg05461.html

Because I had only dvd image connected as dvd rom - nothing bad happened, b=
ut
be aware about this abort if you connect real hard disk ....

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15134444440.F0FE314.6398
Date: Sat, 16 Dec 2017 17:14:04 +0000
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
   title=3D"NEW - Virgl broken on current mesa (17.4+), with nouveau/nv50 a=
s host"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104291">104291</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Virgl broken on current mesa (17.4+), with nouveau/nv50 as ho=
st
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
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
          <td>randrik&#64;mail.ru
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hello.

Sorry for possibly irrelevant bug report, but I just tested virgl and found=
 it
broken - glxinfo works, but glxgears or any gl program segfaults.

On both host and guest (self-assembled live DVD) I have mesa Mesa 17.4.0-de=
vel
(git-96fc5fbf23), X server 1.19.5. Host kernel - Linux slax 4.14.3-x64 #18 =
SMP
Sun Dec 3 09:13:07 MSK 2017 x86_64 AMD FX(tm)-4300 Quad-Core Processor
AuthenticAMD GNU/Linux, guest kernel - 4.12.0-x64.

Qemu - 2.11. Launch command and output:

qemu-system-x86_64 -M q35 -enable-kvm -cdrom /dev/shm/slax_16_12_2017_test.=
iso
-m 512 -display sdl,gl=3Don -soundhw es1370 -smp 4 -vga virtio -usbdevice m=
ouse
qemu-system-x86_64: -usbdevice mouse: '-usbdevice' is deprecated, please use
'-device usb-...' instead
gl_version 33 - core profile enabled

startx inside guest works, glxinfo shows virgl as renderer, but glxgears or=
 any
gl program (chromium BSU [old arcade game], glblur from xscreensavers)
segfaults.

At some point it was working better, but it was long ago .... (16.02.2016, =
to
be prescie).

I also run into assertion on qemu side, described here:=20
<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2017-04/msg05461.h=
tml">https://lists.gnu.org/archive/html/qemu-devel/2017-04/msg05461.html</a>

Because I had only dvd image connected as dvd rom - nothing bad happened, b=
ut
be aware about this abort if you connect real hard disk ....</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15134444440.F0FE314.6398--

--===============1457404077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1457404077==--
