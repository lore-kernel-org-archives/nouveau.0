From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102913] New: Nouveau on >4.12.12 not loading EDID
Date: Thu, 21 Sep 2017 00:48:24 +0000
Message-ID: <bug-102913-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2100284697=="
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


--===============2100284697==
Content-Type: multipart/alternative; boundary="15059549041.E0bc.13363";
 charset="UTF-8"


--15059549041.E0bc.13363
Date: Thu, 21 Sep 2017 00:48:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102913

            Bug ID: 102913
           Summary: Nouveau on >4.12.12 not loading EDID
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: andrewb03-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 134394
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D134394&action=3Dedit
Arch 4.12.13 dmesg

System: Arch Linux
CPU: AMD Ryzen 1700
Motherboard: Gigabyte AX370 Gaming K7
After an upgrade from Arch Linux kernel 4.12.10 to 4.12.12 (or 4.12.13) the
system will hang just before initializing nouveaufb.  The system doesn't
respond to keyboard or mouse but can be reset with the Ctrl+Alt+Del or
accessible via ssh.

If I turn off KMS via nomodeset nouveau.modeset=3D0, I am able to boot norm=
ally
but without graphics acceleration.c

The following showed in dmesg from kernel 4.12.13:

[   12.945435] nouveau 0000:0a:00.0: DRM: DDC responded, but no EDID for DP=
-1
[   13.087167] gnome-shell[901]: segfault at 28 ip 00007ffab9d672f5 sp
00007fff5771ba20 error 4 in libmutter-0.so.0.0.0[7ffab9d1d000+139000]
[   16.264988] nouveau 0000:0a:00.0: DRM: DDC responded, but no EDID for DP=
-1
[   16.286324] nouveau 0000:0a:00.0: DRM: DDC responded, but no EDID for DP=
-1

As a result of this I have to either use the nvidia proprietary drivers or =
not
upgrade.

This seems to be the exact opposite of a 4.12 regression reported where EDID
would not load on 4.12 kernels with DP.

I have two PCIe GPUs: GK104 and GP102.  Neither are detected on those kernel
versions.  I tested 4.13 as well and it can't find the EDID either on that
kernel version.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15059549041.E0bc.13363
Date: Thu, 21 Sep 2017 00:48:24 +0000
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
   title=3D"NEW - Nouveau on &gt;4.12.12 not loading EDID"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102913">102913</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau on &gt;4.12.12 not loading EDID
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
          <td>andrewb03&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D134394=
" name=3D"attach_134394" title=3D"Arch 4.12.13 dmesg">attachment 134394</a>=
 <a href=3D"attachment.cgi?id=3D134394&amp;action=3Dedit" title=3D"Arch 4.1=
2.13 dmesg">[details]</a></span>
Arch 4.12.13 dmesg

System: Arch Linux
CPU: AMD Ryzen 1700
Motherboard: Gigabyte AX370 Gaming K7
After an upgrade from Arch Linux kernel 4.12.10 to 4.12.12 (or 4.12.13) the
system will hang just before initializing nouveaufb.  The system doesn't
respond to keyboard or mouse but can be reset with the Ctrl+Alt+Del or
accessible via ssh.

If I turn off KMS via nomodeset nouveau.modeset=3D0, I am able to boot norm=
ally
but without graphics acceleration.c

The following showed in dmesg from kernel 4.12.13:

[   12.945435] nouveau 0000:0a:00.0: DRM: DDC responded, but no EDID for DP=
-1
[   13.087167] gnome-shell[901]: segfault at 28 ip 00007ffab9d672f5 sp
00007fff5771ba20 error 4 in libmutter-0.so.0.0.0[7ffab9d1d000+139000]
[   16.264988] nouveau 0000:0a:00.0: DRM: DDC responded, but no EDID for DP=
-1
[   16.286324] nouveau 0000:0a:00.0: DRM: DDC responded, but no EDID for DP=
-1

As a result of this I have to either use the nvidia proprietary drivers or =
not
upgrade.

This seems to be the exact opposite of a 4.12 regression reported where EDID
would not load on 4.12 kernels with DP.

I have two PCIe GPUs: GK104 and GP102.  Neither are detected on those kernel
versions.  I tested 4.13 as well and it can't find the EDID either on that
kernel version.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15059549041.E0bc.13363--

--===============2100284697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2100284697==--
