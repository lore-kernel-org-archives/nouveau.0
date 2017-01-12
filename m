From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99385] New: Nouveau produces soft lockups
Date: Thu, 12 Jan 2017 15:33:00 +0000
Message-ID: <bug-99385-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1900854347=="
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


--===============1900854347==
Content-Type: multipart/alternative; boundary="14842351800.5b5dbf5.27633";
 charset="UTF-8"


--14842351800.5b5dbf5.27633
Date: Thu, 12 Jan 2017 15:33:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99385

            Bug ID: 99385
           Summary: Nouveau produces soft lockups
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: celelibi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 128914
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D128914&action=3Dedit
dmesg log from boot to bug

Nouveau driver seems to produce soft lockups.

The most notable effect is that some syscalls "hangs", the whole system bec=
ome
very slow and this kind f message appear in every terminals:

NMI watchdog: BUG: soft lockup - CPU#6 stuck for 23s! [kworker/6:2:324]

This seems related to power management, since adding the option runpm=3D0 d=
oesn't
produce the lockups. This bug can be triggered by many things, including
running commands like lspci.

I attach the dmesg log from boot up to the bug.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14842351800.5b5dbf5.27633
Date: Thu, 12 Jan 2017 15:33:00 +0000
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
   title=3D"NEW - Nouveau produces soft lockups"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99385">99385</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau produces soft lockups
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
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
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
          <td>celelibi&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D128914=
" name=3D"attach_128914" title=3D"dmesg log from boot to bug">attachment 12=
8914</a> <a href=3D"attachment.cgi?id=3D128914&amp;action=3Dedit" title=3D"=
dmesg log from boot to bug">[details]</a></span>
dmesg log from boot to bug

Nouveau driver seems to produce soft lockups.

The most notable effect is that some syscalls &quot;hangs&quot;, the whole =
system become
very slow and this kind f message appear in every terminals:

NMI watchdog: BUG: soft lockup - CPU#6 stuck for 23s! [kworker/6:2:324]

This seems related to power management, since adding the option runpm=3D0 d=
oesn't
produce the lockups. This bug can be triggered by many things, including
running commands like lspci.

I attach the dmesg log from boot up to the bug.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14842351800.5b5dbf5.27633--

--===============1900854347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1900854347==--
