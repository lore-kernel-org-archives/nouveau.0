From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110414] New: mesa-vdpau 19.0.2 contains broken
 symlinks to libvdpau_gallium.so.1.0.0
Date: Fri, 12 Apr 2019 20:07:20 +0000
Message-ID: <bug-110414-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0334487553=="
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


--===============0334487553==
Content-Type: multipart/alternative; boundary="15550996410.A84f8d02.9876"
Content-Transfer-Encoding: 7bit


--15550996410.A84f8d02.9876
Date: Fri, 12 Apr 2019 20:07:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110414

            Bug ID: 110414
           Summary: mesa-vdpau 19.0.2 contains broken symlinks to
                    libvdpau_gallium.so.1.0.0
           Product: Mesa
           Version: 19.0
          Hardware: Other
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: glitsj16-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

OS: Arch Linux

$ pacman -Q mesa-vdpau
mesa-vdpau 19.0.2-1

$ pacman -Ql mesa-vdpau
mesa-vdpau /usr/
mesa-vdpau /usr/lib/
mesa-vdpau /usr/lib/vdpau/
mesa-vdpau /usr/lib/vdpau/libvdpau_gallium.so
mesa-vdpau /usr/lib/vdpau/libvdpau_nouveau.so
mesa-vdpau /usr/lib/vdpau/libvdpau_nouveau.so.1
mesa-vdpau /usr/lib/vdpau/libvdpau_nouveau.so.1.0
mesa-vdpau /usr/lib/vdpau/libvdpau_nouveau.so.1.0.0
mesa-vdpau /usr/lib/vdpau/libvdpau_r300.so
mesa-vdpau /usr/lib/vdpau/libvdpau_r300.so.1
mesa-vdpau /usr/lib/vdpau/libvdpau_r300.so.1.0
mesa-vdpau /usr/lib/vdpau/libvdpau_r300.so.1.0.0
mesa-vdpau /usr/lib/vdpau/libvdpau_r600.so
mesa-vdpau /usr/lib/vdpau/libvdpau_r600.so.1
mesa-vdpau /usr/lib/vdpau/libvdpau_r600.so.1.0
mesa-vdpau /usr/lib/vdpau/libvdpau_r600.so.1.0.0
mesa-vdpau /usr/lib/vdpau/libvdpau_radeonsi.so
mesa-vdpau /usr/lib/vdpau/libvdpau_radeonsi.so.1
mesa-vdpau /usr/lib/vdpau/libvdpau_radeonsi.so.1.0
mesa-vdpau /usr/lib/vdpau/libvdpau_radeonsi.so.1.0.0
mesa-vdpau /usr/share/
mesa-vdpau /usr/share/licenses/
mesa-vdpau /usr/share/licenses/mesa-vdpau/
mesa-vdpau /usr/share/licenses/mesa-vdpau/LICENSE

$ sudo find -L / -not \( -type d -path "/dev" -prune -o -path "/home" -prun=
e -o
-path "/media" -prune -o -path "/mnt" -prune -o -path "/proc" -prune -o -pa=
th
"/root" -prune -o -path "/run" -prune -o -path "/sys" -prune -o -path "/tmp"
-prune -o -path "/var" -prune \) -type l -ls
920254 0 lrwxrwxrwx 1 root root 25 Apr 12 07:07
/usr/lib64/vdpau/libvdpau_gallium.so -> libvdpau_gallium.so.1.0.0
920254 0 lrwxrwxrwx 1 root root 25 Apr 12 07:07
/usr/lib/vdpau/libvdpau_gallium.so -> libvdpau_gallium.so.1.0.0
920254 0 lrwxrwxrwx 1 root root 25 Apr 12 07:07
/lib64/vdpau/libvdpau_gallium.so -> libvdpau_gallium.so.1.0.0
920254 0 lrwxrwxrwx 1 root root 25 Apr 12 07:07 /lib/vdpau/libvdpau_gallium=
.so
-> libvdpau_gallium.so.1.0.0

The file libvdpau_gallium.so isn't in 19.0.1-1. First I thought this was an
Arch Linux packaging issue and reported it at
https://bugs.archlinux.org/task/62323. But according to the bug handler it =
is
an upstream issue, so reporting it here.

Regards

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15550996410.A84f8d02.9876
Date: Fri, 12 Apr 2019 20:07:21 +0000
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
   title=3D"NEW - mesa-vdpau 19.0.2 contains broken symlinks to libvdpau_ga=
llium.so.1.0.0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110414">110414</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>mesa-vdpau 19.0.2 contains broken symlinks to libvdpau_galliu=
m.so.1.0.0
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>19.0
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
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
          <td>glitsj16&#64;riseup.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>OS: Arch Linux

$ pacman -Q mesa-vdpau
mesa-vdpau 19.0.2-1

$ pacman -Ql mesa-vdpau
mesa-vdpau /usr/
mesa-vdpau /usr/lib/
mesa-vdpau /usr/lib/vdpau/
mesa-vdpau /usr/lib/vdpau/libvdpau_gallium.so
mesa-vdpau /usr/lib/vdpau/libvdpau_nouveau.so
mesa-vdpau /usr/lib/vdpau/libvdpau_nouveau.so.1
mesa-vdpau /usr/lib/vdpau/libvdpau_nouveau.so.1.0
mesa-vdpau /usr/lib/vdpau/libvdpau_nouveau.so.1.0.0
mesa-vdpau /usr/lib/vdpau/libvdpau_r300.so
mesa-vdpau /usr/lib/vdpau/libvdpau_r300.so.1
mesa-vdpau /usr/lib/vdpau/libvdpau_r300.so.1.0
mesa-vdpau /usr/lib/vdpau/libvdpau_r300.so.1.0.0
mesa-vdpau /usr/lib/vdpau/libvdpau_r600.so
mesa-vdpau /usr/lib/vdpau/libvdpau_r600.so.1
mesa-vdpau /usr/lib/vdpau/libvdpau_r600.so.1.0
mesa-vdpau /usr/lib/vdpau/libvdpau_r600.so.1.0.0
mesa-vdpau /usr/lib/vdpau/libvdpau_radeonsi.so
mesa-vdpau /usr/lib/vdpau/libvdpau_radeonsi.so.1
mesa-vdpau /usr/lib/vdpau/libvdpau_radeonsi.so.1.0
mesa-vdpau /usr/lib/vdpau/libvdpau_radeonsi.so.1.0.0
mesa-vdpau /usr/share/
mesa-vdpau /usr/share/licenses/
mesa-vdpau /usr/share/licenses/mesa-vdpau/
mesa-vdpau /usr/share/licenses/mesa-vdpau/LICENSE

$ sudo find -L / -not \( -type d -path &quot;/dev&quot; -prune -o -path &qu=
ot;/home&quot; -prune -o
-path &quot;/media&quot; -prune -o -path &quot;/mnt&quot; -prune -o -path &=
quot;/proc&quot; -prune -o -path
&quot;/root&quot; -prune -o -path &quot;/run&quot; -prune -o -path &quot;/s=
ys&quot; -prune -o -path &quot;/tmp&quot;
-prune -o -path &quot;/var&quot; -prune \) -type l -ls
920254 0 lrwxrwxrwx 1 root root 25 Apr 12 07:07
/usr/lib64/vdpau/libvdpau_gallium.so -&gt; libvdpau_gallium.so.1.0.0
920254 0 lrwxrwxrwx 1 root root 25 Apr 12 07:07
/usr/lib/vdpau/libvdpau_gallium.so -&gt; libvdpau_gallium.so.1.0.0
920254 0 lrwxrwxrwx 1 root root 25 Apr 12 07:07
/lib64/vdpau/libvdpau_gallium.so -&gt; libvdpau_gallium.so.1.0.0
920254 0 lrwxrwxrwx 1 root root 25 Apr 12 07:07 /lib/vdpau/libvdpau_gallium=
.so
-&gt; libvdpau_gallium.so.1.0.0

The file libvdpau_gallium.so isn't in 19.0.1-1. First I thought this was an
Arch Linux packaging issue and reported it at
<a href=3D"https://bugs.archlinux.org/task/62323">https://bugs.archlinux.or=
g/task/62323</a>. But according to the bug handler it is
an upstream issue, so reporting it here.

Regards</pre>
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

--15550996410.A84f8d02.9876--

--===============0334487553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0334487553==--
