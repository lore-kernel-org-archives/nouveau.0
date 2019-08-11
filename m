From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111371] New: [NV04] bios OOB on kernel driver
 initialization
Date: Sun, 11 Aug 2019 15:33:56 +0000
Message-ID: <bug-111371-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0419519598=="
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


--===============0419519598==
Content-Type: multipart/alternative; boundary="15655376361.eFcfbC99.718"
Content-Transfer-Encoding: 7bit


--15655376361.eFcfbC99.718
Date: Sun, 11 Aug 2019 15:33:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111371

            Bug ID: 111371
           Summary: [NV04] bios OOB on kernel driver initialization
           Product: xorg
           Version: unspecified
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jorgenatzdev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 145023
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145023&action=3Dedit
The non-verbose kernel log

Steps to reproduce:
Boot linux with NV04 card in motherboard AGP slot.
OR
'modprobe nouveau' with NV04 card in motherboard AGP slot.

Actual Results:
2 times during the boot process the screen turns black, only to return back=
 to
the character display. The nouveau module ends up loaded, but the screen
appears to not be using the drm driver.

Platform:
Alpine Linux 3.10.1 Standard, kernel 4.19.58 (non-verbose log)
Tiny Core Linux, kernel 4.19.10 (verbose external module log)

I tried using the kernel parameter nouveau.config=3DNvMSI=3D0, but it made =
no
difference. I also tried using nouveau.config=3DNvBios=3DPRAMIN, even thoug=
h there
were no "checksum invalid" errors in the dmesg output.

I was unable to get a VBIOS dump, as the /sys/kernel/debug/dri folder was
empty.

I was also hesitant to do a git bisection, as compiling the nouveau kernel
module takes upwards of 7 hours on the machine I am using. However, I can t=
ry
if you would like.

I have two kernel logs, one is from kernel 4.19.58 and has nouveau compiled=
 as
an in-tree module. The other log is for kernel 4.19.10 and has nouveau comp=
iled
as an out-of-tree module, but I was able to add the kernel parameters
drm.debug=3D14 and log_buf_len=3D16M.

I apologize if I left any information out, and thank you for any reply.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15655376361.eFcfbC99.718
Date: Sun, 11 Aug 2019 15:33:56 +0000
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
   title=3D"NEW - [NV04] bios OOB on kernel driver initialization"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111371">111371</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV04] bios OOB on kernel driver initialization
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
          <td>jorgenatzdev&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145023=
" name=3D"attach_145023" title=3D"The non-verbose kernel log">attachment 14=
5023</a> <a href=3D"attachment.cgi?id=3D145023&amp;action=3Dedit" title=3D"=
The non-verbose kernel log">[details]</a></span>
The non-verbose kernel log

Steps to reproduce:
Boot linux with NV04 card in motherboard AGP slot.
OR
'modprobe nouveau' with NV04 card in motherboard AGP slot.

Actual Results:
2 times during the boot process the screen turns black, only to return back=
 to
the character display. The nouveau module ends up loaded, but the screen
appears to not be using the drm driver.

Platform:
Alpine Linux 3.10.1 Standard, kernel 4.19.58 (non-verbose log)
Tiny Core Linux, kernel 4.19.10 (verbose external module log)

I tried using the kernel parameter nouveau.config=3DNvMSI=3D0, but it made =
no
difference. I also tried using nouveau.config=3DNvBios=3DPRAMIN, even thoug=
h there
were no &quot;checksum invalid&quot; errors in the dmesg output.

I was unable to get a VBIOS dump, as the /sys/kernel/debug/dri folder was
empty.

I was also hesitant to do a git bisection, as compiling the nouveau kernel
module takes upwards of 7 hours on the machine I am using. However, I can t=
ry
if you would like.

I have two kernel logs, one is from kernel 4.19.58 and has nouveau compiled=
 as
an in-tree module. The other log is for kernel 4.19.10 and has nouveau comp=
iled
as an out-of-tree module, but I was able to add the kernel parameters
drm.debug=3D14 and log_buf_len=3D16M.

I apologize if I left any information out, and thank you for any reply.</pr=
e>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15655376361.eFcfbC99.718--

--===============0419519598==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0419519598==--
