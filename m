From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111094] New: Cannot start Xorg on Nvidia GP108M
Date: Tue, 09 Jul 2019 11:22:07 +0000
Message-ID: <bug-111094-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1336768960=="
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


--===============1336768960==
Content-Type: multipart/alternative; boundary="15626713300.BD578978F.17312"
Content-Transfer-Encoding: 7bit


--15626713300.BD578978F.17312
Date: Tue, 9 Jul 2019 11:22:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111094

            Bug ID: 111094
           Summary: Cannot start Xorg on Nvidia GP108M
           Product: xorg
           Version: 7.7 (2012.06)
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: guygma-97jfqw80gc5Wk0Htik3J/w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 144735
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144735&action=3Dedit
dmesg, xorg, journal output (concatenated)

Despite support for GP108, it seems that I have problems with the mobile
variant, GP108M. While my system boots successfully with the kernel module
loading successfully (though with some warnings) my display manager cannot
start because no screens can be found by the Xorg server. I have attached l=
ogs
from dmesg, Xorg.log, and journalctl. I am on archlinux. Please let me know=
 if
anymore information is required. I would *really* prefer to use the opensou=
rce
nouveau driver rather the closed nvidia...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15626713300.BD578978F.17312
Date: Tue, 9 Jul 2019 11:22:10 +0000
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
   title=3D"NEW - Cannot start Xorg on Nvidia GP108M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111094">111094</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Cannot start Xorg on Nvidia GP108M
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.7 (2012.06)
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
          <td>blocker
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
          <td>guygma&#64;fastmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144735=
" name=3D"attach_144735" title=3D"dmesg, xorg, journal output (concatenated=
)">attachment 144735</a> <a href=3D"attachment.cgi?id=3D144735&amp;action=
=3Dedit" title=3D"dmesg, xorg, journal output (concatenated)">[details]</a>=
</span>
dmesg, xorg, journal output (concatenated)

Despite support for GP108, it seems that I have problems with the mobile
variant, GP108M. While my system boots successfully with the kernel module
loading successfully (though with some warnings) my display manager cannot
start because no screens can be found by the Xorg server. I have attached l=
ogs
from dmesg, Xorg.log, and journalctl. I am on archlinux. Please let me know=
 if
anymore information is required. I would *really* prefer to use the opensou=
rce
nouveau driver rather the closed nvidia...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15626713300.BD578978F.17312--

--===============1336768960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1336768960==--
