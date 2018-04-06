From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105935] New: DRI3 suddenly stopped turning on at
 some point in the past 5 months
Date: Fri, 06 Apr 2018 22:00:03 +0000
Message-ID: <bug-105935-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0137548856=="
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


--===============0137548856==
Content-Type: multipart/alternative; boundary="15230520030.BF64C0e.28017"
Content-Transfer-Encoding: 7bit


--15230520030.BF64C0e.28017
Date: Fri, 6 Apr 2018 22:00:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105935

            Bug ID: 105935
           Summary: DRI3 suddenly stopped turning on at some point in the
                    past 5 months
           Product: Mesa
           Version: 17.3
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jimijames.bove-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 138667
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D138667&action=3Dedit
kernel_log.txt

(The attached files are from when I was on kernel version 4.9.78-lts, but I=
've
confirmed that this bug persists on non-LTS 4.12.12 as well as up to
4.14.31-lts.)

I have two GPUs a GT 740 on nouveau, and an AMD R9 Fury on amdgpu. Both car=
ds
are working fine, and both drivers seem to be working fine, other than this
issue.

Problem:
DRI3 won't activate, despite no logs that I know of ever spitting out an er=
ror
message related to it, and despite nothing about my system changing since it
last worked other than package versions. I'm not sure exactly when this pro=
blem
started, because I haven't been playing video games on Linux as often lately
(DRI_PRIME is what I need DRI3 for), but it most likely started within the =
last
5 months.

Steps to reproduce:
I have no idea. This is why I'm stumped. The Xorg conf files are exactly wh=
at
they should be and exactly what they were the last time this worked. Here a=
re
the packages I've tried downgrading to versions that I had when this worked,
even all at the same time just in case:
-linux{,-lts} (currently 4.14.31-lts)
-xorg-server{,-common,-devel} (currently 1.19.6+13+gd0d1a694f)
-xf86-input-libinput & libinput (currently 0.27.0 and 1.10.3, respectively)
-{,lib32-}mesa (currently 17.3.7)
-mesa-vdpau (also 17.3.7)
-xf86-video-{nouveau,amdgpu} (currently 1.0.15 and 18.0.1, respectively)
And my current version of libdrm is 2.4.91.

I found one other person with this problem, on reddit:
https://www.reddit.com/r/VFIO/comments/7u8o50/dri3_and_dri_prime_randomly_s=
topped_working_in/dwx5vl2/?context=3D3
They're using a similar NVidia card to mine (GT 730), and the only way they=
've
managed to fix this issue is by replacing it with an AMD card, leading me to
suspect nouveau.
I also made a report for Arch Linux, but it's pretty much the same report:
https://bugs.archlinux.org/task/57564

I first noticed this problem about 2 months ago, but have spent all this ti=
me
trying to figure out how to reproduce it before doing a bug report, even
getting help from #nouveau (and trying to get help from #xorg-users and
#xorg-devel, but the former was empty and the latter ignored me). I give up=
. I
can't figure out how to reproduce it unless there are even more packages I =
can
try downgrading that I haven't heard of.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15230520030.BF64C0e.28017
Date: Fri, 6 Apr 2018 22:00:03 +0000
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
   title=3D"NEW - DRI3 suddenly stopped turning on at some point in the pas=
t 5 months"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105935">105935</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>DRI3 suddenly stopped turning on at some point in the past 5 =
months
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>17.3
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
          <td>jimijames.bove&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D138667=
" name=3D"attach_138667" title=3D"kernel_log.txt">attachment 138667</a> <a =
href=3D"attachment.cgi?id=3D138667&amp;action=3Dedit" title=3D"kernel_log.t=
xt">[details]</a></span>
kernel_log.txt

(The attached files are from when I was on kernel version 4.9.78-lts, but I=
've
confirmed that this bug persists on non-LTS 4.12.12 as well as up to
4.14.31-lts.)

I have two GPUs a GT 740 on nouveau, and an AMD R9 Fury on amdgpu. Both car=
ds
are working fine, and both drivers seem to be working fine, other than this
issue.

Problem:
DRI3 won't activate, despite no logs that I know of ever spitting out an er=
ror
message related to it, and despite nothing about my system changing since it
last worked other than package versions. I'm not sure exactly when this pro=
blem
started, because I haven't been playing video games on Linux as often lately
(DRI_PRIME is what I need DRI3 for), but it most likely started within the =
last
5 months.

Steps to reproduce:
I have no idea. This is why I'm stumped. The Xorg conf files are exactly wh=
at
they should be and exactly what they were the last time this worked. Here a=
re
the packages I've tried downgrading to versions that I had when this worked,
even all at the same time just in case:
-linux{,-lts} (currently 4.14.31-lts)
-xorg-server{,-common,-devel} (currently 1.19.6+13+gd0d1a694f)
-xf86-input-libinput &amp; libinput (currently 0.27.0 and 1.10.3, respectiv=
ely)
-{,lib32-}mesa (currently 17.3.7)
-mesa-vdpau (also 17.3.7)
-xf86-video-{nouveau,amdgpu} (currently 1.0.15 and 18.0.1, respectively)
And my current version of libdrm is 2.4.91.

I found one other person with this problem, on reddit:
<a href=3D"https://www.reddit.com/r/VFIO/comments/7u8o50/dri3_and_dri_prime=
_randomly_stopped_working_in/dwx5vl2/?context=3D3">https://www.reddit.com/r=
/VFIO/comments/7u8o50/dri3_and_dri_prime_randomly_stopped_working_in/dwx5vl=
2/?context=3D3</a>
They're using a similar NVidia card to mine (GT 730), and the only way they=
've
managed to fix this issue is by replacing it with an AMD card, leading me to
suspect nouveau.
I also made a report for Arch Linux, but it's pretty much the same report:
<a href=3D"https://bugs.archlinux.org/task/57564">https://bugs.archlinux.or=
g/task/57564</a>

I first noticed this problem about 2 months ago, but have spent all this ti=
me
trying to figure out how to reproduce it before doing a bug report, even
getting help from #nouveau (and trying to get help from #xorg-users and
#xorg-devel, but the former was empty and the latter ignored me). I give up=
. I
can't figure out how to reproduce it unless there are even more packages I =
can
try downgrading that I haven't heard of.</pre>
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

--15230520030.BF64C0e.28017--

--===============0137548856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0137548856==--
