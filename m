From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97066] New: Blank screen when starting KMS on a
 GTX970 for kernel 4.6 series
Date: Sun, 24 Jul 2016 17:16:53 +0000
Message-ID: <bug-97066-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1731168382=="
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


--===============1731168382==
Content-Type: multipart/alternative; boundary="14693806130.7b9Fbb20.1518";
 charset="UTF-8"


--14693806130.7b9Fbb20.1518
Date: Sun, 24 Jul 2016 17:16:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97066

            Bug ID: 97066
           Summary: Blank screen when starting KMS on a GTX970 for kernel
                    4.6 series
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: pil.smmilut-zJpx2rpV7r/QT0dZR+AlfA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 125292
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D125292&action=3Dedit
full dmesg when experiencing the bug, and with drm.debug=3D14 log_buf_len=
=3D16M

Hello,

Since i upgraded my kernel from 4.5.4 to 4.6.3, the screen goes "blank" when
entering KMS, instead of giving the high resolution tty.
By "blank", i mean it has a uniform colour : during some boots it's pure re=
d,
other boots it's pure magenta, and sometimes pure white.
The system is functional and i am able to ssh remotely into the machine.

My setup :
- single 2560x1440 monitor
- NVIDIA Corporation GM204 [GeForce GTX 970] (rev a1) (prog-if 00 [VGA
controller])
- both DVI and DisplayPort ports exhibit the issue
- Arch Linux

If i disable modesetting, i am able to see an image on the screen (low
resolution tty) and login to the system (no Xorg though, as expected).

I found bug 94990 which seems similar, although the symptoms are a bit
different (his monitor goes to sleep, mine remains ON and monochromatic). A=
lso,
i have a similar motherboard (Z97-A).

So i tried one advice i saw there : booting with nouveau.config=3DNvForcePo=
st=3D1
got me no signal instead of a uniform colour.

Sorry if i'm actually posting a duplicate, i'm not very experienced with th=
is
:) I'll try provide more info if i can.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14693806130.7b9Fbb20.1518
Date: Sun, 24 Jul 2016 17:16:53 +0000
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
   title=3D"NEW - Blank screen when starting KMS on a GTX970 for kernel 4.6=
 series"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97066">97066</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Blank screen when starting KMS on a GTX970 for kernel 4.6 ser=
ies
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
          <td>pil.smmilut&#64;yandex.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D125292=
" name=3D"attach_125292" title=3D"full dmesg when experiencing the bug, and=
 with drm.debug=3D14 log_buf_len=3D16M">attachment 125292</a> <a href=3D"at=
tachment.cgi?id=3D125292&amp;action=3Dedit" title=3D"full dmesg when experi=
encing the bug, and with drm.debug=3D14 log_buf_len=3D16M">[details]</a></s=
pan>
full dmesg when experiencing the bug, and with drm.debug=3D14 log_buf_len=
=3D16M

Hello,

Since i upgraded my kernel from 4.5.4 to 4.6.3, the screen goes &quot;blank=
&quot; when
entering KMS, instead of giving the high resolution tty.
By &quot;blank&quot;, i mean it has a uniform colour : during some boots it=
's pure red,
other boots it's pure magenta, and sometimes pure white.
The system is functional and i am able to ssh remotely into the machine.

My setup :
- single 2560x1440 monitor
- NVIDIA Corporation GM204 [GeForce GTX 970] (rev a1) (prog-if 00 [VGA
controller])
- both DVI and DisplayPort ports exhibit the issue
- Arch Linux

If i disable modesetting, i am able to see an image on the screen (low
resolution tty) and login to the system (no Xorg though, as expected).

I found <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"show_bug.cgi?id=3D94990">bug 94990</a> which seems similar, alth=
ough the symptoms are a bit
different (his monitor goes to sleep, mine remains ON and monochromatic). A=
lso,
i have a similar motherboard (Z97-A).

So i tried one advice i saw there : booting with nouveau.config=3DNvForcePo=
st=3D1
got me no signal instead of a uniform colour.

Sorry if i'm actually posting a duplicate, i'm not very experienced with th=
is
:) I'll try provide more info if i can.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14693806130.7b9Fbb20.1518--

--===============1731168382==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1731168382==--
