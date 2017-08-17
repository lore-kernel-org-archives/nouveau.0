From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102275] New: Laptop bootup and suspend and wake
	issues
Date: Thu, 17 Aug 2017 15:36:25 +0000
Message-ID: <bug-102275-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2111519020=="
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


--===============2111519020==
Content-Type: multipart/alternative; boundary="15029841850.b81832.32117";
 charset="UTF-8"


--15029841850.b81832.32117
Date: Thu, 17 Aug 2017 15:36:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102275

            Bug ID: 102275
           Summary: Laptop bootup and suspend and wake issues
           Product: Mesa
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: majzoube-9kdMmqzM7is@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 133577
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D133577&action=3Dedit
output of journalctl -b -1 booting into 4.12.5-300

I don't know exactly where to post this bug. Initially I posted on RedHat
bugzilla #1481510, but it appears perhaps I should be posting it here. The
problem started on upgrading from kernel 4.11.11-300 to 4.12.5-300.

Description of problem:

15-30 seconds of black screen and unresponsive mouse, trackpad, keyboard on
bootup and suspend and wake.

Version-Release number of selected component (if applicable):

kernel 4.12.5-300

How reproducible:

Every time booting up or suspending and waking laptop

Steps to Reproduce:
1. Boot up and wait for login screen
2. suspend laptop by closing lid with AC power on
3. wake computer by opening lid=20

Actual results:


Expected results:


Additional info:
I was having lots of trouble with suspend and wake issues. See Bug 1470473.
Resolved all issues after setting boot parameters and updating Dell XPS BIOS
firmware and everything was working well with kernel 4.11.11-300.

Current boot sequence that works with 4.11.11-300 is:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
load_video
set gfxpayload=3Dkeep
insmod gzio
insmod part_gpt
insmod ext2
if [ x$feature_platform_search_hint =3D xy ]; then
  search --no-floppy --fs-uuid --set=3Droot  46985d35-b7e3-41f9-9bc0-8ae6c1=
1bc84c
else
  search --no-floppy --fs-uuid --set=3Droot 46985d35-b7e3-41f9-9bc0-8ae6c11=
bc84c
fi
linuxefi /vmlinuz-4.11.11-300.fc26.x86_64 root=3D/dev/mapper/fedora-root ro
rd.lvm.lv=3Dfedora/root rd.lvm.lv=3Dfedora/swap nouveau.runpm=3D0 rhgb quiet
resume=3D/dev/dm-1
initrdefi /initramfs-4.11.11-300.fc26.x86_64.img
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

Using the same boot sequence with 4.12.5-300 is problematic with bootup and
suspend and wake.


Hardware: XPS 15 9560
Fedora 26: all the latest updates current as of 14 Aug 2017

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15029841850.b81832.32117
Date: Thu, 17 Aug 2017 15:36:25 +0000
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
   title=3D"NEW - Laptop bootup and suspend and wake issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102275">102275</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Laptop bootup and suspend and wake issues
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
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
          <td>majzoube&#64;umsl.edu
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D133577=
" name=3D"attach_133577" title=3D"output of journalctl -b -1 booting into 4=
.12.5-300">attachment 133577</a> <a href=3D"attachment.cgi?id=3D133577&amp;=
action=3Dedit" title=3D"output of journalctl -b -1 booting into 4.12.5-300"=
>[details]</a></span>
output of journalctl -b -1 booting into 4.12.5-300

I don't know exactly where to post this bug. Initially I posted on RedHat
bugzilla #1481510, but it appears perhaps I should be posting it here. The
problem started on upgrading from kernel 4.11.11-300 to 4.12.5-300.

Description of problem:

15-30 seconds of black screen and unresponsive mouse, trackpad, keyboard on
bootup and suspend and wake.

Version-Release number of selected component (if applicable):

kernel 4.12.5-300

How reproducible:

Every time booting up or suspending and waking laptop

Steps to Reproduce:
1. Boot up and wait for login screen
2. suspend laptop by closing lid with AC power on
3. wake computer by opening lid=20

Actual results:


Expected results:


Additional info:
I was having lots of trouble with suspend and wake issues. See Bug 1470473.
Resolved all issues after setting boot parameters and updating Dell XPS BIOS
firmware and everything was working well with kernel 4.11.11-300.

Current boot sequence that works with 4.11.11-300 is:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
load_video
set gfxpayload=3Dkeep
insmod gzio
insmod part_gpt
insmod ext2
if [ x$feature_platform_search_hint =3D xy ]; then
  search --no-floppy --fs-uuid --set=3Droot  46985d35-b7e3-41f9-9bc0-8ae6c1=
1bc84c
else
  search --no-floppy --fs-uuid --set=3Droot 46985d35-b7e3-41f9-9bc0-8ae6c11=
bc84c
fi
linuxefi /vmlinuz-4.11.11-300.fc26.x86_64 root=3D/dev/mapper/fedora-root ro
rd.lvm.lv=3Dfedora/root rd.lvm.lv=3Dfedora/swap nouveau.runpm=3D0 rhgb quiet
resume=3D/dev/dm-1
initrdefi /initramfs-4.11.11-300.fc26.x86_64.img
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

Using the same boot sequence with 4.12.5-300 is problematic with bootup and
suspend and wake.


Hardware: XPS 15 9560
Fedora 26: all the latest updates current as of 14 Aug 2017</pre>
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

--15029841850.b81832.32117--

--===============2111519020==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2111519020==--
