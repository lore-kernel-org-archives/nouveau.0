From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101273] New: [NV108] Random kernel panic
Date: Thu, 01 Jun 2017 17:46:16 +0000
Message-ID: <bug-101273-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0175149308=="
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


--===============0175149308==
Content-Type: multipart/alternative; boundary="14963391761.2AA25B86.21722";
 charset="UTF-8"


--14963391761.2AA25B86.21722
Date: Thu, 1 Jun 2017 17:46:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101273

            Bug ID: 101273
           Summary: [NV108] Random kernel panic
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: mrblooter-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 131646
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D131646&action=3Dedit
lspci output (from when the kernel panic didn't happen)

I have suddenly started experiencing kernel panics with my Nvidia GT630
(NV108).
It started happening after a system update (kernel was updated, but I am
getting the same with an older kernel).

Shortly after booting, sometimes in the middle of it, it goes into a kernel
panic. It doesn't happen all the time, but it seems to be random, every oth=
er
time.
I tested it with the proprietary Nvidia driver and there were no kernel pan=
ics
with that one.

Could this be related to bug #101184 ?

Screenshot of the screen when it happens (sorry, I couldn't find a way to g=
et
the text from it):
http://preview.ibb.co/mb2oJF/DSC_0007_1.jpg

Xorg version: 1.19.3
Linux version: 4.11.3
Operating system: Arch Linux
I can provide more information if needed.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14963391761.2AA25B86.21722
Date: Thu, 1 Jun 2017 17:46:16 +0000
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
   title=3D"NEW - [NV108] Random kernel panic"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101273">101273</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV108] Random kernel panic
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
          <td>mrblooter&#64;hotmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D131646=
" name=3D"attach_131646" title=3D"lspci output (from when the kernel panic =
didn't happen)">attachment 131646</a> <a href=3D"attachment.cgi?id=3D131646=
&amp;action=3Dedit" title=3D"lspci output (from when the kernel panic didn'=
t happen)">[details]</a></span>
lspci output (from when the kernel panic didn't happen)

I have suddenly started experiencing kernel panics with my Nvidia GT630
(NV108).
It started happening after a system update (kernel was updated, but I am
getting the same with an older kernel).

Shortly after booting, sometimes in the middle of it, it goes into a kernel
panic. It doesn't happen all the time, but it seems to be random, every oth=
er
time.
I tested it with the proprietary Nvidia driver and there were no kernel pan=
ics
with that one.

Could this be related to <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] [bisected] Panic on boot with GK106"
   href=3D"show_bug.cgi?id=3D101184">bug #101184</a> ?

Screenshot of the screen when it happens (sorry, I couldn't find a way to g=
et
the text from it):
<a href=3D"http://preview.ibb.co/mb2oJF/DSC_0007_1.jpg">http://preview.ibb.=
co/mb2oJF/DSC_0007_1.jpg</a>

Xorg version: 1.19.3
Linux version: 4.11.3
Operating system: Arch Linux
I can provide more information if needed.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14963391761.2AA25B86.21722--

--===============0175149308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0175149308==--
