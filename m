From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102528] New: Display messed up shortly after boot on
 laptop with GT218M
Date: Sun, 03 Sep 2017 14:18:51 +0000
Message-ID: <bug-102528-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1106803350=="
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


--===============1106803350==
Content-Type: multipart/alternative; boundary="15044483310.dfD5.26139";
 charset="UTF-8"


--15044483310.dfD5.26139
Date: Sun, 3 Sep 2017 14:18:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102528

            Bug ID: 102528
           Summary: Display messed up shortly after boot on laptop with
                    GT218M
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: johan.myreen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 133949
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D133949&action=3Dedit
Kernel messages as reported by journalctl -b -1.

On a Dell Latitute E6410 laptop with the following display adapter:

01:00.0 VGA compatible controller: NVIDIA Corporation GT218M [NVS 3100M] (r=
ev
a2)

Some time ago (kernel 4.10.0) the kernel drm module stopped working, the
display is all messed up after boot and stays so. The first line on the scr=
een
says "Starting version 234" which refers to Systemd version 234. The rest of
the screen in unintelligible.

I'm running Arch Linux. The problem is still there with the latest kernel.

I did a git bisect on the kernel and found the following:

first bad commit: [df8dc97cd17269474344d73cc02739532c468d04]
drm/nouveau/kms/nv50: use drm core i2c-over-aux algorithm

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15044483310.dfD5.26139
Date: Sun, 3 Sep 2017 14:18:51 +0000
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
   title=3D"NEW - Display messed up shortly after boot on laptop with GT218=
M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102528">102528</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Display messed up shortly after boot on laptop with GT218M
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
          <td>johan.myreen&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D133949=
" name=3D"attach_133949" title=3D"Kernel messages as reported by journalctl=
 -b -1.">attachment 133949</a> <a href=3D"attachment.cgi?id=3D133949&amp;ac=
tion=3Dedit" title=3D"Kernel messages as reported by journalctl -b -1.">[de=
tails]</a></span>
Kernel messages as reported by journalctl -b -1.

On a Dell Latitute E6410 laptop with the following display adapter:

01:00.0 VGA compatible controller: NVIDIA Corporation GT218M [NVS 3100M] (r=
ev
a2)

Some time ago (kernel 4.10.0) the kernel drm module stopped working, the
display is all messed up after boot and stays so. The first line on the scr=
een
says &quot;Starting version 234&quot; which refers to Systemd version 234. =
The rest of
the screen in unintelligible.

I'm running Arch Linux. The problem is still there with the latest kernel.

I did a git bisect on the kernel and found the following:

first bad commit: [df8dc97cd17269474344d73cc02739532c468d04]
drm/nouveau/kms/nv50: use drm core i2c-over-aux algorithm</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15044483310.dfD5.26139--

--===============1106803350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1106803350==--
